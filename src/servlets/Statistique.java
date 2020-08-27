package servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Cette classe est le servlet de la page statistique et qui gérer les requêtes HTTP pour celle-ci
 */

public class Statistique extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    /**
     * Cette méthode permet d'afficher la page statistique
     * @param request cet objet contient la requête HTTP du servlet
     * @param response cet objet initialise la réponse HTTP du servlet
     * @throws ServletException si le servlet rencontre des difficultés
     * @throws IOException si l'entrée request ou la sortie response n'arrivent pas à être lu
     */

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String pagePublic = "/WEB-INF/statistique.jsp";
        request.getRequestDispatcher(pagePublic).forward(request, response);
    }
}
