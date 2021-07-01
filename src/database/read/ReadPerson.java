package database.read;

import beans.Person;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.gridfs.GridFSBucket;
import com.mongodb.client.gridfs.GridFSBuckets;
import com.mongodb.client.gridfs.GridFSDownloadStream;
import com.mongodb.client.gridfs.model.GridFSDownloadOptions;
import com.mongodb.client.gridfs.model.GridFSFile;
import org.bson.Document;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.regex.Pattern;

import static com.mongodb.client.model.Filters.eq;

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
     * @param client L'instance du connecteur Mongo DB
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
            LOG.error(e);
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
            personnage.setId(doc.getObjectId("_id"));
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
            LOG.error(e);
        }
        return personnage;
    }

    public String getNomById(MongoClient client, String id){
        Person personnage = new Person("Gandhy", 1930, "Inde", "Contre l'injustice", "résistance non-violente", "l'autonomie de l'Inde", "victoire", "anecdote", "citation", "Que vise sa 'marche du Sel' ?", "Créer un mouvement de masse contre l'occupant britannique", "Mettre en évidence les distances parcourues par les enfants indiens pour rejoindre leur école", "Visibiliser le fait que la majorité des Indien·n·e·s n'ont accès qu'à certaines denrées alimentaires", " 1jour une actu. - Gandhi", "article");
        MongoDatabase mongo = client.getDatabase(dbName);
        MongoCollection <Document> personnages = mongo.getCollection(Personnages);
        DBObject query = new BasicDBObject();
        System.out.println("QUERY: "+id);
        ObjectId objectId = new ObjectId(id);
        query.put("_id", objectId);
        String result = "";
        Document doc = personnages.find((Bson) query).first();//parcours les utilisateurs de la db et rempli la mémoire
        if(doc.isEmpty()){
            return null;
        }
        try {//récupère l'élément qui est rempli
            result = doc.getString("nom");
        }
        catch (Exception e) {
            LOG.error(e);
        }
        return result;
    }

    public FileOutputStream getImgPerso(String fileName, MongoClient mongoClient){
        MongoDatabase myDatabase = mongoClient.getDatabase(dbName);
        GridFSBucket gridFSBucket = GridFSBuckets.create(myDatabase, "imgPerso");
        try {
            FileOutputStream streamToDownloadTo = new FileOutputStream(fileName);
            GridFSDownloadOptions downloadOptions = new GridFSDownloadOptions().revision(0);
            gridFSBucket.downloadToStream(fileName, streamToDownloadTo, downloadOptions);
            streamToDownloadTo.close();
            return streamToDownloadTo;
        } catch (IOException e) {
            LOG.error(e);
        }
        return null;
    }

    public byte[] findImg(String nom,MongoClient mongoClient) {
//        byte[] originalBytes = nom.getBytes(StandardCharsets.ISO_8859_1);
//        nom = new String(originalBytes, StandardCharsets.UTF_8);
        try {
            MongoDatabase database = mongoClient.getDatabase(dbName);
            GridFSBucket gridBucket = GridFSBuckets.create(database,"imgPerso");

            GridFSFile gridFSFile = gridBucket.find(eq("metadata.perso", nom)).first();
            LOG.info("Nom:- " + nom);
            LOG.info("File Name:- " + gridFSFile.getFilename());
            LOG.info("Meta Data:- " + gridFSFile.getObjectId());

            GridFSDownloadStream downloadStream = gridBucket.openDownloadStream(gridFSFile.getObjectId());//télécharge l'image depuis mongoDB
            int fileLength = (int) downloadStream.getGridFSFile().getLength();
            byte[] data = new byte[fileLength];
            downloadStream.read(data);//conversion du bucket en byte
            downloadStream.close();
            LOG.info("fileLength:- " + fileLength);
            LOG.info("File Name:- " + downloadStream.getGridFSFile().getFilename());
            LOG.info("data length:- " + data.length);
            return data;
        } catch (Exception e) {
            LOG.error(e);
        }
        return null;
    }
}

