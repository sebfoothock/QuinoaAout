package rest;

import beans.User;
import database.read.ReadUser;
import servlets.Rechercher;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import java.util.ArrayList;
import java.util.List;

import static connection.MongoConnector.getConnector;
@Path("/stats")
@Produces("application/json")
@Consumes("application/json")
public class REST {
    final static org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(Rechercher.class);
    org.apache.log4j.Level info = org.apache.log4j.Level.INFO;
    org.apache.log4j.Level verbose = org.apache.log4j.Level.ALL;

    String db_host = new connection.ConfProperties().getHostProperties();

        @Path("/users")//Rest n'aime pas les majuscules
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
