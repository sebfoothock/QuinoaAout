<%--
  Created by IntelliJ IDEA.
  User: seb18
  Date: 28/06/2020
  Time: 18:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Freelancer - Start Bootstrap Theme</title>
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
            <img src="img/Quinoa.png" class="logoNav
" />
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
                    <form id="accueilForm" action="Accueil" method="GET"></form>
                    <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#" onclick="document.getElementById('accueilForm').submit();">Accueil</a>
                </li>
                <li class="nav-item mx-0 mx-lg-1">
                    <form id="test" action="Inscription" method="POST"></form>
                    <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
                       href="#" onclick="document.getElementById('test').submit();">Inscription</a>
                </li>
                <li class="nav-item mx-0 mx-lg-1">
                    <form id="histoireLutteForm" action="HistoireLutte" method="GET"></form>
                    <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#" onclick="document.getElementById('histoireLutteForm').submit();">Histoire de lutte</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- Portfolio Section-->
<section class="page-section portfolio" id="portfolio">
    <div class="container center">
        <div class="row justify-content-md-center">
            <h1 class="formTitle text-center">Inscription</h1>
            <form id="inscriptionForm" class="col-md-10" action="Inscription" method="POST">
                <div class="form-group ">
                    <label>Adresse Mail</label>
                    <input type="email" class="form-control" id="identifiant" name="identifiant" placeholder="">
                </div>
                <div class="form-group">
                    <label>Mot de Passe</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="">
                        <p class="help-block text-danger"></p>
                </div>
                <div class="form-group">
                <h3>Age</h3>
                    <div>
                        <Input
                                type="radio"
                                name="radioAge"
                                id="16"
                                value="16"
                                onChange=
                        />
                        <Label>16-18</Label>
                    </div>
                    <div class="radio">
                        <Input
                                type="radio"
                                name="radioAge"
                                id="19"
                                value="19"
                                onChange=
                        />
                        <Label>19-21</Label>
                    </div>
                    <div class="radio">
                        <Input
                                type="radio"
                                name="radioAge"
                                id="22"
                                value="22"
                                onChange=
                        />
                        <Label>22-25</Label>
                    </div>
                    <div class="radio">
                        <Input
                                type="radio"
                                name="radioAge"
                                id="26"
                                value="26"
                                onChange=
                        />
                        <Label>26-29</Label>
                    </div>
                    <div class="radio">
                        <Input
                                type="radio"
                                name="radioAge"
                                id="30"
                                value="30"
                                onChange=
                        />
                        <Label>+ 30</Label>
                    </div>
                </div>
        <div class="form-group">
                    <h3>Sexe</h3>
                    <div class="radio">
                            <Input
                                    type="radio"
                                    name="sexe"
                                    id="homme"
                                    value="homme"
                                    data-testid="homme"
                                    onChange=
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
                                    onChange=
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
                                    onChange=
                            />
                        <Label>autre</Label>
                    </div>
                </div>
                <div>
                    <h3>Est-ce que vous vous considérez comme «désobéissant» ?</h3>
                    <div class="radio">
                        <Input
                                type="radio"
                                name="desobei"
                                id="oui"
                                value="oui"
                                onChange=
                        />
                        <Label>oui</Label>
                    </div>
                    <div class="radio">
                        <Input
                                type="radio"
                                name="desobei"
                                id="unPeu"
                                value="un peu"
                                onChange=
                        />
                        <Label>un peu</Label>
                    </div>
                    <div class="radio">
                        <Input
                                type="radio"
                                name="desobei"
                                id="non"
                                value="non"
                                onChange=
                        />
                        <Label>non</Label>
                    </div>
                </div>
                <br></br>
                <div class="wrapper">
                    <Button class="btnLogin" onclick="document.getElementById('inscriptionForm').submit();">
                        <label>S'inscrire</label>
                    </Button>
                </div>
            </form>
        </div>
    </div>
</section>
<!-- Bootstrap core JS-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
<!-- Third party plugin JS-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>

</html>