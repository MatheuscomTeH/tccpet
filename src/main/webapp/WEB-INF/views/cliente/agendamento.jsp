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
</style>

</head>

<body>

	<c:import url="components/sidebar.jsp" />



	<section
		class="agendamento d-flex w-100 p-5 row row-cols-1 row-cols-lg-2">

		<form class="col-lg-8" action="php/processar_agendamento.php"
			method="POST">
			<div class="container-servicos-center">
				<c:choose>
					<c:when test="${empty servicos}">
						<div class="alert alert-dismissible alert-warning" style="margin:auto;">
						
							<h4 class="alert-heading">Alerta!</h4>
							<p class="mb-0">
								Serviço indisponivel no momento
							</p>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="servico" items="${servicos}" varStatus="loop">
							<!--servico-->
							<div class="card" style="width: 18rem; text-align: center">
								<div class="card-body">
									<h5 class="card-title">${servico.titulo}</h5>
									<p class="card-text">${servico.descricao}</p>
									<a href="#" data-toggle="modal"
										data-target="#modalCart${loop.index}"
										style="background-color: #78B8C6" class="btn">Agendar</a>
								</div>
							</div>

							<div class="modal fade" id="modalCart${loop.index}" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<!--Header-->
										<div class="modal-header">
											<h4 class="modal-title" id="myModalLabel">Agendar
												${servico.nome}</h4>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">×</span>
											</button>
										</div>
										<!--Body-->
										<div class="modal-body">
											<div class="form-group">
												<label for="data">Data:</label> <input type="date"
													class="form-control" id="data" name="data">
											</div>

											<div class="form-group">
												<label for="hora">Hora:</label> <input type="time"
													class="form-control" id="hora" name="hora">
											</div>

											<div class="form-group">
												<label for="mensagem">Descrição:</label>
												<textarea class="form-control" id="mensagem" name="mensagem"
													rows="5" placeholder="Digite sua mensagem aqui..."></textarea>
											</div>
										</div>
										<!--footer-->


										<div class="modal-footer">
											<button type="button" class="btn btn-outline-primary"
												data-dismiss="modal">Close</button>
											<button class="btn btn-primary">Checkout</button>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>



		</form>

		<figure class="col-lg-4" style="margin-left: -100px;">
			<img src="<c:url value="/resources/images/doguinho.png"/>"
				alt="foto lateral de um cachorro" class="img-fluid ">
		</figure>



	</section>










	<c:import url="components/rodape.jsp" />