<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<spring:url value="/resources/css/bootstrap.min.css" var="bootstrapCSS" />
<spring:url value="/resources/css/dataTables.min.css" var="dataTableCSS" />
<link href="${bootstrapCSS}" rel="stylesheet" />
<link rel="shortcut icon" href="#" />

<title>Challenge </title>
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

</body>
</html>