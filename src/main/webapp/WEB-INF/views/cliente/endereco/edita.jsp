<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Editar Endereço</title>
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
			<img src="<c:url value="/resources/images/images.png"/>" alt="Image"
				class="img-fluid">
			<h3 class="name">${cliente.username}</h3>
		</div>


		<div class="nav-menu">
			<ul style="display: flex; flex-direction: column">

				<li
					style="width: 100%; border: 0; border-radius: 0; text-align: left"><a
					href="<c:url value="index"/>"><span style="margin-right: 10px"
						class="icon-calendar mr-3"></span>Agendamento</a></li>
				<li
					style="width: 100%; border: 0; border-radius: 0; text-align: left"><a
					href="<c:url value="lista-animal"/>"><i
						style="margin-right: 10px" class="bi bi-github"></i>Meus pets</a></li>
				<li
					style="width: 100%; border: 0; border-radius: 0; text-align: left"><a
					href="lista-endereco"><span style="margin-right: 10px"
						class="icon-notifications mr-3"></span>Meus endereços</a></li>
				<li
					style="width: 100%; border: 0; border-radius: 0; text-align: left"><a
					href="<c:url value="lista-agendamento"/>"><span style="margin-right:10px" class="icon-calendar mr-3"></span>>Meus
						Agendamentos</a></li>
				<li
					style="width: 100%; border: 0; border-radius: 0; text-align: left"><a
					href="<c:url value="/logout"/>"><span
						style="margin-right: 10px" class="icon-sign-out mr-3"></span>Sign
						out</a></li>
			</ul>
		</div>
	</div>

</aside>
<div class="p-5 mb-4 bg-light rounded-3">

	<div class="container py-5">
		<h1 class="display-5 fw-bold">Editar Endereço</h1>
		<p class="col-md-12 fs-4">Preencha o formulário abaixo para editar
			o Endereço no sistema.</p>
	</div>
</div>

<main>
	<div class="container">
		<form action="altera-endereco" method="POST" class="row g-3">

			<security:csrfInput />

			<input hidden name="id" value="${endereco.id}">

			<!-- RUA -->
			<div class="form-group">
				<label for="rua" class="col-form-label">Rua</label> <input
					value="${endereco.rua}" type="text" class="form-control" name="rua"
					autofocus MAXLENGTH="255" required>
			</div>

			<!-- NÚMERO -->
			<div class="form-group">
				<label for="numero" class="col-form-label">Número</label> <input
					value="${endereco.numero}" type="text" class="form-control"
					name="numero" required>
			</div>

			<!-- BAIRRO -->
			<div class="container mt-5">
				<label for="bairro" class="form-label">Selecione o Bairro:</label> <select
					class="form-select" id="bairro" name="bairro">
					<option value="Água Verde">Água Verde</option>
					<option value="Badenfurt">Badenfurt</option>
					<option value="Bom Retiro">Bom Retiro</option>
					<option value="Boa Vista">Boa Vista</option>
					<option value="Centro">Centro</option>
					<option value="Da Glória">Da Glória</option>
					<option value="Do Salto">Do Salto</option>
					<option value="Escola Agrícola">Escola Agrícola</option>
					<option value="Fidélis">Fidélis</option>
					<option value="Fortaleza">Fortaleza</option>
					<option value="Fortaleza Alta">Fortaleza Alta</option>
					<option value="Garcia">Garcia</option>
					<option value="Itoupava Central">Itoupava Central</option>
					<option value="Itoupava Norte">Itoupava Norte</option>
					<option value="Itoupava Seca">Itoupava Seca</option>
					<option value="Itoupavazinha">Itoupavazinha</option>
					<option value="Jardim Blumenau">Jardim Blumenau</option>
					<option value="Nova Esperança">Nova Esperança</option>
					<option value="Passo Manso">Passo Manso</option>
					<option value="Ponta Aguda">Ponta Aguda</option>
					<option value="Progresso">Progresso</option>
					<option value="Ribeirão Fresco">Ribeirão Fresco</option>
					<option value="Salto do Norte">Salto do Norte</option>
					<option value="Salto Weissbach">Salto Weissbach</option>
					<option value="Testo Salto">Testo Salto</option>
					<option value="Tribess">Tribess</option>
					<option value="Valparaíso">Valparaíso</option>
					<option value="Velha">Velha</option>
					<option value="Velha Central">Velha Central</option>
					<option value="Velha Grande">Velha Grande</option>
					<option value="Victor Konder">Victor Konder</option>
					<option value="Vila Formosa">Vila Formosa</option>
					<option value="Vila Itoupava">Vila Itoupava</option>
					<option value="Vila Nova">Vila Nova</option>
					<option value="Vorstadt">Vorstadt</option>
				</select>
			</div>

			<div class="text-center">
				<button type="submit" class="btn btn-primary btn-lg">
					<i class="bi bi-plus-circle"></i> Alterar
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
					<h5>Contato</h5>
					<div>
						<img src="<c:url value="/resources/images/call.png"/>" alt="" />
						<p>+01 1234567890</p>
					</div>
					<div>
						<img src="<c:url value="/resources/images/mail.png"/>" alt="" />
						<p>ceduphh@gmail.com</p>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-lg-3">
				<div class="info_time">
					<h5>Hermann Pet aberto</h5>
					<div>
						<p>Segunda-feira à Sábado</p>
					</div>
					<div>
						<p>07:00h até as 18:00h</p>
					</div>
				</div>
			</div>

			<div class="col-md-6 col-lg-3">
				<div class="info_social">
					<h5>Acesse nossas redes sociais:</h5>
					<div class="social_container">
						<div>
							<a href=""> <img
								src="<c:url value="/resources/images/fb.png"/>" alt="" />
							</a>
						</div>
						<div>
							<a href=""> <img
								src="<c:url value="/resources/images/twitter.png"/>" alt="" />
							</a>
						</div>
						<div>
							<a href=""> <img
								src="<c:url value="/resources/images/linkedin.png"/>" alt="" />
							</a>
						</div>
						<div>
							<a href=""> <img
								src="<c:url value="/resources/images/instagram.png"/>" alt="" />
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script src="<c:url value="/resources/js/jquery-3.4.1.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/bootstrap.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/popper.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/main.js" />"></script>



</body>

</html>