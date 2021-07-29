package database;

import beans.User;
import com.mongodb.BasicDBObject;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import connection.ConfProperties;
import org.bson.Document;

import javax.ws.rs.GET;
import javax.ws.rs.Consumes;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import static connection.MongoConnector.getConnector;

@Path("/Stats")
@Produces("application/json")
@Consumes("application/json")

/**
 * Cette classe est destiné a écrire une partie et lire les parties de quiz réalisées sur la base de données
 */

public class QuizCounter {

    final static org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(QuizCounter.class);
    org.apache.log4j.Level info = org.apache.log4j.Level.INFO;
    org.apache.log4j.Level verbose = org.apache.log4j.Level.ALL;

    private final String database = "Quinoa";
    String db_host = new ConfProperties().getHostProperties();



    /**
     * Cette méthode permet d'ajouter une partie de quiz avec son heure
     * @param mongoClient L'instance du connecteur Mongo DB
     */

    public void addGameInfo(MongoClient mongoClient) {
        LOG.info("IncrementCounter");
        DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
        Date date = new Date();
        String today = dateFormat.format(date);

//        BasicDBObject query = new BasicDBObject("id", "100QUIZ");
        MongoDatabase db = mongoClient.getDatabase(database);
        MongoCollection<Document> collection = db.getCollection("Compteur");

//        int nbquiz = readCounter(mongoClient);
//        LOG.info("nbquiz: "+nbquiz);
//        nbquiz++;
//        BasicDBObject update = new BasicDBObject();
//        update.append("$set", new Document().append("nbQuiz", nbquiz));

//        long nb_modified = collection.updateOne(query, update).getModifiedCount();
//        LOG.info("nb_modified: "+nb_modified);

        Document document = new Document();
        document.append("date", today);
        collection.insertOne(document);//insertion dans la collection


//        if (nb_modified > 0) {
//            return true;
//        } else {
//            return false;
//        }
    }

    /**
     * Cette méthode permet de lire les parties de quiz qui ont été lancé sur le site
     * @return une ArrayList des informations des parties jouées sur le site
     */

    @GET
    public ArrayList<String> readGamesInfo(){
        if (db_host != null) {
            ArrayList<String> quizCounter = new ArrayList<>();
            MongoClient client = getConnector(db_host);
            MongoDatabase db = client.getDatabase(database);
            MongoCollection<Document> collection = db.getCollection("Compteur");
            MongoCursor<Document> iterator = collection.find().iterator();//parcours les dates de quiz sur la db et rempli la mémoire

            try {
                while (iterator.hasNext()) {//parcours la collection et récupère ses éléments
                    Document doc = iterator.next();
                    quizCounter.add(doc.getString("date"));
                }
            } catch (Exception e) {
                System.out.println(e);
            } finally {//pour vider la mémoire utiliser
                iterator.close();
            }
            return quizCounter;
        }
        else{
            LOG.info("erreur récupération info parties jouées sur le site");
            return null;
        }
    }

}
