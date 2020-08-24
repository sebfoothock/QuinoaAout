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
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css"/>
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
          <form id="accueilNav" action="Accueil" method="GET"></form>
          <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#" onclick="document.getElementById('accueilNav').submit();">Accueil</a>
        </li>
        <li class="nav-item mx-0 mx-lg-1">
          <form id="inscriptionNav" action="Inscription" method="GET"></form>
          <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#" onclick="document.getElementById('inscriptionNav').submit();">Jouer !</a>
        </li>
        <li class="nav-item mx-0 mx-lg-1">
          <form id="connexionNav" action="Connexion" method="GET"></form>
          <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#" onclick="document.getElementById('connexionNav').submit();">Connexion</a>
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
    <label id="switch">
      <input type="checkbox" id="togBtn">
      <div class="slider round"></div>
    </label>
  </div>
</nav>
<!-- Masthead-->
<header class="masthead text-center">
  <div class="container d-flex align-items-center flex-column">
    <h1 class="masthead-heading text-uppercase mb-0 font3D">Quiz Dezobeyi</h1>
    <p class="masthead-subheading font-weight-light mb-0">
      Désobéissance civile - Combat pour des libertés
    </p>
  </div>
</header>
<!-- Le jeu Section-->
<section class="page-section bg-primary mb-0" >
  <div class="container">
    <!-- Le jeu Section Heading-->
    <h2 class="page-section-heading text-center text-uppercase">
      Le jeu !
    </h2>
    <br />
<!-- Le jeu Section Content-->
    <div class="row justify-content-center">
      <div class="col-md-10 text-center">
        <p class="lead">
          En cliquant sur l’onglet  <b>‘Jouer !’</b>, tu accèderas à la version ‘Quizz’ de Dezobeyi : à travers une dizaine de questions, 
          explore les luttes et les victoires de ces femmes et hommes qui ont désobéi !
        </p>
        <p class="lead">
          Avant de te lancer, tu peux aussi parcourir les différentes luttes et t’informer 
          sur ces désobéissant·e·s qui, à travers le monde et les époques se battent pour plus de justice ! <b>Clique sur ‘Histoires de luttes’</b> !
        </p>
        <p class="lead">
          N’hésite pas à créer ton compte pour comptabiliser tes points et découvrir quel·le désobéissant·e tu es. <b> Clique sur ‘Connexion’</b> !
        </p>
        <p class="lead">
          Tu peux refaire le quizz plusieurs fois, des questions différentes te seront proposées pour te permettre de découvrir de nouveaux modes de résistances.
        </p>
        <h6><a href="http://www.quinoa.be/je-minforme-3/outils-pedagogiques/desobeir-un-acte-citoyen/" class="text-white">Lien vers la version papier du jeu</a></h6>
        <br>
        <img src="img/dezobey.jpg" class="imgJeu" alt="image jeu"/>
      </div>
    </div>
  </div>
</section>
<!-- Présentation de l'ASBL Section-->
<section class="page-section mb-0">
  <div class="container">
    <!-- Présentation de l'ASBL Section Heading-->
    <h2 class="page-section-heading text-center text-uppercase">
      Présentation de l'ASBL
    </h2>
    <br />
    <!-- Présentation de l'ASBL Section Content-->
    <div class="row justify-content-center">
      <div class="col-md-10 text-center">
        <p class="lead">
          Quinoa est une ONG d'éducation à la citoyenneté mondiale et solidaire (ECMS).
          L'ECMS est un processus qui vise à provoquer des changements de valeurs et de comportements
          sur le plan individuel et collectif en vue d'un monde plus juste dans lequel ressources et
          pouvoirs sont équitablement répartis dans le respect de la dignité humaine.
        </p>
        <p class="lead">
          Ses actions : projets internationaux tels que scolaires, maisons de jeunes, scoutisme
          en Amérique de sud, Afrique et Asie, projets alternatifs locaux, animations pédagogiques
          (jeu de la ficelle, Potentia, jeu des chaises, Dezobeyi...).
        </p>
        <h6><a href="http://www.quinoa.be">Lien vers l'ASLB</a></h6>
        <img src="img/Quinoa.png" class="imgLogo" alt="logo Quinoa"/>
      </div>
    </div>
  </div>
