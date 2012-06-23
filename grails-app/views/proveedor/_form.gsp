<%@ page import="mx.com.ideasydiseno.adn.Proveedor" %>



<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="proveedor.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${proveedorInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="proveedor.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${proveedorInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'fechaRegistro', 'error')} required">
	<label for="fechaRegistro">
		<g:message code="proveedor.fechaRegistro.label" default="Fecha Registro" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaRegistro" precision="day"  value="${proveedorInstance?.fechaRegistro}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'direccion', 'error')} ">
	<label for="direccion">
		<g:message code="proveedor.direccion.label" default="Direccion" />
		
	</label>
	<g:textField name="direccion" value="${proveedorInstance?.direccion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'colonia', 'error')} ">
	<label for="colonia">
		<g:message code="proveedor.colonia.label" default="Colonia" />
		
	</label>
	<g:select id="colonia" name="colonia.id" from="${mx.com.ideasydiseno.adn.Colonia.list()}" optionKey="id" value="${proveedorInstance?.colonia?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'codigoPostal', 'error')} ">
	<label for="codigoPostal">
		<g:message code="proveedor.codigoPostal.label" default="Codigo Postal" />
		
	</label>
	<g:textField name="codigoPostal" value="${proveedorInstance?.codigoPostal}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'telefono1', 'error')} ">
	<label for="telefono1">
		<g:message code="proveedor.telefono1.label" default="Telefono1" />
		
	</label>
	<g:textField name="telefono1" value="${proveedorInstance?.telefono1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'telefono2', 'error')} ">
	<label for="telefono2">
		<g:message code="proveedor.telefono2.label" default="Telefono2" />
		
	</label>
	<g:textField name="telefono2" value="${proveedorInstance?.telefono2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'paginaWeb', 'error')} ">
	<label for="paginaWeb">
		<g:message code="proveedor.paginaWeb.label" default="Pagina Web" />
		
	</label>
	<g:textField name="paginaWeb" value="${proveedorInstance?.paginaWeb}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'email1', 'error')} ">
	<label for="email1">
		<g:message code="proveedor.email1.label" default="Email1" />
		
	</label>
	<g:textField name="email1" value="${proveedorInstance?.email1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'email2', 'error')} ">
	<label for="email2">
		<g:message code="proveedor.email2.label" default="Email2" />
		
	</label>
	<g:textField name="email2" value="${proveedorInstance?.email2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'contactos', 'error')} ">
	<label for="contactos">
		<g:message code="proveedor.contactos.label" default="Contactos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${proveedorInstance?.contactos?}" var="c">
    <li><g:link controller="contactoProveedor" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="contactoProveedor" action="create" params="['proveedor.id': proveedorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'contactoProveedor.label', default: 'ContactoProveedor')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'productos', 'error')} ">
	<label for="productos">
		<g:message code="proveedor.productos.label" default="Productos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${proveedorInstance?.productos?}" var="p">
    <li><g:link controller="productoProveedor" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="productoProveedor" action="create" params="['proveedor.id': proveedorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'productoProveedor.label', default: 'ProductoProveedor')])}</g:link>
</li>
</ul>

</div>

