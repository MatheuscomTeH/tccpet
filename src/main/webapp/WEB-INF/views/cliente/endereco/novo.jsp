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
	

	<style>
.container-servicos-center {
	display: flex;
	gap: 20px;
	flex-wrap: wrap;
	padding-left:100px;
}

.info_section {
	background-color: #A6A6A6;
	color: #ffffff;
	padding: 40px 0 75px 0;
	font-family: "Open Sans", sans-serif;
}

.info_section .row>div {
	margin-top: 35px;
}

.info_section h5 {
	text-transform: uppercase;
	margin-bottom: 25px;
}

.info_time p {
	text-transform: uppercase;
}

.info_form input {
	width: 100%;
	border: none;
	height: 40px;
	margin-bottom: 10px;
	padding-left: 25px;
	background-color: #eaeaea;
	outline: none;
	color: #101010;
}

.info_form button {
	width: 100%;
	outline: none;
	border: none;
	color: #fff;
	text-transform: uppercase;
	display: inline-block;
	padding: 4px 45px;
	background-color: #78B8C6;
	color: #A6A6A6;
	-webkit-transition: all 0.3s;
	transition: all 0.3s;
	border: 1px solid #78B8C6;
	border-radius: 0;
}

.info_form button:hover {
	background-color: transparent;
	color: #78B8C6;
}

.info_social .social_container {
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
}

.info_social .social_container a {
	margin: 0 5px;
}

.info_social .social_container a img {
	width: 35px;
}

.info_contact>div {
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	margin: 10px 0;
}

.info_contact>div img {
	height: auto;
	margin-right: 12px;
}

.info_contact>div p {
	margin: 0;
}

/* footer section*/
.footer_section {
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	-ms-flex-direction: column;
	flex-direction: column;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
	background-color: #78B8C6;
}

.footer_section p {
	color: #ffffff;
	margin: 0;
	padding: 25px 0 20px 0;
	margin: 0 auto;
	text-align: center;
}

.footer_section a {
	color: #ffffff;
}
body {
	height: 100vh;
	display: flex;
	flex-direction: column;
}

.centralizar {
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}
</style>
	
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
				<li style="width:100%;border:0;border-radius:0;text-align:left"><a href="lista-endereco"><span style="margin-right:10px" class="icon-notifications mr-3"></span>Meus endereços</a></li>
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
            <form action="adiciona-endereco" method="POST" class="row g-3">
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
 <input name="cliente.id" hidden value="${cliente.id}">
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
  	<c:import url="../components/rodape.jsp" />