<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Editar Animal</title>
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
					href="#"><span style="margin-right: 10px"
						class="icon-notifications mr-3"></span>Notifications</a></li>
				<li
					style="width: 100%; border: 0; border-radius: 0; text-align: left"><a
					href="#"><span style="margin-right: 10px"
						class="icon-location-arrow mr-3"></span>Direct</a></li>
				<li
					style="width: 100%; border: 0; border-radius: 0; text-align: left"><a
					href="#"><span style="margin-right: 10px"
						class="icon-pie-chart mr-3"></span>Stats</a></li>
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
		<h1 class="display-5 fw-bold">Editar Animal</h1>
		<p class="col-md-12 fs-4">Preencha o formulário abaixo para editar
			o Animal no sistema.</p>
	</div>
</div>


<main>
	<div class="container">
		<form action="altera-animal" method="POST" class="row g-3">

			<security:csrfInput />
			
			<input hidden name="id" value="${animal.id}">

			<!-- NOME -->
			<div class="form-group">
				<label for="nome" class="col-form-label"></label> <input value="${animal.nome}"
					type="text" class="form-control" name="nome" autofocus
					MAXLENGTH="255" required>
			</div>

			<div class="form-group">
				<label for="tipo">Tipo:</label> <select class="form-control"
					name="tipo">
					<option value="cachorro"
						${animal.tipo.equalsIgnoreCase("cachorro") ? 'selected' : ''}>Cachorro</option>
					<option value="gato"
						${animal.tipo.equalsIgnoreCase("gato") ? 'selected' : ''}>Gato</option>
					<option value="cavalo"
						${animal.tipo.equalsIgnoreCase("cavalo") ? 'selected' : ''}>Cavalo</option>
					<option value="roedores"
						${animal.tipo.equalsIgnoreCase("roedores") ? 'selected' : ''}>Roedores</option>
				</select>
			</div>


			<div class="form-group">
				<label for="idade" class="col-form-label"></label> <input
					type="number" value="${animal.idade}" class="form-control" name="idade" 
				 required>
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