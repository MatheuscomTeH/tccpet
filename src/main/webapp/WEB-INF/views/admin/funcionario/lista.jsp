<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Lista Funcionarios</title>

<c:import url="../componentes/cabecalho.jsp" />
<main class="centralizar">
	<div class="container center-v">

		<div class="card border-light mb-3">
			<div class="card-header">Listagem de Funcionario</div>

			<!-- Table -->
			<div class="card-body">
				<table class="table datatable" id="datatable">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Nome</th>
							<th scope="col">Email</th>
							<th scope="col">Telefone</th>
							<th scope="col">Cpf</th>
							<th scope="col">Ações</th>
						</tr>
					</thead>
					<tbody>
						<!-- percorre cursos montando as linhas da tabela -->
						<c:forEach var="funcionario"  items="${funcionarios}">
							<tr>
								<td scope="row">${funcionario.id}</td>
								<td>${funcionario.nome}</td>
								<td >${funcionario.usuario.email}</td>
								<td>${funcionario.telefone}</td>
								<td>${funcionario.cpf}</td>
								<td>
									<!-- Exibir --> <a
									href="<c:url value="/admin/exibe-funcionario?id=${funcionario.id}"/>"
									class="btn btn-info btn-sm" data-toggle="tooltip"
									data-bs-placement="bottom" title="Exibir"> <i
											class="bi bi-eye"></i>
								</a> <!-- Editar --> <a
									href="<c:url value="/admin/edita-funcionario?id=${funcionario.id}" />"
									class="btn btn-warning btn-sm" data-toggle="tooltip"
									data-bs-placement="bottom" title="Editar"> <i
											class="bi bi-pencil-square"></i>
								</a> <!-- Excluir -->
									<button type="button" class="btn btn-danger btn-sm"
										data-toggle="tooltip" data-bs-placement="bottom"
										title="Excluir" data-bs-toggle="modal"
										data-bs-target="#modal${funcionario.id}">
										<i class="bi bi-trash"></i>
									</button>
									<div class="modal fade" id="modal${funcionario.id}" tabindex="-1">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Exclusão do funcionario</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close">
														<span aria-hidden="true"></span>
													</button>
												</div>
												<div class="modal-body">
													<p>
														Deseja realmente excluir o funcionario <br>ID (${funcionario.id})
														-> ${funcionario.nome}?
													</p>
												</div>
												<div class="modal-footer">
													<a href="<c:url value="/admin/remove-funcionario?id=${funcionario.id}" />"
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
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<div align="center">
			<a href="<c:url value="/admin/novo-funcionario" />"
				class="btn btn-primary btn-lg"> <i class="bi bi-plus-circle"></i>
				Cadastrar
			</a>
		</div>
	</div>
</main>
<c:import url="../componentes/rodape.jsp" />