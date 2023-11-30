<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<aside class="sidebar">
	<div class="toggle">
		<a href="#" class="burger js-menu-toggle" data-toggle="collapse"
			data-target="#main-navbar"> <span></span>
		</a>
	</div>
	<div class="side-inner">

		<div class="profile">
			<img src="<c:url value="/resources/images/images.png"/>" alt="Image" class="img-fluid">
			<h3 class="name">${cliente.username}</h3>
		</div>


		<div class="nav-menu">
			<ul style="display:flex;flex-direction:column">
			
				<li style="width:100%;border:0;border-radius:0;text-align:left"><a href="<c:url value="index"/>"><span style="margin-right:10px" class="icon-calendar mr-3"></span>Agendamento</a></li>
				<li style="width:100%;border:0;border-radius:0;text-align:left"><a href="<c:url value="lista-animal"/>"><i style="margin-right:10px" class="bi bi-github"></i>Meus pets</a></li>
				<li style="width:100%;border:0;border-radius:0;text-align:left"><a href="<c:url value="lista-endereco"/>"><span style="margin-right:10px" class="icon-notifications mr-3"></span>Meus endereços</a></li>
				<li style="width:100%;border:0;border-radius:0;text-align:left"><a href="<c:url value="lista-agendamento"/>"><span style="margin-right:10px" class="icon-calendar mr-3"></span>Meus Agendamentos</a></li>
				<li style="width:100%;border:0;border-radius:0;text-align:left"><a href="<c:url value="/logout"/>"><span style="margin-right:10px" class="icon-sign-out mr-3"></span>Sign
						out</a></li>
			</ul>
		</div>
	</div>

</aside>