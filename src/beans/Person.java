package beans;

/**
 * Cette classe défini un objet Person qui correspond à un personnage qui a été désobéissant dans sa vie
 */

public class Person {

    String nom;
    Integer annee;
    String lieu;
    String lutte;
    String strategie;
    String action;
    String victoire;
    String anecdote;
    String citation;
    String question;
    String reponse1;
    String reponse2;
    String reponse3;
    String video;
    String article;

    /**
     *  @param nom Le nom du personnage ou groupe
     * @param lieu Le lieu de l'action du personnage
     * @param lutte La lutte du personnage
     */

    public Person(String nom, String lieu, String lutte){
        this.nom = nom;
        this.annee = annee;
        this.lieu = lieu;
        this.lutte = lutte;
        this.strategie = strategie;
        this.action = action;
        this.victoire = victoire;
        this.anecdote = anecdote;
        this.citation = citation;
        this.question = question;
        this.reponse1 = reponse1;
        this.reponse2 = reponse2;
        this.reponse3 = reponse3;
        this.video = video;
        this.article = article;
    }

    public Person(String gandhy, int i, String inde, String s, String s1, String s2, String victoire, String anecdote, String citation, String s3, String s4, String s5, String s6, String s7, String article){

    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Integer getAnnee() {
        return annee;
    }

    public void setAnnee(Integer annee) {
        this.annee = annee;
    }

    public String getLieu() {
        return lieu;
    }

    public void setLieu(String lieu) {
        this.lieu = lieu;
    }

    public String getLutte() {
        return lutte;
    }

    public void setLutte(String lutte) {
        this.lutte = lutte;
    }

    public String getStrategie() {
        return strategie;
    }

    public void setStrategie(String strategie) {
        this.strategie = strategie;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getVictoire() {
        return victoire;
    }

    public void setVictoire(String victoire) {
        this.victoire = victoire;
    }

    public String getAnecdote() {
        return anecdote;
    }

    public void setAnecdote(String anecdote) {
        this.anecdote = anecdote;
    }

    public String getCitation() {
        return citation;
    }

    public void setCitation(String citation) {
        this.citation = citation;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getReponse1() {
        return reponse1;
    }

    public void setReponse1(String reponse1) {
        this.reponse1 = reponse1;
    }

    public String getReponse2() {
        return reponse2;
    }

    public void setReponse2(String reponse2) {
        this.reponse2 = reponse2;
    }

    public String getReponse3() {
        return reponse3;
    }

    public void setReponse3(String reponse3) {
        this.reponse3 = reponse3;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    public String getArticle() {
        return article;
    }

    public void setArticle(String article) {
        this.article = article;
    }
}
