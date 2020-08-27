package test;

import servlets.Person;
import com.mongodb.BasicDBObject;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import servlets.ConfProperties;
import org.bson.Document;
import org.junit.Test;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import static com.mongodb.client.model.Filters.eq;
import static servlets.MongoConnector.getConnector;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

/**
 * Cette classe permet de tester la modification d'un personnage dans la base de données
 */

public class UpdatePersonTest {

    final static org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(test.UpdatePersonTest.class);
    org.apache.log4j.Level info = org.apache.log4j.Level.INFO;
    org.apache.log4j.Level verbose = org.apache.log4j.Level.ALL;

    private final String database = "Quinoa";
    String db_host = new ConfProperties().getHostProperties();

    /**
     * Cette méthode test la méthode updatePerson
     *
     * @throws IOException                  si les entrées de l'objet person n'arrivent pas à être lu
     * @throws UnsupportedEncodingException si un des caractères de l'objet person n'est pas supporté
     */

    @Test
    public void updatePersonTest() throws IOException, UnsupportedEncodingException {
        LOG.info("updatePersonTest started");
        MongoClient client = getConnector(db_host);
        Person person = new Person("Gandhy(faux)", 2020, "Europe", "Contre l'injustice", "résistance non-violente", "l'autonomie de l'Inde",
                "victoire", "anecdote", "citation", "Que vise sa 'marche du Sel' ?", "Créer un mouvement de masse contre l'occupant britannique",
                "Mettre en évidence les distances parcourues par les enfants indiens pour rejoindre leur école", "Visibiliser le fait que la majorité des Indien·n·e·s n'ont accès qu'à certaines denrées alimentaires",
                "1jour une actu. - Gandhi", "article");

        BasicDBObject query = new BasicDBObject("nom", person.getNom());

        MongoDatabase db = client.getDatabase(database);
        MongoCollection<Document> collection = db.getCollection("InfosPersonnage");

        BasicDBObject update = new BasicDBObject();
        update.append("$set", new Document()
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
        LOG.info("nb_modified: " + nb_modified);
        assertNotNull(nb_modified);
    }


//    /**
//     * Cette méthode test la méthode getPerson
//     * @throws ParseException si il y a eu un problème lors du changement de type
//     */
//
//    @Test
//    public void getPersonTest() throws ParseException {//récupérer un utilisateur
//        LOG.info("getPersonTest started");
//        MongoClient client = getConnector(db_host);
//        String nom = "Gandhy";
//        Person person = new Person();
//        MongoDatabase mongo = client.getDatabase(database);
//        MongoCollection<Document> personnages = mongo.getCollection("InfosPersonnage");
//        Document doc = personnages.find(eq("nom", nom)).first();//parcours les utilisateurs de la db et rempli la mémoire
//        if(doc == null){
//            LOG.info("return null");
//        } else {
//            if(doc.isEmpty()){
//                LOG.info("return null (isEmpty)");
//            }
//        }
//        try {
//            person.setNom(doc.getString("nom"));
//            person.setAnnee(doc.getInteger("annee"));
//            person.setLieu(doc.getString("lieu"));
//            person.setLutte(doc.getString("lutte"));
//            person.setStrategie(doc.getString("strategie"));
//            person.setAction(doc.getString("action"));
//            person.setVictoire(doc.getString("victoire"));
//            person.setAnecdote(doc.getString("anecdote"));
//            person.setCitation(doc.getString("citation"));
//            person.setQuestion(doc.getString("question"));
//            person.setReponse1(doc.getString("creation_date"));
//            person.setReponse2(doc.getString("creation_date"));
//            person.setReponse3(doc.getString("creation_date"));
//            person.setVideo(doc.getString("creation_date"));
//            person.setArticle(doc.getString("creation_date"));
//        }
//        catch (Exception e) {
//            System.out.println(e);
//        }
//        assertEquals("Gandhy(faux)",person.getNom());
//        assertEquals("1930",person.getAnnee());
//        assertEquals("Inde",person.getLieu());
//        assertEquals("Contre l'injustice",person.getLutte());
//        assertEquals("résistance non-violente",person.getStrategie());
//        assertEquals("l'autonomie de l'Inde",person.getAction());
//        assertEquals("victoire",person.getVictoire());
//        assertEquals("anecdote",person.getAnecdote());
//        assertEquals("citation",person.getCitation());
//        assertEquals("Que vise sa 'marche du Sel' ?",person.getQuestion());
//        assertEquals("Créer un mouvement de masse contre l'occupant britannique",person.getReponse1());
//        assertEquals("Mettre en évidence les distances parcourues par les enfants indiens pour rejoindre leur école",person.getReponse2());
//        assertEquals("Visibiliser le fait que la majorité des Indien·n·e·s n'ont accès qu'à certaines denrées alimentaires",person.getReponse3());
//        assertEquals("1jour une actu. - Gandhi",person.getVideo());
//        assertEquals("article",person.getArticle());
//    }

}
