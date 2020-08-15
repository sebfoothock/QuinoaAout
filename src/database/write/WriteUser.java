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

public class WriteUser {
    private final String database = "Quinoa";

        public WriteUser() {
        }

        public void addUser( User user, MongoClient mongoClient) throws IOException, UnsupportedEncodingException {

            MongoDatabase db = mongoClient.getDatabase(database);
            MongoCollection<Document> collection = db.getCollection("Utilisateurs");

            Document document = new Document();
            document.append("nom", user.getIdentifiant())
                    .append("password", user.getPassword())
                    .append("age", user.getAge())
                    .append("sexe", user.getSexe())
                    .append("desobei", user.getDesobei());

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
