
<%@ page import="mx.com.ideasydiseno.adn.Pago" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pago.label', default: 'Pago')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pago" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pago" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="pago.venta.label" default="Venta" /></th>
					
						<g:sortableColumn property="concepto" title="${message(code: 'pago.concepto.label', default: 'Concepto')}" />
					
						<g:sortableColumn property="totalPago" title="${message(code: 'pago.totalPago.label', default: 'Total Pago')}" />
					
						<g:sortableColumn property="fechaPago" title="${message(code: 'pago.fechaPago.label', default: 'Fecha Pago')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pagoInstanceList}" status="i" var="pagoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pagoInstance.id}">${fieldValue(bean: pagoInstance, field: "venta")}</g:link></td>
					
						<td>${fieldValue(bean: pagoInstance, field: "concepto")}</td>
					
						<td>${fieldValue(bean: pagoInstance, field: "totalPago")}</td>
					
						<td><g:formatDate date="${pagoInstance.fechaPago}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pagoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
