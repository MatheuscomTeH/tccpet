<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<!-- Basico -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- Site Metas -->
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>Hermann Pets</title>

<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/bootstrap.css" />">

<!-- fonts style -->
<link
	href="<c:url value="https://fonts.googleapis.com/css?family=Open+Sans|Poppins:400,700&display=swap"/>"
	rel="stylesheet">

<!-- css-->
<link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet" />
<!-- responsive style -->
<link href="<c:url value="/resources/css/responsive.css"/>"
	rel="stylesheet" />
</head>

<body>
	<div class="hero_area ">
		<!-- header -->
		<header class="header_section">
			<div class="container-fluid">
				<nav class="navbar navbar-expand-lg custom_nav-container">
					<a class="navbar-brand" href="index.html"> <img
						src="images/logotcc.jpeg" alt="">
					</a>
					<div class="" id="">
						<div class="User_option">
							<form class="form-inline my-2  mb-3 mb-lg-0">
								<input type="search" placeholder="Search">
								<button class="btn   my-sm-0 nav_search-btn" type="submit"></button>
							</form>
						</div>
						<style>
									.custom_menu-btn button .s-1, .custom_menu-btn button .s-2,
								.custom_menu-btn button .s-3 {
										background-color: #78B8C6; /* Define a cor das linhas do bot�o */
						}
							</style>

						<div class="custom_menu-btn">
							<button onclick="openNav()">
								<span class="s-1"></span> <span class="s-2"></span> <span
									class="s-3"></span>
							</button>
						</div>


						<div id="myNav" class="overlay">
							<div class="overlay-content">
								<a href="index.html">P�gina Inicial</a> <a href="about.html">Sobre
									n�s</a> <a href="cliente/formLogin">Login</a> <a href="contact.html">Cadastro</a>
							</div>
						</div>
					</div>
				</nav>
			</div>
		</header>
		<!-- final da header -->
		<!-- tela de passar pro lado (slide?) -->
		<section class="slider_section">
			<div id="carouselExampleIndicators" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>

				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-5 offset-md-1">
									<div class="detail-box">
										<div class="number">
											<h5>01</h5>
										</div>
										<h1>
											Hermann Pets <br> <span> Fa�a seu animalzinho
												feliz! </span>
										</h1>
										<p>Amor, cuidado e patinhas!</p>
										<div class="btn-box">
											<a href="cliente/formLogin" class="btn-1"> Fa�a Login </a> <a
												href="<c:url value="cliente/novo"/>" class="btn-2">
												Cadastro </a>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="img-box">
										<img src="resources/images/capatcc.png" alt="">


									</div>
								</div>
							</div>
						</div>
					</div>
					<!--slide 2-->
					<div class="carousel-item">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-5 offset-md-1">
									<div class="detail-box">
										<div class="number">
											<h5>02</h5>
										</div>
										<h1>
											Hermann Pets <br> <span> Entre como funcion�rio!
											</span>
										</h1>
										<p>Amor, cuidado e patinhas!</p>
										<div class="btn-box">
											<a href="contact.html" class="btn-1"> Cadastrar cliente </a>
											<a href="loginfuncionario.html" class="btn-2">
												Funcion�rio </a>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="img-box">
										<img src="resources/images/capatcc.png" alt="">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</section>
		<!-- final da telinha de slides -->
	</div>


	<!-- tela sobre a gente e tal -->

	<section class="about_section layout_padding">
		<div class="container">
			<div class="detail-box">
				<div class="heading_container">
					<img src="resources/images/heading-img.png" alt="">
					<h2>Sobre n�s</h2>
				</div>
				<p>Aqui na Herman Pets, acreditamos que animais de estima��o s�o
					mais do que simples companheiros - s�o membros queridos de nossas
					fam�lias. Nossa jornada come�ou com a paix�o por criar um espa�o
					acolhedor e dedicado aos nossos amigos de quatro patas. Nossa
					miss�o � oferecer produtos e servi�os de alta qualidade, atendendo
					�s necessidades individuais de cada animal, enquanto oferecemos
					orienta��o especializada aos seus humanos.</p>
				<P>Nossa equipe � formada por amantes de animais apaixonados,
					comprometidos em garantir o bem-estar e a felicidade de todos os
					pets que cruzam nosso caminho. Valorizamos a �tica, o respeito e a
					dedica��o aos nossos amigos peludos, comprometendo-nos a
					proporcionar um ambiente seguro, saud�vel e divertido para eles.</P>
				</a>
			</div>
		</div>
		</div>
	</section>
	<!-- final da pagina sobre nos-->
	<!-- pet section -->

	<section class="pet_section layout_padding">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="img-box">
						<img src="resources/images/gatocachorro.webp" alt="">
					</div>
				</div>
				<div class="col-md-6">
					<div class="detail-box">
						<div class="heading_container">
							<h2>Cuidando do seu amiguinho!</h2>
						</div>
						<p>Em Nosso Mundo Pet, voc� encontrar� uma ampla gama de
							produtos cuidadosamente selecionados, desde alimentos premium at�
							acess�rios especiais, garantindo que cada animal receba os
							melhores cuidados poss�veis.</p>
						<p>
							Junte-se a n�s nessa jornada de amor e dedica��o aos animais de
							estima��o. Estamos aqui para celebrar, cuidar e nutrir os la�os
							especiais que compartilhamos com nossos amigos peludos. Venha nos
							visitar e fa�a parte da nossa fam�lia! <img
								src="resources/images/link-arrow.png" alt=""> </a>
					</div>
				</div>
			</div>
		</div>
		</div>
	</section>

	<!-- end pet section -->

	<!-- animais que atendemos!!-->
	<section class="animal_section layout_padding">
		<div class="container">
			<div class="animal_container">
				<div class="box b1">
					<div class="img-box">
						<img src="resources/images/dog.jpg" alt="">
					</div>
					<div class="detail-box">
						<h5>Cachorrinhos de pequeno e grande porte</h5>
						<p>Venha conhecer nossos servi�os!</p>
					</div>
				</div>
				<div class="box b2">
					<div class="img-box">
						<img src="resources/images/cavalo.jpg" alt="">
					</div>
					<div class="detail-box">
						<h5>Deixe seu cavalo lindo!</h5>
						<p>Venha conhecer nossos servicos!</p>
					</div>
				</div>
				<div class="box b1">
					<div class="img-box">
						<img src="resources/images/chinchila.jpg" alt="">
					</div>
					<div class="detail-box">
						<h5>Roedores</h5>
						<p>Temos tratamentos especiais com chinchilas!</p>
					</div>
				</div>
				<div class="box b2">
					<div class="img-box">
						<img src="resources/images/cat.jpg" alt="">
					</div>
					<div class="detail-box">
						<h5>Gatinhoos</h5>
						<p>Venha conhecer nossos servicos!</p>
					</div>
				</div>
			</div>
	</section>
	</div>
	</div>
	<!-- end animal section -->
	<div class="container-fluid p-5 mx-auto">
		<div class="mb-5 text-center">
			<h2 class="text-primary text-uppercase">Nossa Equipe</h2>
		</div>

		<div class="row g-5 justify-content-center">
			<!-- Primeiro bloco -->
			<div class="col-md-6 col-lg-4">
				<div class="blog-item">
					<div class="position-relative overflow-hidden rounded-top">
						<img class="img-fluid"
							src="caminho_para_sua_imagem/matheus_small.jpeg" alt="">
					</div>
					<div class="bg-dark d-flex align-items-center rounded-bottom p-4">
						<div
							class="flex-shrink-0 text-center text-secondary border-end border-secondary pe-3 me-3">
							<span>01</span>
							<h6 class="text-light text-uppercase mb-0">January</h6>
							<span>2045</span>
						</div>
						<a class="h5 text-uppercase text-light" href="#">Sed amet
							tempor amet sit kasd sea lorem</a>
					</div>
				</div>
			</div>
			<!-- Fim do primeiro bloco -->

			<!-- Segundo bloco -->
			<div class="col-md-6 col-lg-4">
				<div class="blog-item">
					<div class="position-relative overflow-hidden rounded-top">
						<img class="img-fluid"
							src="caminho_para_sua_imagem/matheus_small.jpeg" alt="">
					</div>
					<div class="bg-dark d-flex align-items-center rounded-bottom p-4">
						<div
							class="flex-shrink-0 text-center text-secondary border-end border-secondary pe-3 me-3">
							<span>01</span>
							<h6 class="text-light text-uppercase mb-0">January</h6>
							<span>2045</span>
						</div>
						<a class="h5 text-uppercase text-light" href="#">Sed amet
							tempor amet sit kasd sea lorem</a>
					</div>
				</div>
			</div>
			<!-- Fim do segundo bloco -->

			<!-- Terceiro bloco -->
			<div class="col-md-6 col-lg-4">
				<div class="blog-item">
					<div class="position-relative overflow-hidden rounded-top">
						<img class="img-fluid"
							src="caminho_para_sua_imagem/matheus_small.jpeg" alt="">
					</div>
					<div class="bg-dark d-flex align-items-center rounded-bottom p-4">
						<div
							class="flex-shrink-0 text-center text-secondary border-end border-secondary pe-3 me-3">
							<span>01</span>
							<h6 class="text-light text-uppercase mb-0">January</h6>
							<span>2045</span>
						</div>
						<a class="h5 text-uppercase text-light" href="#">Sed amet
							tempor amet sit kasd sea lorem</a>
					</div>
				</div>
			</div>
			<!-- Fim do terceiro bloco -->

			<!-- Quarto bloco -->
			<div class="col-md-6 col-lg-4">
				<div class="blog-item">
					<div class="position-relative overflow-hidden rounded-top">
						<img class="img-fluid" src="resources/images/matheus (1).jpeg"
							alt="">
					</div>
					<div class="bg-dark d-flex align-items-center rounded-bottom p-4">
						<div
							class="flex-shrink-0 text-center text-secondary border-end border-secondary pe-3 me-3">
							<span>01</span>
							<h6 class="text-light text-uppercase mb-0">January</h6>
							<span>2045</span>
						</div>
						<a class="h5 text-uppercase text-light" href="#">Sed amet
							tempor amet sit kasd sea lorem</a>
					</div>
				</div>
			</div>
			<!-- Fim do quarto bloco -->
			<div class="col-md-6 col-lg-4">
				<div class="blog-item">
					<div class="position-relative overflow-hidden rounded-top"
						style="height: 300px;">
						<img class="img-fluid" src="resources/images/matheus (1).jpeg"
							alt="" style="object-fit: cover; width: 100%; height: 100%;">
					</div>
					<div class="bg-dark d-flex align-items-center rounded-bottom p-4"
						style="height: 300px; border: 2px solid #343a40;">
						<div class="flex-shrink-0 text-center text-secondary pe-3 me-3"
							style="border-right: 2px solid #343a40;">
							<span>01</span>
							<h6 class="text-light text-uppercase mb-0">January</h6>
							<span>2045</span>
						</div>
						<a class="h5 text-uppercase text-light" href="#">Sed amet
							tempor amet sit kasd sea lorem</a>
					</div>
				</div>
			</div>

			<!-- informacoes de sempre -->
			<section class="info_section ">
				<div class="container">
					<div class="row">
						<div class="col-md-6 col-lg-3">
							<div class="info_contact">
								<h5>Contato</h5>
								<div>
									<img src="resources/images/call.png" alt="" />
									<p>+01 1234567890</p>
								</div>
								<div>
									<img src="resources/images/mail.png" alt="" />
									<p>ceduphh@gmail.com</p>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-3">
							<div class="info_time">
								<h5>Hermann Pet aberto</h5>
								<div>
									<p>Segunda-feira � S�bado</p>
								</div>
								<div>
									<p>07:00h at� as 18:00h</p>
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
										<a href=""> <img src="resources/images/twitter.png" alt="" />
										</a>
									</div>
									<div>
										<a href=""> <img src="resources/images/linkedin.png"
											alt="" />
										</a>
									</div>
									<div>
										<a href=""> <img src="resources/images/instagram.png"
											alt="" />
										</a>
									</div>
								</div>
							</div>
						</div>

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