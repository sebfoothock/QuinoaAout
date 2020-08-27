package servlets;

import com.mongodb.BasicDBObject;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

/**
 * Cette classe est destiné a écrire, de modifier ou supprimer le contenue d'un personnage la base de données
 */

public class WritePerson {

    final static org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(WritePerson.class);
    org.apache.log4j.Level info = org.apache.log4j.Level.INFO;
    org.apache.log4j.Level verbose = org.apache.log4j.Level.ALL;

    private final String database = "Quinoa";

    public WritePerson() {
    }

    /**
     * Cette méthode permet de rajouter un personnage de la base de données
     * @param person objet personnage à ajouter à la base de données
     * @param mongoClient L'instance du connecteur Mongo DB
     * @throws IOException si les entrées de l'objet person n'arrivent pas à être lu
     * @throws UnsupportedEncodingException si un des caractères de l'objet person n'est pas supporté
     */

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

    /**
     * Cette méthode permet de modifier un personnage de la base de données
     * @param person objet personnage à modifier à la base de données
     * @param mongoClient L'instance du connecteur Mongo DB
     * @throws IOException si les entrées de l'objet person n'arrivent pas à être lu
     * @throws UnsupportedEncodingException si un des caractères de l'objet person n'est pas supporté
     */

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
        long nb_modified = collection.updateOne(query, update).getModifiedCount();//query = modifie un user sur base de son identifiant , updateOne = modifier un seul document, UpdateOption = si la donnée n'existe pas il va la créer
        LOG.info("nb_modified: "+nb_modified);
        if(nb_modified > 0){
            return true;
        } else {
            return false;
        }

    }

    /**
     * Cette méthode permet de supprimmer un personnage de la base de données
     * @param mongoClient L'instance du connecteur Mongo DB
     * @param nom Le nom du personnage à supprimer de la base de données
     * @return un true si la suppréssion c'est bien fait sinon retourne un false
     * @throws IOException si l'entré nom n'arrive pas à être lu
     * @throws UnsupportedEncodingException si un des caractères de nom n'est pas supporté
     */

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

    /**
     * Cette méthode permet de vérifier si un personnage à bien été rajouter suite à la fucntion addPerson
     * @param mongoClient L'instance du connecteur Mongo DB
     * @param nom Le nom du personnage qui a été ajouté de la base de données
     * @return un true si l'ajout c'est bien fait sinon retourne un false
     */

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
