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

<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/vendor/bootstrap-icons/bootstrap-icons.min.css" />">

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
<body>

	
	<c:import url="../components/sidebar.jsp" />

	<main class="centralizar">
		<div class="container center-v">

			<div class="card border-light mb-3">
				<div class="card-header">Meus Pets</div>

				<!-- Table -->
				<div class="card-body">
					<table class="table datatable" id="datatable">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Nome</th>
								<th scope="col">Tipo</th>
								<th scope="col">Idade</th>
								<th scope="col">Ações</th>
							</tr>
						</thead>
						<tbody>
							<!-- percorre cursos montando as linhas da tabela -->
							<c:forEach var="animal" items="${cliente.animais}">
								<tr>
									<td scope="row">${animal.id}</td>
									<td>${animal.nome}</td>
									<td>${animal.tipo}</td>
									<td>${animal.idade}</td>
									<td>
										<!-- Editar --> <a
										href="<c:url value="/cliente/edita-animal?id=${animal.id}" />"
										class="btn btn-warning btn-sm" data-toggle="tooltip"
										data-bs-placement="bottom" title="Editar"> <i
											class="bi bi-pencil-square"></i>
									</a> <!-- Excluir -->
										<button type="button" class="btn btn-danger btn-sm"
											data-toggle="tooltip" data-bs-placement="bottom"
											title="Excluir" data-bs-toggle="modal"
											data-bs-target="#modal${animal.id}">
											<i class="bi bi-trash"></i>
										</button>
										<div class="modal fade" id="modal${animal.id}" tabindex="-1">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title">Exclusão do animal</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close">
															<span aria-hidden="true"></span>
														</button>
													</div>
													<div class="modal-body">
														<p>
															Deseja realmente excluir o animal <br>ID
															(${animal.id}) -> ${animal.nome}?
														</p>
													</div>
													<div class="modal-footer">
														<a
															href="<c:url value="/cliente/remove-animal?id=${animal.id}" />"
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
				<a href="<c:url value="/cliente/novo-animal" />"
					class="btn btn-primary btn-lg"> <i class="bi bi-plus-circle"></i>
					Cadastrar
				</a>
			</div>
		</div>
	</main>
	<c:import url="../components/rodape.jsp" />