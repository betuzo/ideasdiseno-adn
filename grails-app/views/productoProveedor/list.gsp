
<%@ page import="mx.com.ideasydiseno.adn.ProductoProveedor" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'productoProveedor.label', default: 'ProductoProveedor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-productoProveedor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-productoProveedor" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="productoProveedor.producto.label" default="Producto" /></th>
					
						<th><g:message code="productoProveedor.proveedor.label" default="Proveedor" /></th>
					
						<g:sortableColumn property="precio" title="${message(code: 'productoProveedor.precio.label', default: 'Precio')}" />
					
						<g:sortableColumn property="ventajas" title="${message(code: 'productoProveedor.ventajas.label', default: 'Ventajas')}" />
					
						<g:sortableColumn property="desventajas" title="${message(code: 'productoProveedor.desventajas.label', default: 'Desventajas')}" />
					
						<g:sortableColumn property="esProveedorOficial" title="${message(code: 'productoProveedor.esProveedorOficial.label', default: 'Es Proveedor Oficial')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${productoProveedorInstanceList}" status="i" var="productoProveedorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${productoProveedorInstance.id}">${fieldValue(bean: productoProveedorInstance, field: "producto")}</g:link></td>
					
						<td>${fieldValue(bean: productoProveedorInstance, field: "proveedor")}</td>
					
						<td>${fieldValue(bean: productoProveedorInstance, field: "precio")}</td>
					
						<td>${fieldValue(bean: productoProveedorInstance, field: "ventajas")}</td>
					
						<td>${fieldValue(bean: productoProveedorInstance, field: "desventajas")}</td>
					
						<td><g:formatBoolean boolean="${productoProveedorInstance.esProveedorOficial}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${productoProveedorInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
