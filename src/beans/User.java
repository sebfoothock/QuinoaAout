package beans;

import java.text.ParseException;
import java.util.ArrayList;

/**
 * Cette classe défini un objet Person qui correspond à un personnage qui a été désobéissant dans sa vie
 */

public class User {
    private String identifiant;
    private String password;
    private String age;
    private String sexe;
    private String desobei;
    private String date;
    private ArrayList<String> roles;

    /**
     *
     * @param identifiant
     * @param password
     * @param age
     * @param sexe
     * @param desobei
     * @param date
     * @param roles
     * @throws ParseException
     */


    public User(String identifiant, String password, String age, String sexe, String desobei, String date, ArrayList<String> roles) throws ParseException {
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

    public ArrayList<String> getRoles() {
        return roles;
    }

    public void setRoles(ArrayList<String> roles) {
        this.roles = roles;
    }
}
