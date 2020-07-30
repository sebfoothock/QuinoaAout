package servlets;

import beans.Person;
import com.mongodb.client.MongoClient;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "Administrateur")
public class Ajouter extends HttpServlet {
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        request.setCharacterEncoding("UTF-8");
//        String host = new database.read.ReadPerson.Parameter().getParams().getDatabase();
//        MongoClient mongo = getInstance(host);
//
//        try{
//            String nomPersonnage = request.getParameter("nom");
//            PrintWriter out = response.getWriter();
//            response.setContentType("text/html");
//            response.setHeader("Cache-control", "no-cache, no-store");
//            response.setHeader("Pragma", "no-cache");
//            response.setHeader("Expires", "-1");
//            response.setHeader("Access-Control-Allow-Origin", "*");
//            response.setHeader("Access-Control-Allow-Methods", "POST");
//            response.setHeader("Access-Control-Allow-Headers", "Content-Type");
//            response.setHeader("Access-Control-Max-Age", "86400");
//
//            beans.Person pers = new database.read.ReadPerson.getPerson().getPersonnageByName(nomPersonnage, mongo);
//            ArrayList<String> result = new ArrayList<>();
//            result.add(Person.getAnnee());
//            result.add(Person.getLieu());
//
//            Gson gson = new Gson();
//            JsonObject myObj = new JsonObject();
//
//            JsonElement bdcObj = gson.toJsonTree(result);
//            if(result!= null){
//                myObj.addProperty("success", true);
//            }
//            else {
//                myObj.addProperty("success", false);
//            }
//            myObj.add("results", bdcObj);
//            out.println(myObj.toString());
//
//            out.close();
//        } catch(IOException ex){
//            System.out.println("Erreur: "+ex);
//        }
//    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String pagePublic = "/WEB-INF/ajouter.jsp";
        request.getRequestDispatcher(pagePublic).forward(request, response);
    }
}
