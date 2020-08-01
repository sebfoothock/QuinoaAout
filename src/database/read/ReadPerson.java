package database.read;

import beans.Person;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;
import static com.mongodb.client.model.Filters.eq;

import java.util.ArrayList;

public class ReadPerson {
    private final String dbName = "Quinoa";
    private final String Personnages = "InfosPersonnage";

    public ArrayList<Person> getPersons(MongoClient client){//récupérer tout des utilisateurs
        ArrayList <Person> listPerson = new ArrayList<>();
        MongoDatabase mongo = client.getDatabase(dbName);
        MongoCollection <Document> personnages = mongo.getCollection(Personnages);
        MongoCursor <Document> iterator = personnages.find().iterator();//parcours les utilisateurs de la db et rempli la mémoire
        try {
            while (iterator.hasNext()) {//parcours la collection et récupère ses éléments
                Document doc = iterator.next();
                Person personnage = new Person();
                personnage.setNom(doc.getString("nom"));
                personnage.setAnnee(doc.getInteger("annee"));
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

    public Person getPerson(MongoClient client, String nom){//récupérer des personnages
        Person personnage = new Person();
        MongoDatabase mongo = client.getDatabase(dbName);
        MongoCollection <Document> personnages = mongo.getCollection(Personnages);
        Document doc = personnages.find(eq("nom", nom)).first();//parcours les utilisateurs de la db et rempli la mémoire
        if(doc.isEmpty()){
            return null;
        }
        try {//récupère l'élément qui est rempli
            personnage.setNom(doc.getString("nom"));
            personnage.setAnnee(doc.getInteger("annee"));
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

