<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>Hermann Pets</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/vendor/bootstrap-icons/bootstrap-icons.min.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/vendor/data-table/css/datatables.min.css" />">

<!-- fonts style -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans|Poppins:400,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	crossorigin="anonymous">

<link href="css/style.css" rel="stylesheet" />

<link rel="stylesheet" type="text/css"
	href="<c:url value='resources/css/bootstrap.css'/>">
<link href="<c:url value='/resources/css/style2.css'/>" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/vendor/bootstrap-icons/bootstrap-icons.min.css" />">
	<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css" />">

<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/vendor/bootstrap/css/bootstrap-icons.css" />">


<link type="text/css" href="<c:url value="/resources/css/estilo.css"/>"
	rel="stylesheet" />



<link type="text/css" rel="stylesheet"
	href="<c:url value="/resources/icomoon/style.css"/>">

<link type="text/css" rel="stylesheet"
	href="<c:url value="/resources/css/owl.carousel.min.css"/>">
	

</head>

<body>

	<c:import url="components/sidebar.jsp" />


	<div class="hero_area_agendamento">



		<section class="about_section layout_padding">
			<div class="container">
				<div class="detail-box">
					<div class="heading_container">
						<h2>ANIMAIS QUE ATENDEMOS!</h2>
					</div>
		</section>

		<section class="animal_section layout_padding">
			<div class="container">
				<div class="animal_container">
					<div class="box b1">
						<div class="img-box">
							<img src="<c:url value="/resources/images/dog.jpg"/>" alt="">
						</div>
						<div class="detail-box">
							<h5>Cachorrinhos de pequeno e grande porte</h5>
							<p>Venha conhecer nossos serviços!</p>
						</div>
					</div>
					<div class="box b2">
						<div class="img-box">
							<img src="<c:url value="/resources/images/cavalo.jpg"/>" alt="">
						</div>
						<div class="detail-box">
							<h5>Deixe seu cavalo lindo!</h5>
							<p>Venha conhecer nossos servicos!</p>
						</div>
					</div>
					<div class="box b1">
						<div class="img-box">
							<img src="<c:url value="/resources/images/chinchila.jpg"/>"
								alt="">
						</div>
						<div class="detail-box">
							<h5>Roedores</h5>
							<p>Temos tratamentos especiais com chinchilas!</p>
						</div>
					</div>
					<div class="box b2">
						<div class="img-box">
							<img src="<c:url value="/resources/images/cat.jpg"/>" alt="">
						</div>
						<div class="detail-box">
							<h5>Gatinhoos</h5>
							<p>Venha conhecer nossos servicos!</p>
						</div>
					</div>
				</div>
		</section>
	</div>


	<section
		class="agendamento d-flex w-100 p-5 row row-cols-1 row-cols-lg-2">

		<form class="col-lg-8" action="adiciona-agendamento" method="POST">
			<div class="container-servicos-center">
				<c:choose>
					<c:when test="${empty servicos}">
						<div class="alert alert-dismissible alert-warning"
							style="margin: auto;">

							<h4 class="alert-heading">Alerta!</h4>
							<p class="mb-0">Serviço indisponivel no momento</p>
						</div>
					</c:when>
					<c:otherwise>
						<ul
							style="display: flex; flex-direction: row; gap: 20px; flex-wrap: wrap; list-style: none">
							<c:forEach var="servico" items="${servicos}" varStatus="loop">

								<li>
									<div class="card"
										style="width: 18rem; text-align: center; background-color: #f5f5f5">
										<div class="card-body">
											<h5 class="card-title"
												style="font-size: 20px; font-family: Poppins, sans-serif; font-weight: bold;">${servico.titulo}</h5>
											<p class="card-text"
												style="font-family: Poppins, sans-serif; font-size: 14px; line-height: 1.2; color: black">${servico.descricao}</p>
												<p class="card-text"
												style="font-family: Poppins, sans-serif; font-size: 14px; line-height: 1.2; color: black">Preço: R$${servico.preco}</p>
											<a data-toggle="modal" data-target="#modalCart${loop.index}"
												style="background-color: #78B8C6; margin-top: 35px; border-radius: 0px; padding: 10px 45px; color: #fff;"
												class="btn">Agendar</a>
										</div>
									</div>

									<div class="modal fade" id="modalCart${loop.index}"
										tabindex="-1" role="dialog"
										aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<!--Header-->
												<div class="modal-header">
													<h4 class="modal-title" id="myModalLabel">Agendar
														${servico.nome}</h4>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">×</span>
													</button>
												</div>
												<!--Body-->
												<div class="modal-body">
													<input name="cliente.id" value="${cliente.id}" hidden>
													<input name="servico.id" value="${servico.id}" hidden>
													<div class="form-check">
														<input type="checkbox" class="form-check-input"
															id="servicoLevaTras" name="levaTraz" value="true">
														<label class="form-check-label" for="servicoLevaTras">Serviço
															de Leva e Trás</label>
													</div>
													<div class="form-group">
														<label for="data">Data:</label> <input type="date"
															class="form-control" id="data" name="data"
															placeholder="dd-MM-yyyy">
													</div>

													<div class="form-group">
														<label for="hora">Hora:</label> <input type="time"
															class="form-control" id="hora" name="hora"
															placeholder="HH:mm">
													</div>

													<div class="form-group">
														<label for="mensagem">Descrição:</label>
														<textarea class="form-control" id="mensagem"
															name="descricao" rows="5"
															placeholder="Digite sua mensagem aqui..."></textarea>
													</div>
													<div class="form-group">
														<label for="animal">Selecione o Animal:</label> <select
															class="form-select" name="animal.id" id="animal">
															<c:forEach var="animal" items="${cliente.animais}">
																<option value="${animal.id}">${animal.nome}</option>
															</c:forEach>
														</select>
													</div>

													<div class="form-group">
														<label for="endereco">Selecione o Endereço:</label> <select
															class="form-select" name="endereco.id" id="endereco">
															<c:forEach var="endereco" items="${listaDeEnderecos}">
																<option value="${endereco.id}">${endereco.rua}
																	${endereco.bairro} Numero: ${endereco.numero}</option>
															</c:forEach>
														</select>
													</div>


												</div>
												<!--footer-->


												<div class="modal-footer">
													<button type="button" class="btn btn-outline-primary"
														data-dismiss="modal">Fechar</button>
													<button class="btn btn-primary">Agendar</button>
												</div>
											</div>
										</div>
									</div>
								</li>


							</c:forEach>
						</ul>
					</c:otherwise>
				</c:choose>
			</div>



		</form>

		<figure class="col-lg-4">
			<img src="<c:url value="/resources/images/doguinho.png"/>"
				alt="foto lateral de um cachorro" class="img-fluid ">
		</figure>



	</section>


<c:import url="components/rodape.jsp" />