<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Exibe os dados do Agendamento</title>
<c:import url="../componentes/cabecalho.jsp" />

<main>
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

						<tr>
							<th>Cliente</th>
							<td style="font-weight: bold; color: blue;"><a
								href="<c:url value="/funcionario/exibe-cliente?id=${agendamento.cliente.id}"/>">${agendamento.cliente.username}</a></td>
						</tr>
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
					<a href="aceitar-agendamento?id=${agendamento.id}"
						class="btn btn-primary btn-lg">Aceitar</a>
					<a href="recusar-agendamento?id=${agendamento.id}"
						class="btn btn-danger btn-lg">Recusar</a>
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
<c:import url="../componentes/rodape.jsp" />