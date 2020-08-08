package servlets;

import beans.User;
import database.read.ReadUser;
import database.write.WriteUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import static connection.MongoConnector.getConnector;

@WebServlet(name = "Inscription")
public class Inscription extends HttpServlet {
    final static org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(Rechercher.class);
    org.apache.log4j.Level info = org.apache.log4j.Level.INFO;
    org.apache.log4j.Level verbose = org.apache.log4j.Level.ALL;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String pagePublic = "/WEB-INF/accueil.jsp";
        /* récupération de la liste des utilisateurs de la DB
        ReadUser user = new ReadUser();
        ArrayList <User> listUsers = user.getUsers(getConnector("192.168.129.128"));
        for(User current : listUsers){//afficher les utilisateurs en console
            System.out.println("id : " + current.getIdentifiant());
            System.out.println("mdp : " + current.getPassword());
            System.out.println("age : " + current.getAge());
            System.out.println("sexe : " + current.getSexe());
            System.out.println("desobei : " + current.getDesobei());
        }
        */
        WriteUser w = new WriteUser();
        User u = new User();//faire un post sur ce servet ci pour récupérer les éléments d'inscription
        u.setIdentifiant(request.getParameter("identifiant"));
        u.setPassword(request.getParameter("password"));
        u.setAge(request.getParameter("radioAge"));
        u.setSexe(request.getParameter("sexe"));
        u.setDesobei(request.getParameter("desobei"));
        
        w.addUser(u,getConnector("192.168.129.133"));

        LOG.info("inscription utilisateur => id : " + u.getIdentifiant());
        String page = "/WEB-INF/histoireLutte.jsp";
        request.getRequestDispatcher(page).forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String pagePublic = "/WEB-INF/inscription.jsp";
        request.getRequestDispatcher(pagePublic).forward(request, response);
    }
}
