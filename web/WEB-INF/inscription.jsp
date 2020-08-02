<%--
  Created by IntelliJ IDEA.
  User: seb18
  Date: 28/06/2020
  Time: 18:13
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
                    <form id="InscriptionNav" action="Inscription" method="POST"></form>
                    <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
                       href="#" onclick="document.getElementById('InscriptionNav').submit();">Inscription</a>
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
        <div class="row justify-content-md-center">
            <h3 class="formTitle text-center">Inscription</h3>
            <form id="inscriptionForm" class="col-md-10" action="Inscription" method="POST">
                <div class="form-control">
                    <h6>Adresse Mail</h6>
                    <input type="email" class="form-control" id="identifiant" name="identifiant" placeholder="">
                </div>
                <div class="form-control">
                    <h6>Mot de Passe</h6>
                    <input type="password" class="form-control" id="password" name="password" placeholder="">
                        <p class="help-block text-danger"></p>
                </div>
                <div class="form-control">
                    <h6>Vérifiaction mot de passe</h6>
                    <input type="password" placeholder="" id="password2"/>
                </div>
                <div class="form-group">
                <h6>Age</h6>
                    <div>
                        <Input
                                type="radio"
                                name="radioAge"
                                id="16"
                                value="16"
                        />
                        <Label>16-18</Label>
                    </div>
                    <div class="radio">
                        <Input
                                type="radio"
                                name="radioAge"
                                id="19"
                                value="19"
                        />
                        <Label>19-21</Label>
                    </div>
                    <div class="radio">
                        <Input
                                type="radio"
                                name="radioAge"
                                id="22"
                                value="22"
                        />
                        <Label>22-25</Label>
                    </div>
                    <div class="radio">
                        <Input
                                type="radio"
                                name="radioAge"
                                id="26"
                                value="26"
                        />
                        <Label>26-29</Label>
                    </div>
                    <div class="radio">
                        <Input
                                type="radio"
                                name="radioAge"
                                id="30"
                                value="30"
                        />
                        <Label>+ 30</Label>
                    </div>
                </div>
        <div class="form-group">
                    <h6>Sexe</h6>
                    <div class="radio">
                            <Input
                                    type="radio"
                                    name="sexe"
                                    id="homme"
                                    value="homme"
                                    data-testid="homme"
                            />
                        <Label>homme</Label>
                    </div>
                    <div class="radio">
                            <Input
                                    type="radio"
                                    name="sexe"
                                    id="femme"
                                    value="femme"
                                    data-testid="femme"
                            />
                        <Label>femme</Label>
                    </div>
                    <div class="radio">
                            <Input
                                    type="radio"
                                    name="sexe"
                                    id="autre"
                                    value="autre"
                                    data-testid="autre"
                            />
                        <Label>autre</Label>
                    </div>
                </div>
                <div>
                    <h6>Est-ce que vous vous considérez comme «désobéissant» ?</h6>
                    <div class="radio">
                        <Input
                                type="radio"
                                name="desobei"
                                id="oui"
                                value="oui"
                        />
                        <Label>oui</Label>
                    </div>
                    <div class="radio">
                        <Input
                                type="radio"
                                name="desobei"
                                id="unPeu"
                                value="un peu"
                        />
                        <Label>un peu</Label>
                    </div>
                    <div class="radio">
                        <Input
                                type="radio"
                                name="desobei"
                                id="non"
                                value="non"
                        />
                        <Label>non</Label>
                    </div>
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
    const form = document.getElementById('inscriptionForm');
    const identifiant = document.getElementById('identifiant');
    const password = document.getElementById('password');
    const password2 = document.getElementById('password2');

    form.addEventListener('submit', e => {
        e.preventDefault();

        checkInputs();
    });

    function checkInputs() {
        // trim to remove the whitespaces
        const identifiantValue = identifiant.value.trim();
        const passwordValue = password.value.trim();
        const password2Value = password2.value.trim();

        if(identifiantValue === '') {
            setErrorFor(identifiant, 'Email cannot be blank');
        } else if (!isEmail(identifiantValue)) {
            setErrorFor(identifiant, 'Not a valid email');
        } else {
            setSuccessFor(identifiant);
        }

        if(passwordValue === '') {
            setErrorFor(password, 'Password cannot be blank');
        } else {
            setSuccessFor(password);
        }

        if(password2Value === '') {
            setErrorFor(password2, 'Password2 cannot be blank');
        } else if(passwordValue !== password2Value) {
            setErrorFor(password2, 'Passwords does not match');
        } else{
            setSuccessFor(password2);
        }
    }

    function setErrorFor(input, message) {
        const formControl = input.parentElement;
        const small = formControl.querySelector('small');
        formControl.className = 'form-control error';
        small.innerText = message;
    }

    function setSuccessFor(input) {
        const formControl = input.parentElement;
        formControl.className = 'form-control success';
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