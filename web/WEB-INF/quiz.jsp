<%--
  Created by IntelliJ IDEA.
  User: seb18
  Date: 06/08/2020
  Time: 17:46
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
    <link href="css/styles.css" type="text/css" rel="stylesheet" />
</head>

<body id="page-top" onload="postdata();">
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
                    <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#">Accueil</a>
                </li>
                <li class="nav-item mx-0 mx-lg-1">
                    <form id="inscriptionNav" action="Inscription" method="GET"></form>
                    <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#" onclick="document.getElementById('inscriptionNav').submit();">Inscription</a>
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

<%--Quiz--%>
<div id="bodyQuiz">
    <div class="containerQuiz">
        <div id="question-container" class="hide">
            <div id="question">Question</div>
            <div id="answer-buttons" class="btn-grid">
                <button class="btnQuiz">Answer 1</button>
                <button class="btnQuiz">Answer 2</button>
                <button class="btnQuiz">Answer 3</button>
            </div>
        </div>
        <div class="controls">
            <button id="start-btn" class="start-btn btn" onclick="startGame()">Commencer</button>
            <button id="next-btn" class="next-btn btn hide">Suivant</button>
        </div>
    </div>
</div>

<script>
    var questions = [];
    function postdata() {
        var parameter ="";
        $.ajax({
            type: "POST",
            url: "Quiz",
            data: parameter,
            dataType: "json",
            success: function( data, textStatus, jqXHR) {
                if (data.success) {
                    for (var i = 0; i < data.results.length; i++) {
                        questions.push({
                            question: data.results[i].question,
                            answers: [
                                {text: data.results[i].reponse1, correct: true},
                                {text: data.results[i].reponse2, correct: false},
                                {text: data.results[i].reponse3, correct: false},
                                ].sort(function () {
                                    return 0.5 - Math.random()
                                }),
                        });
                    }
                    // for (var i = 0; i < data.results.length; i++) {
                    //     questions = [
                    //         {
                    //             question: data.results[i].question,
                    //             answer: [
                    //                 {text: data.results[i].reponse1, correct: true},
                    //                 {text: data.results[i].reponse2, correct: false},
                    //                 {text: data.results[i].reponse3, correct: false},
                    //             ].sort(function () {
                    //                 return 0.5 - Math.random();
                    //             }),
                    //         }
                    //     ]
                    // }

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
    const nextButton = document.getElementById('next-btn')
    const questionContainerElement = document.getElementById('question-container');
    const questionElement = document.getElementById('question');
    const answerButtonsElement = document.getElementById('answer-buttons');

    let changeQuestions, currentQuestionIndex;

    function startGame(){
        startButton.classList.add('hide');
        changeQuestions = questions.sort(() => Math.random() - .5);//mélanger les questions
        currentQuestionIndex = 0;
        questionContainerElement.classList.remove('hide');
        setNextQuestion();
    }

    function setNextQuestion(){
        resetState()
        showQuestion(questions[currentQuestionIndex])
    }

    function showQuestion(question){
        console.log(questions);
        questionElement.innerText = question.question;
        question.answers.forEach(answer => {
            const button = document.createElement('button')
            button.innerText = answer.text //insérer le text
            button.classList.add('btnQuiz')//qui va permettre d'appliquer le style btnQuiz.correct, .wrong, ...
            if (answer.correct){
                button.dataset.correct = answer.correct//ajoute un attribut dataset à notre bouton => .correct
            }
            button.addEventListener('click',selectAnswer)
            answerButtonsElement.appendChild(button)//ajout de nouveau bouton
        })
    }

    function resetState() {
        nextButton.classList.add('hide')
        while (answerButtonsElement.firstChild) {//si answerButtonElement a un enfant
            answerButtonsElement.removeChild(answerButtonsElement.firstChild)//retire les boutons enfants
        }
    }

    function selectAnswer(e) {
        const selectedButton = e.target//savoir quelle réponse est sélectionné
        const correct = selectedButton.dataset.correct
         // setStatusClass(document.getElementById('bodyQuiz'), correct)
        Array.from(answerButtonsElement.children).forEach(button => {//convertir les états de bouton en tableau pour chaque bouton
            setStatusClass(button, button.dataset.correct)
        })
        // if (shuffledQuestions.length > currentQuestionIndex + 1) {
        //     nextButton.classList.remove('hide')
        // } else {
        //     startButton.innerText = 'Restart'
        //     startButton.classList.remove('hide')
        // }

    }

    function setStatusClass(element, correct){//prend l'élément et si il est correcte ou pas
        // clearStatusClass(element)
        if(correct){
            element.classList.add("correct")
        } else {
            element.classList.add("wrong")
        }
    }

    // function clearStatusClass(element) {
    //     element.classList.remove('correct')
    //     element.classList.remove('wrong')
    // }


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