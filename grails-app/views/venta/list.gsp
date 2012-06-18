
<%@ page import="mx.com.ideasydiseno.adn.Venta" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'venta.label', default: 'Venta')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-venta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-venta" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="id" title="${message(code: 'venta.id.label', default: 'Folio')}" />
					
						<th><g:message code="venta.cliente.label" default="Cliente" /></th>
					
						<th><g:message code="venta.vendedor.label" default="Vendedor" /></th>
					
						<g:sortableColumn property="fechaVenta" title="${message(code: 'venta.fechaVenta.label', default: 'Fecha Venta')}" />
					
						<g:sortableColumn property="fechaEntrega" title="${message(code: 'venta.fechaEntrega.label', default: 'Fecha Entrega')}" />
					
						<g:sortableColumn property="totalVenta" title="${message(code: 'venta.totalVenta.label', default: 'Total Venta')}" />
					
						<g:sortableColumn property="estado" title="${message(code: 'venta.estado.label', default: 'Estado')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ventaInstanceList}" status="i" var="ventaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td>${fieldValue(bean: ventaInstance, field: "id")}</td>

						<td><g:link action="show" id="${ventaInstance.id}">${fieldValue(bean: ventaInstance, field: "cliente")}</g:link></td>
					
						<td>${fieldValue(bean: ventaInstance, field: "vendedor")}</td>
					
						<td><g:formatDate date="${ventaInstance.fechaVenta}" /></td>
					
						<td><g:formatDate date="${ventaInstance.fechaEntrega}" /></td>
					
						<td>${fieldValue(bean: ventaInstance, field: "totalVenta")}</td>
					
						<td>${fieldValue(bean: ventaInstance, field: "estado")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ventaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
