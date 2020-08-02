<%--
  Created by IntelliJ IDEA.
  User: seb18
  Date: 28/06/2020
  Time: 16:02
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

<body id="page-top">
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
          <form id="histoireLutteNav" action="Histoire" method="GET"></form>
          <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#" onclick="document.getElementById('histoireLutteNav').submit();">Histoire de lutte</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<!-- Masthead-->
<header class="masthead text-center">
  <div class="container d-flex align-items-center flex-column">
    <!-- Masthead Avatar Image-->
    <!-- <img
        class="masthead-avatar mb-5"
        src="assets/img/avataaars.svg"
        alt=""
      /> -->
    <!-- Masthead Heading-->
    <h1 class="masthead-heading text-uppercase mb-0">Quizz Dezobeyi</h1>
    <!-- Icon Divider-->
    <!-- <div class="divider-custom divider-light">
        <br />
        <div class="divider-custom-line"></div>
        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
        <div class="divider-custom-line"></div>
        <br />
      </div> -->
    <!-- Masthead Subheading-->
    <p class="masthead-subheading font-weight-light mb-0">
      Désobeissance civil - Combat pour des libertés
    </p>
  </div>
</header>
<!-- About Section-->
<section class="page-section bg-primary mb-0" id="about">
  <div class="container">
    <!-- About Section Heading-->
    <h2 class="page-section-heading text-center text-uppercase">
      Présentation ASBL
    </h2>
    <br />
    <!-- About Section Content-->
    <div class="row justify-content-center">
      <div class="col-md-10 text-center">
        <p class="lead">
          Quinoa est une ONG d'éducation à la citoyenneté mondiale et
          solidaire (ECMS). L'ECMS est un processus qui vise à provoquer des
          changements de valeur et de comportement sur le plan individuel et
          collectif en vue d'un monde plus juste dans lequel ressources et
          pouvoirs sont équitablement répartis dans le respect de la dignité
          humaine. Ses actions : projets internationaux (aussi scolaires,
          maison de jeunes, scouts en Amérique de sud, Afrique et Asie).
          Projet alternative locales. Animations pédagogiques (Jeu de la
          ficelle, Potentia, Jeu des chaises, Dezobeyi...). Mobilisations.
        </p>
        <h6><a href="http://www.quinoa.be" class="text-white">Lien vers l'ASLB</a></h6>
        <img src="img/Quinoa.png" class="imgLogo" alt="logo Quinoa"/>
      </div>
    </div>
  </div>
</section>
<!-- About Section-->
<section class="page-section  mb-0" >
  <div class="container">
    <!-- About Section Heading-->
    <h2 class="page-section-heading text-center text-uppercase">
      Jeu Dezobeyi
    </h2>
    <br />
    <!-- About Section Content-->
    <div class="row justify-content-center">
      <div class="col-md-10 text-center">
        <p class="lead">
          Et toi, as-tu déjà desobéi ? Face à l'intimidation, à l'injustice comment réagir ?
          Faut-il parfois désobéir ? Quinoa asbl propose un outil pédagogique autour de l'action directe non-violente
          et de la désobéissance civile : du Nord au Sud, l'action directe non-violente est (et a toujours été) un
          levier de changement social. Droit de vote des femmes, abolition de la ségrégation, récupération de
          terres... : tous ont été obtenus notamment par des actions de "désobéissance".
        </p>
        <p class="lead">
          Le jeu entend partir du vécu des participan•t•e•s pour mieux toucher au coeur des causes qui les animent et
          les inspirent. L'outil se développe en une ligne du temps sur laquelle le•la participant•e, en plusieurs
          phase ludiques, peut tester ses connaissances et affuter sa vision du monde en voyageant dans une "autre"
          Histoire que celle récontée par les "dominants".
          L'outil laisse aussi la place aux échanges et à l'action avec des mises en situation et débats mouvants.
          Explorez les luttes (et les victoires) de ces femmes et hommes qui ont désobéi.
        </p>
        <h6><a href="http://www.quinoa.be/je-minforme-3/outils-pedagogiques/desobeir-un-acte-citoyen/">Lien vers la version papier du jeu</a></h6>
        <img src="img/dezobey.jpg" class="imgJeu" alt="image jeu"/>
      </div>
    </div>
  </div>
</section>
<!-- Footer-->
<footer class="footer text-center">
  <div class="container">
    <div class="row">
      <!-- Footer Location-->
      <div class="col-lg-4 mb-5 mb-lg-0">
        <h4 class="text-uppercase mb-4">Location</h4>
        <p class="lead mb-0">
          2215 John Daniel Drive
          <br />
          Clark, MO 65243
        </p>
      </div>
      <!-- Footer Social Icons-->
      <div class="col-lg-4 mb-5 mb-lg-0">
        <h4 class="text-uppercase mb-4">Around the Web</h4>
        <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-facebook-f"></i></a>
        <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-twitter"></i></a>
        <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-linkedin-in"></i></a>
        <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-dribbble"></i></a>
      </div>
      <!-- Footer About Text-->
      <div class="col-lg-4">
        <h4 class="text-uppercase mb-4">About Freelancer</h4>
        <p class="lead mb-0">
          Freelance is a free to use, MIT licensed Bootstrap theme created
          by
          <a href="http://startbootstrap.com">Start Bootstrap</a>
          .
        </p>
      </div>
    </div>
  </div>
</footer>
<!-- Copyright Section-->
<div class="copyright py-4 text-center text-white">
  <div class="container"><small>Copyright © Your Website 2020</small></div>
</div>
<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes)-->
<div class="scroll-to-top d-lg-none position-fixed">
  <a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top"><i
          class="fa fa-chevron-up"></i></a>
</div>
<!-- Bootstrap core JS-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
<!-- Third party plugin JS-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>

</html>