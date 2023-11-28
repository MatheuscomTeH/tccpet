<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <title>Hermann Pets</title>

<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.min.css" />">

<!-- fonts style -->
<link
	href="<c:url value="https://fonts.googleapis.com/css?family=Open+Sans|Poppins:400,700&display=swap"/>"
	rel="stylesheet">

<!-- css-->
<link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet" />


</head>

<body>
  
  <div class="hero_area_agendamento">

    <!-- header -->
    <header class="header_section">
      <div class="container-fluid">
        <nav class="navbar navbar-expand-lg custom_nav-container">
          <a class="navbar-brand" href="index.html">
            <img src="<c:url value="/resources/images/logotcc.jpeg"/>" alt="Logo da petshop">
          </a>
          <div class="" id="">
            <div class="User_option">
              <form class="form-inline my-2  mb-3 mb-lg-0">
                <input type="search" placeholder="Search">
                <button class="btn   my-sm-0 nav_search-btn" type="submit"></button>
              </form>
            </div>

            <div class="custom_menu-btn">
              <button class="open__nav__btn">
                <span class="s-1">

                </span>
                <span class="s-2">

                </span>
                <span class="s-3">

                </span>
              </button>
            </div>
            <div id="myNav" class="overlay">
              <div class="overlay-content">
                <a href="index.html">Página Inicial</a>
                <a href="about.html">Sobre nós</a>
              </div>
            </div>
          </div>
        </nav>
      </div>
    </header>
    <!--final da header-->

    <section class="about_section layout_padding">
      <div class="container">
        <div class="detail-box">
          <div class="heading_container">
            <h2>
              ANIMAIS QUE ATENDEMOS!
            </h2>
          </div>

    </section>

    <section class="animal_section layout_padding">
      <div class="container">
        <div class="animal_container">
          <div class="box b1">
            <div class="img-box">
              <img src="<c:url value="/resources/images/dog.jpg"/>" alt="">
            </div>
            <div class="detail-box">
              <h5>
                Cachorrinhos de pequeno e grande porte
              </h5>
              <p>
                Venha conhecer nossos serviços!
              </p>
            </div>
          </div>
          <div class="box b2">
            <div class="img-box">
              <img src="<c:url value="/resources/images/cavalo.jpg"/>"" alt="">
            </div>
            <div class="detail-box">
              <h5>
                Deixe seu cavalo lindo!
              </h5>
              <p>
                Venha conhecer nossos servicos!
              </p>
            </div>
          </div>
          <div class="box b1">
            <div class="img-box">
              <img src="<c:url value="/resources/images/chinchila.jpg"/>" alt="">
            </div>
            <div class="detail-box">
              <h5>
                Roedores
              </h5>
              <p>
                Temos tratamentos especiais com chinchilas!
              </p>
            </div>
          </div>
          <div class="box b2">
            <div class="img-box">
              <img src="<c:url value="/resources/images/cat.jpg"/>" alt="">
            </div>
            <div class="detail-box">
              <h5>
                Gatinhoos
              </h5>
              <p>
                Venha conhecer nossos servicos!
              </p>
            </div>
          </div>
        </div>
    </section>
    <select class="wide">
      <option data-display="Selecione">SELECIONE</option>
      <option value="1">CACHORRO</option>
      <option value="2">GATO</option>
      <option value="3">ROEDORES</option>
      <option value="4">CAVALO</option>
    </select>
  </div>


  <section class="agendamento d-flex w-100 p-5 row row-cols-1 row-cols-lg-2">

    <form class="col-lg-8" action="php/processar_agendamento.php" method="POST"> 

        <ul id="servicos" class="row row-cols-2 row-cols-lg-2">
          
          
        </ul> 
       

      </form>

      <figure class="col-lg-4">
        <img src="<c:url value="/resources/images/doguinho.png"/>" alt="foto lateral de um cachorro" class="img-fluid ">
      </figure>
   


    </section>


 <section class="info_section ">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-lg-3">
        <div class="info_contact">
          <h5>
            Contato
          </h5>
          <div>
            <img src="<c:url value="/resources/images/call.png"/>" alt="" />
            <p>
              +01 1234567890
            </p>
          </div>
          <div>
            <img src="<c:url value="/resources/images/mail.png"/>" alt="" />
            <p>
              ceduphh@gmail.com
            </p>
          </div>
        </div>
      </div>
      <div class="col-md-6 col-lg-3">
        <div class="info_time">
          <h5>
            Hermann Pet aberto
          </h5>
          <div>
            <p>
            Segunda-feira à Sábado 
            </p>
          </div>
          <div>
            <p>
              07:00h até as 18:00h              
            </p>
          </div>
        </div>
      </div>

      <div class="col-md-6 col-lg-3">
        <div class="info_social">
          <h5>
            Acesse nossas redes sociais:
          </h5>
          <div class="social_container">
            <div>
              <a href="">
                <img src="<c:url value="/resources/images/fb.png"/>" alt="" />
              </a>
            </div>
            <div>
              <a href="">
                <img src="<c:url value="/resources/images/twitter.png"/>" alt="" />
              </a>
            </div>
            <div>
              <a href="">
                <img src="<c:url value="/resources/images/linkedin.png"/>" alt="" />
              </a>
            </div>
            <div>
              <a href="">
                <img src="<c:url value="/resources/images/instagram.png"/>" alt="" />
              </a>
            </div>
          </div>
        </div>
      </div>

      <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <!-- Popper.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.10.2/umd/popper.min.js"></script>
    <!-- Bootstrap JavaScript -->
    <script src="<c:url value="/resources/vendor/bootstrap/css/bootstrap.min.css" />"></script>


    

</body>

</html>