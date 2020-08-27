package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Cette classe est le servlet de la page accueil et qui gérer les requêtes HTTP pour celle-ci
 */

@WebServlet(name = "Accueil")
public class Accueil extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    /**
     * Cette méthode permet d'afficher la page accueil et crée une variable de session
     * @param request cet objet contient la requête HTTP du servlet
     * @param response cet objet initialise la réponse HTTP du servlet
     * @throws ServletException si le servlet rencontre des difficultés
     * @throws IOException si l'entrée request ou la sortie response n'arrivent pas à être lu
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String pagePublic = "/WEB-INF/accueil.jsp";

        String identifiant = "test";
        request.setAttribute("identifiant", identifiant);

        request.getRequestDispatcher(pagePublic).forward(request, response);
    }
}