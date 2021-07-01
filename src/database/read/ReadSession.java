package database.read;

import beans.Session;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class ReadSession {

    private final String dbName = "Quinoa";
    private final String session = "Session";

    final static org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(ReadSession.class);
    org.apache.log4j.Level info = org.apache.log4j.Level.INFO;
    org.apache.log4j.Level verbose = org.apache.log4j.Level.ALL;


    /**
     * Cette méthode permet de récupérer le contenu de tout les sessions de la base de données
     * @param client L'instance du connecteur Mongo DB
     * @return une ArrayList des personnages
     */

    public ArrayList<Session> getSession(MongoClient client){
        ArrayList <Session> listSession = new ArrayList<>();
        MongoDatabase mongo = client.getDatabase(dbName);
        MongoCollection<Document> sessions = mongo.getCollection(session);
        MongoCursor<Document> iterator = sessions.find().iterator();//parcours les utilisateurs de la db et rempli la mémoire
        LOG.info("connexion à la collection Session");
        try {
            while (iterator.hasNext()) {//parcours la collection et récupère ses éléments
                Document doc = iterator.next();
                Session sess = new Session();
                sess.setUsername(doc.getString("username"));
                sess.setTimestart(doc.getString("timestart"));
                sess.setRoles((ArrayList<String>) doc.get("roles"));

                listSession.add(sess);
            }
        }
        catch (Exception e){
            LOG.error(e);
        }
        finally {//pour vider la mémoire utiliser
            iterator.close();
            LOG.info("récupération de la collection Session terminé");
        }
        return listSession;
    }

    /**
     * Cette méthode permet de trouver quelle est la session la plus récente de la base de données
     * @param listsessions dfsd
     * @return dsfsdf
     */

    public Session getLastSession(ArrayList<Session> listsessions) throws ParseException {
        Session tmpsess = null;
        if(listsessions != null){
            if(!listsessions.isEmpty()){
                tmpsess = listsessions.get(0);
                for(Session sess:listsessions){
                    SimpleDateFormat sdformat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                    Date tmpsessd1 = sdformat.parse(tmpsess.getTimestart());
                    Date sessd2 = sdformat.parse(sess.getTimestart());
                    LOG.debug("tmpsessd1: " + sdformat.format(tmpsessd1));
                    LOG.debug("sessd2: " + sdformat.format(sessd2));
                    if(tmpsessd1.compareTo(sessd2) > 0) {
                        LOG.debug("Date 1 est après Date 2");
                    } else if(tmpsessd1.compareTo(sessd2) < 0) {
                        LOG.debug("Date 1 est avant Date 2");
                        tmpsess = sess;
                    }
                }
            } else {
                LOG.info("liste vide");
            }
        } else {
            LOG.info("liste null");
        }
            return tmpsess;
    }
}
