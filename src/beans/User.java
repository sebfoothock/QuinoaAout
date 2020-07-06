package beans;

public class User {
    String identifiant;
    String password;
    String age;

    public User(String identifiant, String password, String age){
        this.identifiant = identifiant;
        this.password = password;
        this.age = age;
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
}
