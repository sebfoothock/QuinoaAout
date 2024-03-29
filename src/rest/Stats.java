package rest;

import connection.ConfProperties;
import database.read.ReadUser;
import servlets.Rechercher;
import beans.User;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import java.util.ArrayList;
import java.util.List;

import static connection.MongoConnector.getConnector;
//@Path("/Stats")
@Produces("application/json")
@Consumes("application/json")

/**
 * Cette classe a pour but de récupérer des données au format REST du nombre de quiz réalisé
 */

public class Stats {
    final static org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(Rechercher.class);
    org.apache.log4j.Level info = org.apache.log4j.Level.INFO;
    org.apache.log4j.Level verbose = org.apache.log4j.Level.ALL;

    String db_host = new ConfProperties().getHostProperties();

    /**
     * Cette méthode permet de récupérer les utilisateurs de la base de données
     * @return une ArrayList des utilisateurs
     */

    @GET
    public List<User> getUsers() {
        if (db_host != null) {
            ArrayList<User> user = new ReadUser().getUsers(getConnector(db_host));
            LOG.info("getUser pour les statistiques: "+user.get(0).getIdentifiant());
            return user;
        }
        else{
            return null;
        }
    }
}