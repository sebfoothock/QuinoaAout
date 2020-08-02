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
        User seb = new User();//faire un post sur ce servet ci pour récupérer les éléments d'inscription
        seb.setIdentifiant(request.getParameter("identifiant"));
        seb.setPassword(request.getParameter("password"));
        seb.setAge(request.getParameter("radioAge"));
        seb.setSexe(request.getParameter("sexe"));
        seb.setDesobei(request.getParameter("desobei"));
        
        w.addUser(seb,getConnector("192.168.129.128"));


        request.getRequestDispatcher(pagePublic).forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String pagePublic = "/WEB-INF/inscription.jsp";
        request.getRequestDispatcher(pagePublic).forward(request, response);
    }
}
