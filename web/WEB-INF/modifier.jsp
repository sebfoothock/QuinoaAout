<%--
  Created by IntelliJ IDEA.
  User: seb18
  Date: 30/07/2020
  Time: 18:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Dezobey</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="img/quizz.png" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet"
          type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
</head>

<body id="page-top">
<!-- Navigation-->
<nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
    <div class="container">
        <form id="retourSiteNav" action="Accueil" method="GET"></form>
        <Button class="btnLogin btn btn-primary" onclick="document.getElementById('retourSiteNav').submit();">
            <label>Retour au site</label>
        </Button>
        <button
                class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded"
                type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive"
                aria-expanded="false" aria-label="Toggle navigation">
            Menu
            <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item mx-0 mx-lg-1">
                    <form id="ajouterNav" action="Ajouter" method="GET"></form>
                    <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#" onclick="document.getElementById('ajouterNav').submit();">Ajouter</a>
                </li>
                <li class="nav-item mx-0 mx-lg-1">
                    <form id="modifierNav" action="Modifier" method="GET"></form>
                    <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#" onclick="document.getElementById('modifierNav').submit();">Modifier</a>
                </li>
                <li class="nav-item mx-0 mx-lg-1">
                    <form id="rechercherNav" action="Rechercher" method="GET"></form>
                    <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#" onclick="document.getElementById('rechercherNav').submit();">Rechercher</a>
                </li>
                <li class="nav-item mx-0 mx-lg-1">
                    <form id="listeNav" action="Liste" method="GET"></form>
                    <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#" onclick="document.getElementById('listeNav').submit();">Liste</a>
                </li>
                <li class="nav-item mx-0 mx-lg-1">
                    <form id="supprimerNav" action="Supprimer" method="GET"></form>
                    <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#" onclick="document.getElementById('supprimerNav').submit();">Supprimer</a>
                </li>
                <li class="nav-item mx-0 mx-lg-1">
                    <form id="statistiqueNav" action="Statistique" method="GET"></form>
                    <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#" onclick="document.getElementById('statistiqueNav').submit();">Statistique</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- Portfolio Section-->
<section class="page-section portfolio" id="portfolio">
    <div class="container center">
        <br>
        <div class="row justify-content-md-center">
            <h1 class="formTitle text-center">Modifier un personnage</h1>
            <form id="modifierForm" class="col-md-10" action="Modifier" method="POST">
                <br>
                <h6 class="text-center text-danger">Le champ nom, annee, question et les réponses sont obligatoires</h6>
                <br>
                <div class="form-group">
                    <label>Nom</label>
                    <input type="text" class="form-control" id="nom" name="nom" placeholder="Nom du Personne" required>
                    <div class="erreurChamp">
                        <small id="smallNom">Ce champ ne peut pas être vide</small>
                    </div>
                </div>
                <div class="form-group">
                    <label>Année</label>
                    <input type="number" class="form-control" id="annee" name="annee" placeholder="Année de l'action" required>
                    <div class="erreurChamp">
                        <small id="smallAnnee">Ce champ ne peut pas être vide</small>
                    </div>
                </div>
                <div class="form-group">
                    <label>Lieu</label>
                    <input type="text" class="form-control" id="lieu" name="lieu" placeholder="Lieu de l'action">
                </div>
                <div class="form-group">
                    <label>Lutte</label>
                    <input type="text" class="form-control" id="lutte" name="lutte" placeholder="Lutte de la personne">
                </div>
                <div class="form-group">
                    <label>Stratégie</label>
                    <input type="text" class="form-control" id="strategie" name="strategie" placeholder="Stratégie de l'action">
                </div>
                <div class="form-group">
                    <label>Action</label>
                    <input type="text" class="form-control" id="action" name="action" placeholder="Action de la personne">
                </div>
                <div class="form-group">
                    <label>Victoire</label>
                    <input type="text" class="form-control" id="victoire" name="victoire" placeholder="Victoire de la personne">
                </div>
                <div class="form-group">
                    <label>Anecdote</label>
                    <input type="text" class="form-control" id="anecdote" name="anecdote" placeholder="Anecdote sur l'action ou l'évènement">
                </div>
                <div class="form-group">
                    <label>Citation</label>
                    <input type="text" class="form-control" id="citation" name="citation" placeholder="Citation de la personne">
                </div>
                <div class="form-group">
                    <label>Question</label>
                    <input type="text" class="form-control" id="question" name="question" placeholder="Question pour le quizz" required>
                    <div class="erreurChamp">
                        <small id="smallQ">Ce champ ne peut pas être vide</small>
                    </div>
                </div>
                <div class="form-group">
                    <label>Première réponse (réponse correcte)</label>
                    <input type="text" class="form-control" id="reponse1" name="reponse1" placeholder="Réponse 1 (correcte)" required>
                    <div class="erreurChamp">
                        <small id="smallR1">Ce champ ne peut pas être vide</small>
                    </div>
                </div>
                <div class="form-group">
                    <label>Deuxième réponse</label>
                    <input type="text" class="form-control" id="reponse2" name="reponse2" placeholder="Réponse 2" required>
                    <div class="erreurChamp">
                        <small id="smallR2">Ce champ ne peut pas être vide</small>
                    </div>
                </div>
                <div class="form-group">
                    <label>Troisième réponse</label>
                    <input type="text" class="form-control" id="reponse3" name="reponse3" placeholder="Réponse 3" required>
                    <div class="erreurChamp">
                        <small id="smallR3">Ce champ ne peut pas être vide</small>
                    </div>
                </div>
                <div class="form-group">
                    <label>Video</label>
                    <input type="text" class="form-control" id="video" name="video" placeholder="Lien vers une vidéo">
                </div>
                <div class="form-group">
                    <label>Article</label>
                    <input type="text" class="form-control" id="article" name="article" placeholder="Lien vers un article">
                </div>

                <div class="form-group">
                    <label>Image du Personnage</label>
                    <input type="file" class="form-control" id="imgPersonnage" name="imgPersonnage">
                </div>

                <br></br>
                <div class="wrapper">
                    <button class="btnLogin btn btn-primary" onclick="validation();">
                        <label>Modifier</label>
                    </button>
                </div>
            </form>
        </div>
    </div>
    <input type="hidden" id="afficheBootbox" name="afficheBootbox" value="-">
