package test;

import beans.Person;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import connection.ConfProperties;
import database.write.WritePerson;
import org.bson.Document;
import org.junit.Test;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import static connection.MongoConnector.getConnector;

public class WritePersonTest {

    final static org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(test.WritePersonTest.class);
    org.apache.log4j.Level info = org.apache.log4j.Level.INFO;
    org.apache.log4j.Level verbose = org.apache.log4j.Level.ALL;

    private final String database = "Quinoa";
    String db_host = new ConfProperties().getHostProperties();

    @Test
    public void addPersonTest() throws IOException, UnsupportedEncodingException {

        MongoClient client = getConnector(db_host);
        Person person = new Person("Gandhy", 1930,"Inde","Contre l'injustice", "résistance non-violente", "l'autonomie de l'Inde",
                "victoire","anecdote", "citation", "Que vise sa 'marche du Sel' ?", "Créer un mouvement de masse contre l'occupant britannique",
                "Mettre en évidence les distances parcourues par les enfants indiens pour rejoindre leur école", "Visibiliser le fait que la majorité des Indien·n·e·s n'ont accès qu'à certaines denrées alimentaires",
                " 1jour une actu. - Gandhi", "article");

        WritePerson w_pers = new WritePerson();

        MongoDatabase db = client.getDatabase(database);
        MongoCollection<Document> collection = db.getCollection("InfosPersonnage");

        Document document = new Document();
        document.append("nom", person.getNom())
                .append("annee", person.getAnnee())
                .append("lieu", person.getLieu())
                .append("lutte", person.getLutte())
                .append("strategie", person.getStrategie())
                .append("action", person.getAction())
                .append("victoire", person.getVictoire())
                .append("anecdote", person.getAnecdote())
                .append("citation", person.getCitation())
                .append("question", person.getQuestion())
                .append("reponse1", person.getReponse1())
                .append("reponse2", person.getReponse2())
                .append("reponse3", person.getReponse3())
                .append("video", person.getVideo())
                .append("article", person.getArticle());

        collection.insertOne(document);//insertion dans la collection
    }

    
//    assertEquals("seb@ephec.be",person.getIdentifiant());
//    assertEquals("155290511d5c4bfb1369217d6846c8eef1ed6a564579516eaf36cf5598ac92de", user.getPassword());
//    assertEquals("17/08/2020 00:32",user.getDate());
//    assertEquals("oui",user.getDesobei());
//    assertEquals("homme",user.getSexe());
//    assertEquals("19",user.getAge());


}
