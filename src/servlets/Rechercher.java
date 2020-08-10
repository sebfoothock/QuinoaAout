package servlets;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import static connection.MongoConnector.getConnector;

@WebServlet(name = "Rechercher")
public class Rechercher extends HttpServlet {
    final static org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(Rechercher.class);
    org.apache.log4j.Level info = org.apache.log4j.Level.INFO;
    org.apache.log4j.Level verbose = org.apache.log4j.Level.ALL;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String identifiant = request.getParameter("id");//créer un objet personne avec tout les request.Paremeter
        try{
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
            LOG.info("identifiant: " + identifiant);
            //System.out.println("identifiant: "+identifiant);
            beans.Person pers = new database.read.ReadPerson().getPerson(getConnector("192.168.129.133"),identifiant);//ajout : appel writePerso & supprimer : appel deletePerson
            LOG.info("Nom: "+pers.getNom());
            //System.out.println("Nom: "+pers.getNom());
            ArrayList<String> result = new ArrayList<>();
            result.add(String.valueOf(pers.getAnnee()));
            result.add(pers.getLieu());
            result.add(pers.getAnecdote());
            result.add(pers.getArticle());
            result.add(pers.getLutte());
            result.add(pers.getStrategie());
            result.add(pers.getVictoire());
            result.add(pers.getReponse1());
            result.add(pers.getReponse2());
            result.add(pers.getReponse3());
            result.add(pers.getAction());
            result.add(pers.getCitation());
            result.add(pers.getVideo());
            result.add(pers.getQuestion());

            Gson gson = new Gson();
            JsonObject myObj = new JsonObject();

            JsonElement bdcObj = gson.toJsonTree(result);
            if(result!= null){
                myObj.addProperty("success", true);
            }
            else {
                myObj.addProperty("success", false);
            }
            myObj.add("results", bdcObj);
            out.println(myObj.toString());

            out.close();
        } catch(IOException ex){
            LOG.error(ex);
            //System.out.println("Erreur: "+ex);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String pagePublic = "/WEB-INF/rechercher.jsp";
        request.getRequestDispatcher(pagePublic).forward(request, response);
    }
}
