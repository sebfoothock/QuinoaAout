package servlets;

import beans.Person;
import com.google.gson.JsonObject;
import database.write.WritePerson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Properties;

import static connection.MongoConnector.getConnector;

@WebServlet(name = "Ajouter")
public class Ajouter extends HttpServlet {
    final static org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(Ajouter.class);
    org.apache.log4j.Level info = org.apache.log4j.Level.INFO;
    org.apache.log4j.Level verbose = org.apache.log4j.Level.ALL;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Person personnage = new Person();//créer un objet personne avec tout les request.Paremeter

        personnage.setNom(request.getParameter("nom"));
        String annee = request.getParameter("annee");
        if(annee != null){
            if(!annee.isEmpty()){
                personnage.setAnnee(Integer.valueOf(request.getParameter("annee")));
            } else {
                personnage.setAnnee(0);
            }
        }
        personnage.setLieu(request.getParameter("lieu"));
        personnage.setLutte(request.getParameter("lutte"));
        personnage.setStrategie(request.getParameter("strategie"));
        personnage.setAction(request.getParameter("action"));
        personnage.setVictoire(request.getParameter("victoire"));
        personnage.setAnecdote(request.getParameter("anecdote"));
        personnage.setCitation(request.getParameter("citation"));
        personnage.setQuestion(request.getParameter("question"));
        personnage.setReponse1(request.getParameter("reponse1"));
        personnage.setReponse2(request.getParameter("reponse2"));
        personnage.setReponse3(request.getParameter("reponse3"));
        personnage.setVideo(request.getParameter("video"));
        personnage.setArticle(request.getParameter("article"));

        try {
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
            LOG.info("nom: " + personnage.getNom());
            //System.out.println("identifiant: "+identifiant);
            WritePerson w_pers = new database.write.WritePerson();
            JsonObject myObj = new JsonObject();
            if(db_host != null){
                w_pers.addPerson(personnage, getConnector(db_host));//ajout : appel writePerso & supprimer : appel deletePerson
                if(w_pers.isAdded(getConnector(db_host),personnage.getNom())){
                    myObj.addProperty("success", true);
                } else {
                    myObj.addProperty("success", false);
                }
            } else {
                myObj.addProperty("success", false);
            }

            out.println(myObj.toString());
            out.close();
        }

        catch(IOException ex){
            LOG.error(ex);
            //System.out.println("Erreur: "+ex);
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String pagePublic = "/WEB-INF/ajouter.jsp";

        request.getRequestDispatcher(pagePublic).forward(request, response);
    }
}
