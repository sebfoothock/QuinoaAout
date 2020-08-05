package database.write;

import beans.Person;
import com.mongodb.BasicDBObject;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

public class WritePerson {
    private final String database = "Quinoa";

    public WritePerson() {
    }

    public Person addPerson(Person person, MongoClient mongoClient) throws IOException, UnsupportedEncodingException {

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

        return person;
    }

    public Person updatePerson(Person person, MongoClient mongoClient) throws IOException, UnsupportedEncodingException {

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
        collection.updateOne(query, update);//collection.updateOne(query, update, new UpdateOptions().upsert(true)); query = modifie un user sur base de son identifiant , updateOne = modifier un seul document, UpdateOption = si la donnée n'existe pas il va la créer
        return person;//replaceOne
    }

    public Person deletePerson(MongoClient mongoClient, String nom)  throws IOException, UnsupportedEncodingException {

        MongoDatabase db = mongoClient.getDatabase(database);
        BasicDBObject query = new BasicDBObject("nom", nom);

        MongoCollection<Document> collection = db.getCollection("InfosPersonnage");
        collection.deleteMany(query);
        return null;
    }

}
