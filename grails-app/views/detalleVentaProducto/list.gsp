
<%@ page import="mx.com.ideasydiseno.adn.DetalleVentaProducto" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'detalleVentaProducto.label', default: 'DetalleVentaProducto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-detalleVentaProducto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-detalleVentaProducto" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="detalleVentaProducto.producto.label" default="Producto" /></th>
					
						<g:sortableColumn property="cantidad" title="${message(code: 'detalleVentaProducto.cantidad.label', default: 'Cantidad')}" />
					
						<g:sortableColumn property="totalProducto" title="${message(code: 'detalleVentaProducto.totalProducto.label', default: 'Total Producto')}" />
					
						<th><g:message code="detalleVentaProducto.venta.label" default="Venta" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${detalleVentaProductoInstanceList}" status="i" var="detalleVentaProductoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${detalleVentaProductoInstance.id}">${fieldValue(bean: detalleVentaProductoInstance, field: "producto")}</g:link></td>
					
						<td>${fieldValue(bean: detalleVentaProductoInstance, field: "cantidad")}</td>
					
						<td>${fieldValue(bean: detalleVentaProductoInstance, field: "totalProducto")}</td>
					
						<td>${fieldValue(bean: detalleVentaProductoInstance, field: "venta")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${detalleVentaProductoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
