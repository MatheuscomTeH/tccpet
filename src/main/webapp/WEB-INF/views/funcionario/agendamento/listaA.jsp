<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Lista de Agendamentos</title>

<c:import url="../componentes/cabecalho.jsp" />
<main class="centralizar">
	<div class="container center-v">

		<div class="card border-light mb-3">
			<div class="card-header">Listagem de Agendamentos</div>

			<!-- Table -->
			<div class="card-body">
				<table class="table datatable" id="datatable">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Animal</th>
							<th scope="col">Cliente</th>
							<th scope="col">Data</th>
							<th scope="col">Hora</th>
							<th scope="col">Serviço leva e traz</th>
							<th scope="col">Status</th>
							<th scope="col">Ações</th>
						</tr>
					</thead>
					<tbody>
						<!-- percorre cursos montando as linhas da tabela -->
						<c:forEach var="agendamento" items="${agendamentos}">
							<tr>
								<td scope="row">${agendamento.id}</td>
								<td>${agendamento.animal.nome}</td>
								<td>${agendamento.cliente.username}</td>
								<td>${agendamento.data}</td>
								<td>${agendamento.hora}</td>
								<td>${agendamento.levaTraz?'Sim':'Não'}</td>
								<td>${agendamento.status}</td>
								<td>
								
								<a
									href="exibe-agendamento?id=${agendamento.id}"
									class="btn btn-info btn-sm" data-toggle="tooltip"
									data-bs-placement="bottom" title="Exibir"> <i
											class="bi bi-eye"></i>
								</a>
								<a href="concluir-agendamento?id=${agendamento.id}" data-toggle="tooltip"
									data-bs-placement="bottom" title="Concluir" class="btn btn-primary btn-sm" role="button"><i class="bi bi-check"></i></a>

							 <a href="cancelar-agendamento?id=${agendamento.id}" data-toggle="tooltip"
									data-bs-placement="bottom" title="Cancelar" class="btn btn-danger btn-sm" 
									role="button"><i class="bi bi-x"></i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>


	</div>
</main>
<c:import url="../componentes/rodape.jsp" />