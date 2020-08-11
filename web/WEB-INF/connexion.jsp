<%--
  Created by IntelliJ IDEA.
  User: seb18
  Date: 08/08/2020
  Time: 19:22
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
                <li class="nav-item mx-0 mx-lg-1">
                    <form id="inscriptionNav" action="Inscription" method="GET"></form>
                    <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
                       href="#" onclick="document.getElementById('inscriptionNav').submit();">Inscription</a>
                </li>
                <li class="nav-item mx-0 mx-lg-1">
                    <form id="connexionNav" action="Connexion" method="GET"></form>
                    <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
                       href="#" onclick="document.getElementById('connexionNav').submit();">Connexion</a>
                </li>
                <li class="nav-item mx-0 mx-lg-1">
                    <form id="quizNav" action="Quiz" method="GET"></form>
                    <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#" onclick="document.getElementById('quizNav').submit();">Quiz</a>
                </li>
                <li class="nav-item mx-0 mx-lg-1">
                    <form id="histoireLutteNav" action="Histoire" method="GET"></form>
                    <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#" onclick="document.getElementById('histoireLutteNav').submit();">Histoire de lutte</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- Portfolio Section-->
<section class="page-section portfolio" id="portfolio">
    <div class="container center">
        <h3 class="formTitle text-center">Connexion</h3>
        <div class="row justify-content-md-center">
            <form id="connexionForm" class="col-md-10">
                <div class="form-inscription">
                    <label for="identifiant"><h6>Adresse Mail</h6></label>
                    <input type="email" placeholder="" id="identifiant" class="champText" name="identifiant" />
                    <div class="erreurChamp">
                        <small>Error message</small>
                    </div>
                </div>
                <div class="form-inscription">
                    <label for="password"><h6>Mot de Passe</h6></label>
                    <input type="password" placeholder="" id="password" class="champText" name="password" />
                    <div class="erreurChamp">
                        <small>Error message</small>
                    </div>

                </div>
                <br></br>
                <div class="wrapper">
                    <Button class="btnLogin btn btn-primary" onclick="checkInputs();">
                        <label>Se Connecter</label>
                    </Button>
                </div>
            </form>
        </div>
    </div>
</section>

<script>
    const identifiant = document.getElementById('identifiant');
    const password = document.getElementById('password');

    function checkInputs() {
        // trim to remove the whitespaces
        const identifiantValue = identifiant.value.trim();
        const passwordValue = password.value.trim();

        var idValidation = false;
        var passwordValidation = false;

        if(identifiantValue === '') {
            setErrorFor(identifiant, 'Ce champ ne peut pas être vide');
            idValidation = false;
        } else if (!isEmail(identifiantValue)) {
            setErrorFor(identifiant, 'L\'email n\'est pas valide');
            idValidation = false;
        } else {
            setSuccessFor(identifiant);
            idValidation = true;
        }

        if(passwordValue === '') {
            setErrorFor(password, 'Ce champ ne peut pas être vide');
            passwordValidation = false;
        } else {
            setSuccessFor(password);
            passwordValidation = true;
        }


        if(idValidation === true && passwordValidation === true){
            document.getElementById('connexionForm').submit();
            console.log("Envoyé !")
        }

    }

    function setErrorFor(input, message) {
        const formControl = input.parentElement;
        const small = formControl.querySelector('small');
        formControl.className = 'form-inscription error';
        small.innerText = message;
    }


    function setSuccessFor(input) {
        const formControl = input.parentElement;
        formControl.className = 'form-inscription success';
    }

    function isEmail(email) {
        return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
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
