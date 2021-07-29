<%--
  Created by IntelliJ IDEA.
  User: seb18
  Date: 18/08/2020
  Time: 20:42
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

<body id="page-top" onload="data()">
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
                    <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#" onclick="document.getElementById('statistiqueNavNav').submit();">Statistique</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<section class="page-section portfolio" id="portfolio">
    <div class="container center">
        <br>
        <h1 class="formTitle text-center">Statistique</h1>
        <div class="row justify-content-md-center">
            <br>
<%--            <input type="number">--%>
            <table id="stat">
                <thead>
                <tr>
                    <td id=ref class="h6">Type de statistique</td>
                    <td id=auteur class="h6">Résultat</td>
                </tr>
                </thead>
                <tbody id=tabStat>
                </tbody>
            </table>
        </div>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script>
    function data() {
        let currentYear = new Date().getFullYear()
        let previousYear = currentYear-1;
        let anneePrecedente = 0;
        var anneeActuelle = 0;
        let autreValeur = 0;

        axios.get("Stats")
            .then( (response) => {

                console.log("response: "+response.data)
                //this.users({response: response})

                let filterGamesInfo = response.data + '';
                let filterGamesInfoSplit = filterGamesInfo.split(",");
                let filterGamesInfoSplitLength = filterGamesInfoSplit.length;

                for(let i = 0; i < filterGamesInfoSplitLength; i++){
                    nbPartie++;
                    console.log("date: "+filterGamesInfoSplit[i]);
                    let date = filterGamesInfoSplit[i]
                    let splitDate = date.split('/')
                    let annee = parseInt(splitDate[2])
                    console.log("annee: "+annee);
                    console.log(typeof annee)

                    switch (annee) {
                        case currentYear-1:
                            anneePrecedente++;
                            break;
                        case currentYear:
                            anneeActuelle++;
                            break;
                        default:
                            autreValeur++;
                    }
                }
                function refElem(id) {
                    return document.getElementById(id);
                }

                function addElem(id, v) {
                    var e = refElem(id); // référence
                    if (e) {
                        e.innerHTML += v
                    } // s'il existe, ajoute
                }

                addElem("anneePrecedente", anneePrecedente);
                addElem("anneeActuelle", anneeActuelle);
                addElem("autreValeur", autreValeur);
                addElem("nbPartie", filterGamesInfoSplitLength);


                // affectation dans les éléments du DOM

            })
            .catch( (error) => {
                console.log(error);
            })



        function refElem(id) {
            return document.getElementById(id);
        }

        function addElem(id, v) {
            var e = refElem(id); // référence
            if (e) {
                e.innerHTML += v
            } // s'il existe, ajoute
        }


        var tab = "";
            // tab += '<tr>';
            // tab += '<td>' + 'nombre de connexion en ' + currentYear + '</td>';
            // tab += '<td>' + +'</td>';
            // tab += '</tr>';

            tab += '<tr>';
            tab += '<td>' + 'nombre de partie au total ' + '</td>';
            tab += '<td id="nbPartie"></td>';
            tab += '</tr>';

            tab += '<tr>';
            tab += '<td>' + 'nombre de partie lancée en ' + previousYear + '</td>';
            tab += '<td id="anneePrecedente"></td>';
            tab += '</tr>';

            tab += '<tr>';
            tab += '<td>' + 'nombre de partie lancée en ' + currentYear + '</td>';
            tab += '<td id="anneeActuelle"></td>';
            tab += '</tr>';

            tab += '<tr>';
            tab += '<td>' + 'autres valeurs' + '</td>';
            tab += '<td id="autreValeur"></td>';
            tab += '</tr>';

        addElem('tabStat', tab);
    }
</script>

</body>
</html>
