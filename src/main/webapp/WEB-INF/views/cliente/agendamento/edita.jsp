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

<div class="p-5 mb-4 bg-light rounded-3">
	<div class="container py-5">
		<h1 class="display-5 fw-bold">Editar Agendamento</h1>
		<p class="col-md-12 fs-4">Preencha o formulário abaixo para
			realizar a alteração do atendimento no sistema.</p>
	</div>
</div>

<main style="min-height:800px">
	<div class="container">
		<form action="altera-agendamento" method="POST" class="row g-3">

			<security:csrfInput />

			<input type="hidden" name="id" value="${agendamento.id}">
			<input type="hidden" name="cliente.id" value="${agendamento.cliente.id}">

			<div class="form-check">
				<input type="checkbox" class="form-check-input" id="servicoLevaTras"
					name="levaTraz" value="true" ${agendamento.levaTraz?'checked':''}>
				<label class="form-check-label" for="servicoLevaTras">Serviço
					de Leva e Trás</label>
			</div>

			<div class="form-group col-md-6">
				<label for="data" class="col-form-label obrigatorio">Data</label> <input
					class="form-control" placeholder="yyyy-MM-dd" autofocus type="date"
					id="data" name="data" required  />
			</div>

			<div class="form-group col-md-3">
				<label for="horario_inicial" class="col-form-label obrigatorio">Horário
				</label> <input type="time" class="form-control" id="hora"
					name="hora" MAXLENGTH="255" required
					value="${atendimento.hora}">
			</div>

			<div class="form-group">
				<label for="mensagem">Descrição:</label>
				<textarea class="form-control" id="mensagem" name="descricao"
					rows="5" placeholder="Digite sua mensagem aqui...">${ agendamento.descricao}</textarea>
			</div>

			<div class="form-group">
				<label for="animal">Selecione o Animal:</label> <select
					class="form-select" name="animal.id" id="animal">
					<c:forEach var="animal" items="${animais}">
						<option value="${animal.id}"
							${agendamento.animal == animal.nome?'selected':'' }>${animal.nome}</option>
					</c:forEach>
				</select>
			</div>

			<div class="form-group">
				<label for="endereco">Serviço:</label> <select class="form-select"
					name="servico.id" id="servico">
					<c:forEach var="servico" items="${servicos}">
						<option value="${servico.id}"
							${agendamento.servico.nome == servico.nome?'selected':'' }>${servico.nome}</option>
					</c:forEach>
				</select>
			</div>


			<input hidden id="data-value" value='${agendamento.data}'> <input
				hidden id="hora-value" value='${agendamento.hora}'>

			<div class="form-group">
				<label for="endereco">Selecione o Endereço:</label> <select
					class="form-select" name="endereco.id" id="endereco">
					<c:forEach var="endereco" items="${enderecos}">
						<option value="${endereco.id}"
							${agendamento.endereco.id == endereco.id?'selected':'' }>${endereco.rua}
							${endereco.bairro} Numero: ${endereco.numero}</option>
					</c:forEach>
				</select>
			</div>



			
				<div class="text-center" style="margin-top:20px">
					<button type="submit" class="btn btn-primary btn-lg">
						<i class="bi bi-arrow-clockwise"></i> Atualizar
					</button>
					<a href="<c:url value="lista-agendamento" />"
						class="btn btn-secondary btn-lg"> <i class="bi bi-x"></i>
						Cancelar
					</a>
				</div>
			
		</form>
	</div>
</main>
<script>
	var dataInput1 = document.getElementById("data");
	var dataInput2 = document.getElementById("hora");

	dataInput1.value = document.getElementById("data-value").value;
	dataInput2.value = document.getElementById("hora-value").value;
</script>


<c:import url="../components/rodape.jsp" />