</section>
<!-- combats de l'ASBL Section -->
<section class="page-section bg-primary mb-0">
  <div class="container">
    <!-- combats de l'ASBL Section Heading-->
    <h2 class="page-section-heading text-center text-uppercase">
      Les combats de l'ASBL
    </h2>
    <br />
    <!-- combats de l'ASBL Section Content-->
    <div class="row justify-content-center">
      <div class="col-md-10 text-center">
        <p class="lead">
          Les injustices sont parfois perpétrées légalement : l’esclavagisme comme la ségrégation étaient légales !
          Chez ‘nous’, l’enfermement de personnes migrantes, les salaires misérables, la pollution et le lobby des
          entreprises transnationales sont tolérés, parfois encouragés, par des lois…
        </p>
        <p class="lead">
          Face au racisme, au sexisme, aux inégalités sociales, économiques, à la destruction de l’environnement,
          aux oppressions, aux injustices qui nous touchent et dont nous sommes témoins… <b>comment réagir ? Faut-il
          parfois désobéir ?</b>
        </p>
        <p class="lead">
          Droit de vote des femmes, abolition de la ségrégation, récupération de terres... : tous ont été obtenus, notamment, par des actions de "désobéissance" !
        </p>
        <p class="lead">
          <b>Quinoa asbl</b> propose un outil pédagogique autour de l'action directe non-violente et de la désobéissance civile : du Nord au Sud, l'action directe non-violente
          est -et a toujours été- un levier de changement social.
        </p>
        <p class="lead">
          …Et, toi, as-tu déjà désobéi ?
        </p>
        <p class="lead">
          <b>Envie d’aborder la désobéissance civile et l’action directe non-violente avec ta classe ? Quinoa propose une animation pédagogique (2x50 min., à partir de 16 ans)
            autour de ces questions ! Contacte-nous (<a href="mailto:info@quinoa.be" class="text-white"> info@quinoa.be </a>)</b>
        </p>
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
        <h4 class="text-uppercase mb-4">Contact</h4>
        <p class="lead mb-0">
          <a href="mailto:info@quinoa.be">info@quinoa.be</a>
          <br />
          +32 2 893 08 70
        </p>
      </div>
      <!-- Footer Social Icons-->
      <div class="col-lg-4 mb-5 mb-lg-0">
        <h4 class="text-uppercase mb-4">L'ASBL sur Internet</h4>
        <a class="btn btn-outline-light btn-social mx-1" href="https://www.facebook.com/Quinoa.asbl/"><i class="fab fa-fw fa-facebook-f"></i></a>
        <a class="btn btn-outline-light btn-social mx-1" href="https://www.linkedin.com/company/quinoa/?trk=company_logo"><i class="fab fa-fw fa-linkedin-in"></i></a>
        <a class="btn btn-outline-light btn-social mx-1" href="http://www.quinoa.be"><i class="fab fa-fw fa-dribbble"></i></a>
      </div>
      <!-- Footer About Text-->
      <div class="col-lg-4">
        <h4 class="text-uppercase mb-4">Dévelloper par</h4>
        <p class="lead mb-0">
          étudiant en IT à l'EPHEC
          <br>
          <a class="btn btn-outline-light btn-social mx-1" href="https://www.linkedin.com/in/sébastien-raemdonck-87a864182/"><i class="fab fa-fw fa-linkedin-in"></i></a>
          <a class="btn btn-outline-light btn-social mx-1" href="https://www.linkedin.com/in/aymeric-ponj%C3%A9e-91153b180/"><i class="fab fa-fw fa-linkedin-in"></i></a>
          <br>
        </p>
      </div>
    </div>
  </div>
</footer>
<!-- Copyright Section-->
<div class="copyright py-4 text-center text-white">
  Template by <a href="https://startbootstrap.com/themes/freelancer/">Start Bootstrap</a>
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
