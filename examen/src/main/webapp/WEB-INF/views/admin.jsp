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
	
	<spring:url value="/resources/css/daterangepicker.css" var="daterangepickerCSS" />
	<spring:url value="/resources/css/admin.css" var="adminCSS" />
	<spring:url value="/resources/css/custom.css" var="customCSS" />
	<spring:url value="/resources/css/bootstrap.min.css" var="bootstrapCSS" />
	
	
	
	
	<!--spring:url value="/resources/css/font.awesome.all.css" var="allCSS" /-->
	<spring:url value="/resources/css/fonts.google.api.css" var="fontsCSS" />
	<spring:url value="/resources/css/icons.css" var="iconsCSS" />
	<spring:url value="/resources/css/dataTables.min.css" var="dataTableCSS" />
	
	<spring:url value="/resources/js/jquery.js" var="jqueryJS" />
	<spring:url value="/resources/js/datatable.min.js" var="jqueryDataTableJS" />
	<spring:url value="/resources/js/bootstrap.min.js" var="bootstrapJS" />
	<spring:url value="/resources/js/moment.min.js" var="momentJS" />
	<spring:url value="/resources/js/daterangepicker.min.js" var="daterangepickerJS" />
	
	<spring:url value="/resources/img/logo-sat.png" var="logo" />
	
	<spring:url value="/admin" var="homeAdmin" />
	<spring:url value="/admin/eventos" var="verEvento" />
	<spring:url value="/logout" var="logOut"/>
	<spring:url value="/reporte" var="reporte"/>
	
	<spring:url value="/resources/js/constants.js" var="constantsJS" />
	<spring:url value="/resources/js/admin.js" var="adminJS" />
	
	<title>Administración - </title>
	<link href="http://ksylvest.github.io/jquery-growl/stylesheets/jquery.growl.css" rel="stylesheet" type="text/css">
	<link href="${daterangepickerCSS}" rel="stylesheet" />
	<link href="${bootstrapCSS}" rel="stylesheet" />
	<!-- Custom CSS -->
	<link href="${customCSS}" rel="stylesheet" />
	<link href="${adminCSS}" rel="stylesheet" />
	<!--link rel="stylesheet" href="${allCSS}" /-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<link rel="stylesheet" href="${iconsCSS}" />
	<link rel="stylesheet" href="${fontsCSS}" />
	<link rel="stylesheet" href="${dataTableCSS}" />

	<!-- JSTL -->
	<c:set var="url" value="${url}"/>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
</head>
<body class="background">

