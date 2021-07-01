package servlets;

import database.read.ReadPerson;
import database.write.WritePerson;
import org.bson.types.ObjectId;

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

@WebServlet(name = "ModifierImg")
@MultipartConfig
public class ModifierImg extends HttpServlet {
    final static org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(ModifierImg.class);
    org.apache.log4j.Level info = org.apache.log4j.Level.INFO;
    org.apache.log4j.Level verbose = org.apache.log4j.Level.ALL;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        LOG.info("ModifierImg");
        InputStream fileContent = null;
        String fileName = null;
        String nom = null;
        String id = null;
        WritePerson person = new WritePerson();
        //String nom = perso.getName();
        Collection<Part> parts = request.getParts(); // Retrieves <input type="file" name="file">
        for (Part part : parts) {//foreach
            LOG.info("part: "+part.getName().toString());
            if(ObjectId.isValid(Paths.get(part.getName()).toString())){//vérifie qu'on est bien au niveau de l'id
                id = Paths.get(part.getName()).toString(); // MSIE fix.
                LOG.info("id: "+id);
            } else if(!part.getName().equals("imgPerso")){//si on est pas au niveau des images personnages
                nom = Paths.get(part.getName()).toString(); // MSIE fix.
                LOG.info("nom: "+nom);
            } else {
                fileName = Paths.get(part.getName()).getFileName().toString(); // MSIE fix.
                LOG.info("filename: " + fileName);
                fileContent = part.getInputStream();
            }
        }
        String db_host = new connection.ConfProperties().getHostProperties();
        // STORE TO DB
        if(fileContent != null && fileName != null && nom != null){//vérifie que les éléments posté sont bon
            // REMOVE OLD DATA
            String oldNom = new ReadPerson().getNomById(getConnector(db_host),id);//supprime grâce au nom du personnage
            person.deleteImg(getConnector(db_host),oldNom);
            person.storeImg(fileName,fileContent,getConnector(db_host),nom);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
