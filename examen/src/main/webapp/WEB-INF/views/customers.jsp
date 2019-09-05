<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="shortcut icon" type="image/png" href="resources/img/favicon.ico"/>

<spring:url value="/resources/css/bootstrap.min.css" var="bootstrapCSS" />

<spring:url value="/resources/css/font.all.css" var="allCSS" />
<spring:url value="/resources/css/fonts.google.api.css" var="fontsCSS" />
<spring:url value="/resources/css/icons.css" var="iconsCSS" />
<spring:url value="/resources/css/dataTables.min.css" var="dataTableCSS" />
<!-- css excel -->
<spring:url value="/resources/css/buttons.dataTables.min.css" var="buttonsDataTableCSS" />
<spring:url value="/resources/css/jquery-ui.css" var="jqueryuiCSS" />

<spring:url value="/resources/js/constants.js" var="constantsJS" />
<spring:url value="/resources/js/jquery.js" var="jqueryJS" />
<spring:url value="/resources/js/datatable.min.js" var="jqueryDataTableJS" />
<spring:url value="/resources/js/bootstrap.min.js" var="bootstrapJS" />
<spring:url value="/resources/js/jquery-ui.js" var="jqueryui" />

<!--script de boton excel  -->
<spring:url value="/resources/js/dataTables.buttons.min.js" var="dataTButtonsJS" />
<spring:url value="/resources/js/jszip.min.js" var="jszipJS" />
<spring:url value="/resources/js/buttons.html5.min.js" var="buttonsH5JS" />

<link href="${bootstrapCSS}" rel="stylesheet" />

<!-- Custom CSS -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
<link rel="stylesheet" href="${iconsCSS}" />
<!-- 	Css Botones -->
<link rel="stylesheet" href="${jqueryuiCSS}">

<!-- JSTL -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<title>Administración - </title>
</head>
<body class="background">

		<div class="container">
			<div class="table-wrapper">
				<div class="table-title">
					<div class="row">
						<div class="col-sm-6">
							<h2>Customers</h2>
						</div>
					</div>
				</div>

				<table id="tabla" class="table table-striped table-hover"
					style="width: 100%">
					<thead>
						<tr>
							<th style="width: 15%" class="text-center">Id Customer</th>
							<th style="width: 15%" class="text-center">Nombre</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${customers}" var="customer">
							<tr>
								<td align="center">${customer.id}</td>
								<td align="center">${customer.nombre}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

	<!--  Script botones -->
	<script src="${jqueryJS}"></script>
	<script src="${jqueryui}"></script>
	<script src="${bootstrapJS}"></script>
	<script src="${jqueryDataTableJS}"></script>
	<script src="${dataTButtonsJS}"></script>
	<script src="${jszipJS}"></script>
	<script src="${buttonsH5JS}"></script>
	<script src="${constantsJS}"></script>
	<script src="${filtrosJS}"></script>		
</body>
</html>