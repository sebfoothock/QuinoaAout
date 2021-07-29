package database.read;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;
import beans.User;

import static com.mongodb.client.model.Filters.eq;

import java.text.ParseException;
import java.util.ArrayList;

/**
 * Cette classe est destiné a lire le contenue d'un ou de tout les utilisateurs de la base de données
 */

public class ReadUser {
    private final String dbName = "security_realm";
    private final String Utilisateurs = "authentification";

    final static org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(ReadUser.class);
    org.apache.log4j.Level info = org.apache.log4j.Level.INFO;
    org.apache.log4j.Level verbose = org.apache.log4j.Level.ALL;

    /**
     * Cette méthode permet de récupérer le contenu de tout les utilisateurs de la base de données
     * @param client L'instance du connecteur Mongo DB
     * @return une ArrayList des utilisateurs
     */
    public ArrayList <User> getUsers(MongoClient client){//récupérer tout des utilisateurs
        ArrayList <User> listUser = new ArrayList<>();
        MongoDatabase mongo = client.getDatabase(dbName);
        MongoCollection <Document> utilisateurs = mongo.getCollection(Utilisateurs);
        MongoCursor <Document> iterator = utilisateurs.find().iterator();//parcours les utilisateurs de la db et rempli la mémoire
        try {
            while (iterator.hasNext()) {//parcours la collection et récupère ses éléments
                Document doc = iterator.next();
                User user = new User();
                user.setIdentifiant(doc.getString("username"));
                user.setPassword(doc.getString("password"));
                user.setAge(doc.getString("age"));
                user.setSexe(doc.getString("sexe"));
                user.setDesobei(doc.getString("desobei"));
                user.setDate(doc.getString("creation_date"));

                listUser.add(user);
            }
        }
        catch (Exception e){
            System.out.println(e);
        }
        finally {//pour vider la mémoire utiliser
            iterator.close();
        }
        return listUser;
    }

    /**
     * Cette méthode permet de récupérer le contenu d'un utilisateur de la base de données
     * @param client L'instance du connecteur Mongo DB
     * @param identifiant L'email de l'utilisateur
     * @return un objet User avec les informations de l'utilisateur
     * @throws ParseException si il y a eu un problème lors du changement de type
     */

    public User getUser(MongoClient client, String identifiant) throws ParseException {//récupérer un utilisateur
        User user = new User();
        MongoDatabase mongo = client.getDatabase(dbName);
        MongoCollection <Document> utilisateurs = mongo.getCollection(Utilisateurs);
        Document doc = utilisateurs.find(eq("username", identifiant)).first();//parcours les utilisateurs de la db et rempli la mémoire
        if(doc.isEmpty()){
            return null;
        }
        try {//récupère l'élément qui est rempli
            user.setIdentifiant(doc.getString("username"));
            user.setPassword(doc.getString("password"));
            user.setAge(doc.getString("age"));
            user.setSexe(doc.getString("sexe"));
            user.setDesobei(doc.getString("desobei"));
            user.setDate(doc.getString("creation_date"));
        }
        catch (Exception e) {
            System.out.println(e);
        }
        return user;
    }
}
