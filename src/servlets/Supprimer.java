package servlets;

import com.google.gson.JsonObject;
import connection.ConfProperties;
import database.write.WritePerson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import static connection.MongoConnector.getConnector;

/**
 * Cette classe est le servlet de la page supprimer et qui gérer les requêtes HTTP pour celle-ci
 */

@WebServlet(name = "Supprimer")
public class Supprimer extends HttpServlet {
    final static org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(Supprimer.class);
    org.apache.log4j.Level info = org.apache.log4j.Level.INFO;
    org.apache.log4j.Level verbose = org.apache.log4j.Level.ALL;

    /**
     * Cette méthode permet d'envoyer et recevoir des requête de la DB pour supprimer un personnage de la DB
     * @param request cet objet contient la requête HTTP du servlet
     * @param response cet objet initialise la réponse HTTP du servlet
     * @throws ServletException si le servlet rencontre des difficultés
     * @throws IOException si l'entrée request ou la sortie response n'arrivent pas à être lu
     */

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        LOG.info("POST: Supprimer");
        String nom = request.getParameter("nom");
        try {
            String db_host = new ConfProperties().getHostProperties();
            PrintWriter out = response.getWriter();//mettre en format printwriter pour répondre à AJAX
            response.setContentType("text/html; charset=UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.setHeader("Cache-control", "no-cache, no-store");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "-1");
            response.setHeader("Access-Control-Allow-Origin", "*");
            response.setHeader("Access-Control-Allow-Methods", "POST");
            response.setHeader("Access-Control-Allow-Headers", "Content-Type");
            response.setHeader("Access-Control-Max-Age", "86400");
            LOG.info("nom: " + nom);
            Boolean isDeleted = new WritePerson().deletePerson(getConnector("192.168.129.133"), nom);
            JsonObject myObj = new JsonObject();
            if(db_host != null) {
                if (isDeleted) {
                    myObj.addProperty("success", true);
                } else {
                    myObj.addProperty("success", false);
                }
            }
            out.println(myObj.toString());
            out.close();//ferme le printwinter
        }

        catch(IOException ex){
            LOG.error(ex);
            //System.out.println("Erreur: "+ex);
        }
    }

    /**
     * Cette méthode permet d'afficher la page supprimer
     * @param request cet objet contient la requête HTTP du servlet
     * @param response cet objet initialise la réponse HTTP du servlet
     * @throws ServletException si le servlet rencontre des difficultés
     * @throws IOException si l'entrée request ou la sortie response n'arrivent pas à être lu
     */

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String pagePublic = "/WEB-INF/supprimer.jsp";
        request.getRequestDispatcher(pagePublic).forward(request, response);
    }
}
