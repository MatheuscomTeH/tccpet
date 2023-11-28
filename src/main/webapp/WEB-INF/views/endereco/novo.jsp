<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
   <title>Cadastrar Endereço</title>
<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css" />">
	
	<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/vendor/bootstrap/css/bootstrap-icons.css" />">

<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/vendor/bootstrap-icons/bootstrap-icons.min.css" />">
<!-- fonts style -->
<link type="text/css"
	href="<c:url value="https://fonts.googleapis.com/css?family=Open+Sans|Poppins:400,700&display=swap"/>"
	rel="stylesheet">



<link type="text/css" href="<c:url value="/resources/css/estilo.css"/>"
	rel="stylesheet" />


<link type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap"
	rel="stylesheet">

<link type="text/css"
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap"
	rel="stylesheet">

<link type="text/css"
	href="https://fonts.googleapis.com/css?family=Source+Serif+Pro:400,600&display=swap"
	rel="stylesheet">

<link type="text/css" rel="stylesheet"
	href="<c:url value="/resources/icomoon/style.css"/>">

<link type="text/css" rel="stylesheet"
	href="<c:url value="/resources/css/owl.carousel.min.css"/>">
</head>
   <aside class="sidebar">
	<div class="toggle">
		<a href="#" class="burger js-menu-toggle" data-toggle="collapse"
			data-target="#main-navbar"> <span></span>
		</a>
	</div>
	<div class="side-inner">

		<div class="profile">
			<img src="<c:url value="/resources/images/images.png"/>" alt="Image" class="img-fluid">
			<h3 class="name">${cliente.username}</h3>
		</div>


		<div class="nav-menu">
			<ul style="display:flex;flex-direction:column">
			
				<li style="width:100%;border:0;border-radius:0;text-align:left"><a href="<c:url value="index"/>"><span style="margin-right:10px" class="icon-calendar mr-3"></span>Agendamento</a></li>
				<li style="width:100%;border:0;border-radius:0;text-align:left"><a href="<c:url value="lista-animal"/>"><i style="margin-right:10px" class="bi bi-github"></i>Meus pets</a></li>
				<li style="width:100%;border:0;border-radius:0;text-align:left"><a href="#"><span style="margin-right:10px" class="icon-notifications mr-3"></span>Notifications</a></li>
				<li style="width:100%;border:0;border-radius:0;text-align:left"><a href="#"><span style="margin-right:10px" class="icon-location-arrow mr-3"></span>Direct</a></li>
				<li style="width:100%;border:0;border-radius:0;text-align:left"><a href="#"><span style="margin-right:10px" class="icon-pie-chart mr-3"></span>Stats</a></li>
				<li style="width:100%;border:0;border-radius:0;text-align:left"><a href="<c:url value="/logout"/>"><span style="margin-right:10px" class="icon-sign-out mr-3"></span>Sign
						out</a></li>
			</ul>
		</div>
	</div>

</aside>
    <div class="p-5 mb-4 bg-light rounded-3">
    <div class="container py-5">
        <h1 class="display-5 fw-bold">Cadastrar Endereço</h1>
        <p class="col-md-12 fs-4">Preencha o formulário abaixo para
            realizar o cadastro do endereço no sistema.</p>
    </div>
</div>

    <main>
        <div class="container">
            <form action="adiciona-animal" method="POST" class="row g-3">
                <security:csrfInput />
                <!-- ... (seus campos existentes) ... -->
                <!-- Novos campos para endereço -->
                <div class="form-group">
                    <label for="rua" class="col-form-label">Rua</label>
                    <input type="text" class="form-control" name="rua" required>
                </div>
                <div class="form-group">
                    <label for="numero" class="col-form-label">Número</label>
                    <input type="text" class="form-control" name="numero" required>
                </div>
                <!-- BAIRRO -->
