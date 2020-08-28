package database.write;

import com.mongodb.BasicDBObject;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;
import beans.User;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Cette classe est destiné a écrire, de modifier ou supprimer le contenue d'un utilisateur la base de données
 */

public class WriteUser {
    private final String database = "security_realm";

    final static org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(WriteUser.class);
    org.apache.log4j.Level info = org.apache.log4j.Level.INFO;
    org.apache.log4j.Level verbose = org.apache.log4j.Level.ALL;

        public WriteUser() {
        }

    /**
     * Cette méthode permet de rajouter un utilisateurs de la base de données
     * @param user objet user à ajouter à la base de données
     * @param mongoClient L'instance du connecteur Mongo DB
     * @throws IOException si les entrées de l'objet user n'arrivent pas à être lu
     * @throws UnsupportedEncodingException si un des caractères de l'objet user n'est pas supporté
     */
        
        public void addUser(User user, MongoClient mongoClient) throws IOException, UnsupportedEncodingException {

            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            Date date = new Date();
            String today = dateFormat.format(date);

            MongoDatabase db = mongoClient.getDatabase(database);
            MongoCollection<Document> collection = db.getCollection("authentification");

            /*
            hachage mot de passe en SHA-256
             */
            String password =  user.getPassword();
            MessageDigest messageDigest = null;
            try {
                messageDigest = MessageDigest.getInstance("SHA-256");
            } catch (NoSuchAlgorithmException e) {
                LOG.error(e);
            }
            messageDigest.update(password.getBytes());
            byte byteData[] = messageDigest.digest();
            StringBuffer hexString = new StringBuffer();
            for (int i = 0; i < byteData.length; i++) {
                String hex=Integer.toHexString(0xff & byteData[i]);
                if (hex.length()==1)
                    hexString.append('0');
                hexString.append(hex);
            }

            Document document = new Document();
            document.append("username", user.getIdentifiant())
                    .append("password",hexString.toString())
                    .append("age", user.getAge())
                    .append("sexe", user.getSexe())
                    .append("desobei", user.getDesobei())
                    .append("creation_date",today)
                    .append("roles", user.getRoles());
            collection.insertOne(document);//insertion dans la collection

        }

    /**
     * Cette méthode permet de modifier un utilisateurs de la base de données
     * @param user objet user à modifier à la base de données
     * @param mongoClient L'instance du connecteur Mongo DB
     * @throws IOException si les entrées de l'objet person n'arrivent pas à être lu
     * @throws UnsupportedEncodingException si un des caractères de l'objet person n'est pas supporté
     */

        public Boolean updateUser(User user, MongoClient mongoClient) throws IOException, UnsupportedEncodingException {

            BasicDBObject query = new BasicDBObject("username", user.getIdentifiant());

            MongoDatabase db = mongoClient.getDatabase(database);
            MongoCollection <Document> collection = db.getCollection("Utilisateurs");

            BasicDBObject update = new BasicDBObject();
            update.append("$set", new Document()//$set permet de modifier une colonne
                    .append("username", user.getIdentifiant())
                    .append("password", user.getPassword())
                    .append("age", user.getAge())
                    .append("sexe", user.getSexe())
                    .append("desobei", user.getDesobei())
            );
            long nb_modified = collection.updateOne(query, update).getModifiedCount();//query = modifie un user sur base de son identifiant , updateOne = modifier un seul document, UpdateOption = si la donnée n'existe pas il va la créer
            LOG.info("nb_modified: "+nb_modified);
            if(nb_modified > 0){
                return true;
            } else {
                return false;
            }
        }

    /**
     * Cette méthode permet de supprimer un utilisateurs de la base de données
     * @param identifiant L'identifiant de l'utilisateur à supprimer de la base de données
     * @param mongoClient L'instance du connecteur Mongo DB
     * @throws IOException si l'entré identifiant n'arrive pas à être lu
     * @throws UnsupportedEncodingException si un des caractères de identifiant n'est pas supporté
     */

        public Boolean deleteUser(MongoClient mongoClient, String identifiant)  throws IOException, UnsupportedEncodingException {

            MongoDatabase db = mongoClient.getDatabase(database);
            BasicDBObject query = new BasicDBObject("username", identifiant);

            MongoCollection<Document> collection = db.getCollection("Utilisateurs");
            collection.deleteMany(query);

            long nb_deleted = collection.deleteMany(query).getDeletedCount();//donne le nombre de element supprimé
            LOG.info("nb deleted: "+nb_deleted);
            if(nb_deleted > 0){
                return true;
            } else {
                return false;
            }
        }

    /**
     * Cette méthode permet de vérifier si un utilisateur à bien été rajouter suite à la fucntion addUser
     * @param mongoClient L'instance du connecteur Mongo DB
     * @param identifiant L'identifiant de l'utilisateur qui a été ajouté de la base de données
     * @return un true si l'ajout c'est bien fait sinon retourne un false
     */

    public Boolean isAdded(MongoClient mongoClient, String identifiant){//vérifie si ajouté
        MongoDatabase db = mongoClient.getDatabase(database);
        BasicDBObject query = new BasicDBObject("username", identifiant);
        MongoCollection<Document> collection = db.getCollection("Utilisateurs");
        long nb_count = collection.countDocuments(query);//donne le nombre de document en fonction du nom du personnage
        if(nb_count > 0){
            return true;
        } else {
            return false;
        }
    }
}
