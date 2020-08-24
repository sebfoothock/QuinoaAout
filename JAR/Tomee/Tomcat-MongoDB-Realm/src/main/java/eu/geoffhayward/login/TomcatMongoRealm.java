/**
 * Copyright 2014
 */
package eu.geoffhayward.login;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import java.net.UnknownHostException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import org.apache.catalina.realm.GenericPrincipal;
import org.apache.catalina.realm.RealmBase;
import org.apache.commons.codec.digest.DigestUtils;

/**
 * @author https://www.geoffhayward.eu
 */
public class TomcatMongoRealm extends RealmBase {

	final static org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(TomcatMongoRealm.class);
	org.apache.log4j.Level info = org.apache.log4j.Level.INFO;
	org.apache.log4j.Level verbose = org.apache.log4j.Level.ALL;

	// Database fields
	private String dbHost = "";
	private String dbName = "security_realm";
	private String dbCollection = "authentification";

	// User fields
	private String userUsername = "username";
	private String userPassword = "password";
	private String userRoles = "roles";

	// MongoDB Connection
	private MongoClient mongoClient = null;
	private DB mongoDatabase = null;
	private DBCollection mongoCollection = null;


	/**
	 * Return a short name for this Realm implementation.
	 *
	 * @return The name of the Realm's class.
	 */
	@Override
	protected String getName() {
		return this.getClass().getSimpleName();
	}

	/**
	 * Return the password associated with the given principal's user name.
	 *
	 * @param username
	 * @return The stored password
	 */
	@Override
	protected String getPassword(String username) {
		String password = null;
		try {
			DBCollection collection = getAnOpenDBCollection();
			BasicDBObject query = new BasicDBObject(userUsername, username);
			DBObject userData = collection.findOne(query);
			if (userData != null) {
				password = (String) userData.get(userPassword);
			}
		} catch (UnknownHostException e) {
			System.out.println("Unknown host exception");
		}
		return password;
	}

	@Override
	protected Principal getPrincipal(String username) {
		return (new GenericPrincipal(username, getPassword(username), getRoles(username)));
	}

	/**
	 * Return the Principal associated with the given username.
	 *
	 * @param username
	 * @return
	 */
	@Override
	public synchronized Principal authenticate(String username, String credentials) {
		//LOG.info("username: "+username);
		//LOG.info("credentials: "+credentials);
		String password_db = getPassword(username);
		//LOG.info("password_db: "+password_db);
		if (password_db != null) {
			boolean validated = false;
			validated = DigestUtils.sha256Hex(credentials).equalsIgnoreCase(password_db);
			//LOG.info("validated: "+validated);
			if (validated) {
				return new GenericPrincipal(username, password_db, getRoles(username));
			}
		}
		return null;
	}

	/**
	 * Get the stored roles associated with the given username.
	 */
	private ArrayList<String> getRoles(String username) {
		ArrayList<String> roles = new ArrayList<>();
		try {
			DBCollection collection = getAnOpenDBCollection();
			BasicDBObject query = new BasicDBObject(userUsername, username);
			DBObject userData = collection.findOne(query);
			if (userData != null) {
				roles.addAll((List<String>) userData.get(userRoles));
			}
		} catch (UnknownHostException e) {
			System.out.println("Unknown host exception");
		}
		return roles;
	}

	/**
	 *
	 * @return @throws UnknownHostException
	 */
	private DBCollection getAnOpenDBCollection() throws UnknownHostException {
		if (mongoClient == null) {
			mongoClient = new MongoClient(dbHost);
		}
		if (mongoDatabase == null) {
			mongoDatabase = mongoClient.getDB(dbName);
		}
		if (mongoCollection == null) {
			mongoCollection = mongoDatabase.getCollection(dbCollection);
		}
		return mongoCollection;
	}

	public void setDbHost(String dbHost) { this.dbHost = dbHost; }

	public void setDbName(String dbName) {
		this.dbName = dbName;
	}

	public void setDbCollection(String dbCollection) {
		this.dbCollection = dbCollection;
	}

	public void setUserUsername(String userUsername) {
		this.userUsername = userUsername;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public void setUserRoles(String userRoles) {
		this.userRoles = userRoles;
	}

	public String getUserPassword() {
		return userPassword;
	}
}
