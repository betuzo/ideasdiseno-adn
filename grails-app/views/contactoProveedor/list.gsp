
<%@ page import="mx.com.ideasydiseno.adn.ContactoProveedor" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contactoProveedor.label', default: 'ContactoProveedor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-contactoProveedor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-contactoProveedor" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'contactoProveedor.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="apellidoPaterno" title="${message(code: 'contactoProveedor.apellidoPaterno.label', default: 'Apellido Paterno')}" />
					
						<g:sortableColumn property="apellidoMaterno" title="${message(code: 'contactoProveedor.apellidoMaterno.label', default: 'Apellido Materno')}" />
					
						<g:sortableColumn property="sexo" title="${message(code: 'contactoProveedor.sexo.label', default: 'Sexo')}" />
					
						<g:sortableColumn property="fechaNacimiento" title="${message(code: 'contactoProveedor.fechaNacimiento.label', default: 'Fecha Nacimiento')}" />
					
						<g:sortableColumn property="direccion" title="${message(code: 'contactoProveedor.direccion.label', default: 'Direccion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${contactoProveedorInstanceList}" status="i" var="contactoProveedorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${contactoProveedorInstance.id}">${fieldValue(bean: contactoProveedorInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: contactoProveedorInstance, field: "apellidoPaterno")}</td>
					
						<td>${fieldValue(bean: contactoProveedorInstance, field: "apellidoMaterno")}</td>
					
						<td>${fieldValue(bean: contactoProveedorInstance, field: "sexo")}</td>
					
						<td><g:formatDate date="${contactoProveedorInstance.fechaNacimiento}" /></td>
					
						<td>${fieldValue(bean: contactoProveedorInstance, field: "direccion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${contactoProveedorInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
