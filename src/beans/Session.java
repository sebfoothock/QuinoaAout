package beans;

import java.util.ArrayList;

public class Session {

    private String username;
    private String timestart;
    private ArrayList<String> roles;

    public Session(String username, String timestart, ArrayList roles){
        this.username = username;
        this.timestart = timestart;
        this.roles = roles;
    }

    public Session(){
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTimestart() {
        return timestart;
    }

    public void setTimestart(String timestart) {
        this.timestart = timestart;
    }

    public ArrayList<String> getRoles() {
        return roles;
    }

    public void setRoles(ArrayList<String> roles) {
        this.roles = roles;
    }
}
