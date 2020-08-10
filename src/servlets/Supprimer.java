package servlets;

import beans.Person;
import com.google.gson.JsonObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import static connection.MongoConnector.getConnector;

@WebServlet(name = "Supprimer")
public class Supprimer extends HttpServlet {
    final static org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(Supprimer.class);
    org.apache.log4j.Level info = org.apache.log4j.Level.INFO;
    org.apache.log4j.Level verbose = org.apache.log4j.Level.ALL;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        LOG.info("POST: Supprimer");
        String nom = request.getParameter("nom");
        try {
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
            Boolean isDeleted = new database.write.WritePerson().deletePerson(getConnector("192.168.129.133"), nom);
            JsonObject myObj = new JsonObject();
            if(isDeleted){
                myObj.addProperty("success", true);
            } else {
                myObj.addProperty("success", false);
            }
            out.println(myObj.toString());
            out.close();//ferme le printwinter
        }

        catch(IOException ex){
            LOG.error(ex);
            //System.out.println("Erreur: "+ex);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String pagePublic = "/WEB-INF/supprimer.jsp";
        request.getRequestDispatcher(pagePublic).forward(request, response);
    }
}
