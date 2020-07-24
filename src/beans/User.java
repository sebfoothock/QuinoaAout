package beans;

public class User {
    String identifiant;
    String password;
    String age;
    String sexe;
    String desobei;

    public User(String identifiant, String password, String age, String sexe, String desobei){
        this.identifiant = identifiant;
        this.password = password;
        this.age = age;
        this.sexe = sexe;
        this.desobei = desobei;
    }

    public User(){
        
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
}
