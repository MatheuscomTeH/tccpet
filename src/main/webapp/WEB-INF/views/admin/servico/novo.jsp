<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Cadastrar Serviço</title>

<c:import url="../componentes/cabecalho.jsp" />

<div class="p-5 mb-4 bg-light rounded-3">
	s
	<div class="container py-5">
		<h1 class="display-5 fw-bold">Cadastrar Serviço</h1>
		<p class="col-md-12 fs-4">Preencha o formulário abaixo para
			realizar o cadastro de Serviço no sistema.</p>
	</div>
</div>

<main>
	<div class="container">
		<form action="adiciona-servico" method="POST" class="row g-3">

			<security:csrfInput />

			<!-- NOME -->
			<div class="form-group">
				<label for="nome" class="col-form-label">Nome</label> <input
					type="text" class="form-control" name="nome" autofocus
					MAXLENGTH="255" required>
			</div>

			<div class="form-group">
				<label for="titulo" class="col-form-label">Titulo</label> <input
					type="text" class="form-control" name="titulo" MAXLENGTH="255"
					required>
			</div>




			<div class="form-group">
				<label for="descricao" class="form-label mt-4">Descricao</label>
				<textarea class="form-control" name="descricao"id="exampleTextarea" rows="3"></textarea>
			</div>
			
			<div class="form-group">
				<label for="preco" class="form-label mt-4">Preço</label>
				<input
					type="number" class="form-control" name="preco" MAXLENGTH="255"
					required>
			</div>




			<div class="text-center">
				<button type="submit" class="btn btn-primary btn-lg">
					<i class="bi bi-plus-circle"></i> Cadastrar
				</button>
				<button type="reset" class="btn btn-secondary btn-lg">
					<i class="bi bi-trash"></i> Limpar
				</button>
			</div>

		</form>
	</div>
</main>

<c:import url="../componentes/rodape.jsp" />