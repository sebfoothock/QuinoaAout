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
        <h1 class="formTitle text-center">Statistique <label id="annee"></label></h1>
        <div class="row justify-content-md-center">
            <br>
<%--            <input type="number">--%>
            <table id="stat">
                <thead>
                <tr>
                    <td id=ref>Champs</td>
                    <td id=auteur>Données des inscriptions</td>
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
        var currentYear = new Date().getFullYear()
        var users = []

        var nbInscrit = 0;
        var age16 = 0;
        var age19 = 0;
        var age22 = 0;
        var age26 = 0;
        var age30 = 0;
        var homme = 0;
        var femme = 0;
        var autre = 0;
        var desobeiOui = 0;
        var desobeiPeu = 0;
        var desobeiNon = 0;

        axios.get("Stats")
            .then( (response) => {

                console.log("response: "+response.data)
                //this.users({response: response})

                var filterUsers = response.data; //= users.filter(users.creation_date => currentYear);

                for(let i = 0; i < filterUsers.length; i++){
                    nbInscrit++;
                    console.log("age: "+filterUsers[i].age);
                    switch (filterUsers[i].age) {
                        case '16':
                            age16++;
                            break;
                        case '19':
                            age19++;
                            break;
                        case '21':
                            age22++;
                            break;
                        case '26':
                            age26++;
                            break;
                        case '30':
                            age30++;
                            break;
                        default:
                            age30++;
                    }
                    switch (filterUsers[i].sexe) {
                        case 'homme':
                            homme++;
                            break;
                        case 'femme':
                            femme++;
                            break;
                        case 'autre':
                            autre++;
                            break;
                        default:
                            autre++;
                    }
                    switch (filterUsers[i].desobei) {
                        case 'oui':
                            desobeiOui++;
                            break;
                        case 'non':
                            desobeiNon++;
                            break;
                        case 'un peu':
                            desobeiPeu++;
                            break;
                        default:
                            desobeiNon++;
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

                addElem("nbInscrit", nbInscrit);
                addElem("age16", age16);
                addElem("age19", age19);
                addElem("age22", age22);
                addElem("age26", age26);
                addElem("age30", age30);
                addElem("homme", homme);
                addElem("femme", femme);
                addElem("autre", autre);
                addElem("desobeiOui", desobeiOui);
                addElem("desobeiNon", desobeiNon);
                addElem("desobeiPeu", desobeiPeu);

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


        addElem('annee', currentYear)


        var tab = "";
            // tab += '<tr>';
            // tab += '<td>' + 'nombre de connexion en ' + currentYear + '</td>';
            // tab += '<td>' + +'</td>';
            // tab += '</tr>';

            tab += '<tr>';
            tab += '<td>' + 'nombre d\'inscrit en ' + currentYear + '</td>';
            tab += '<td id="nbInscrit"></td>';
            tab += '</tr>';

            tab += '<tr>';
            tab += '<td>' + 'agé entre 16 et 18 ans' + '</td>';
            tab += '<td id="age16"></td>';
            tab += '</tr>';

            tab += '<tr>';
            tab += '<td>' + 'agé entre 19 et 21 ans' + '</td>';
            tab += '<td id="age19"></td>';
            tab += '</tr>';

            tab += '<tr>';
            tab += '<td>' + 'agé entre 22 et 25 ans' + '</td>';
            tab += '<td id="age22"></td>';
            tab += '</tr>';

            tab += '<tr>';
            tab += '<td>' + 'agé entre 25 et 29 ans' + '</td>';
            tab += '<td id="age26"></td>';
            tab += '</tr>';

            tab += '<tr>';
            tab += '<td>' + 'agé de plus 30 ans' + '</td>';
            tab += '<td id="age30"></td>';
            tab += '</tr>';

            tab += '<tr>';
            tab += '<td>' + 'homme' + '</td>';
            tab += '<td id="homme"></td>';
            tab += '</tr>';

            tab += '<tr>';
            tab += '<td>' + 'femme' + '</td>';
            tab += '<td id="femme"></td>';
            tab += '</tr>';

            tab += '<tr>';
            tab += '<td>' + 'autre' + '</td>';
            tab += '<td id="autre"></td>';
            tab += '</tr>';

            tab += '<tr>';
            tab += '<td>' + 'se considère désobéissant·e' + '</td>';
            tab += '<td id="desobeiOui"></td>';
            tab += '</tr>';

            tab += '<tr>';
            tab += '<td>' + 'se considère un peu désobéissant·e' + '</td>';
            tab += '<td id="desobeiPeu"></td>';
            tab += '</tr>';

            tab += '<tr>';
            tab += '<td>' + 'se considère non désobéissant·e' + '</td>';
            tab += '<td id="desobeiNon"></td>';
            tab += '</tr>';

        addElem('tabStat', tab);
    }
</script>

</body>
</html>
