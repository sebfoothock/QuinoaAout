package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Cette classe est le servlet de la page quiz et qui gérer les requêtes HTTP pour celle-ci
 */

@WebServlet(name = "Quiz")
public class Quiz extends HttpServlet {
    final static org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(Quiz.class);
    org.apache.log4j.Level info = org.apache.log4j.Level.INFO;
    org.apache.log4j.Level verbose = org.apache.log4j.Level.ALL;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
