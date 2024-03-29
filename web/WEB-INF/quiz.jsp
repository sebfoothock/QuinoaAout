<%--
  Created by IntelliJ IDEA.
  User: seb18
  Date: 06/08/2020
  Time: 17:46
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
    <link href="css/styles.css" type="text/css" rel="stylesheet" />
</head>

<body id="page-top" onload="postdata()">
<!-- Navigation-->
<nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
    <div class="container">
        <a href="http://www.quinoa.be">
            <img src="img/Quinoa.png" class="logoNav" alt="logo Quinoa"/>
        </a>
        <button class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded"
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
                    <form id="quizNav" action="Quiz" method="GET"></form>
                    <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#" onclick="document.getElementById('quizNav').submit();">Jouer !</a>
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

<%--refresh button--%>
<div id="refresh">
<%--    <div id="containerRefresh">--%>
<%--        <div class="controls">--%>
<%--            <button class="refresh-btn btn" onclick="refresh()">Rafraichir</button>--%>
<%--            <p class="text-center textRefresh">Si le quiz ne s'affiche pas rafraichissez la page</p>--%>
<%--        </div>--%>
<%--    </div>--%>
</div>

<%--Quiz--%>
<div id="bodyQuiz">
    <div class="containerQuiz">
        <div id="question-container" class="hide">
            <div id="themeQuiz" class="textQuiz text-center">theme</div>
            <div id="questionQuiz" class="text-center titreQuiz">Question</div>
            <div id="answer-buttons" class="btn-grid">
                <button class="btn">Answer 1</button>
                <button class="btn">Answer 2</button>
                <button class="btn">Answer 3</button>
            </div>
        </div>
        <div id="debut-container" class="text-center textQuiz">
            <p class="font3D" id="dezobeyTitreQuiz">Quiz Dezobeyi</p>
            <p class="textQuiz"> Le quiz dure 5 minutes et contient 10 questions</p>
<%--            <p class="titreQuiz">Bonne chance !</p>--%>
        </div>
        <div class="controls">
            <button id="start-btn" class="start-btn btn" onclick="startGame()">Commencer</button>
            <button id="next-btn" class="next-btn btn hide" onclick="() => {currentQuestionIndex++
                                                                    setNextQuestion()}">Suivant</button>
        </div>

        <div id="result-container" class="text-center hide">
                <p class="titreQuiz">Tu as fini le Quiz Dezobeyi !</p>
            <br>
            <label>Tu as eu <label id="score"></label> sur 10 !</label>
            <p id="phraseScore"></p>
            <button id="restart-btn" class="start-btn btn" onclick="window.location.reload()">Recommencer</button>
            <div>
                <button id="newsletter-btn" class="btn" onclick="newsletter()">S'inscrire à la newsletter Quinoa</button>
            </div>
        </div>
    </div>
</div>

