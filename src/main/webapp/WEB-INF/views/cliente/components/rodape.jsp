<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section class="info_section " >
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-lg-3">
				<div class="info_contact">
					<h5>Contato</h5>
					<div>
						<img src="<c:url value="/resources/images/call.png"/>" alt="" />
						<p>+01 1234567890</p>
					</div>
					<div>
						<img src="<c:url value="/resources/images/mail.png"/>" alt="" />
						<p>ceduphh@gmail.com</p>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-lg-3">
				<div class="info_time">
					<h5>Hermann Pet aberto</h5>
					<div>
						<p>Segunda-feira à Sábado</p>
					</div>
					<div>
						<p>07:00h até as 18:00h</p>
					</div>
				</div>
			</div>

			<div class="col-md-6 col-lg-3">
				<div class="info_social">
					<h5>Acesse nossas redes sociais:</h5>
					<div class="social_container">
						<div>
							<a href=""> <img
								src="<c:url value="/resources/images/fb.png"/>" alt="" />
							</a>
						</div>
						<div>
							<a href=""> <img
								src="<c:url value="/resources/images/twitter.png"/>" alt="" />
							</a>
						</div>
						<div>
							<a href=""> <img
								src="<c:url value="/resources/images/linkedin.png"/>" alt="" />
							</a>
						</div>
						<div>
							<a href=""> <img
								src="<c:url value="/resources/images/instagram.png"/>" alt="" />
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


<script src="<c:url value="/resources/js/jquery-3.4.1.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/bootstrap.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/popper.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/main.js" />"></script>

<script type="text/javascript" src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>

<!-- https://datatables.net/examples/styling/bootstrap5.html -->
<script type="text/javascript" src="<c:url value="/resources/vendor/jquery/jquery-3.7.0.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/vendor/data-table/js/datatables.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/data_table.js"/>"></script>

</body>

</html>