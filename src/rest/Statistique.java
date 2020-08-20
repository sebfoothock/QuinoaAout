package rest;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/stat")//Rest n'aime pas les majuscules
public class Statistique {

        @GET
        @Produces(MediaType.TEXT_HTML)
        public String sayHtmlHello() {
            return "<html> " + "<title>" + "Hello Jersey" + "</title>"
                    + "<body><h1>" + "Hello Jersey HTML" + "</h1></body>" + "</html> ";
        }
}
