
<%@ page import="mx.com.ideasydiseno.adn.ProductoProveedor" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'productoProveedor.label', default: 'ProductoProveedor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-productoProveedor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-productoProveedor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list productoProveedor">
			
				<g:if test="${productoProveedorInstance?.producto}">
				<li class="fieldcontain">
					<span id="producto-label" class="property-label"><g:message code="productoProveedor.producto.label" default="Producto" /></span>
					
						<span class="property-value" aria-labelledby="producto-label"><g:link controller="producto" action="show" id="${productoProveedorInstance?.producto?.id}">${productoProveedorInstance?.producto?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${productoProveedorInstance?.proveedor}">
				<li class="fieldcontain">
					<span id="proveedor-label" class="property-label"><g:message code="productoProveedor.proveedor.label" default="Proveedor" /></span>
					
						<span class="property-value" aria-labelledby="proveedor-label"><g:link controller="proveedor" action="show" id="${productoProveedorInstance?.proveedor?.id}">${productoProveedorInstance?.proveedor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${productoProveedorInstance?.precio}">
				<li class="fieldcontain">
					<span id="precio-label" class="property-label"><g:message code="productoProveedor.precio.label" default="Precio" /></span>
					
						<span class="property-value" aria-labelledby="precio-label"><g:fieldValue bean="${productoProveedorInstance}" field="precio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productoProveedorInstance?.ventajas}">
				<li class="fieldcontain">
					<span id="ventajas-label" class="property-label"><g:message code="productoProveedor.ventajas.label" default="Ventajas" /></span>
					
						<span class="property-value" aria-labelledby="ventajas-label"><g:fieldValue bean="${productoProveedorInstance}" field="ventajas"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productoProveedorInstance?.desventajas}">
				<li class="fieldcontain">
					<span id="desventajas-label" class="property-label"><g:message code="productoProveedor.desventajas.label" default="Desventajas" /></span>
					
						<span class="property-value" aria-labelledby="desventajas-label"><g:fieldValue bean="${productoProveedorInstance}" field="desventajas"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productoProveedorInstance?.esProveedorOficial}">
				<li class="fieldcontain">
					<span id="esProveedorOficial-label" class="property-label"><g:message code="productoProveedor.esProveedorOficial.label" default="Es Proveedor Oficial" /></span>
					
						<span class="property-value" aria-labelledby="esProveedorOficial-label"><g:formatBoolean boolean="${productoProveedorInstance?.esProveedorOficial}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${productoProveedorInstance?.id}" />
					<g:link class="edit" action="edit" id="${productoProveedorInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
