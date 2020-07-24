package database.read;

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

    public User getUser(MongoClient client, String identifiant){//récupérer des personnages
        User user = new User();
        MongoDatabase mongo = client.getDatabase(dbName);
        MongoCollection<Document> utilisateurs = mongo.getCollection(Personnage);
        Document doc = utilisateurs.find(eq("identifiant", identifiant)).first();//parcours les utilisateurs de la db et rempli la mémoire
        if(doc.isEmpty()){
            return null;
        }
        try {//récupère l'élément qui est rempli
            user.setIdentifiant(doc.getString("identifiant"));
            user.setPassword(doc.getString("password"));
            user.setAge(doc.getString("age"));
            user.setAge(doc.getString("sexe"));
            user.setAge(doc.getString("desobei"));
        }
        catch (Exception e) {
            System.out.println(e);
        }
        return user;
    }

    public ArrayList<User> getUsers(MongoClient client){//récupérer tout des utilisateurs
        ArrayList <User> listUser = new ArrayList<>();
        MongoDatabase mongo = client.getDatabase(dbName);
        MongoCollection <Document> utilisateurs = mongo.getCollection(Personnage);
        MongoCursor<Document> iterator = utilisateurs.find().iterator();//parcours les utilisateurs de la db et rempli la mémoire
        try {
            while (iterator.hasNext()) {//parcours la collection et récupère ses éléments
                Document doc = iterator.next();
                User user = new User();
                user.setIdentifiant(doc.getString("identifiant"));
                user.setPassword(doc.getString("password"));
                user.setAge(doc.getString("age"));
                user.setAge(doc.getString("sexe"));
                user.setAge(doc.getString("desobei"));
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

}
