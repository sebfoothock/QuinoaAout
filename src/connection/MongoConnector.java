package connection;

import com.mongodb.MongoClient;

/**
 * Cette classe permet de commencer ou d'arrêter une liaison avec la base de données
 */

public class MongoConnector extends MongoClient {
    private static MongoConnector connexion = null;//static réservation mémoire et var normale allocation

    public MongoConnector(String host) {//host = ip serveur
        super(host);//si change port mongoDB faire =>  super(host, numPort);
    }

    /**
     * Cette méthode permet de commencer une liaison avec la base de données
     * @param host IP de la base de données
     * @return ?
     */

    public static MongoClient getConnector(String host){
        if(connexion == null){
            connexion = new MongoConnector(host);
        }
        return connexion;
    }

    /**
     * Cette méthode permet d'arrêter une liaison avec la base de données
     */

    public static void closeConnector(){
        if(connexion != null){
            connexion.close();
//            mongoClient.close();
        }
    }
}
