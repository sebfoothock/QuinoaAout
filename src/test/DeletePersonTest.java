package test;

import com.mongodb.BasicDBObject;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import servlets.ConfProperties;
import org.bson.Document;
import org.junit.Test;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import static servlets.MongoConnector.getConnector;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

public class DeletePersonTest {
    final static org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(test.DeletePersonTest.class);
    org.apache.log4j.Level info = org.apache.log4j.Level.INFO;
    org.apache.log4j.Level verbose = org.apache.log4j.Level.ALL;

    private final String database = "Quinoa";
    String db_host = new ConfProperties().getHostProperties();

    @Test
    public void deletePerson()  throws IOException, UnsupportedEncodingException {
        LOG.info("DeletePersonTest started");
        String nom = "Gandhy(faux)";
        MongoClient client = getConnector(db_host);
        MongoDatabase db = client.getDatabase(database);
        BasicDBObject query = new BasicDBObject("nom", nom);

        MongoCollection<Document> collection = db.getCollection("InfosPersonnage");
        long nb_deleted = collection.deleteMany(query).getDeletedCount();//donne le nombre de element supprimé
        LOG.info("nb deleted: " + nb_deleted);

        assertNotNull(nb_deleted);
    }
}