<div class="form-group">
    <label for="bairro" class="form-label">Selecione o Bairro:</label>
    <select class="form-select" id="bairro" name="bairro">
        <option value="Água Verde" ${endereco.bairro == 'Água Verde' ? 'selected' : ''}>Água Verde</option>
        <option value="Badenfurt" ${endereco.bairro == 'Badenfurt' ? 'selected' : ''}>Badenfurt</option>
        <option value="Bom Retiro" ${endereco.bairro == 'Bom Retiro' ? 'selected' : ''}>Bom Retiro</option>
        <option value="Boa Vista" ${endereco.bairro == 'Boa Vista' ? 'selected' : ''}>Boa Vista</option>
        <option value="Centro" ${endereco.bairro == 'Centro' ? 'selected' : ''}>Centro</option>
        <option value="Da Glória" ${endereco.bairro == 'Da Glória' ? 'selected' : ''}>Da Glória</option>
        <option value="Do Salto" ${endereco.bairro == 'Do Salto' ? 'selected' : ''}>Do Salto</option>
        <option value="Escola Agrícola" ${endereco.bairro == 'Escola Agrícola' ? 'selected' : ''}>Escola Agrícola</option>
        <option value="Fidélis" ${endereco.bairro == 'Fidélis' ? 'selected' : ''}>Fidélis</option>
        <option value="Fortaleza" ${endereco.bairro == 'Fortaleza' ? 'selected' : ''}>Fortaleza</option>
        <option value="Fortaleza Alta" ${endereco.bairro == 'Fortaleza Alta' ? 'selected' : ''}>Fortaleza Alta</option>
        <option value="Garcia" ${endereco.bairro == 'Garcia' ? 'selected' : ''}>Garcia</option>
        <option value="Itoupava Central" ${endereco.bairro == 'Itoupava Central' ? 'selected' : ''}>Itoupava Central</option>
        <option value="Itoupava Norte" ${endereco.bairro == 'Itoupava Norte' ? 'selected' : ''}>Itoupava Norte</option>
        <option value="Itoupava Seca" ${endereco.bairro == 'Itoupava Seca' ? 'selected' : ''}>Itoupava Seca</option>
        <option value="Itoupavazinha" ${endereco.bairro == 'Itoupavazinha' ? 'selected' : ''}>Itoupavazinha</option>
        <option value="Jardim Blumenau" ${endereco.bairro == 'Jardim Blumenau' ? 'selected' : ''}>Jardim Blumenau</option>
        <option value="Nova Esperança" ${endereco.bairro == 'Nova Esperança' ? 'selected' : ''}>Nova Esperança</option>
        <option value="Passo Manso" ${endereco.bairro == 'Passo Manso' ? 'selected' : ''}>Passo Manso</option>
        <option value="Ponta Aguda" ${endereco.bairro == 'Ponta Aguda' ? 'selected' : ''}>Ponta Aguda</option>
        <option value="Progresso" ${endereco.bairro == 'Progresso' ? 'selected' : ''}>Progresso</option>
        <option value="Ribeirão Fresco" ${endereco.bairro == 'Ribeirão Fresco' ? 'selected' : ''}>Ribeirão Fresco</option>
        <option value="Salto do Norte" ${endereco.bairro == 'Salto do Norte' ? 'selected' : ''}>Salto do Norte</option>
        <option value="Salto Weissbach" ${endereco.bairro == 'Salto Weissbach' ? 'selected' : ''}>Salto Weissbach</option>
        <option value="Testo Salto" ${endereco.bairro == 'Testo Salto' ? 'selected' : ''}>Testo Salto</option>
        <option value="Tribess" ${endereco.bairro == 'Tribess' ? 'selected' : ''}>Tribess</option>
        <option value="Valparaíso" ${endereco.bairro == 'Valparaíso' ? 'selected' : ''}>Valparaíso</option>
        <option value="Velha" ${endereco.bairro == 'Velha' ? 'selected' : ''}>Velha</option>
        <option value="Velha Central" ${endereco.bairro == 'Velha Central' ? 'selected' : ''}>Velha Central</option>
        <option value="Velha Grande" ${endereco.bairro == 'Velha Grande' ? 'selected' : ''}>Velha Grande</option>
        <option value="Victor Konder" ${endereco.bairro == 'Victor Konder' ? 'selected' : ''}>Victor Konder</option>
        <option value="Vila Formosa" ${endereco.bairro == 'Vila Formosa' ? 'selected' : ''}>Vila Formosa</option>
        <option value="Vila Itoupava" ${endereco.bairro == 'Vila Itoupava' ? 'selected' : ''}>Vila Itoupava</option>
        <option value="Vila Nova" ${endereco.bairro == 'Vila Nova' ? 'selected' : ''}>Vila Nova</option>
        <option value="Vorstadt" ${endereco.bairro == 'Vorstadt' ? 'selected' : ''}>Vorstadt</option>
    </select>
</div>

                <div class="text-center">
                    <button type="submit" class="btn btn-primary btn-lg">
                        <i class="bi bi-plus-circle"></i> Cadastrar
                    </button>
                    <button type="reset" class="btn btn-secondary btn-lg">
                        <i class="bi bi-trash"></i> Limpar
                    </button>
                </div>
            </form>
        </div>
    </main>
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
      </div>
      </div>
	</section >
	   <script src="<c:url value="/resources/js/jquery-3.4.1.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/bootstrap.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/popper.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/main.js" />"></script>

    

</body>

</html>
