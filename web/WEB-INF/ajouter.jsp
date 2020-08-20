<%--
  Created by IntelliJ IDEA.
  User: seb18
  Date: 29/07/2020
  Time: 11:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <h1 class="formTitle text-center">Ajouter un personnage</h1>
            <form id="ajouterForm" class="col-md-10" action="Ajouter" method="POST">
                <br>
                <h6 class="text-center text-danger">Le champ nom, annee, question et les réponses sont obligatoires</h6>
                <br>
                <div class="form-group">
                    <label>Nom</label>
                    <input type="text" class="form-control" id="nom" name="nom" placeholder="Nom de la Personne ou du groupe" required>
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
                    <input type="text" class="form-control" id="lutte" name="lutte" placeholder="Lutte de la personne ou du groupe">
                </div>
                <div class="form-group">
                    <label>Stratégie</label>
                    <input type="text" class="form-control" id="strategie" name="strategie" placeholder="Stratégie de l'action">
                </div>
                <div class="form-group">
                    <label>Action</label>
                    <input type="text" class="form-control" id="action" name="action" placeholder="Action de la personne ou du groupe">
                </div>
                <div class="form-group">
                    <label>Victoire</label>
                    <input type="text" class="form-control" id="victoire" name="victoire" placeholder="Victoire de la personne ou du groupe">
                </div>
                <div class="form-group">
                    <label>Anecdote</label>
                    <input type="text" class="form-control" id="anecdote" name="anecdote" placeholder="Anecdote sur l'action ou du personnage">
                </div>
                <div class="form-group">
                    <label>Citation</label>
                    <input type="text" class="form-control" id="citation" name="citation" placeholder="Citation de la personne ou du groupe">
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

                <br></br>
                <div class="wrapper">
                    <Button class="btnLogin btn btn-primary" onclick="validation()">
                        <label>Ajouter</label>
                    </Button>
                </div>
            </form>
        </div>
    </div>
</section>

<script src="js/jquery.min.js"></script>
<script src="js/bootbox.all.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    $("form :input").attr("autocomplete", "off");//ne pas proposer l'autocomplete de la cache

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
    function postdata(){
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

        parameter = "nom=" + element1 + "&annee=" + element2 + "&lieu=" + element3 + "&lutte=" + element4 + "&strategie=" + element5 + "&action=" + element6 + "&victoire=" + element7 + "&anecdote=" + element8
        + "&citation=" + element9 + "&question=" + element10 + "&reponse1=" + element11 + "&reponse2=" + element12 + "&reponse3=" + element13 + "&video=" + element14 + "&article=" + element15; //forge les paramètres pour l'URL

       // alert(parameter);
        console.log(parameter)

        $.ajax({
            type: "POST",
            url: "Ajouter",
            data: parameter,//envoyé à la classe JAVA grâce à l'url
            contentType: "application/x-www-form-urlencoded;charset=utf-8",//encodage donnée
            dataType: "json",//format de donnée reçu
            success: function (data){
                bootbox.alert("Personnage ajouté");
                console.log('success', data);
            },
            error: function(data){
                bootbox.alert("Il y a eu une erreur lors de l'ajout du personnage");
                console.log('error', data);
            }
        });
    }
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
