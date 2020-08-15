package servlets;

import beans.Person;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import database.read.ReadPerson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import static connection.MongoConnector.getConnector;

@WebServlet(name = "Lsite")
public class Liste extends HttpServlet {
    final static org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(Liste.class);
    org.apache.log4j.Level info = org.apache.log4j.Level.INFO;
    org.apache.log4j.Level verbose = org.apache.log4j.Level.ALL;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            String db_host = new connection.ConfProperties().getHostProperties();
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
            //System.out.println("identifiant: "+identifiant);
            LOG.info("Liste des personnages");
            //System.out.println("Nom: "+pers.getNom());

            Gson gson = new Gson();
            JsonObject myObj = new JsonObject();


            if(db_host != null) {
                ArrayList<Person> pers = new ReadPerson().getPersons(getConnector(db_host));//ajout : appel writePerso & supprimer : appel deletePerson
                if (pers != null) {
                    myObj.addProperty("success", true);
                    JsonElement bdcObj = gson.toJsonTree(pers);
                    myObj.add("results", bdcObj);
                    out.println(myObj.toString());
                } else {
                    myObj.addProperty("success", false);
                }
            }

            out.close();
        } catch(IOException ex){
            LOG.error(ex);
            //System.out.println("Erreur: "+ex);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String pagePublic = "/WEB-INF/liste.jsp";
        request.getRequestDispatcher(pagePublic).forward(request, response);
    }
}
