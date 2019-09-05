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

<spring:url value="/resources/css/admin.css" var="adminCSS" />
<spring:url value="/resources/css/custom.css" var="customCSS" />
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

<!--Filtro nuevo js filtroEventos -->
<spring:url value="/resources/js/filtrosEventos.js" var="filtrosJS" />

<spring:url value="/resources/img/logo-sat.png" var="logo" />

<spring:url value="/admin" var="homeAdmin" />
<spring:url value="/logout" var="logOut" />

<link href="${bootstrapCSS}" rel="stylesheet" />


<!-- Custom CSS -->
<link href="${customCSS}" rel="stylesheet" />
<link href="${adminCSS}" rel="stylesheet" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
<link rel="stylesheet" href="${iconsCSS}" />
<link rel="stylesheet" href="${fontsCSS}" />
<link rel="stylesheet" href="${dataTableCSS}" />
<!-- 	Css Botones -->
<link rel="stylesheet" href="${buttonsDataTableCSS}" />
<link rel="stylesheet" href="${jqueryuiCSS}">

<!-- JSTL -->
<c:set var="url" value="${url}" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<title>Administración - </title>
</head>
<body class="background">
	<security:authorize access="!hasRole('ADMIN')">
		<div class="alert alert-danger" style="text-align: center">
			<Strong>Error de autenticacion, acceso restringido.</Strong>
		</div>
		<a href="${contextPath}" class="salir">
			<div class="salir">
				<i class="fas fa-long-arrow-alt-left" style="padding-right: 8px;"></i>volver
			</div>
		</a>
	</security:authorize>
	<security:authorize access="hasRole('ADMIN')">
		<p hidden="true" id="url">${url}</p>
		<!-- Fragmento del header Logo + Botones -->
		<nav class="navbar navbar-fixed-top navbar-custom" role="navigation">
			<div class="container">
				<div class="navbar-header ">
					<a class="navbar-brand" href="${homeAdmin}">
						<img style="height: 40px; margin-left: 8px;" src="${logo}">
					</a>
				</div>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="${contextPath}/admin" class="salir">
							<div class="salir">
								<i class="fas fa-long-arrow-alt-left"
									style="padding-right: 8px;"></i>volver
							</div>
					</a></li>
					<li><a href="${logOut}" class="botonesHeader">
							<div class="botonesHeader">
								<i class="fas fa-sign-out-alt" style="padding-right: 8px;"></i>Salir
							</div>
					</a></li>
				</ul>
			</div>
		</nav>

		<div class="container">
			<div class="table-wrapper">
				<div class="table-title">
					<div class="row">
						<div class="col-sm-6">
							<h2>Eventos</h2>
						</div>

					</div>
				</div>
				<div id="botonesFiltros" style="text-align: right;margin: 5px 0 5px 0;">
				<!--buscar -->
				
					<label style="margin: 0 5px 0 5px;">
						<input id="buscarTodos" type="text" class="form-control" placeholder="Buscar:" style="color:black;margin: 0 5px 0 5px;" >					
					</label>
					<!--List clientes -->
					<label id="listaDeClientes"style="color: white; text-align: left; margin: 0 0px 0 5px;">
							<select id="clienteSeleccionado" class="form-control" style ="color:#999;">
							<option value="noSoyOpcion" >Seleccionar cliente</option>
							<c:forEach items="${clientesList}" var="cliente">
								<option value="${cliente}">${cliente}</option>
							</c:forEach>
						</select>
					</label>
					<!--Fecha desde -->
					<label style="margin: 0 5px 0 0px;"> 
						<input id="fechaDesde" type="text" class="form-control" placeholder="Fecha Desde:" style="color:black;margin: 0 5px 0 5px;" autocomplete="false">
					</label>
					<!--Fecha hasta -->					
					<label style="margin: 0 0px 0 5px;">
						<input id="fechaHasta" type="text" class="form-control" placeholder="Fecha hasta:" style="color:black;" autocomplete="false">
					</label> 
					<!--botones pdf -->
					<label style="color:white; text-align:left;margin: 0 0px 0 5px;">
						<button class="form-control" style="text-align:left;" onclick="crearPDF();">PDF</button>
					</label>
					<!-- botones excel -->
					<label id="botonExcel" style="color:white; text-align:left;margin: 0 5px 0 5px;">
						<div id="botonSinRelleno">
							<button tabindex="0" aria-controls="tabla" type="button" class="form-control">
								<span>Excel</span>
							</button>
						 </div>
					 </label>
					 
<!-- 					botones excel -->
<!-- 					<label id ="botonExcel" style="color:white; text-align:left;margin: 0 5px 0 5px;"> </label> -->
				</div>

				<table id="tabla" class="table table-striped table-hover"
					style="width: 100%">
					<thead>
						<tr>
							<th style="width: 10%" class="text-center">Evento</th>
							<th class="text-center" hidden="true">ID Operador</th>
							<th class="text-center" hidden="true">ID Cliente</th>
							<th style="width: 15%" class="text-center">Operador</th>
							<th style="width: 15%" class="text-center">Cliente</th>
							<th style="width: 15%" class="text-center">Cuenta</th>
							<th style="width: 15%" class="text-center">Estado</th>
							<th style="width: 15%" class="text-center">Fecha inicio</th>
							<th style="width: 15%" class="text-center">Fecha fin</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${eventosList}" var="evento">
							<tr>
								<td align="center">${evento.nombre}</td>
								<td align="center" hidden="true">${evento.idOperador}</td>
								<td align="center" hidden="true">${evento.idCliente}</td>
								<td align="center">${evento.operador}</td>
								<td align="center">${evento.clienteNombre}</td>
								<td align="center">${evento.nombreCuenta}</td>
								<td align="center">${evento.estado}</td>
								<td align="center">${evento.fechaInicio}</td>
								<c:choose>
									<c:when test="${empty evento.fechaFin}">
										<td align="center">-</td>
									</c:when>
									<c:otherwise>
										<td align="center">${evento.fechaFin}</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr id="filtros">
							<th hidden="true">Evento</th>
							<th hidden="true">ID Operador</th>
							<th hidden="true">ID Cliente</th>
							<th hidden="true">Operador</th>
							<th hidden="true">Cliente</th>
							<th hidden="true">Cuenta</th>
							<th hidden="true">Estado</th>
							<th hidden="true">Fecha inicio</th>
							<th hidden="true">Fecha fin</th>
						</tr>
					</tfoot>
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
	</security:authorize>
</body>
</html>