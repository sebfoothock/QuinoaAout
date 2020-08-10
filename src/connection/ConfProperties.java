package connection;

import servlets.Ajouter;
import servlets.Modifier;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ConfProperties {
    final static org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(ConfProperties.class);
    org.apache.log4j.Level info = org.apache.log4j.Level.INFO;
    org.apache.log4j.Level verbose = org.apache.log4j.Level.ALL;

    public String getHostProperties(){
        try (InputStream input = Ajouter.class.getClassLoader().getResourceAsStream("conf.properties")) {
            Properties prop = new Properties();
            if (input == null) {
                return "";
            }
            prop.load(input);
            String result = prop.getProperty("db.host");
            LOG.info(result);
            return result;
        } catch (IOException ex) {
            LOG.error(ex);
        }
        return null;
    }
    //si on veut récupérer toutes les propriétés en même temps, utiliser HashMap<String,String>
}
