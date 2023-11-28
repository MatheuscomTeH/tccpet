<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Editar Cliente</title>

<c:import url="../componentes/cabecalho.jsp" />

<div class="p-5 mb-4 bg-light rounded-3">
	<div class="container py-5">
		<h1 class="display-5 fw-bold">Editar Cliente</h1>
		<p class="col-md-12 fs-4">Preencha o formulário abaixo para
			realizar a alteração do Cliente no sistema.</p>
	</div>
</div>

<main>
	<div class="container">
		<form action="altera-cliente" method="POST" class="row g-3">

			<security:csrfInput />

			<!-- ID -->
			<input type="hidden" name="id" value="${cliente.id}" required>

			<security:csrfInput />

			<!-- NOME -->
			<div class="form-group">
				<label for="username" class="col-form-label">Nome</label> <input value='${cliente.username}'
					type="text" class="form-control" name="username" autofocus
					MAXLENGTH="255" required>
			</div>
			
			<div class="form-group">
				<label for="email" class="col-form-label">Email</label> <input value='${cliente.usuario.email }'
					type="email" class="form-control" name="email" autofocus
					MAXLENGTH="255" required>
			</div>

			<div class="form-group">
				<label for="telefone" class="col-form-label">Telefone</label>
				<input type="tel" name="telefone" value='${cliente.telefone}' pattern="[0-9]+"
				maxlength="11" class="form-control" required  />
			</div>

			
			
				<input hidden type="password" value='${cliente.usuario.password }' name="password" 
									maxlength="50" class="form-control" required />
		


			<div class="text-center">
				<button type="submit" class="btn btn-primary btn-lg">
					<i class="bi bi-arrow-clockwise"></i> Atualizar
				</button>
				<a href="<c:url value="/admin/lista-cliente" />"
					class="btn btn-secondary btn-lg"> <i class="bi bi-x"></i>
					Cancelar
				</a>
			</div>

		</form>
	</div>
</main>

<c:import url="../componentes/rodape.jsp" />