<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>Hermann Pets</title>

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
	padding-left: 100px;
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
<body>

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
						href="lista-endereco"><span style="margin-right:10px" class="icon-calendar mr-3"></span>>Meus endere�os</a></li>
					<li
						style="width: 100%; border: 0; border-radius: 0; text-align: left"><a
						href="<c:url value="lista-agendamento"/>"><span
							style="margin-right: 10px" class="icon-notifications mr-3"></span>Meus
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

	<main class="centralizar">
		<div class="container center-v">

			<div class="card border-light mb-3">
				<div class="card-header">Meus Endere�os</div>

				<!-- Table -->
				<div class="card-body">
					<table class="table datatable" id="datatable">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Rua</th>
								<th scope="col">N�mero</th>
								<th scope="col">Bairro</th>
								<th scope="col">A��es</th>
							</tr>
						</thead>
						<tbody>
							<!-- percorre endere�os montando as linhas da tabela -->
							<c:forEach var="endereco" items="${enderecos}">
								<tr>
									<td scope="row">${endereco.id}</td>
									<td>${endereco.rua}</td>
									<td>${endereco.numero}</td>
									<td>${endereco.bairro}</td>
									<td>
										<!-- Editar --> <a
										href="<c:url value="/cliente/edita-endereco?id=${endereco.id}" />"
										class="btn btn-warning btn-sm" data-toggle="tooltip"
										data-bs-placement="bottom" title="Editar"> <i
											class="bi bi-pencil-square"></i>
									</a> <!-- Excluir -->
										<button type="button" class="btn btn-danger btn-sm"
											data-toggle="tooltip" data-bs-placement="bottom"
											title="Excluir" data-bs-toggle="modal"
											data-bs-target="#modal${endereco.id}">
											<i class="bi bi-trash"></i>
										</button>
										<div class="modal fade" id="modal${endereco.id}" tabindex="-1">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title">Exclus�o do endere�o</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close">
															<span aria-hidden="true"></span>
														</button>
													</div>
													<div class="modal-body">
														<p>
															Deseja realmente excluir o endere�o <br>ID
															(${endereco.id}) -> ${endereco.rua}, ${endereco.numero},
															${endereco.bairro}?
														</p>
													</div>
													<div class="modal-footer">
														<a
															href="<c:url value="/cliente/remove-endereco?id=${endereco.id}" />"
															class="btn btn-danger"> <i class="bi bi-trash"></i>
															Excluir
														</a>
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">
															<i class="bi bi-x"></i> Fechar
														</button>
													</div>
												</div>
											</div>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>


			<div align="center">
				<a href="<c:url value="/cliente/endereco-novo" />"
					class="btn btn-primary btn-lg"> <i class="bi bi-plus-circle"></i>
					Cadastrar
				</a>
			</div>
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
	<script type="text/javascript"
		src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>

	<!-- https://datatables.net/examples/styling/bootstrap5.html -->
	<script type="text/javascript"
		src="<c:url value="/resources/vendor/jquery/jquery-3.7.0.min.js" />"></script>
	<script type="text/javascript"
		src="<c:url value="/resources/vendor/data-table/js/datatables.min.js" />"></script>
	<script type="text/javascript"
		src="<c:url value="/resources/js/data_table.js"/>"></script>
</body>

</html>