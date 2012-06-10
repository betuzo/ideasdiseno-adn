
<%@ page import="mx.com.ideasydiseno.adn.Entrada" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'entrada.label', default: 'Entrada')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-entrada" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-entrada" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="entrada.empleado.label" default="Empleado" /></th>
					
						<g:sortableColumn property="fechaSolicitud" title="${message(code: 'entrada.fechaSolicitud.label', default: 'Fecha Solicitud')}" />
					
						<g:sortableColumn property="totalEntrada" title="${message(code: 'entrada.totalEntrada.label', default: 'Total Entrada')}" />
					
						<g:sortableColumn property="estado" title="${message(code: 'entrada.estado.label', default: 'Estado')}" />
					
						<g:sortableColumn property="observaciones" title="${message(code: 'entrada.observaciones.label', default: 'Observaciones')}" />
					
						<g:sortableColumn property="fechaRecepcion" title="${message(code: 'entrada.fechaRecepcion.label', default: 'Fecha Recepcion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${entradaInstanceList}" status="i" var="entradaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${entradaInstance.id}">${fieldValue(bean: entradaInstance, field: "empleado")}</g:link></td>
					
						<td><g:formatDate date="${entradaInstance.fechaSolicitud}" /></td>
					
						<td>${fieldValue(bean: entradaInstance, field: "totalEntrada")}</td>
					
						<td>${fieldValue(bean: entradaInstance, field: "estado")}</td>
					
						<td>${fieldValue(bean: entradaInstance, field: "observaciones")}</td>
					
						<td><g:formatDate date="${entradaInstance.fechaRecepcion}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${entradaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