<script src="js/jquery.min.js"></script>
<script src="js/bootbox.all.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script>

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

    var questions = [];
    let score = 0;
    function postdata() {
        var parameter ="";
        $.ajax({
            type: "POST",
            url: "Quiz",
            data: parameter,
            contentType: "application/x-www-form-urlencoded;charset=UTF-8",
            dataType: "json",
            success: function( data, textStatus, jqXHR) {
                if (data.success) {
                    for (var i = 0; i < data.results.length; i++) {
                        questions.push({
                            nom: data.results[i].nom,
                            question: data.results[i].question,
                            answers: [
                                {text: data.results[i].reponse1, correct: true},
                                {text: data.results[i].reponse2, correct: false},
                                {text: data.results[i].reponse3, correct: false},
                            ].sort(function () {
                                return 0.5 - Math.random()//mélange des réponses
                            }),
                        });
                    }
                    questions = questions.sort(() => Math.random() - .5);//mélanger les questions
                    questions = questions.slice(0, 10);
                    console.log(questions);
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
    const startButton = document.getElementById('start-btn');
    const nextButton = document.getElementById('next-btn');
    const questionContainerElement = document.getElementById('question-container');
    const resultContainerElement = document.getElementById('result-container');
    const questionElement = document.getElementById('questionQuiz');
    const answerButtonsElement = document.getElementById('answer-buttons');
    const debutQuiz = document.getElementById('debut-container');
    const themeQuiz = document.getElementById('themeQuiz');


    let currentQuestionIndex;

    nextButton.addEventListener('click', () => {
        currentQuestionIndex++
        setNextQuestion()
    })

    function addElem(id, v) {
        if (id) { id.innerHTML += v } // s'il existe, ajoute
    }

    function startGame(){
        startButton.classList.add('hide');
        currentQuestionIndex = 0;
        questionContainerElement.classList.remove('hide');
        debutQuiz.classList.add('hide');
        resultContainerElement.classList.add('hide');
        setNextQuestion();
    }

    function setNextQuestion(){
        resetState()
        showQuestion(questions[currentQuestionIndex])
    }

    function showQuestion(question){
        addElem(questionElement, question.question);
        addElem(themeQuiz,"Sujet de la question : " + question.nom);
        if(question){
            question.question = " ";
        }
        if(question.nom){
            question.nom = " ";
        }

        question.answers.forEach(answer => {
            const button = document.createElement('button')
            button.innerText = answer.text //insérer le text
            button.classList.add('textQuiz')
            button.classList.add('btnQuiz')
            button.classList.add('answer')
            button.classList.add('btn')//qui va permettre d'appliquer le style btnQuiz.correct, .wrong, ...
            if (answer.correct){
                button.dataset.correct = answer.correct//ajoute un attribut dataset à notre bouton => .correct
            }
            button.addEventListener('click',selectAnswer)
            answerButtonsElement.appendChild(button)//ajout de nouveau bouton
            answerButtonsElement.classList.remove('disable')//activer le click sur les réponses
        })
    }

    function resetState() {
        nextButton.classList.add('hide')
        while (answerButtonsElement.firstChild) {//si answerButtonElement a un enfant
            answerButtonsElement.removeChild(answerButtonsElement.firstChild)//retire les boutons enfants
        }
        questionElement.removeChild(questionElement.firstChild)
        themeQuiz.removeChild(themeQuiz.firstChild)
    }

    function selectAnswer(e) {
        const selectedButton = e.target//savoir quelle réponse est sélectionné
        const correct = selectedButton.dataset.correct
        // setStatusClass(document.getElementById('bodyQuiz'), correct)
        Array.from(answerButtonsElement.children).forEach(button => {//convertir les états de bouton en tableau pour chaque bouton
            setStatusClass(button, button.dataset.correct)
        })
        if (questions.length > currentQuestionIndex +1 ) {//si il y a encore des questions
            nextButton.classList.remove('hide')
            answerButtonsElement.classList.add('disable')//annuler le clique sur les réponses pour augmenter le score
        } else {//si plus de question on affiche le résultat
            questionContainerElement.classList.add('hide')
            resultContainerElement.classList.remove('hide')
            console.log(score)
            document.getElementById("score").innerText = score;
            if(score >= 7){
                document.getElementById("phraseScore").innerText = "Bravo ! Tu es un-e incontestable désobéissant-e 😃...\n" +
                    "Dezobeyi comporte encore bien d'autres facettes, n'hésite\n" +
                    "pas à rejouer..."
            }
            else if(score >= 5){
                document.getElementById("phraseScore").innerText = "Tu es un-e désobéissant-e confirmé-e, bien joué !\n"
                    + "et si tu rejouais pour devenir un-e véritable expert-e ?"
            }
            else{
                document.getElementById("phraseScore").innerText = "Tu es une graine de désobéissant-e !\n" +
                    "Continue de t'informer dans nos pages et rejoue !"
            }
        }
        if (selectedButton.dataset = correct) {
            score++;
            console.log(score)
        }
    }

    function setStatusClass(element, correct){//prend l'élément et si il est correcte ou pas
        // clearStatusClass(element)
        if(correct){
            element.classList.add("correct")
        } else {
            element.classList.add("wrong")
        }
    }

    function validateEmail(email) {
        const re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
    }

    function newsletter() {
        bootbox.dialog({
            title: 'Newsletter',
            message: '<p>Entrez votre adresse mail pour être tenu au courant des actualités de l\'ASBL Quinoa</p> ' +
                '<input type="text" name="mail" id="mail">' +
                ' <p id="email"></p>',
            size: 'medium',
            onEscape: true,
            backdrop: true,
            prompt:true,
            buttons: {
                send: {
                    label: 'Envoyer',
                    className: 'btn-success',
                    callback: function () {
                        let resultMail = $('#mail').val();
                        if (resultMail === null) {
                        }
                        else {
                             if (validateEmail(resultMail)) {
                                console.log(resultMail)
                                var parameter = "mailInput=" + resultMail;
                                $.ajax({
                                    type: "POST",
                                    url: "Mail",
                                    data: parameter,
                                    dataType: "json",
                                    success: function (data) {
                                        bootbox.alert("Inscription à la newsletter réussi !");
                                        console.log("Réussi: " + data);
                                    },
                                    error: function (data) {
                                        bootbox.alert("Erreur d'inscription à la newsletter");
                                        console.log("Erreur: " + data);
                                    }
                                });
                            }
                            else {
                                bootbox.alert("Votre adresse mail n'est pas valide");
                            }
                            }
                        }
                    }
                },
                cancel: {
                    label: 'Annuler',
                    className: 'none',
                    callback: function () {

                    }
                }
            })
        }

    // function clearStatusClass(element) {
    //     element.classList.remove('correct')
    //     element.classList.remove('wrong')
    // }


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
