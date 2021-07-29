package servlets;

import beans.Person;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import connection.ConfProperties;
import database.read.ReadPerson;
import database.QuizCounter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import static connection.MongoConnector.getConnector;

/**
 * Cette classe est le servlet de la page quiz et qui gérer les requêtes HTTP pour celle-ci
 */

@WebServlet(name = "Quiz")
public class Quiz extends HttpServlet {
    final static org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(Quiz.class);
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
                Gson gson = new Gson();
                JsonObject myObj = new JsonObject();

//                boolean modifiedCounter = new QuizCounter().IncrementCounter(getConnector(db_host));
                new QuizCounter().addGameInfo(getConnector(db_host));
//                if(modifiedCounter == true){
//                    LOG.info("compteur incrémenter");
//                }
//                else{
//                    LOG.info("compteur pas incrémenter");
//                }


                JsonElement bdcObj = gson.toJsonTree(pers);
                if (pers != null ) {
                    LOG.info("Questions personnages");
                    myObj.addProperty("success", true);
                } else {
                    myObj.addProperty("error", false);
                }
                myObj.add("results", bdcObj);
                out.println(myObj.toString());
            }
            out.close();
        } catch(IOException ex){
            LOG.error(ex);
            //System.out.println("Erreur: "+ex);
        }
    }

    /**
     * Cette méthode permet d'afficher la page quiz et crée une variable isncrit pour affiché uen alert après l'inscription
     * @param request cet objet contient la requête HTTP du servlet
     * @param response cet objet initialise la réponse HTTP du servlet
     * @throws ServletException si le servlet rencontre des difficultés
     * @throws IOException si l'entrée request ou la sortie response n'arrivent pas à être lu
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String pagePublic = "/WEB-INF/quiz.jsp";
        String inscrit = request.getParameter("inscrit");
        request.setAttribute("inscrit",inscrit);//crée une variable qui sera réutilisable dans la JSP
        request.getRequestDispatcher(pagePublic).forward(request, response);
    }
}
