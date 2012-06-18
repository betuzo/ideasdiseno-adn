
<%@ page import="mx.com.ideasydiseno.adn.Proveedor" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'proveedor.label', default: 'Proveedor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-proveedor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-proveedor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list proveedor">
			
				<g:if test="${proveedorInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="proveedor.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${proveedorInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="proveedor.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${proveedorInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.fechaRegistro}">
				<li class="fieldcontain">
					<span id="fechaRegistro-label" class="property-label"><g:message code="proveedor.fechaRegistro.label" default="Fecha Registro" /></span>
					
						<span class="property-value" aria-labelledby="fechaRegistro-label"><g:formatDate date="${proveedorInstance?.fechaRegistro}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.direccion}">
				<li class="fieldcontain">
					<span id="direccion-label" class="property-label"><g:message code="proveedor.direccion.label" default="Direccion" /></span>
					
						<span class="property-value" aria-labelledby="direccion-label"><g:fieldValue bean="${proveedorInstance}" field="direccion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.colonia}">
				<li class="fieldcontain">
					<span id="colonia-label" class="property-label"><g:message code="proveedor.colonia.label" default="Colonia" /></span>
					
						<span class="property-value" aria-labelledby="colonia-label"><g:link controller="colonia" action="show" id="${proveedorInstance?.colonia?.id}">${proveedorInstance?.colonia?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.codigoPostal}">
				<li class="fieldcontain">
					<span id="codigoPostal-label" class="property-label"><g:message code="proveedor.codigoPostal.label" default="Codigo Postal" /></span>
					
						<span class="property-value" aria-labelledby="codigoPostal-label"><g:fieldValue bean="${proveedorInstance}" field="codigoPostal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.telefono1}">
				<li class="fieldcontain">
					<span id="telefono1-label" class="property-label"><g:message code="proveedor.telefono1.label" default="Telefono1" /></span>
					
						<span class="property-value" aria-labelledby="telefono1-label"><g:fieldValue bean="${proveedorInstance}" field="telefono1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.telefono2}">
				<li class="fieldcontain">
					<span id="telefono2-label" class="property-label"><g:message code="proveedor.telefono2.label" default="Telefono2" /></span>
					
						<span class="property-value" aria-labelledby="telefono2-label"><g:fieldValue bean="${proveedorInstance}" field="telefono2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.contactos}">
				<li class="fieldcontain">
					<span id="contactos-label" class="property-label"><g:message code="proveedor.contactos.label" default="Contactos" /></span>
					
						<g:each in="${proveedorInstance.contactos}" var="c">
						<span class="property-value" aria-labelledby="contactos-label"><g:link controller="contactoProveedor" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.paginaWeb}">
				<li class="fieldcontain">
					<span id="paginaWeb-label" class="property-label"><g:message code="proveedor.paginaWeb.label" default="Pagina Web" /></span>
					
						<span class="property-value" aria-labelledby="paginaWeb-label"><g:fieldValue bean="${proveedorInstance}" field="paginaWeb"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.productos}">
				<li class="fieldcontain">
					<span id="productos-label" class="property-label"><g:message code="proveedor.productos.label" default="Productos" /></span>
					
						<g:each in="${proveedorInstance.productos}" var="p">
						<span class="property-value" aria-labelledby="productos-label"><g:link controller="productoProveedor" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${proveedorInstance?.id}" />
					<g:link class="edit" action="edit" id="${proveedorInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
