package database.write;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;
import org.bson.conversions.Bson;

public class QuizCounter {

    final static org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(QuizCounter.class);
    org.apache.log4j.Level info = org.apache.log4j.Level.INFO;
    org.apache.log4j.Level verbose = org.apache.log4j.Level.ALL;

    private final String database = "Quinoa";

    public QuizCounter() {

    }

    public boolean IncrementCounter(MongoClient mongoClient) {
        LOG.info("IncrementCounter");
        BasicDBObject query = new BasicDBObject("id", "100QUIZ");
        MongoDatabase db = mongoClient.getDatabase(database);
        MongoCollection<Document> collection = db.getCollection("Compteur");

        int nbquiz = readCounter(mongoClient);
        LOG.info("nbquiz: "+nbquiz);
        nbquiz++;
        BasicDBObject update = new BasicDBObject();
        update.append("$set", new Document().append("nbQuiz", nbquiz));

        long nb_modified = collection.updateOne(query, update).getModifiedCount();
        LOG.info("nb_modified: "+nb_modified);
        if (nb_modified > 0) {
            return true;
        } else {
            return false;
        }
    }

    public int readCounter(MongoClient mongoClient){
        MongoDatabase db = mongoClient.getDatabase(database);
        MongoCollection<Document> collection = db.getCollection("Compteur");
        BasicDBObject query = new BasicDBObject("id", "100QUIZ");
        Document doc = collection.find(query).first();
        return doc.getInteger("nbQuiz");
    }

}
