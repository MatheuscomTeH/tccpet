<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Exibe os dados do Funcionario</title>
<c:import url="../componentes/cabecalho.jsp" />

<main>
	<div class="container">
		<div class="card border-light mb-3">
			<div class="card-header">Exibe os dados do Funcionario</div>
			<!-- Table -->
			<div class="card-body">
				<div class="table-responsive">
					<table
						class="table table-striped table-bordered dt-responsive nowrap">
						<tr>
							<th width="30%">ID</th>
							<td>${funcionario.id}</td>
						</tr>
						<tr>
							<th>Nome</th>
							<td style="font-weight: bold; color: blue;">${funcionario.nome}</td>
						</tr>
						<tr>
							<th>Email</th>
							<td style="font-weight: bold; color: blue;">${funcionario.usuario.email}</td>
						</tr>
						<tr>
							<th>Telefone</th>
							<td style="font-weight: bold; color: blue;">${funcionario.telefone}</td>
						</tr>
						<tr>
							<th>Cpf</th>
							<td style="font-weight: bold; color: blue;">${funcionario.cpf}</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div align="center">
			<!-- Cadastrar -->
			<a href="<c:url value="/admin/novo-funcionario" />"
				class="btn btn-primary btn-lg"><i class="bi bi-plus-circle"></i>
				Cadastrar</a>
			<!-- Editar -->
			<a href="<c:url value="/admin/edita-funcionario?id=${funcionario.id}" />"
				class="btn btn-warning btn-lg"><i class="bi bi-pencil-square"></i>
				Editar </a>
			<!-- Excluir -->
			<button type="button" class="btn btn-danger btn-lg"
				data-bs-toggle="modal" data-bs-target="#modal${funcionario.id}">
				<i class="bi bi-trash"></i>
				Excluir
			</button>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="modal${funcionario.id}" tabindex="-1">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Exclusão do curso</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
					</div>
					<div class="modal-body">
						<p>
							Deseja realmente excluir o Cliente <br>ID (${funcionario.id}) ->
							${funcionario.nome}?
						</p>
					</div>
					<div class="modal-footer">
						<a href="<c:url value="/admin/remove-funcionario?id=${funcionario.id}" />"
							class="btn btn-danger"> <i class="bi bi-trash"></i> Excluir
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
		<button class="btn btn-success" onclick="window.history.back()">
			<i class="bi bi-chevron-left"></i>
			Voltar
		</button>
	</div>
</main>
<c:import url="../componentes/rodape.jsp" />