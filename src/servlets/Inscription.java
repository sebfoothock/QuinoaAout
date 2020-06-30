package servlets;

import beans.User;
import database.read.ReadUser;

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
        ReadUser user = new ReadUser();
        ArrayList <User> listUsers = user.getUsers(getConnector("192.168.129.128"));
        for(User current : listUsers){
            System.out.println("id : " + current.getIdentifiant());
            System.out.println("mdp : " + current.getPassword());
            System.out.println("age : " + current.getAge());
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String pagePublic = "/WEB-INF/inscription.jsp";
        request.getRequestDispatcher(pagePublic).forward(request, response);
    }
}
