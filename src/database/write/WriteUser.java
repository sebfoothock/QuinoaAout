package database.write;

import beans.User;
import com.mongodb.BasicDBObject;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.UpdateOptions;
import org.bson.Document;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class WriteUser {
    private final String database = "security_realm";

    final static org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(WriteUser.class);
    org.apache.log4j.Level info = org.apache.log4j.Level.INFO;
    org.apache.log4j.Level verbose = org.apache.log4j.Level.ALL;

        public WriteUser() {
        }
        
        public void addUser( User user, MongoClient mongoClient) throws IOException, UnsupportedEncodingException {

            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            Date date = new Date();
            String today = dateFormat.format(date);

            MongoDatabase db = mongoClient.getDatabase(database);
            MongoCollection<Document> collection = db.getCollection("authentification");

            String password =  user.getPassword();
            MessageDigest messageDigest = null;
            try {
                messageDigest = MessageDigest.getInstance("SHA-256");
            } catch (NoSuchAlgorithmException e) {
                LOG.error(e);
            }
            messageDigest.update(password.getBytes());
            byte byteData[] = messageDigest.digest();
            StringBuffer hexString = new StringBuffer();
            for (int i = 0; i < byteData.length; i++) {
                String hex=Integer.toHexString(0xff & byteData[i]);
                if (hex.length()==1)
                    hexString.append('0');
                hexString.append(hex);
            }

            Document document = new Document();
            document.append("nom", user.getIdentifiant())
                    .append("password",hexString.toString())
                    .append("age", user.getAge())
                    .append("sexe", user.getSexe())
                    .append("desobei", user.getDesobei())
                    .append("creation_date",today);
            collection.insertOne(document);//insertion dans la collection

        }

        public void updateUser(User user, MongoClient mongoClient) throws IOException, UnsupportedEncodingException {

            BasicDBObject query = new BasicDBObject("identifiant", user.getIdentifiant());

            MongoDatabase db = mongoClient.getDatabase(database);
            MongoCollection <Document> collection = db.getCollection("Utilisateurs");

            BasicDBObject update = new BasicDBObject();
            update.append("$set", new Document()//$set permet de modifier une colonne
                    .append("identifiant", user.getIdentifiant())
                    .append("password", user.getPassword())
                    .append("age", user.getAge())
                    .append("sexe", user.getSexe())
                    .append("desobei", user.getDesobei())
            );
            collection.updateOne(query, update, new UpdateOptions().upsert(true));// query = modifie un user sur base de son identifiant , update = élément à modifier, UpdateOption = si la donnée n'existe pas il va la créer
        }

        public void deleteUser(MongoClient mongoClient, String identifiant)  throws IOException, UnsupportedEncodingException {

            MongoDatabase db = mongoClient.getDatabase(database);
            BasicDBObject query = new BasicDBObject("identifiant", identifiant);

            MongoCollection<Document> collection = db.getCollection("Utilisateurs");
            collection.deleteMany(query);
        }

    public Boolean isAdded(MongoClient mongoClient, String identifiant){//vérifie si ajouté
        MongoDatabase db = mongoClient.getDatabase(database);
        BasicDBObject query = new BasicDBObject("identifiant", identifiant);
        MongoCollection<Document> collection = db.getCollection("Utilisateurs");
        long nb_count = collection.countDocuments(query);//donne le nombre de document en fonction du nom du personnage
        if(nb_count > 0){
            return true;
        } else {
            return false;
        }
    }
}
