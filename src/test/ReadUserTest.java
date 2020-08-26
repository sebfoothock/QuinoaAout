package test;

import beans.User;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;
import org.junit.Test;
import connection.ConfProperties;

import java.text.ParseException;

import static com.mongodb.client.model.Filters.eq;
import static connection.MongoConnector.getConnector;
import static org.junit.Assert.assertEquals;

public class ReadUserTest {
    final static org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(ReadUserTest.class);
    org.apache.log4j.Level info = org.apache.log4j.Level.INFO;
    org.apache.log4j.Level verbose = org.apache.log4j.Level.ALL;

    private final String dbName = "security_realm";
    private final String Utilisateurs = "authentification";
    String db_host = new ConfProperties().getHostProperties();

    @Test
    public void getUserTest() throws ParseException {//récupérer un utilisateur
        LOG.info("getUserTest started");
        MongoClient client = getConnector(db_host);
        String identifiant = "seb@ephec.be";
        User user = new User();
        MongoDatabase mongo = client.getDatabase(dbName);
        MongoCollection <Document> utilisateurs = mongo.getCollection(Utilisateurs);
        Document doc = utilisateurs.find(eq("username", identifiant)).first();//parcours les utilisateurs de la db et rempli la mémoire
        if(doc == null){
            LOG.info("return null");
        } else {
            if(doc.isEmpty()){
                LOG.info("return null (isEmpty)");
            }
        }
        try {//récupère l'élément qui est rempli
            user.setIdentifiant(doc.getString("username"));
            user.setPassword(doc.getString("password"));
            user.setAge(doc.getString("age"));
            user.setSexe(doc.getString("sexe"));
            user.setDesobei(doc.getString("desobei"));
            user.setDate(doc.getString("creation_date"));
        }
        catch (Exception e) {
            System.out.println(e);
        }
        assertEquals("seb@ephec.be",user.getIdentifiant());
        assertEquals("155290511d5c4bfb1369217d6846c8eef1ed6a564579516eaf36cf5598ac92de", user.getPassword());
        assertEquals("17/08/2020 00:32",user.getDate());
        assertEquals("oui",user.getDesobei());
        assertEquals("homme",user.getSexe());
        assertEquals("19",user.getAge());
    }

}
