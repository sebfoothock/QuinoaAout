package servlets;

import connection.ConfProperties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import static connection.MongoConnector.getConnector;

/**
 * Cette classe est le servlet de la page accueil et qui gérer les requêtes HTTP pour celle-ci
 */

@WebServlet(name = "Accueil")
public class Accueil extends HttpServlet {
    final static org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(Accueil.class);
    org.apache.log4j.Level info = org.apache.log4j.Level.INFO;
    org.apache.log4j.Level verbose = org.apache.log4j.Level.ALL;

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
        Boolean isConnected = false;
        try {
            String db_host = new ConfProperties().getHostProperties();
            database.read.ReadSession readSession = new database.read.ReadSession();
            ArrayList<beans.Session> listSessions = readSession.getSession(getConnector(db_host));
            beans.Session sess = readSession.getLastSession(listSessions);
            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            Date date = new Date();
            String now = dateFormat.format(date);
            Date tmpsessd1 = dateFormat.parse(now);
            Date sessd2 = dateFormat.parse(sess.getTimestart());
            LOG.info("tmpsessd1: " + dateFormat.format(tmpsessd1));
            LOG.info("sessd2: " + dateFormat.format(sessd2));
            if(tmpsessd1.compareTo(sessd2) > 0) {
                LOG.info("Date 1 est après Date 2");
            } else if(tmpsessd1.compareTo(sessd2) <= 0) {
                LOG.info("Date 1 est avant Date 2");
                isConnected = true;
            }
            HttpSession session=request.getSession();
            LOG.info("session: "+session.getAttribute("identifiant"));
            if(isConnected){
                LOG.info("last session: "+sess.getUsername());
                session.setAttribute("identifiant", sess.getUsername());
                // request.setAttribute("identifiant", sess.getUsername());
                request.setAttribute("role", sess.getRoles().get(0));
            } else {
                session.invalidate();
            }
        } catch (Exception e) {
            LOG.error(e);
        }
        request.getRequestDispatcher(pagePublic).forward(request, response);
    }
}