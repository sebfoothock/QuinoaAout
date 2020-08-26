package connection;

import servlets.Ajouter;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Cette classe permert de la création de propriété
 */

public class ConfProperties {
    final static org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(ConfProperties.class);
    org.apache.log4j.Level info = org.apache.log4j.Level.INFO;
    org.apache.log4j.Level verbose = org.apache.log4j.Level.ALL;

    /**
     * Cette méthode permet de récupérer la propriété db.host qui est l'adresse IP de la base de données
     * @return l'IP de la base de données si les condition sont respectées
     */
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
