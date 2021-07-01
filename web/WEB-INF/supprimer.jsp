<%--
  Created by IntelliJ IDEA.
  User: seb18
  Date: 01/08/2020
  Time: 18:02
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
            <h1 class="formTitle text-center">Supprimer un personnage</h1>
            <form id="supprimerForm" class="col-md-10" action="Supprimer" method="POST">
                <br>
                <h6 class="text-center text-danger">Il faut que le nom du personnage soit écrit exactement de la même manière (attention aux majuscules)</h6>
                <br>
                <h6 class="text-center text-danger">Conseil : faire un copier coller du nom dans la liste</h6>
                <br>
                <div class="form-group">
                    <label>Nom</label>
                    <input type="text" class="form-control" id="nom" name="nom" placeholder="Nom du Personne">
                </div>

                <br></br>
                <div class="wrapper">
                    <button class="btnLogin btn btn-primary" onclick="postdata(event);">
                        <label>Supprimer</label>
                    </button>
                </div>
            </form>
        </div>
    </div>
</section>
<%--utilisé pour le JS donc l'exécution marche en focntion de l'ordre du code--%>
<script src="js/jquery.min.js"></script>
<script src="js/bootbox.all.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    $("form :input").attr("autocomplete", "off");//ne pas proposer l'autocomplete de la cache

    function postdata(e) {
        e.preventDefault()
        bootbox.confirm({
            message: "Voulez-vous vraiment supprimer ce personnage ?",
            buttons: {
                confirm: {
                    label: 'Oui',
                    className: 'btn-success'
                },
                cancel: {
                    label: 'Non',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {
                console.log('This was logged in the callback: ' + result);
                if(result){
                    var element1 = document.getElementById("nom").value;
                    var parameter = "nom=" + element1;
                    result = null;
                    $.ajax({
                        type: "POST",
                        url: "Supprimer",
                        data: parameter,
                        dataType: "json",
                        success: function (data) {
                            bootbox.alert("Personnage supprimé ! <br> Vérifier si il est bien supprimé dans Liste");
                            console.log("Réussi: " + data);
                        },
                        error: function (data) {
                            bootbox.alert("Il y a eu une erreur lors de la suppression du personnage");
                            console.log("Erreur: " + data);
                        }
                    });
                }
            }
        });
    }
</script>

<!-- Bootstrap core JS-->
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>--%>

<%--utilisé par HTMl donc peut être mis à la fin--%>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
<!-- Third party plugin JS-->
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>--%>

<%--bootbox confirm alert--%>

<!-- Core theme JS-->
<script src="js/scripts.js"></script>

</body>

</html>
