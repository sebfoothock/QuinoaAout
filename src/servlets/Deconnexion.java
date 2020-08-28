package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Path;
import java.io.IOException;

/**
 * Cette
 */
@WebServlet(name = "Deconnexion")
public class Deconnexion extends HttpServlet {
    final static org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(Deconnexion.class);
    org.apache.log4j.Level info = org.apache.log4j.Level.INFO;
    org.apache.log4j.Level verbose = org.apache.log4j.Level.ALL;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LOG.info("Deconnexion ");
        HttpSession session=request.getSession();
        //  String user = request.getUserPrincipal().getName();

        request.logout();
        String accesspage = "/Quinoa_war_exploded/Accueil";
        LOG.info("Fermeture de session ");
       // session.setAttribute("identifiant", null);
        session.removeAttribute("identifiant");
        LOG.info("session: "+session.getAttribute("identifiant"));
        session.invalidate();
        response.sendRedirect(accesspage);//redirection
//        request.getRequestDispatcher(accesspage).forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
