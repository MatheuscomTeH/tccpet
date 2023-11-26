<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Acesso Negado</title>
    
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.css" />">
	
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-danger text-white">
                        <h2 class="mb-0">Acesso Negado</h2>
                    </div>
                    <div class="card-body">
                        <p class="lead">Você não tem permissão para acessar esta página.</p>
                        <p><a class="btn btn-primary" href="${pageContext.request.contextPath}/login">Ir para a página de login</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
