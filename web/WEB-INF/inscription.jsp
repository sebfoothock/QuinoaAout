<%--
  Created by IntelliJ IDEA.
  User: seb18
  Date: 28/06/2020
  Time: 18:13
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
                    <form id="InscriptionNav" action="Inscription" method="GET"></form>
                    <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
                       href="#" onclick="document.getElementById('InscriptionNav').submit();">Jouer !</a>
                </li>
                <li class="nav-item mx-0 mx-lg-1">
                    <form id="histoireLutteNav" action="Histoire" method="GET"></form>
                    <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#" onclick="document.getElementById('histoireLutteNav').submit();">Histoires de luttes</a>
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
    <div class="container center">
        <h3 class="formTitle text-center">Inscription</h3>
        <div class="row justify-content-md-center">
            <form id="Quiz" action="Quiz" method="GET"></form>
            <form id="inscriptionForm" class="col-md-10" action="Inscription" method="POST">
                <div class="wrapper">
                    <button class="btnLogin btn btn-primary" onclick="document.getElementById('Quiz').submit();">
                        <label>Si vous avez déjà un compte</label>
                    </button>
                </div>
                <div class="form-group">
                    <label for="identifiant"><h6>Adresse Mail</h6></label>
                    <input type="email" placeholder="" id="identifiant" class="champText" name="identifiant" />
                    <div class="erreurChamp">
                        <small>Error message</small>
                    </div>

                </div>
                <div class="form-group">
                    <label for="password"><h6>Mot de Passe</h6></label>
                    <input type="password" placeholder="" id="password" class="champText" name="password" />
                    <div class="erreurChamp">
                        <small>Error message</small>
                    </div>

                </div>
                <div class="form-group">
                    <label for="password2"><h6>Vérification Mot de passe</h6></label>
                    <input type="password" placeholder="" id="password2" class="champText" name="password2"/>
                    <div class="erreurChamp">
                        <small>Error message</small>
                    </div>

                </div>
                <div class="form-group">
                    <h6>Age</h6>
                    <small id="smallAge">Choisissez une option</small>
                    <div>
                        <Input
                                type="radio"
                                name="age"
                                id="16"
                                value="16"
                        />
                        <Label>16-18</Label>
                    </div>
                    <div class="radio">
                        <Input
                                type="radio"
                                name="age"
                                id="19"
                                value="19"
                        />
                        <Label>19-21</Label>
                    </div>
                    <div class="radio">
                        <Input
                                type="radio"
                                name="age"
                                id="22"
                                value="22"
                        />
                        <Label>22-25</Label>
                    </div>
                    <div class="radio">
                        <Input
                                type="radio"
                                name="age"
                                id="26"
                                value="26"
                        />
                        <Label>26-29</Label>
                    </div>
                    <div class="radio">
                        <Input
                                type="radio"
                                name="age"
                                id="30"
                                value="30"
                        />
                        <Label>+ 30</Label>
                    </div>

                </div>
                <div class="form-group">
                    <h6>Sexe</h6>
                    <small id="smallSexe">Choisissez une option</small>
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
                <div class="form-group">
                    <h6>Est-ce que vous vous considérez comme «désobéissant·e» ?</h6>
                    <small id="smallDesobei">Choisissez une option</small>
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
                    <Button class="btnLogin btn btn-primary" onclick="checkInputs();">
                        <label>S'inscrire</label>
                    </Button>
                </div>
            </form>
        </div>
    </div>
</section>

<script src="js/jquery.min.js"></script>
<script src="js/bootbox.all.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script>
    const identifiant = document.getElementById('identifiant');
    const password = document.getElementById('password');
    const password2 = document.getElementById('password2');

    function checkInputs() {
        // trim to remove the whitespaces
        var identifiantValue = identifiant.value.trim();
        var passwordValue = password.value.trim();
        var password2Value = password2.value.trim();
        // const age = document.querySelector('input[name="age"]:checked').value;//n'arrive pas à récupérer la valeur des radios

        var idValidation = false;
        var passwordValidation = false;
        var password2Validation = false;
        var ageValidation = false;
        var sexeValidation = false;
        var desobeiValidation = false;

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

        if(password2Value === '') {
            setErrorFor(password2, 'Ce champ ne peut pas être vide');
            password2Validation = false;
        } else if(passwordValue !== password2Value) {
            setErrorFor(password2, 'Le mot de passe n\'est pas le même');
            password2Validation = false;
        } else{
            setSuccessFor(password2);
            password2Validation = true;
        }

        if(ageValidation === false){
            const radio = document.getElementsByName("age");

            var i = 0;
            while (!ageValidation && i < radio.length) {
                if (radio[i].checked){
                    var ageValue = radio[i].value;
                    ageValidation = true;
                    document.getElementById("smallAge").style.visibility = "hidden"
                }
                i++;
            }
            if (!ageValidation) document.getElementById("smallAge").style.visibility = "visible";
        }

        if(sexeValidation === false){
            const radio = document.getElementsByName("sexe");

            var i = 0;
            while (!sexeValidation && i < radio.length) {
                if (radio[i].checked){
                    var sexeValue = radio[i].value;
                    sexeValidation = true;
                    document.getElementById("smallSexe").style.visibility = "hidden"
                }
                i++;
            }
            if (!sexeValidation) document.getElementById("smallSexe").style.visibility = "visible";
        }

        if(desobeiValidation === false){
            const radio = document.getElementsByName("desobei");

            var i = 0;
            while (!desobeiValidation && i < radio.length) {
                if (radio[i].checked){
                    var desobeiValue = radio[i].value;
                    desobeiValidation = true;
                    document.getElementById("smallDesobei").style.visibility = "hidden"
                }
                i++;
            }
            if (!desobeiValidation) document.getElementById("smallDesobei").style.visibility = "visible";
        }

        if(idValidation === true && passwordValidation === true && password2Validation === true && ageValidation === true && sexeValidation === true && desobeiValidation === true){
            console.log("Envoyé !")

            parameter = "identifiant=" + identifiantValue + "&password=" + passwordValue + "&age=" + ageValue + "&sexe=" + sexeValue + "&desobei=" + desobeiValue ; //forge les paramètres pour l'URL

            // alert(parameter);
            console.log(parameter)
            $.ajax({
                type: "POST",
                url: "Inscription",
                data: parameter,//envoyé à la classe JAVA grâce à l'url
                dataType: "json",//format de donnée reçu
                success: function (data){
                    console.log('success', data);
                    window.location.replace("http://localhost:8080/Quinoa_war_exploded/Quiz?inscrit=1");
                },
                error: function(data){
                    bootbox.alert("Erreur lors de l'inscription");
                    console.log('error', data);
                }
            });
        }

    }

    function setErrorFor(input, message) {
        const formControl = input.parentElement;
        const small = formControl.querySelector('small');
        formControl.className = 'form-group error';
        small.innerText = message;
    }


    function setSuccessFor(input) {
        const formControl = input.parentElement;
        formControl.className = 'form-group success';
    }

    function isEmail(email) {
        return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
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
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>--%>
<%--<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>--%>
<%--<!-- Third party plugin JS-->--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>--%>
<%--<!-- Core theme JS-->--%>
<%--<script src="js/scripts.js"></script>--%>

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
