package database.read;

import beans.User;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;
import static com.mongodb.client.model.Filters.eq;

import java.text.ParseException;
import java.util.ArrayList;


public class ReadUser {
    private final String dbName = "Quinoa";
    private final String Utilisateurs = "Utilisateurs";

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
     *
     * @param client
     * @param identifiant
     * @return
     * @throws ParseException
     */

    public User getUser(MongoClient client, String identifiant) throws ParseException {//récupérer un utilisateur
        User user = new User();
        MongoDatabase mongo = client.getDatabase(dbName);
        MongoCollection <Document> utilisateurs = mongo.getCollection(Utilisateurs);
        Document doc = utilisateurs.find(eq("identifiant", identifiant)).first();//parcours les utilisateurs de la db et rempli la mémoire
        if(doc.isEmpty()){
            return null;
        }
        try {//récupère l'élément qui est rempli
            user.setIdentifiant(doc.getString("identifiant"));
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
