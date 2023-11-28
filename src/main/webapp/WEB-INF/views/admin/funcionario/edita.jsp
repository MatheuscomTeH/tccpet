<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Editar Funcionario</title>

<c:import url="../componentes/cabecalho.jsp" />

<div class="p-5 mb-4 bg-light rounded-3">
	<div class="container py-5">
		<h1 class="display-5 fw-bold">Editar Funcionario</h1>
		<p class="col-md-12 fs-4">Preencha o formulário abaixo para
			realizar a alteração do Funcionario no sistema.</p>
	</div>
</div>

<main>
	<div class="container">
		<form action="altera-funcionario" method="POST" class="row g-3">

			<security:csrfInput />

			<!-- ID -->
			<input type="hidden" name="id" value="${funcionario.id}" required>

			<security:csrfInput />

			<!-- NOME -->
			<div class="form-group">
				<label for="nome" class="col-form-label">Nome</label> <input value='${funcionario.nome}'
					type="text" class="form-control" name="nome" autofocus
					MAXLENGTH="255" required>
			</div>
			
			<div class="form-group">
				<label for="email" class="col-form-label">Email</label> <input value='${funcionario.usuario.email }'
					type="email" class="form-control" name="email" autofocus
					MAXLENGTH="255" required>
			</div>

			<div class="form-group">
				<label for="telefone" class="col-form-label">Telefone</label>
				<input type="tel" name="telefone" value='${funcionario.telefone}' pattern="[0-9]+"
				maxlength="11" class="form-control" required  />
			</div>
				
				<div class="form-group">
				<label for="cpf" class="col-form-label">Cpf</label>
				<input type="text" name="cpf" value='${funcionario.cpf}'
				maxlength="11" class="form-control" required  />
			</div>

			
				<input hidden type="password" value='${funcionario.usuario.password }' name="password" 
									maxlength="50" class="form-control" required />
			


			<div class="text-center">
				<button type="submit" class="btn btn-primary btn-lg">
					<i class="bi bi-arrow-clockwise"></i> Atualizar
				</button>
				<a href="<c:url value="/admin/lista-funcionario" />"
					class="btn btn-secondary btn-lg"> <i class="bi bi-x"></i>
					Cancelar
				</a>
			</div>

		</form>
	</div>
</main>

<c:import url="../componentes/rodape.jsp" />