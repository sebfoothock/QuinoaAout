package servlets;

import com.google.gson.JsonObject;
import mail.EmailSender;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.spec.ECField;
import java.io.PrintWriter;

@WebServlet(name = "Mail")
public class Mail extends HttpServlet {
    final static org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(Mail.class);
    org.apache.log4j.Level info = org.apache.log4j.Level.INFO;
    org.apache.log4j.Level verbose = org.apache.log4j.Level.ALL;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        String contenu = "Ce mail veut être ajouté à la newsletter : " + request.getParameter("mailInput");
        JsonObject myObj = new JsonObject();
        if(EmailSender.run("seb180298@gmail.com","Newsletter Dezobey", contenu)){
            myObj.addProperty("success", true);
            LOG.info("Email envoyé");
        } else {
            myObj.addProperty("error", false);
            LOG.info("Email non envoyé");
        }
        out.println(myObj.toString());
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