<security:authorize access="!hasRole('ADMIN')">
	<div class="alert alert-danger" style="text-align:center"><Strong>Error de autenticacion, acceso restringido.</Strong></div>
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
                <li>
                	<a href="${verEvento}" class="botonesHeader">
                		<div class="botonesHeader">
	                        <i class="fas fa-search" style="padding-right: 8px;"></i>Ver eventos
                        </div>
                    </a>
                </li>
                <li>
	                <a href="${logOut}" class="botonesHeader">
		            	<div class="botonesHeader">
		                   <i class="fas fa-sign-out-alt" style="padding-right: 8px;"></i>Salir
		                </div>
	                </a>
                </li>
            </ul>
        </div>
    </nav>

	<div class="container">
		<c:if test="${not empty message}">
			<div class="alert alert-success alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<strong>${message}</strong>
			</div>
		</c:if>
		
		<c:if test="${not empty messageError}">
			<div class="alert alert-danger">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<Strong>${messageError}</Strong>
			</div>
		</c:if>
	
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>Administrar usuarios</h2>
					</div>
					<div class="col-sm-6">
						<a href="${contextPath}/admin/agregar" class="btn btn-danger"><i class="material-icons">&#xE147;</i> <span>Agregar</span></a>
						<button id="btnModalReporte" class="btn btn-danger btn-filter" data-toggle="modal" data-target="#modalReporte"><i class="material-icons">assessment</i><span>Reporte</span></button>
					</div>
				</div>
			</div>
			
		<table id="tabla" class="table table-striped table-hover" style="width:100%">
				<thead>
					<tr>
						<th class="text-center" style="width:8%">ID</th>
						<th style="width:10%">Rol</th>
						<th class="text-center" style="width:18%">Usuario</th>
						<th class="text-center" style="width:20%">Nombre</th>
						<th class="text-center" style="width:20%">Apellido</th>
						<th style="width:10%">Estado</th>
						<th style="width:14%">Acciones</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${usuariosList}" var="user">
						<tr>
							<td align="center">${user.id}</td>
							<c:choose>
								<c:when test="${user.rol eq 'O'}">
									<td>Operador</td>
								</c:when>
								<c:when test="${user.rol eq 'C'}">
									<td>Abonado</td>
								</c:when>
								<c:otherwise>
									<td>No se pudo recuperar la información</td>
								</c:otherwise>
							</c:choose>
							
							<td align="center" style="font-weight: bold">${user.usuario}</td>
							<td align="center">${user.nombre}</td>
							<td align="center">${user.apellido}</td>
							
							<c:choose>
								<c:when test="${user.estado}">
									<td><span class="status text-success">●</span>Activo</td>
								</c:when>	
								<c:otherwise>
									<td><span class="status text-danger">●</span>En baja</td>
								</c:otherwise>
							</c:choose>
							
							<td>
								<a onClick='toPageModify("${user.usuario}", "${user.rol}", "${user.id}", "${user.tipoCliente}", "${contextPath}")' role="button" id="buttomTipeCliente" class="edit"><i class="material-icons" data-toggle="tooltip" title="Editar">&#xE254;</i></a>
								<a href="#deleteEmployeeModal_${user.usuario}" role="button" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Eliminar">&#xE872;</i></a>
							</td>
						</tr>

						<!-- Delete Modal HTML -->
						<div id="deleteEmployeeModal_${user.usuario}" class="modal fade">
							<div class="modal-dialog">
								<div class="modal-content">
									<form:form action="administrar" method="post">
										<div class="modal-header">
											<h4 class="modal-title">Eliminar Usuario</h4>
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
										</div>
										<hr style="width: 100%; color: black; height: 1px; background-color: black;" />
										<div class="modal-body">
											<p style="color: black;">¿Está seguro que desea eliminar el usuario seleccionado?</p>
											<p class="text-warning"><small>Una vez que acepte esta acción no se podrá deshacer.</small></p>
										</div>
										<div class="modal-footer">
											<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar"> 
											<a href="${contextPath}/admin/eliminar?usuario=${user.usuario}" role="button" class="btn btn-danger">Eliminar</a>
										</div>
									</form:form>
								</div>
							</div>
						</div>
						
					</c:forEach>

				</tbody>
				<tfoot>
					<tr id="filtros" hidden="true">
						<th >ID</th>
						<th >Rol</th>
						<th >Usuario</th>
						<th >Nombre</th>
						<th >Apellido</th>
						<th >Acciones</th>
					</tr>
				</tfoot>
			</table>

		</div>
		<!-- Modal HTML -->
        <div id="modalReporte" class="modal fade" data-backdrop="static" data-keyboard="false">
			<div class="modal-dialog" style="max-width:100%">
				<div class="modal-content" style="background-color:#333333">
						<div class="modal-header" style="border-bottom: 0 none;">
							<h3 class="modal-title" id="modalLabel" style="background-color:#333333;color:white">Reporte de operadores</h3></div>
						<hr style="width: 100%; color: black; height: 1px;"/>
						<div id=operadores class="modal-body">
						<div class="row">
						<label class="col-sm-2" style="margin-top:1%;" for="daterange">Período:</label>	
						<input type="text" id="daterange" name="daterange" class="form-control col-sm-5" style="width:40%;border-radius: 5px;font-size: 16px;margin-bottom:2%;">
						</div>
							<table id="tablaReporte"
								class="table table-striped table-hover tabla-modal"
								style="width: 100%">
								<thead>
									<tr>
										<th hidden="true">Id</th>
										<th class="text-center"
											style="width: 50%; border-top-left-radius: 5px;">Usuario</th>
										<th class="text-center" style="width: 25%">Eventos</th>
										<th class="text-center" style="width: 25%">Horas</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${usuariosList}" var="operador" varStatus="i">
										<c:if test="${operador.rol == 'O'}">
											<tr>
												<td hidden="true">${operador.id}</td>
												<td align="center" style="font-weight: bold">${operador.usuario}</td>
												<td align="center">${operador.cantidadEventos}</td>
												<td align="center">${operador.cantidadHoras}</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>

								<tfoot>
									<tr id="filtrosReporte" hidden="true">
										<th hidden="true">Id</th>
										<th>Usuario</th>
										<th>Eventos</th>
										<th>Horas</th>
									</tr>
								</tfoot>
							</table>
						</div>
						<div class="modal-footer" style="border-top: 0 none;background-color: #1f1e1e">
								<button type="button" class="btn col-md-offset-3 btn-danger" onclick="crearPDFReporte();">Exportar a PDF</button>
							<button type="button" class="btn col-md-offset-3 btn-danger" onclick="crearExcelReporte()">Exportar a Excel</button> 
								<button type="button" class="btn  float-right btn-danger" id="cancelar"  data-dismiss="modal">Salir</button>

						</div>
				</div>
			</div>
		</div>
		<!-- Fin Modal HTML -->	
	</div>
	
	<script src="${jqueryJS}"></script>
	<script src="${jqueryDataTableJS}"></script>
	<script src="${bootstrapJS}"></script>
	<script src="${momentJS}"></script>
	<script src="${daterangepickerJS}"></script>
	<script src="${constantsJS}"></script>		
	<script src="${adminJS}"></script>

</security:authorize>
</body>
</html>