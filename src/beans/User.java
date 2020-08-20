package beans;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class User {
    String identifiant;
    String password;
    String age;
    String sexe;
    String desobei;

    String date;
//    SimpleDateFormat dt = new SimpleDateFormat("dd-mm-yyyyy hh:mm");
//    Date date = dt.parse(date_s);

    public User(String identifiant, String password, String age, String sexe, String desobei, String date) throws ParseException {
        this.identifiant = identifiant;
        this.password = password;
        this.age = age;
        this.sexe = sexe;
        this.desobei = desobei;
        this.date = date;
    }

    public User() throws ParseException {
    }

    public String getIdentifiant() {
        return identifiant;
    }

    public void setIdentifiant(String identifiant) {
        this.identifiant = identifiant;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getSexe() {
        return sexe;
    }

    public void setSexe(String sexe) {
        this.sexe = sexe;
    }

    public String getDesobei() {
        return desobei;
    }

    public void setDesobei(String desobei) {
        this.desobei = desobei;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
