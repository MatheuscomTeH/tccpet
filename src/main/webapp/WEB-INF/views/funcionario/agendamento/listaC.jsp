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
								<button type="button" class="btn btn-danger btn-sm"
										data-toggle="tooltip" data-bs-placement="bottom"
										title="Excluir" data-bs-toggle="modal"
										data-bs-target="#modal${agendamento.id}">
										<i class="bi bi-trash"></i>
									</button>
									<div class="modal fade" id="modal${agendamento.id}" tabindex="-1">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Exclusão do agendamento</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close">
														<span aria-hidden="true"></span>
													</button>
												</div>
												<div class="modal-body">
													<p>
														Deseja realmente excluir o agendamento <br>ID (${agendamento.id})
														 ?
													</p>
												</div>
												<div class="modal-footer">
													<a href="remove-agendamento?id=${agendamento.id}"
														class="btn btn-danger"> <i class="bi bi-trash"></i>
														Excluir
													</a>
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">
														<i class="bi bi-x"></i>
														Fechar
													</button>
												</div>
											</div>
										</div>
									</div>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>


	</div>
</main>
<c:import url="../componentes/rodape.jsp" />