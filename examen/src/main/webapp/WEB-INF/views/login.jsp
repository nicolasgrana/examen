<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <link rel="shortcut icon" type="image/png" href="resources/img/favicon.ico"/>
    
    <spring:url value="/resources/css/custom.css" var="customCSS" />
	<spring:url value="/resources/css/bootstrap.min.css" var="bootstrapCSS" />
	
	<spring:url value="/resources/css/font.awesome.all.css" var="allCSS" />
	<spring:url value="/resources/css/fonts.google.api.css" var="fontsCSS" />
	
	<spring:url value="/resources/js/jquery.js" var="jqueryJS" />
	<spring:url value="/resources/js/bootstrap.min.js" var="bootstrapJS" />
	
	<spring:url value="/resources/img/logo.png" var="logo" />

    <title>Iniciar sesión - </title>
    <link href="${bootstrapCSS}" rel="stylesheet" />

    <!-- Custom CSS -->
    <link href="${customCSS}" rel="stylesheet" />
    <link href="${allCSS}" rel="stylesheet" />
    <link href="${fontsCSS}" rel="stylesheet" />
    
    <!-- jQuery -->
    <script src="${jqueryJS}"></script>
    <script src="${bootstrapJS}"></script>
</head>
<body class="background" style="padding-top: 0">
    <div class="container">
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success alert-dismissible fade in" role="alert"  style="text-align:center;">
			<strong>${message}</strong>
		</div>
    </c:if>
        <div class="row" style="padding: 10% 0;">
            <div class="col-md-2 col-md-offset-5">
                <img class="center-img center-block" src="${logo}">
                <h1 class="title">Iniciar sesión</h1>
                <form:form id="loginForm" modelAttribute="loginRequest" action="login" method="post">
	                <div class="form-group">
	                    <div class="form-group">
	                        <label>Usuario</label>
							<form:input path="username" cssClass="form-control input" maxlength="16" required="true"/>
	                    </div>
	                    <div class="form-group">
	                        <label style="margin-top: 4%;">Contraseña</label>
	                        <form:password path="password" cssClass="form-control input" maxlength="16" required="true"/>
	                    </div>
	                    <form:button id="ingresar" class="btn btn-primary boton-primario login">Iniciar sesión</form:button>
	                </div>
	                <c:if test="${not empty messageError}">
		                <div class="alert alert-danger">
						  <Strong>${messageError}</Strong>
						</div>
	                </c:if>
                </form:form>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    $(document).ready(function() {
        setTimeout(function() {
            $("#message").alert('close');
        }, 2000);
    });
    </script>
</body>
</html>