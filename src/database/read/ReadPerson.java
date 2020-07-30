package database.read;

import beans.Person;
import beans.User;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;

import java.util.ArrayList;

import static com.mongodb.client.model.Filters.eq;

public class ReadPerson {
    private final String dbName = "Quinoa";
    private final String Personnage = "InfosPersonnage";

//    public ArrayList<Person> getPersons(MongoClient client){//récupérer tout des utilisateurs
//        ArrayList <Person> listPerson = new ArrayList<>();
//        MongoDatabase mongo = client.getDatabase(dbName);
//        MongoCollection <Document> personnages = mongo.getCollection(Personnage);
//        MongoCursor<Document> iterator = personnages.find().iterator();//parcours les utilisateurs de la db et rempli la mémoire
//        try {
//            while (iterator.hasNext()) {//parcours la collection et récupère ses éléments
//                Document doc = iterator.next();
//                Person personnage = new Person();
//                Person.setNom(doc.getString("nom"));
//                Person.setAnnee(doc.getInteger("annee"));
//                Person.setLieu(doc.getString("lieu"));
//                Person.setLutte(doc.getString("lutte"));
//                Person.setStrategie(doc.getString("strategie"));
//                Person.setAction(doc.getString("action"));
//                Person.setVictoire(doc.getString("victoire"));
//                Person.setAnecdote(doc.getString("anecdote"));
//                Person.setCitation(doc.getString("citation"));
//                Person.setQuestion(doc.getString("question"));
//                Person.setReponse1(doc.getString("reponse1"));
//                Person.setReponse2(doc.getString("reponse2"));
//                Person.setReponse3(doc.getString("reponse3"));
//                Person.setVideo(doc.getString("video"));
//                Person.setArticle(doc.getString("article"));
//                listPerson.add(personnage);
//            }
//        }
//        catch (Exception e){
//            System.out.println(e);
//        }
//        finally {//pour vider la mémoire utiliser
//            iterator.close();
//        }
//        return listPerson;
//    }
//
//    public Person getPerson(MongoClient client, String nom){//récupérer des personnages
//        Person personnage = new Person();
//        MongoDatabase mongo = client.getDatabase(dbName);
//        MongoCollection<Document> personnages = mongo.getCollection(Personnage);
//        Document doc = personnages.find(eq("nom", nom)).first();//parcours les utilisateurs de la db et rempli la mémoire
//        if(doc.isEmpty()){
//            return null;
//        }
//        try {//récupère l'élément qui est rempli
//            Person.setNom(doc.getString("nom"));
//            Person.setAnnee(doc.getInteger("annee"));
//            Person.setLieu(doc.getString("lieu"));
//            Person.setLutte(doc.getString("lutte"));
//            Person.setStrategie(doc.getString("strategie"));
//            Person.setAction(doc.getString("action"));
//            Person.setVictoire(doc.getString("victoire"));
//            Person.setAnecdote(doc.getString("anecdote"));
//            Person.setCitation(doc.getString("citation"));
//            Person.setQuestion(doc.getString("question"));
//            Person.setReponse1(doc.getString("reponse1"));
//            Person.setReponse2(doc.getString("reponse2"));
//            Person.setReponse3(doc.getString("reponse3"));
//            Person.setVideo(doc.getString("video"));
//            Person.setArticle(doc.getString("article"));
//        }
//        catch (Exception e) {
//            System.out.println(e);
//        }
//        return personnage;
//    }
//
//
//
//} public ArrayList<Person> getPersons(MongoClient client){//récupérer tout des utilisateurs
//        ArrayList <Person> listPerson = new ArrayList<>();
//        MongoDatabase mongo = client.getDatabase(dbName);
//        MongoCollection <Document> personnages = mongo.getCollection(Personnage);
//        MongoCursor<Document> iterator = personnages.find().iterator();//parcours les utilisateurs de la db et rempli la mémoire
//        try {
//            while (iterator.hasNext()) {//parcours la collection et récupère ses éléments
//                Document doc = iterator.next();
//                Person personnage = new Person();
//                Person.setNom(doc.getString("nom"));
//                Person.setAnnee(doc.getInteger("annee"));
//                Person.setLieu(doc.getString("lieu"));
//                Person.setLutte(doc.getString("lutte"));
//                Person.setStrategie(doc.getString("strategie"));
//                Person.setAction(doc.getString("action"));
//                Person.setVictoire(doc.getString("victoire"));
//                Person.setAnecdote(doc.getString("anecdote"));
//                Person.setCitation(doc.getString("citation"));
//                Person.setQuestion(doc.getString("question"));
//                Person.setReponse1(doc.getString("reponse1"));
//                Person.setReponse2(doc.getString("reponse2"));
//                Person.setReponse3(doc.getString("reponse3"));
//                Person.setVideo(doc.getString("video"));
//                Person.setArticle(doc.getString("article"));
//                listPerson.add(personnage);
//            }
//        }
//        catch (Exception e){
//            System.out.println(e);
//        }
//        finally {//pour vider la mémoire utiliser
//            iterator.close();
//        }
//        return listPerson;
//    }
//
//    public Person getPerson(MongoClient client, String nom){//récupérer des personnages
//        Person personnage = new Person();
//        MongoDatabase mongo = client.getDatabase(dbName);
//        MongoCollection<Document> personnages = mongo.getCollection(Personnage);
//        Document doc = personnages.find(eq("nom", nom)).first();//parcours les utilisateurs de la db et rempli la mémoire
//        if(doc.isEmpty()){
//            return null;
//        }
//        try {//récupère l'élément qui est rempli
//            Person.setNom(doc.getString("nom"));
//            Person.setAnnee(doc.getInteger("annee"));
//            Person.setLieu(doc.getString("lieu"));
//            Person.setLutte(doc.getString("lutte"));
//            Person.setStrategie(doc.getString("strategie"));
//            Person.setAction(doc.getString("action"));
//            Person.setVictoire(doc.getString("victoire"));
//            Person.setAnecdote(doc.getString("anecdote"));
//            Person.setCitation(doc.getString("citation"));
//            Person.setQuestion(doc.getString("question"));
//            Person.setReponse1(doc.getString("reponse1"));
//            Person.setReponse2(doc.getString("reponse2"));
//            Person.setReponse3(doc.getString("reponse3"));
//            Person.setVideo(doc.getString("video"));
//            Person.setArticle(doc.getString("article"));
//        }
//        catch (Exception e) {
//            System.out.println(e);
//        }
//        return personnage;
//    }
//
//
//
}
