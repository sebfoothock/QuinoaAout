package database.write;

import beans.User;
import com.mongodb.BasicDBObject;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

public class WriteUser {
    private final String database = "Quinoa";

        public WriteUser() {
        }

        public void addUser( User user,
                MongoClient mongoClient) throws IOException,
                UnsupportedEncodingException {

            MongoDatabase db = mongoClient.getDatabase(database);
            MongoCollection<Document> collection = db.getCollection("Utilisateurs");

            Document document = new Document();
            document.append("identifiant", user.getIdentifiant())
                    .append("password", user.getPassword())
                    .append("age", user.getAge())
            ;
            collection.insertOne(document);//insertion dans la collection

        }

        public void updateUser(User user,
                MongoClient mongoClient) throws IOException,
                UnsupportedEncodingException {

            BasicDBObject query = new BasicDBObject("identifiant", user.getIdentifiant());

            MongoDatabase db = mongoClient.getDatabase(database);
            MongoCollection<Document> collection = db.getCollection("Utilisateurs");

            BasicDBObject update = new BasicDBObject();
            update.append("$set", new Document()//$set permet de modifier une colonne
                    .append("identifiant", user.getIdentifiant())
                    .append("password", user.getPassword())
                    .append("age", user.getAge())
            );
            collection.updateOne(query, update);//modifie une user sur base de son identifiant
        }

        public void deleteUser(MongoClient mongoClient, User user)  throws IOException,
                UnsupportedEncodingException {

            MongoDatabase db = mongoClient.getDatabase(database);
            BasicDBObject query = new BasicDBObject("identifiant", user.getIdentifiant());

            MongoCollection<Document> collection = db.getCollection("Utilisateurs");
            collection.deleteMany(query);
        }
}
