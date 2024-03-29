<%--
  Created by IntelliJ IDEA.
  User: seb18
  Date: 31/07/2020
  Time: 23:20
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
        <button class="btnLogin btn btn-primary" onclick="document.getElementById('retourSiteNav').submit();">
            <label>Retour au site</label>
        </button>
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
            <h1 class="formTitle text-center">Rechercher un personnage</h1>
            <form id="rechercherForm" class="col-md-10" action="Modifier" method="POST">
                <div class="form-group ">
                    <label>Nom</label>
                    <input type="text" class="form-control" id="nom" name="nom" placeholder="Nom du Personne">
                </div>
                <div class="form-group">
                    <label>Année</label>
                    <input type="number" class="form-control" id="annee" name="annee" placeholder="Année de l'action">
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
                    <input type="text" class="form-control" id="question" name="question" placeholder="Question pour le quizz">
                </div>
                <div class="form-group">
                    <label>Première réponse (réponse correcte)</label>
                    <input type="text" class="form-control" id="reponse1" name="reponse1" placeholder="Réponse 1 (correcte)">
                </div>
                <div class="form-group">
                    <label>Deuxième réponse</label>
                    <input type="text" class="form-control" id="reponse2" name="reponse2" placeholder="Réponse 2">
                </div>
                <div class="form-group">
                    <label>Troisième réponse</label>
                    <input type="text" class="form-control" id="reponse3" name="reponse3" placeholder="Réponse 3">
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
<%--                <div class="wrapper">--%>
<%--                    <Button class="btnLogin btn btn-primary" onclick="postdata();">--%>
<%--                        <label>Rechercher</label>--%>
<%--                    </Button>--%>
<%--                </div>--%>
            </form>
        </div>
    </div>
</section>

<script src="js/jquery.min.js"></script>
<script src="js/bootbox.all.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
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
                        // si le client reçoit une réponse 200 OK alors on peut compléter les input du formulaire
                        //                     for(var i=0;i<data.results.length;i++){
                        //                         alert(i+" "+data.results[i]);
                        //                     }
                        //bootbox.alert("Personnage recherché");
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
            <c:forEach items="${listPerson}" var="person">
            '<c:out value="${person.nom}" />',//person.nom = person.getNom
            </c:forEach>
        ];
        console.log(listPerson);

        $( "#nom" ).autocomplete({
            source: listPerson
        });
    } );
//     function postdata(){
//         var element1 = document.getElementById("nom").value;
//         var parameter = "id=" + element1 ;//forge les paramètres pour l'URL   ////  exemple:  + "&annee="+element2
//         alert(parameter);
//         $.ajax({
//             type: "POST",
//             url: "Rechercher",
//             data: parameter,//envoyé à la classe JAVA grâce à l'url
//             contentType: "application/x-www-form-urlencoded;charset=utf-8",//encodage donnée
//             dataType: "json",//format de donnée reçu
//             success: function( data, textStatus, jqXHR) {
//                 if(data.success){
// // si le client reçoit une réponse 200 OK alors on peut compléter les input du formulaire
// //                     for(var i=0;i<data.results.length;i++){
// //                         alert(i+" "+data.results[i]);
// //                     }
//                     bootbox.alert("Personnage recherché");
//                     document.getElementById("annee").value = data.results[0];//supprimer  : value = ""
//                     document.getElementById("lieu").value = data.results[1];//ajouter (créer var) : value = nom
//                     document.getElementById("lutte").value = data.results[4];
//                     document.getElementById("strategie").value = data.results[5];
//                     document.getElementById("action").value = data.results[10];
//                     document.getElementById("victoire").value = data.results[6];
//                     document.getElementById("anecdote").value = data.results[2];
//                     document.getElementById("citation").value = data.results[11];
//                     document.getElementById("question").value = data.results[13];
//                     document.getElementById("reponse1").value = data.results[7];
//                     document.getElementById("reponse2").value = data.results[8];
//                     document.getElementById("reponse3").value = data.results[9];
//                     document.getElementById("video").value = data.results[12];
//                     document.getElementById("article").value = data.results[3];
//                 }
//             },
//             error: function(jqXHR, textStatus, errorThrown){
//                 bootbox.alert("Il y a eu une erreur lors de la recherche du personnage");
//                 console.log("Erreur: " + textStatus);
//                 console.log("Erreur: " + jqXHR);
//                 console.log("Erreur: " + errorThrown);
//             }
//         });
//     }
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
