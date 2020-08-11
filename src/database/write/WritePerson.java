package database.write;

import beans.Person;
import com.mongodb.BasicDBObject;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;
import servlets.Rechercher;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

public class WritePerson {

    final static org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(WritePerson.class);
    org.apache.log4j.Level info = org.apache.log4j.Level.INFO;
    org.apache.log4j.Level verbose = org.apache.log4j.Level.ALL;

    private final String database = "Quinoa";

    public WritePerson() {
    }

    public void addPerson(Person person, MongoClient mongoClient) throws IOException, UnsupportedEncodingException {

        MongoDatabase db = mongoClient.getDatabase(database);
        MongoCollection<Document> collection = db.getCollection("InfosPersonnage");

        Document document = new Document();
        document.append("nom", person.getNom())
                .append("annee", person.getAnnee())
                .append("lieu", person.getLieu())
                .append("lutte", person.getLutte())
                .append("strategie", person.getStrategie())
                .append("action", person.getAction())
                .append("victoire", person.getVictoire())
                .append("anecdote", person.getAnecdote())
                .append("citation", person.getCitation())
                .append("question", person.getQuestion())
                .append("reponse1", person.getReponse1())
                .append("reponse2", person.getReponse2())
                .append("reponse3", person.getReponse3())
                .append("video", person.getVideo())
                .append("article", person.getArticle());

        collection.insertOne(document);//insertion dans la collection
    }

    public Boolean updatePerson(Person person, MongoClient mongoClient) throws IOException, UnsupportedEncodingException {

        BasicDBObject query = new BasicDBObject("nom", person.getNom());

        MongoDatabase db = mongoClient.getDatabase(database);
        MongoCollection <Document> collection = db.getCollection("InfosPersonnage");

        BasicDBObject update = new BasicDBObject();
        update.append("$set", new Document()//$set permet de modifier une colonne
                .append("nom", person.getNom())
                .append("annee", person.getAnnee())
                .append("lieu", person.getLieu())
                .append("lutte", person.getLutte())
                .append("strategie", person.getStrategie())
                .append("action", person.getAction())
                .append("victoire", person.getVictoire())
                .append("anecdote", person.getAnecdote())
                .append("citation", person.getCitation())
                .append("question", person.getQuestion())
                .append("reponse1", person.getReponse1())
                .append("reponse2", person.getReponse2())
                .append("reponse3", person.getReponse3())
                .append("video", person.getVideo())
                .append("article", person.getArticle())
        );
        long nb_modified = collection.updateOne(query, update).getModifiedCount();//collection.updateOne(query, update, new UpdateOptions().upsert(true)); query = modifie un user sur base de son identifiant , updateOne = modifier un seul document, UpdateOption = si la donnée n'existe pas il va la créer
        LOG.info("nb_modified: "+nb_modified);
        if(nb_modified > 0){
            return true;
        } else {
            return false;
        }

    }

    public Boolean deletePerson(MongoClient mongoClient, String nom)  throws IOException, UnsupportedEncodingException {

        MongoDatabase db = mongoClient.getDatabase(database);
        BasicDBObject query = new BasicDBObject("nom", nom);

        MongoCollection<Document> collection = db.getCollection("InfosPersonnage");
        long nb_deleted = collection.deleteMany(query).getDeletedCount();//donne le nombre de element supprimé
        LOG.info("nb deleted: "+nb_deleted);
        if(nb_deleted > 0){
            return true;
        } else {
            return false;
        }

    }

    public Boolean isAdded(MongoClient mongoClient, String nom){//vérifie si ajouté
        MongoDatabase db = mongoClient.getDatabase(database);
        BasicDBObject query = new BasicDBObject("nom", nom);
        MongoCollection<Document> collection = db.getCollection("InfosPersonnage");
        long nb_count = collection.countDocuments(query);//donne le nombre de document en fonction du nom du personnage
        if(nb_count > 0){
            return true;
        } else {
            return false;
        }
    }
}
