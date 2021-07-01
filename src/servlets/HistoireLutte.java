package servlets;

import beans.Person;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.mongodb.client.gridfs.GridFSDownloadStream;
import com.mongodb.client.gridfs.model.GridFSFile;
import connection.ConfProperties;
import database.read.ReadPerson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Base64;

import static connection.MongoConnector.getConnector;

/**
 * Cette classe est le servlet de la page histoires de luttes et qui gérer les requêtes HTTP pour celle-ci
 */

@WebServlet(name = "HistoireLutte")
public class HistoireLutte extends HttpServlet {
    final static org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(Liste.class);
    org.apache.log4j.Level info = org.apache.log4j.Level.INFO;
    org.apache.log4j.Level verbose = org.apache.log4j.Level.ALL;

    /**
     * Cette méthode permet d'envoyer et recevoir des requête de la DB pour récupérer tout les personnages de la DB
     * @param request cet objet contient la requête HTTP du servlet
     * @param response cet objet initialise la réponse HTTP du servlet
     * @throws ServletException si le servlet rencontre des difficultés
     * @throws IOException si l'entrée request ou la sortie response n'arrivent pas à être lu
     */

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            String db_host = new ConfProperties().getHostProperties();
            PrintWriter out = response.getWriter();
            response.setContentType("text/html; charset=UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.setHeader("Cache-control", "no-cache, no-store");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "-1");
            response.setHeader("Access-Control-Allow-Origin", "*");
            response.setHeader("Access-Control-Allow-Methods", "POST");
            response.setHeader("Access-Control-Allow-Headers", "Content-Type");
            response.setHeader("Access-Control-Max-Age", "86400");

            if(db_host != null) {
                ArrayList<Person> pers = new ReadPerson().getPersons(getConnector(db_host));//ajout : appel writePerso & supprimer : appel deletePerson
                for(Person p:pers){
                    byte[] data = new ReadPerson().findImg(p.getNom(),getConnector(db_host));
                    if(data != null){
                        String base64Image = Base64.getEncoder().encodeToString(data);
                        LOG.info("base64Image: "+base64Image);
                        p.setImg(base64Image);
                    } else {
                        LOG.info("data is null");
                    }
                }
                Gson gson = new Gson();
                JsonObject myObj = new JsonObject();

                JsonElement bdcObj = gson.toJsonTree(pers);
                if (pers != null) {
                    LOG.info("Liste des utilisateurs");
                    myObj.addProperty("success", true);
                } else {
                    myObj.addProperty("success", false);
                }
                LOG.debug("bdcObj: "+bdcObj.toString());
                myObj.add("results", bdcObj);
                LOG.debug("myObj: "+myObj.toString());
                out.println(myObj.toString());
            }
            out.close();
        } catch(IOException ex){
            LOG.error(ex);
            //System.out.println("Erreur: "+ex);
        }
    }

    /**
     * Cette méthode permet d'afficher la page histoires de luttes
     * @param request cet objet contient la requête HTTP du servlet
     * @param response cet objet initialise la réponse HTTP du servlet
     * @throws ServletException si le servlet rencontre des difficultés
     * @throws IOException si l'entrée request ou la sortie response n'arrivent pas à être lu
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.setCharacterEncoding("UTF-8");
            String pagePublic = "/WEB-INF/histoireLutte.jsp";
            request.getRequestDispatcher(pagePublic).forward(request, response);
    }
}
