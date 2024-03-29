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
                    <form id="ajouterNav" action="" method="GET"></form>
                    <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#" onclick="document.getElementById('ajouterNav').submit();">Ajouter</a>
                </li>
                <li class="nav-item mx-0 mx-lg-1">
                    <form id="modifierNav" action="" method="POST"></form>
                    <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
                       href="#" onclick="document.getElementById('modifierNav').submit();">Modifier</a>
                </li>
                <li class="nav-item mx-0 mx-lg-1">
                    <form id="vérifierNav" action="" method="GET"></form>
                    <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#" onclick="document.getElementById('vérifierNav').submit();">Vérifier</a>
                </li>
                <li class="nav-item mx-0 mx-lg-1">
                    <form id="supprimerNav" action="" method="GET"></form>
                    <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#" onclick="document.getElementById('supprimerNav').submit();">Supprimer</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- Portfolio Section-->
<section class="page-section portfolio" id="portfolio">
    <div class="container center">
        <div class="row justify-content-md-center">
            <h1 class="formTitle text-center">Ajouter un personnage</h1>
            <form id="inscriptionForm" class="col-md-10" action="" method="POST">
                <div class="form-group ">
                    <label>Nom</label>
                    <input type="text" class="form-control" id="nom" name="nom" placeholder="Nom du Personne">
                </div>
                <div class="form-group">
                    <label>Année</label>
                    <input type="number" class="form-control" id="annee" name="annee" placeholder="Année de l'action">
                    <p class="help-block text-danger"></p>
                </div>
                <div class="form-group">
                    <label>Lieu</label>
                    <input type="text" class="form-control" id="lieu" name="lieu" placeholder="Lieu de l'action">
                    <p class="help-block text-danger"></p>
                </div>
                <div class="form-group">
                    <label>Lutte</label>
                    <input type="text" class="form-control" id="lutte" name="lutte" placeholder="Lutte de la personne">
                    <p class="help-block text-danger"></p>
                </div>
                <div class="form-group">
                    <label>Stratégie</label>
                    <input type="text" class="form-control" id="strategie" name="strategie" placeholder="Stratégie de l'action">
                    <p class="help-block text-danger"></p>
                </div>
                <div class="form-group">
                    <label>Action</label>
                    <input type="text" class="form-control" id="action" name="action" placeholder="Action de la personne">
                    <p class="help-block text-danger"></p>
                </div>
                <div class="form-group">
                    <label>Victoire</label>
                    <input type="text" class="form-control" id="victoire" name="victoire" placeholder="Victoire de la personne">
                    <p class="help-block text-danger"></p>
                </div>
                <div class="form-group">
                    <label>Anecdote</label>
                    <input type="text" class="form-control" id="anecdote" name="anecdote" placeholder="Anecdote sur l'action ou l'évènement">
                    <p class="help-block text-danger"></p>
                </div>
                <div class="form-group">
                    <label>Citation</label>
                    <input type="text" class="form-control" id="citation" name="citation" placeholder="Citation de la personne">
                    <p class="help-block text-danger"></p>
                </div>
                <div class="form-group">
                    <label>Question</label>
                    <input type="text" class="form-control" id="question" name="question" placeholder="Question pour le quizz">
                    <p class="help-block text-danger"></p>
                </div>
                <div class="form-group">
                    <label>Première réponse (réponse correcte)</label>
                    <input type="text" class="form-control" id="réponse1" name="réponse1" placeholder="Réponse 1 (correcte)">
                    <p class="help-block text-danger"></p>
                </div>
                <div class="form-group">
                    <label>Deuxième réponse</label>
                    <input type="text" class="form-control" id="réponse2" name="réponse2" placeholder="Réponse 2">
                    <p class="help-block text-danger"></p>
                </div>
                <div class="form-group">
                    <label>Troisième réponse</label>
                    <input type="text" class="form-control" id="réponse3" name="réponse3" placeholder="Réponse 3">
                    <p class="help-block text-danger"></p>
                </div>
                <div class="form-group">
                    <label>Video</label>
                    <input type="text" class="form-control" id="video" name="video" placeholder="Lien vers une vidéo">
                    <p class="help-block text-danger"></p>
                </div>
                <div class="form-group">
                    <label>Article</label>
                    <input type="text" class="form-control" id="article" name="article" placeholder="Lien vers un article">
                    <p class="help-block text-danger"></p>
                </div>

                <br></br>
                <div class="wrapper">
                    <Button class="btnLogin btn btn-primary" onclick="document.getElementById('inscriptionForm').submit();">
                        <label>S'inscrire</label>
                    </Button>
                </div>
            </form>
        </div>
    </div>
</section>

<script>

    document.getElementById("nom").addEventListener("change", function() {
        var element1 = document.getElementById("nom");
        var parameter = "element1=" + element1;
        $.ajax({
            type: "POST",
            url: "<Servlet Ajouter Personnage>",
            data: parameter,
            dataType: "json",
            success: function( data, textStatus, jqXHR) {
                if(data.success){
// si le client reçoit une réponse 200 OK alors on peut compléter les input du formulaire
                    document.getElementById("<id année_personnage dans input>").value = data.results[0];
                    document.getElementById("<id lieu_personnage dans input>").value = data.results[1];
// etc ...
                }
            },

            error: function(jqXHR, textStatus, errorThrown){
                console.log("Erreur: " + textStatus);
            }
        });
    });
</script>

<!-- Bootstrap core JS-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
<!-- Third party plugin JS-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>

</html>
