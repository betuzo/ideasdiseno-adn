
<%@ page import="mx.com.ideasydiseno.adn.DetalleEntradaProducto" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'detalleEntradaProducto.label', default: 'DetalleEntradaProducto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-detalleEntradaProducto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-detalleEntradaProducto" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="detalleEntradaProducto.producto.label" default="Producto" /></th>
					
						<g:sortableColumn property="cantidad" title="${message(code: 'detalleEntradaProducto.cantidad.label', default: 'Cantidad')}" />
					
						<g:sortableColumn property="totalProducto" title="${message(code: 'detalleEntradaProducto.totalProducto.label', default: 'Total Producto')}" />
					
						<th><g:message code="detalleEntradaProducto.entrada.label" default="Entrada" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${detalleEntradaProductoInstanceList}" status="i" var="detalleEntradaProductoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${detalleEntradaProductoInstance.id}">${fieldValue(bean: detalleEntradaProductoInstance, field: "producto")}</g:link></td>
					
						<td>${fieldValue(bean: detalleEntradaProductoInstance, field: "cantidad")}</td>
					
						<td>${fieldValue(bean: detalleEntradaProductoInstance, field: "totalProducto")}</td>
					
						<td>${fieldValue(bean: detalleEntradaProductoInstance, field: "entrada")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${detalleEntradaProductoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
