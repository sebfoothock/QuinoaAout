<%--
  Created by IntelliJ IDEA.
  User: seb18
  Date: 01/07/2020
  Time: 17:19
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

<body id="page-top" onload="postdata();">
<!-- Navigation-->
<nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
    <div class="container">
        <a href="http://www.quinoa.be">
            <img src="img/Quinoa.png" class="logoNav" />
        </a>
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
                    <form id="accueilNav" action="Accueil" method="GET"></form>
                    <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#" onclick="document.getElementById('accueilNav').submit();">Accueil</a>
                </li>
                <c:if test="${empty sessionScope.identifiant }">
                <li class="nav-item mx-0 mx-lg-1">
                    <form id="inscriptionNav" action="Inscription" method="GET"></form>
                    <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#" onclick="document.getElementById('inscriptionNav').submit();">Jouer !</a>
                </li>
                </c:if>
                <c:if test="${ !empty sessionScope.identifiant }">
                <li class="nav-item mx-0 mx-lg-1">
                    <form id="quizNav" action="Quiz" method="GET"></form>
                    <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#" onclick="document.getElementById('quizNav').submit();">Quiz</a>
                </li>
                </c:if>
                <li class="nav-item mx-0 mx-lg-1">
                    <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#">Histoires de luttes</a>
                </li>
            </ul>
        </div>
        <c:if test="${ !empty sessionScope.identifiant }">
            <label id="switch">
                <input type="checkbox" id="togBtn">
                <div id="slider" class="slider round"></div>
            </label>
        </c:if>
    </div>
</nav>
<!-- Portfolio Section-->
<section class="page-section portfolio" id="portfolio">
    <div class="container">
        <!-- Portfolio Section Heading-->
        <br>
        <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">
            Histoire de Lutte
        </h2>
        <br>
        <h6 class="text-center text-info">Vous retrouverez ci-dessous des informations des personnages du quiz</h6>
        <br>
        <br>
        <!-- Portfolio Grid Items-->
        <div class="row">
            <div id="boutonsHistoire"></div>
        </div>
    </div>
</section>
<!-- Portfolio Modals-->
<div id="modals"></div>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script>
    function postdata() {
        var parameter ="";
        $.ajax({
            type: "POST",
            url: "Histoire",
            data: parameter,
            dataType: "json",
            success: function( data, textStatus, jqXHR) {
                if (data.success) {
                    console.log(data.results);

                    function refElem(id){
                        return document.getElementById(id);
                    }

                    function addElem(id, v) {
                        var e = refElem(id); // référence
                        if (e) { e.innerHTML += v } // s'il existe, ajoute
                    }

                    var button = "";
                    for (var i = 0; i < data.results.length; i++) {
                        button += '<div class="divHistoire col-md-6 col-lg-4 mb-5">\n' +
                            '                <button type="button" class="btnHistoire btn btn-primary" data-toggle="modal" data-target="#portfolioModal' + i + '">\n' +
                            '                    <label>' + data.results[i].nom + '</label>\n' +
                            '                </button>\n' +
                            '            </div>';
                    }
                    addElem('boutonsHistoire', button);
                    var modal = "";
                    for (var i = 0; i < data.results.length; i++) {
                        modal += '<!-- Portfolio Modal ' + i + '-->\n' +
                            '<div class="portfolio-modal modal fade" id="portfolioModal' + i + '" tabindex="-1" role="dialog"\n' +
                            '     aria-labelledby="portfolioModal1Label" aria-hidden="true">\n' +
                            '    <div class="modal-dialog modal-xl" role="document">\n' +
                            '        <div class="modal-content">\n' +
                            '            <button class="close" type="button" data-dismiss="modal" aria-label="Close">\n' +
                            '                <span aria-hidden="true"><i class="fas fa-times"></i></span>\n' +
                            '            </button>\n' +
                            '            <div class="modal-body text-center">\n' +
                            '                <div class="container">\n' +
                            '                    <div class="row justify-content-center">\n' +
                            '                        <div class="col-lg-8">\n' +
                            '                            <!-- Portfolio Modal - Title-->\n' +
                            '                            <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0"\n' +
                            '                                id="portfolioModal1Label">';
                        modal += data.results[i].nom + '</h2>';
                        modal += '<!-- Portfolio Modal - Text-->\n';
                        modal +=    '<br>' +
                        '                            <p class="mb-5">'+
                        '<b>Année de l\'action : </b>' + data.results[i].annee + '</p>';
                        modal += '<p class="mb-5">'+
                        '<b>Lieu de l\'action : </b>' + data.results[i].lieu + '</p>';
                        modal += '<p class="mb-5">'+
                        '<b>Lutte de la personne : </b>' + data.results[i].lutte + '</p>';
                        modal += '<p class="mb-5">'+
                        '<b>Stratégie de l\'action : </b>' + data.results[i].strategie + '</p>';
                        modal += '<p class="mb-5">'+
                        '<b>Action de la personne : </b>' + data.results[i].action + '</p>';
                        modal += '<p class="mb-5">'+
                        '<b>Victoire de la personne : </b>' + data.results[i].victoire + '</p>';
                        modal += '<p class="mb-5">'+
                        '<b>Anecdote sur l\'action ou la personne : </b>' + data.results[i].anecdote + '</p>';
                        modal += '<p class="mb-5">'+
                        '<b>Citation de la personne : </b>' + data.results[i].citation + '</p>';
                        modal += '<p class="mb-5">'+
                        '<b>Question pour le quizz : </b>' + data.results[i].question + '</p>';
                        modal += '<p class="mb-5">'+
                        '<b>Réponse 1 (correcte) : </b>' + data.results[i].reponse1 + '</p>';
                        modal += '<p class="mb-5">'+
                        '<b>Réponse 2 : </b>' + data.results[i].reponse2 + '</p>';
                        modal += '<p class="mb-5">'+
                        '<b>Réponse 3 : </b>' + data.results[i].reponse3 + '</p>';
                        modal += '<p class="mb-5">'+
                        '<b>Lien vers vidéo : </b>' + data.results[i].video + '</p>';
                        modal += '<p class="mb-5">'+
                        '<b>Lien vers un article : </b>' + data.results[i].article + '</p>';

                        modal += '<button class="btn btn-primary" data-dismiss="modal">\n' +
                            '                                <i class="fas fa-times fa-fw"></i>\n' +
                            '                                Fermé la Fenêtre\n' +
                            '                            </button>\n' +
                            '                        </div>\n' +
                            '                    </div>\n' +
                            '                </div>\n' +
                            '            </div>\n' +
                            '        </div>\n' +
                            '    </div>\n' +
                            '</div>';
                    }
                    addElem('modals', modal);
                }
            }
            ,
            error: function(jqXHR, textStatus, errorThrown){
                console.log("Erreur: " + textStatus);
                console.log("Erreur: " + jqXHR);
                console.log("Erreur: " + errorThrown);
            }
        });
    }

    if(document.getElementById("switch")){
        const slider = document.getElementById('slider');
        const switch1 = document.getElementById("switch");
        const togBtn = document.getElementById("togBtn");

        switch1.addEventListener("click", function(){
            slider.classList.add('hide');
            togBtn.classList.add('hide');

            axios.post("Deconnexion")
                .then(function (response) {
                    console.log(response);
                    window.location.replace("http://localhost:8080/Quinoa_war_exploded/Accueil")
                })
                .catch(function (error) {
                    console.log(error);
                });
        });
    }
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
