<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
<!-- Basic -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- Site Metas -->
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>Pet Hermann</title>

<!-- Other head elements -->

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="<c:url value='resources/css/bootstrap.css'/>">

    <!-- Other stylesheets -->
    <link href="<c:url value='/resources/css/style.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/css/responsive.css'/>" rel="stylesheet">

    <!-- Bootstrap and other scripts -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="<c:url value='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css'/>">
</head>

<body class="sub_page">
	<div class="hero_area ">
		<!-- header section strats -->
		<header class="header_section">
			<div class="container-fluid">
				<nav class="navbar navbar-expand-lg custom_nav-container">
					<a class="navbar-brand" href="index.html">
					 <img	src="resources/images/logotcc.jpeg" alt="">
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
								<span class="s-1"> </span> <span class="s-2"> </span> <span
									class="s-3"> </span>
							</button>
						</div>
						<div id="myNav" class="overlay">
							<div class="overlay-content">
								<a href="index.html">Página Inicial</a> <a href="about.html">Sobre
									nós</a> <a href="login.html">Login</a> <a href="contact.html">Cadastro</a>

							</div>
						</div>
					</div>
				</nav>
			</div>
		</header>
		<!-- final header-->
	</div>

	<!-- cadastro -->

	<section class="contact_section layout_padding-top">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-5 offset-md-1">
					<div class="form_container">
						<div class="heading_container">
							<h2>Preencha os dados abaixo:</h2>
							<p>Acesso seguro e garantido!</p>
						</div>

						<!-- Seu formulário -->


						<!-- Seu formulário -->
						<form action="adiciona" method="POST"
							id="formCadastro">
							<div>
								<input type="text" name="username" placeholder="Digite seu nome"
									maxlength="45" required />
							</div>
							<div>
								<input type="tel" name="telefone"
									placeholder="Número para contato" pattern="[0-9]+"
									title="Somente números são permitidos" maxlength="11" required />
							</div>
							<div>
								<input type="email" name="email" placeholder="Email"
									maxlength="50" required />
							</div>
							
							<div>
								<div class="input-group">
									<input type="password" name="password" id="senha"
										placeholder="Crie sua senha" required /> <i
										class="bi bi-eye-fill"></i>

								</div>
							</div>

							<div class="btn-box">
								<button type="submit">Cadastrar</button>
							</div>
						</form>

						<script>
							function mostrarSenha() {
								var senhaInput = document
										.getElementById("senha");
								if (senhaInput.type === "password") {
									senhaInput.type = "text";
								} else {
									senhaInput.type = "password";
								}
							}
						</script>

					</div>
				</div>
				<div class="col-md-6 px-0">
					<div class="map_container">
						<div class="map-responsive">
							<iframe
								src="https://www.google.com/maps/embed/v1/place?key=AIzaSyA0s1a7phLN0iaD6-UE7m4qP-z21pH0eSc&q=Eiffel+Tower+Paris+France"
								width="600" height="300" frameborder="0"
								style="border: 0; width: 100%; height: 100%" allowfullscreen></iframe>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- final do cadastro -->


	<!-- informações ein galerinha -->
	<section class="info_section ">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-3">
					<div class="info_contact">
						<h5>Contato</h5>
						<div>
							<img src="<c:url value="/resources/images/call.png"/>" >
							<p>+01 1234567890</p>
						</div>
						<div>
							<img src="<c:url value="/resources/images/mail.png"/>" >
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
								<a href=""> <img src="resources/images/fb.png" alt="" />
								</a>
							</div>
							<div>
								<a href=""> <img src="/resources/images/twitter.png" alt="" />
								</a>
							</div>
							<div>
								<a href=""> <img src="/resources/images/linkedin.png" alt="" />
								</a>
							</div>
							<div>
								<a href=""> <img src="/resources/images/instagram.png" alt="" />
								</a>
							</div>
						</div>
					</div>
				</div>

				<!-- final das informações -->

				       <script type="text/javascript" src="<c:url value="/resources/js/jquery-3.4.1.min.js"/>"></script>
						<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.js"/>"></script>
				<script>
					function openNav() {
						document.getElementById("myNav").classList
								.toggle("menu_width")
						document.querySelector(".custom_menu-btn").classList
								.toggle("menu_btn-style")
					}
				</script>
</body>

</html>
