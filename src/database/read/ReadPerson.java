package database.read;

import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;
import org.bson.conversions.Bson;
import beans.Person;

import java.util.ArrayList;
import java.util.regex.Pattern;

/**
 * Cette classe est destiné a lire le contenue d'un ou de tout les personnages de la base de données
 */

public class ReadPerson {
    private final String dbName = "Quinoa";
    private final String Personnages = "InfosPersonnage";

    final static org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(ReadPerson.class);
    org.apache.log4j.Level info = org.apache.log4j.Level.INFO;
    org.apache.log4j.Level verbose = org.apache.log4j.Level.ALL;

    /**
     * Cette méthode permet de récupérer le contenu de tout les personnages de la base de données
     * @param client ?
     * @return une ArrayList des personnages
     */

    public ArrayList<Person> getPersons(MongoClient client){
        ArrayList <Person> listPerson = new ArrayList<>();
        MongoDatabase mongo = client.getDatabase(dbName);
        MongoCollection <Document> personnages = mongo.getCollection(Personnages);
        MongoCursor <Document> iterator = personnages.find().iterator();//parcours les utilisateurs de la db et rempli la mémoire
        try {
            while (iterator.hasNext()) {//parcours la collection et récupère ses éléments
                Document doc = iterator.next();
                Person personnage = new Person("Gandhy", 1930, "Inde", "Contre l'injustice", "résistance non-violente", "l'autonomie de l'Inde", "victoire", "anecdote", "citation", "Que vise sa 'marche du Sel' ?", "Créer un mouvement de masse contre l'occupant britannique", "Mettre en évidence les distances parcourues par les enfants indiens pour rejoindre leur école", "Visibiliser le fait que la majorité des Indien·n·e·s n'ont accès qu'à certaines denrées alimentaires", " 1jour une actu. - Gandhi", "article");
                personnage.setNom(doc.getString("nom"));
                personnage.setAnnee(doc.getInteger("periode"));
                personnage.setLieu(doc.getString("lieu"));
                personnage.setLutte(doc.getString("lutte"));
                personnage.setStrategie(doc.getString("strategie"));
                personnage.setAction(doc.getString("action"));
                personnage.setVictoire(doc.getString("victoire"));
                personnage.setAnecdote(doc.getString("anecdote"));
                personnage.setCitation(doc.getString("citation"));
                personnage.setQuestion(doc.getString("question"));
                personnage.setReponse1(doc.getString("reponse1"));
                personnage.setReponse2(doc.getString("reponse2"));
                personnage.setReponse3(doc.getString("reponse3"));
                personnage.setVideo(doc.getString("video"));
                personnage.setArticle(doc.getString("article"));
                listPerson.add(personnage);
            }
        }
        catch (Exception e){
            System.out.println(e);
        }
        finally {//pour vider la mémoire utiliser
            iterator.close();
        }
        return listPerson;
    }

    /**
     * Cette méthode permet de récupérer le contenu d'un personnage de la base de données
     * @param client L'instance du connecteur Mongo DB
     * @param nom Le nom du personnage pour lequel nous voulons récurer les information
     * @return un objet Person avec les informations du personnage
     */

    public Person getPerson(MongoClient client, String nom){
        Person personnage = new Person("Gandhy", 1930, "Inde", "Contre l'injustice", "résistance non-violente", "l'autonomie de l'Inde", "victoire", "anecdote", "citation", "Que vise sa 'marche du Sel' ?", "Créer un mouvement de masse contre l'occupant britannique", "Mettre en évidence les distances parcourues par les enfants indiens pour rejoindre leur école", "Visibiliser le fait que la majorité des Indien·n·e·s n'ont accès qu'à certaines denrées alimentaires", " 1jour une actu. - Gandhi", "article");
        MongoDatabase mongo = client.getDatabase(dbName);
        MongoCollection <Document> personnages = mongo.getCollection(Personnages);
        DBObject query = new BasicDBObject();
        System.out.println("QUERY: "+nom);
        query.put("nom", Pattern.compile(nom , Pattern.CASE_INSENSITIVE));
        Document doc = personnages.find((Bson) query).first();//parcours les utilisateurs de la db et rempli la mémoire
        if(doc.isEmpty()){
            return null;
        }
        try {//récupère l'élément qui est rempli
            personnage.setNom(doc.getString("nom"));
            personnage.setAnnee(doc.getInteger("periode"));
            personnage.setLieu(doc.getString("lieu"));
            personnage.setLutte(doc.getString("lutte"));
            personnage.setStrategie(doc.getString("strategie"));
            personnage.setAction(doc.getString("action"));
            personnage.setVictoire(doc.getString("victoire"));
            personnage.setAnecdote(doc.getString("anecdote"));
            personnage.setCitation(doc.getString("citation"));
            personnage.setQuestion(doc.getString("question"));
            personnage.setReponse1(doc.getString("reponse1"));
            personnage.setReponse2(doc.getString("reponse2"));
            personnage.setReponse3(doc.getString("reponse3"));
            personnage.setVideo(doc.getString("video"));
            personnage.setArticle(doc.getString("article"));
        }
        catch (Exception e) {
            System.out.println(e);
        }
        return personnage;
    }
}