</section>
<script src="js/jquery.min.js"></script>
<script src="js/bootbox.all.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
    var nomPerson;//autocomplete
    var idPerso;//id pour l'image
    const afficheBootbox = document.getElementById('afficheBootbox');

    $("#nom")[0].addEventListener("change",function(){

        if (!($("#nom")[0].innerHTML)) {
            var element1 = document.getElementById("nom").value;
            var parameter = "id=" + element1 ;
            // alert(parameter);
            $.ajax({
                type: "POST",
                url: "Rechercher",
                data: parameter,//envoyé à la classe JAVA grâce à l'url
                contentType: "application/x-www-form-urlencoded;charset=utf-8",//encodage donnée
                dataType: "json",//format de donnée reçu
                success: function (data, textStatus, jqXHR) {
                    if (data.success) {
                        document.getElementById("annee").value = data.results[0];//supprimer  : value = ""
                        document.getElementById("lieu").value = data.results[1];//ajouter (créer var) : value = nom
                        document.getElementById("lutte").value = data.results[4];
                        document.getElementById("strategie").value = data.results[5];
                        document.getElementById("action").value = data.results[10];
                        document.getElementById("victoire").value = data.results[6];
                        document.getElementById("anecdote").value = data.results[2];
                        document.getElementById("citation").value = data.results[11];
                        document.getElementById("question").value = data.results[13];
                        document.getElementById("reponse1").value = data.results[7];
                        document.getElementById("reponse2").value = data.results[8];
                        document.getElementById("reponse3").value = data.results[9];
                        document.getElementById("video").value = data.results[12];
                        document.getElementById("article").value = data.results[3];
                        idPerso = data.results[14];
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    bootbox.alert("Il y a eu une erreur lors de la recherche du personnage");
                    console.log("Erreur: " + textStatus);
                    console.log("Erreur: " + jqXHR);
                    console.log("Erreur: " + errorThrown);
                }
            });
        }

    });
    $("form :input").attr("autocomplete", "off");//ne pas proposer l'autocomplete de la cache
    $( function() {
        var listPerson = [
            <c:forEach items="${listPerson}" var="person">//parcours la liste des personnes qui vient du servlet Modifier et person permet de parcourir chaque objet un par un
            '<c:out value="${person.nom}" />',//écrit dans le tableau ListPerson
            </c:forEach>
        ];

        $( "#nom" ).autocomplete({
            source: listPerson
        });
    } );

    function validation(){
        const nomValue = document.getElementById('nom').value;
        const anneeValue = document.getElementById('annee').value;
        const questionValue = document.getElementById('question').value;
        const reponse1Value = document.getElementById('reponse1').value;
        const reponse2Value = document.getElementById('reponse2').value;
        const reponse3Value = document.getElementById('reponse3').value;

        var nomValidation = false;
        var anneeValidation = false;
        var questionValidation = false;
        var reponse1Validation = false;
        var reponse2Validation = false;
        var reponse3Validation = false;

        if(nomValue === '') {
            document.getElementById("smallNom").style.visibility = "visible"
            nomValidation = false;
        } else {
            document.getElementById("smallNom").style.visibility = "hidden"
            nomValidation = true;
        }
        if(anneeValue === '') {
            document.getElementById("smallAnnee").style.visibility = "visible"
            anneeValidation = false;
        } else {
            document.getElementById("smallAnnee").style.visibility = "hidden"
            anneeValidation = true;
        }
        if(questionValue === '') {
            document.getElementById("smallQ").style.visibility = "visible"
            questionValidation = false;
        } else {
            document.getElementById("smallQ").style.visibility = "hidden"
            questionValidation = true;
        }

        if(reponse1Value === '') {
            document.getElementById("smallR1").style.visibility = "visible"
            reponse1Validation = false;
        } else {
            document.getElementById("smallR1").style.visibility = "hidden"
            reponse1Validation = true;
        }

        if(reponse2Value === '') {
            document.getElementById("smallR2").style.visibility = "visible"
            reponse2Validation = false;
        } else{
            document.getElementById("smallR2").style.visibility = "hidden"
            reponse2Validation = true;
        }
        if(reponse3Value === '') {
            document.getElementById("smallR3").style.visibility = "visible"
            reponse3Validation = false;
        } else{
            document.getElementById("smallR3").style.visibility = "hidden"
            reponse3Validation = true;
        }

        if(nomValidation === true && anneeValidation === true && questionValidation === true && reponse1Validation === true && reponse2Validation === true && reponse3Validation === true){
            postdata();
            console.log("Envoyé !");
        }
    }

    function postdata() {
            var element1 = document.getElementById("nom").value;
            var element2 = document.getElementById("annee").value;
            var element3 = document.getElementById("lieu").value;
            var element4 = document.getElementById("lutte").value;
            var element5 = document.getElementById("strategie").value;
            var element6 = document.getElementById("action").value;
            var element7 = document.getElementById("victoire").value;
            var element8 = document.getElementById("anecdote").value;
            var element9 = document.getElementById("citation").value;
            var element10 = document.getElementById("question").value;
            var element11 = document.getElementById("reponse1").value;
            var element12 = document.getElementById("reponse2").value;
            var element13 = document.getElementById("reponse3").value;
            var element14 = document.getElementById("video").value;
            var element15 = document.getElementById("article").value;
            var imgPerso = document.getElementById("imgPersonnage");

            parameter = "nom=" + element1 + "&annee=" + element2 + "&lieu=" + element3 + "&lutte=" + element4 + "&strategie=" + element5 + "&action=" + element6 + "&victoire=" + element7 + "&anecdote=" + element8
                + "&citation=" + element9 + "&question=" + element10 + "&reponse1=" + element11 + "&reponse2=" + element12 + "&reponse3=" + element13 + "&video=" + element14 + "&article=" + element15; //forge les paramètres pour l'URL

            //alert(parameter);
            console.log(parameter)

            $.ajax({
                type: "POST",
                url: "Modifier",
                data: parameter,
                contentType: "application/x-www-form-urlencoded;charset=utf-8",//encodage donnée
                dataType: "json",
                success: function (data){
                    console.log('success', data);
                    bootbox.alert("Personnage modifié");
                    // var content = document.body.textContent || document.body.innerText;
                    // var hasText = content.indexOf("{\"success\":true}")==-1;
                    // if(hasText){
                    //     location.reload();
                    // }
                    // sessionStorage.SessionName = "success";
                },
                error: function(data){
                    console.log('error', data);
                    bootbox.alert("Il y a eu une erreur lors de la modification du personnage");
                    // var content = document.body.textContent || document.body.innerText;
                    // var hasText = content.indexOf("{\"error\":false}")==-1;
                    // if(hasText){
                    //     location.reload();
                    // }
                    // sessionStorage.SessionName = "error";
                }
            });

            const endpoint = "ModifierImg";
            const formData = new FormData();

            console.log(imgPerso.files);
            formData.append(idPerso,"id");
            formData.append(element1,"nom");
            formData.append("imgPerso", imgPerso.files[0]);
            console.log("envoie de formData...");
            fetch(endpoint, {
                method: "post",
                body: formData
            }).catch(
                console.error
            )
            console.log("formData envoyé !");
    }

    var inputfile = document.getElementById("imgPersonnage");
    function checkSizeFile() {
        var curFile = inputfile.files;
        if(curFile[0].size > 2039000){
            bootbox.alert("La taille du fichier ne doit pas dépasser 2MB");
            inputfile.value = "";
        }
        if((curFile[0].type !== 'image/jpeg') && (curFile[0].type !== 'image/png' )){
            bootbox.alert("Le format du fichier doit être .jpeg ou .png");
            inputfile.value = "";
        }
    }
    inputfile.addEventListener('change',checkSizeFile);

        // if(sessionStorage.getItem("SessionName") == 'success'){
        //     bootbox.alert("Personnage modifié");
        //     sessionStorage.SessionName = "";
        // }
        // if(sessionStorage.getItem("SessionName") == 'error'){
        //     bootbox.alert("Il y a eu une erreur lors de la modification du personnage");
        //     sessionStorage.SessionName = "";
        // }
</script>

<!-- Bootstrap core JS-->
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>--%>
<%--<script src="js/jquery.min.js"></script>--%>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
<!-- Third party plugin JS-->
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>--%>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>

</html>
