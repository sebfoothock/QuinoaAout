package connection;

import com.mongodb.MongoClient;

public class MongoConnector extends MongoClient {
    private static MongoConnector connexion = null;//static réservation mémoire et var normale allocation

    public MongoConnector(String host) {//host = ip serveur
        super(host);//si change port mongoDB faire =>  super(host, numPort);
    }

    public static MongoClient getConnector(String host){
        if(connexion == null){
            connexion = new MongoConnector(host);
        }
        return connexion;
    }

    public static void closeConnector(){
        if(connexion != null){
            connexion.close();
//            mongoClient.close();
        }
    }
}
