package servlets;

import com.google.gson.JsonObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.ArrayList;

import static servlets.MongoConnector.getConnector;

/**
 * Cette classe est le servlet de la page inscription et qui gérer les requêtes HTTP pour celle-ci
 */

@WebServlet(name = "Inscription")
public class Inscription extends HttpServlet {
    final static org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(Rechercher.class);
    org.apache.log4j.Level info = org.apache.log4j.Level.INFO;
    org.apache.log4j.Level verbose = org.apache.log4j.Level.ALL;

    /**
     * Cette méthode permet d'envoyer et recevoir des requête de la DB pour créer un nouvelle utilisateur
     * @param request cet objet contient la requête HTTP du servlet
     * @param response cet objet initialise la réponse HTTP du servlet
     * @throws ServletException si le servlet rencontre des difficultés
     * @throws IOException si l'entré request ou la sortie response n'arrivent pas à être lu
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        User user = null;//création user
        try {
            user = new User();
        } catch (ParseException e) {
            e.printStackTrace();
        }

        user.setIdentifiant(request.getParameter("identifiant"));
        user.setPassword(request.getParameter("password"));
        user.setAge(request.getParameter("age"));
        user.setSexe(request.getParameter("sexe"));
        user.setDesobei(request.getParameter("desobei"));
        ArrayList<String> roles = new ArrayList<>();
        roles.add("player");
        user.setRoles(roles);
        try {
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
            WriteUser w_user = new WriteUser();

            LOG.info("inscription utilisateur => id : " + user.getIdentifiant());
        JsonObject myObj = new JsonObject();
        if(db_host != null) {
            w_user.addUser(user, getConnector(db_host));
            if (w_user.isAdded(getConnector(db_host), user.getIdentifiant())) {
                myObj.addProperty("success", true);
            } else {
                myObj.addProperty("error", false);
            }
        }
            out.println(myObj.toString());
            out.close();
        }

        catch(IOException ex){
            LOG.error(ex);
            //System.out.println("Erreur: "+ex);
        }
    }

    /**
     * Cette méthode permet d'afficher la page inscription
     * @param request cet objet contient la requête HTTP du servlet
     * @param response cet objet initialise la réponse HTTP du servlet
     * @throws ServletException si le servlet rencontre des difficultés
     * @throws IOException si l'entrée request ou la sortie response n'arrivent pas à être lu
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String pagePublic = "/WEB-INF/inscription.jsp";
        request.getRequestDispatcher(pagePublic).forward(request, response);
    }
}
