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

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'direccion', 'error')} required">
	<label for="direccion">
		<g:message code="proveedor.direccion.label" default="Direccion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="direccion" required="" value="${proveedorInstance?.direccion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'colonia', 'error')} required">
	<label for="colonia">
		<g:message code="proveedor.colonia.label" default="Colonia" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="colonia" name="colonia.id" from="${mx.com.ideasydiseno.adn.Colonia.list()}" optionKey="id" required="" value="${proveedorInstance?.colonia?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'codigoPostal', 'error')} required">
	<label for="codigoPostal">
		<g:message code="proveedor.codigoPostal.label" default="Codigo Postal" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="codigoPostal" required="" value="${proveedorInstance?.codigoPostal}"/>
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

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'contacto', 'error')} ">
	<label for="contacto">
		<g:message code="proveedor.contacto.label" default="Contacto" />
		
	</label>
	<g:select id="contacto" name="contacto.id" from="${mx.com.ideasydiseno.adn.ContactoProveedor.list()}" optionKey="id" value="${proveedorInstance?.contacto?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'paginaWeb', 'error')} ">
	<label for="paginaWeb">
		<g:message code="proveedor.paginaWeb.label" default="Pagina Web" />
		
	</label>
	<g:textField name="paginaWeb" value="${proveedorInstance?.paginaWeb}"/>
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

