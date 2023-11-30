<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Lista de Agendamentos</title>
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
</html>
<c:import url="../components/sidebar.jsp" />
<main class="centralizar" style="min-height: 1000px">
	<div class="container">
		<div class="card border-light mb-3">
			<div class="card-header">Exibe os dados do Agendamento</div>
			<!-- Table -->
			<div class="card-body">
				<div class="table-responsive">
					<table
						class="table table-striped table-bordered dt-responsive nowrap">
						<tr>
							<th width="30%">ID</th>
							<td>${agendamento.id}</td>
						</tr>

						<tr>
							<th>Serviço</th>
							<td style="font-weight: bold; color: blue;">${agendamento.servico.nome}</td>
						</tr>

						<tr>
							<th>Preço</th>
							<td style="font-weight: bold; color: blue;">R$${agendamento.servico.preco}</td>
						</tr>

						<tr>
							<th>Nome do animal</th>
							<td style="font-weight: bold; color: blue;">${agendamento.animal.nome}</td>
						</tr>
						<tr>
							<th>Tipo do animal</th>
							<td style="font-weight: bold; color: blue;">
								${agendamento.animal.tipo}</td>
						</tr>
						<tr>
							<th>Idade do animal</th>
							<td style="font-weight: bold; color: blue;">${agendamento.animal.idade}</td>
						</tr>
						<c:if test="${agendamento.endereco ne null}">
							<tr>
								<th>Endereco</th>
								<td style="font-weight: bold; color: blue;">
									${agendamento.endereco.rua} ${agendamento.endereco.bairro}
									Numero: ${agendamento.endereco.numero}</td>
							</tr>
						</c:if>

						<c:if test="${agendamento.funcionario ne null}">
							<tr>
								<th>Funcionario</th>
								<td style="font-weight: bold; color: blue;"><a
									href="<c:url value="/cliente/exibe-funcionario?id=${agendamento.funcionario.id}"/>">${agendamento.funcionario.nome}</a></td>
							</tr>
						</c:if>

						<tr>
							<th>Data</th>
							<td style="font-weight: bold; color: blue;">${agendamento.data}
							</td>
						</tr>
						<tr>
							<th>Hora</th>
							<td style="font-weight: bold; color: blue;">
								${agendamento.hora}</td>
						</tr>
						<tr>
							<th>Leva e Traz</th>
							<td style="font-weight: bold; color: blue;">${agendamento.levaTraz ? 'Sim' : 'Não'}</td>
						</tr>

						<tr>
							<th>Devolvido</th>
							<td style="font-weight: bold; color: blue;">${agendamento.devolvido? 'Sim' : 'Não'}</td>
						</tr>

						<tr>
							<th>Descrição</th>
							<td style="font-weight: bold; color: blue;">${agendamento.descricao}</td>
						</tr>
						<tr>
							<th>Status</th>
							<td style="font-weight: bold; color: blue;">${agendamento.status}</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div align="center">

			<c:choose>
				<c:when test="${agendamento.status eq 'Aceito'}">
					<a href="concluir-agendamento?id=${agendamento.id}"
						class="btn btn-primary btn-lg">Concluir</a>
					<a href="cancelar-agendamento?id=${agendamento.id}"
						class="btn btn-warning btn-lg">Cancelar</a>
				</c:when>
				<c:when test="${agendamento.status eq 'Pendente'}">
					<a href="edita-agendamento?id=${agendamento.id}"
						class="btn btn-primary btn-lg">Editar</a>
					<a href="cancelar-agendamento?id=${agendamento.id}"
						class="btn btn-danger btn-lg">Cancelar</a>
				</c:when>
				<c:otherwise>

				</c:otherwise>
			</c:choose>


		</div>





		<button class="btn btn-success" onclick="window.history.back()">
			<i class="bi bi-chevron-left"></i> Voltar
		</button>
	</div>
</main>

<c:import url="../components/rodape.jsp" />