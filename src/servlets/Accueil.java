package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ControllerQuinoa")
public class Accueil extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        System.out.println("fname :" + fname + "\nlname :" + lname);
        String pagePublic = "/WEB-INF/accueil.jsp";
        request.getRequestDispatcher(pagePublic).forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String pagePublic = "/WEB-INF/accueil.jsp";
        request.getRequestDispatcher(pagePublic).forward(request, response);
    }
}