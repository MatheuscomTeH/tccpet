<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/bootstrap.css'/>">
<!-- fonte style -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans|Poppins:400,700&display=swap"
	rel="stylesheet">
<!-- css? -->
<link href="<c:url value='/resources/css/style.css'/>" rel="stylesheet">
<!-- responsive style -->
<link href="<c:url value='/resources/css/responsive.css'/>"
	rel="stylesheet">
</head>

<body class="sub_page">
	<div class="hero_area ">
		<!-- header section strats -->
		<header class="header_section">
			<div class="container-fluid">
				<nav class="navbar navbar-expand-lg custom_nav-container">
					<a class="navbar-brand" href="index.html"> <img
						src="<c:url value="/resources/images/logotcc.jpeg"/>" alt="">
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

	<!-- login-->

	<section class="login_section">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-5 offset-md-1">
					<div class="form_container">
						<div class="heading_container">

							<h2>Efetue seu login:</h2>
							<p>
								   <c:if test="${not empty usuarioInvalido}">
                                    <div class="alert alert-dismissible alert-primary">
                                           O usuário inválido. Por favor, tente novamente.
                                     </div>
                               </c:if>
        										

							</p>
						</div>
						<!--*configuraram o banco?.matheus-->
						<form action="login" method="POST">
							<div>
								<input type="email" name="email" placeholder="E-mail" value='${usuarioInvalido}'  required />
							</div>
							<div>
								<input type="password" name="senha" placeholder="senha" required />
							</div>
							<button type="submit">Login</button>
							</a>
					</div>
					</form>
				</div>
			</div>
		</div>
		</form>
		</div>
		</div>

		</div>
		</div>
	</section>

	<!-- final do login -->


	<!-- informações ein galerinha -->
	<section class="info_section ">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-3">
					<div class="info_contact">
						<h5>CONTACT INFO</h5>
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
								<a href=""> <img src="<c:url value="/resources/images/fb.png"/>" alt="" />
								</a>
							</div>
							<div>
								<a href=""> <img src="<c:url value="/resources/images/twitter.png"/>" alt="" />
								</a>
							</div>
							<div>
								<a href=""> <img src="<c:url value="/resources/images/linkedin.png"/>" alt="" />
								</a>
							</div>
							<div>
								<a href=""> <img src="<c:url value="/resources/images/instagram.png"/>" alt="" />
								</a>
							</div>
						</div>
					</div>
				</div>

				<!-- final das informações -->

				<script type="text/javascript"
					src="<c:url value="/resources/js/jquery-3.4.1.min.js"/>"></script>
				<script type="text/javascript"
					src="<c:url value="/resources/js/bootstrap.js"/>"></script>
				<script>
					function openNav() {
						document.getElementById("myNav").classList
								.toggle("menu_width")
						document.querySelector(".custom_menu-btn").classList
								.toggle("menu_btn-style")
					}
				</script>
</body>
