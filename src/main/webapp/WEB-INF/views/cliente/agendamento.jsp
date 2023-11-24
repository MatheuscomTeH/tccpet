<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
  <!-- Basico -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <title>Hermann Pets</title>

  <!-- bootstrap coresssss css -->
	<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/bootstrap.css'/>">

  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans|Poppins:400,700&display=swap" rel="stylesheet">
  <!-- css-->
<link href="<c:url value='/resources/css/style.css'/>" rel="stylesheet">
  <!-- responsive style -->
<link href="<c:url value='/resources/css/responsive.css'/>"
	rel="stylesheet">

  <script src="code.agendamentojava.js" defer></script>
</head>

<body>


  <div class="hero_area ">
    <!-- header -->
    <header class="header_section">
      <div class="container-fluid">
        <nav class="navbar navbar-expand-lg custom_nav-container">
          <a class="navbar-brand" href="index.html">
            <img src="images/logotcc.jpeg" alt="">
          </a>
          <div class="" id="">
            <div class="User_option">
              <form class="form-inline my-2  mb-3 mb-lg-0">
                <input type="search" placeholder="Search">
                <button class="btn   my-sm-0 nav_search-btn" type="submit"></button>
              </form>
            </div>

            <div class="custom_menu-btn">
              <button onclick="openNav()">
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
              <img src="images/dog.jpg" alt="">
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
              <img src="images/cavalo.jpg" alt="">
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
              <img src="images/chinchila.jpg" alt="">
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
              <img src="images/cat.jpg" alt="">
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
  </div>
  </div>
  <section class="agendamentoo">
    <form action="processar_agendamento.php" method="POST"> <!-- Início do formulário -->
      <ul id="servicos">
          <li>
              <h2>Banho</h2>
              <p>Deixe o seu pet limpo e cheiroso com o nosso serviço de banho profissional.</p>
              <div class="container">
                <!-- POPUP-->
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#banho">
                  Agendar
                </button>
                <div class="modal fade" id="banho">
                  <div class="modal-dialog modal-xl">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h4 class="modal-title">Confirmar agendamento</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                      </div>                  
                      <div class="modal-body">
                        <div>
                        Serviço de leva e trás por + R$12
                      </div>  
                      <input type="checkbox" id="flagCheckbox" name="flagg" value="checked">
                      <div class="flag">
                        <input type="text" name="ani" placeholder="Digite o nome de seu bichinho" required/>
                      <input type="text" name="endereço" placeholder="Digite seu endereço">              
                    </div> 
                    <input type="date" id="diaa_banho" name="diaa_banho" />
                      </div>
                      
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                        <button type="submit" name="servico" value="banho">Agendar Banho</button>     
          </li>

          <li>
              <h2>Tosa</h2>
              <p>Cuide da saúde do seu animal de estimação nesse calor com nossa tosa especializada.</p>
              <!-- POPUP-->
              <div class="container">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#tosa">
                  Agendar
                </button>
                <div class="modal fade" id="tosa">
                  <div class="modal-dialog modal-xl">
                    <div class="modal-content">     
                      <div class="modal-header">
                        <h4 class="modal-title">Confirmar agendamento</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                      </div>
                      <div class="modal-body">
                        Serviço de leva e trás por + R$12
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
              <input type="date" id="diaa_tosa" name="diaa_tosa" />
              <button type="submit" name="servico" value="tosa">Agendar Tosa</button>
          </li>

          <img src="images/doguinho.png" alt="fotolateralcachorro"class="imagem-lateral">
          <li>
              <h2>Passeios Diários</h2>
              <p>Mantenha o seu cão ativo e feliz com os nossos passeios diários pelo parque.</p>
              <!-- POPUP-->
              <div class="container">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#passeio">
                  Agendar
                </button>
                <div class="modal fade" id="passeio">
                  <div class="modal-dialog modal-xl">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h4 class="modal-title">Confirmar agendamento</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                      </div>
                      <div class="modal-body">
                        Serviço de leva e trás por + R$12
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
              <!--Confirmar Agendamento-->
              <input type="date" id="diaa_passeios" name="diaa_passeios" />
              <button type="submit" name="servico" value="passeios">Agendar Passeios</button>
          </li>
          <li>
              <h2>Adoção de Animais</h2>
              <p>Encontre um novo amigo para a vida, visite nosso abrigo e adote um animal de estimação.</p>
              
<div class="container">
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#adocao">
    Agendar
  </button>
  <div class="modal fade" id="adocao">
    <div class="modal-dialog modal-xl">
      <div class="modal-content"> 
        <div class="modal-header">
          <h4 class="modal-title">Confirmar agendamento</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          Serviço de leva e trás por + R$12
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
          <!--Confirmar-->
              <input type="date" id="diaa_adocao" name="diaa_adocao" />
              <button type="submit" name="servico" value="adocao">Agendar Adoção</button>

          </li>

          <li>
            <h2>Treinamento Comportamental</h2>
            <p>Ajude o seu pet a se comportar melhor com nosso  treinamento.</p>

            <!-- POPUP-->
            <div class="container">
              <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#treinamento">
                Agendar
              </button>
              <div class="modal fade" id="treinamento">
                <div class="modal-dialog modal-xl">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h4 class="modal-title">Confirmar agendamento</h4>
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>              
                    <div class="modal-body">
                      Serviço de leva e trás por + R$12
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>  
                      <!--Confirmar agendamento-->      
            <input type="date" id="diaa_treinamento" name="diaa_treinamento" />
            <button type="submit" name="servico" value="treinamento">Agendar Treinamento</button>
          </div>
        </div>
        <li>
          <h2>Hospedagem</h2>
          <p>Precisa viajar? Nós tomamos conta de seu pet até em finais de semana
              .</p>
          <!-- POPUP-->
          <div class="container">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#hotel">
              Agendar
            </button>
            <div class="modal fade" id="">
              <div class="modal-dialog modal-xl">
                <div class="modal-content">
                  <div class="modal-header">
                    <h4 class="modal-title">Confirmar agendamento</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                  </div>              
                  <div class="modal-body">
                    Serviço de leva e trás por + R$12
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>  
                     
                    <!--Confirmar agendamento-->      
          <input type="date" id="diaa_ida_hospedagem" name="diaa_ida_hospedagem" />
          <input type="date" id="diaa_volta_hospedagem" name="diaa_volta_hospedagem" />
          <button type="submit" name="servico" value="hospedagem">Agendar Hospedagem</button>
        </div>
      </div>

      </section>

 <!-- informacoes de sempre -->
 <section class="info_section ">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-lg-3">
        <div class="info_contact">
          <h5>
            Contato
          </h5>
          <div>
            <img src="<c:url value="/resources/images/call.png"/>"alt="" />
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
                <img  src="<c:url value="/resources/images/fb.png"/>" alt="" />
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

								<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.4.1.min.js"/>"></script>
						<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.js"/>"></script>
<script>
  function openNav() {
    document.getElementById("myNav").classList.toggle("menu_width")
    document.querySelector(".custom_menu-btn").classList.toggle("menu_btn-style")
  }
</script>

</body>

</html>