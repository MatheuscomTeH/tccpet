<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Editar Servico</title>

<c:import url="../componentes/cabecalho.jsp" />

<div class="p-5 mb-4 bg-light rounded-3">
	<div class="container py-5">
		<h1 class="display-5 fw-bold">Editar Servico</h1>
		<p class="col-md-12 fs-4">Preencha o formulário abaixo para
			realizar a alteração do Servico no sistema.</p>
	</div>
</div>

<main>
	<div class="container">
		<form action="altera-servico" method="POST" class="row g-3">

			<security:csrfInput />

			<!-- ID -->
			<input type="hidden" name="id" value="${servico.id}" required>

			<security:csrfInput />

			<!-- NOME -->
			<div class="form-group">
				<label for="nome" class="col-form-label">Nome</label> <input value='${servico.nome}'
					type="text" class="form-control" name="nome" autofocus
					MAXLENGTH="255" required>
			</div>
			
		

			<div class="form-group">
				<label for="titulo" class="col-form-label">Titulo</label> <input
					type="text" value='${servico.titulo}' class="form-control" name="titulo" MAXLENGTH="255"
					required>
			</div>




			<div class="form-group">
				<label for="descricao" class="form-label mt-4">Descricao</label>
				<textarea class="form-control"  name="descricao"id="exampleTextarea" rows="3">${servico.descricao}</textarea>
			</div>
			


			<div class="text-center">
				<button type="submit" class="btn btn-primary btn-lg">
					<i class="bi bi-arrow-clockwise"></i> Atualizar
				</button>
				<a href="<c:url value="/admin/lista-servico" />"
					class="btn btn-secondary btn-lg"> <i class="bi bi-x"></i>
					Cancelar
				</a>
			</div>

		</form>
	</div>
</main>

<c:import url="../componentes/rodape.jsp" />