
<%@ page import="mx.com.ideasydiseno.adn.Producto" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'producto.label', default: 'Producto')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-producto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-producto" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list producto">
			
				<g:if test="${productoInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="producto.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${productoInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productoInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="producto.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${productoInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productoInstance?.precioSugerido}">
				<li class="fieldcontain">
					<span id="precioSugerido-label" class="property-label"><g:message code="producto.precioSugerido.label" default="Precio Sugerido" /></span>
					
						<span class="property-value" aria-labelledby="precioSugerido-label"><g:fieldValue bean="${productoInstance}" field="precioSugerido"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productoInstance?.esVenta}">
				<li class="fieldcontain">
					<span id="esVenta-label" class="property-label"><g:message code="producto.esVenta.label" default="Es Venta" /></span>
					
						<span class="property-value" aria-labelledby="esVenta-label"><g:formatBoolean boolean="${productoInstance?.esVenta}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${productoInstance?.proveedores}">
				<li class="fieldcontain">
					<span id="proveedores-label" class="property-label"><g:message code="producto.proveedores.label" default="Proveedores" /></span>
					
						<g:each in="${productoInstance.proveedores}" var="p">
						<span class="property-value" aria-labelledby="proveedores-label"><g:link controller="productoProveedor" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${productoInstance?.id}" />
					<g:link class="edit" action="edit" id="${productoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
