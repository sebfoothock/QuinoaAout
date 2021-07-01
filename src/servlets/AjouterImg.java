package servlets;

import database.write.WritePerson;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.util.Collection;

import static connection.MongoConnector.getConnector;

@WebServlet(name = "AjouterImg")
@MultipartConfig //permet récupérer de différent type (img, file,...) via la classe Part
public class AjouterImg extends HttpServlet {
    final static org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(AjouterImg.class);
    org.apache.log4j.Level info = org.apache.log4j.Level.INFO;
    org.apache.log4j.Level verbose = org.apache.log4j.Level.ALL;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LOG.info("AjouterImg");
        InputStream fileContent = null;
        String fileName = null;
        String nom = null;
        //String nom = perso.getName();
        Collection<Part> parts = request.getParts(); // permet de récupérer l'image et le nom
        for (Part part : parts) {
            if(!part.getName().equals("imgPerso")){
                nom = Paths.get(part.getName()).toString(); // MSIE fix.
                LOG.info("nom: "+nom);
            } else { //vérifie qu'on est bien à l'endroit de l'image
                fileName = Paths.get(part.getName()).getFileName().toString(); // récupère nom de l'image
                LOG.info("filename: "+fileName);
                fileContent = part.getInputStream(); // récupère l'image sérialisé
            }
        }
        // STORE TO DB
        String db_host = new connection.ConfProperties().getHostProperties();
        if(fileContent != null && fileName != null && nom != null){
            new WritePerson().storeImg(fileName,fileContent,getConnector(db_host),nom);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


}