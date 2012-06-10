<%@ page import="mx.com.ideasydiseno.adn.ContactoProveedor" %>



<div class="fieldcontain ${hasErrors(bean: contactoProveedorInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="contactoProveedor.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${contactoProveedorInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactoProveedorInstance, field: 'apellidoPaterno', 'error')} required">
	<label for="apellidoPaterno">
		<g:message code="contactoProveedor.apellidoPaterno.label" default="Apellido Paterno" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellidoPaterno" required="" value="${contactoProveedorInstance?.apellidoPaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactoProveedorInstance, field: 'apellidoMaterno', 'error')} ">
	<label for="apellidoMaterno">
		<g:message code="contactoProveedor.apellidoMaterno.label" default="Apellido Materno" />
		
	</label>
	<g:textField name="apellidoMaterno" value="${contactoProveedorInstance?.apellidoMaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactoProveedorInstance, field: 'sexo', 'error')} required">
	<label for="sexo">
		<g:message code="contactoProveedor.sexo.label" default="Sexo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="sexo" from="${contactoProveedorInstance.constraints.sexo.inList}" required="" value="${contactoProveedorInstance?.sexo}" valueMessagePrefix="contactoProveedor.sexo"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactoProveedorInstance, field: 'fechaNacimiento', 'error')} required">
	<label for="fechaNacimiento">
		<g:message code="contactoProveedor.fechaNacimiento.label" default="Fecha Nacimiento" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaNacimiento" precision="day"  value="${contactoProveedorInstance?.fechaNacimiento}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: contactoProveedorInstance, field: 'direccion', 'error')} required">
	<label for="direccion">
		<g:message code="contactoProveedor.direccion.label" default="Direccion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="direccion" required="" value="${contactoProveedorInstance?.direccion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactoProveedorInstance, field: 'colonia', 'error')} required">
	<label for="colonia">
		<g:message code="contactoProveedor.colonia.label" default="Colonia" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="colonia" name="colonia.id" from="${mx.com.ideasydiseno.adn.Colonia.list()}" optionKey="id" required="" value="${contactoProveedorInstance?.colonia?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactoProveedorInstance, field: 'codigoPostal', 'error')} required">
	<label for="codigoPostal">
		<g:message code="contactoProveedor.codigoPostal.label" default="Codigo Postal" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="codigoPostal" required="" value="${contactoProveedorInstance?.codigoPostal}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactoProveedorInstance, field: 'telefono', 'error')} ">
	<label for="telefono">
		<g:message code="contactoProveedor.telefono.label" default="Telefono" />
		
	</label>
	<g:textField name="telefono" value="${contactoProveedorInstance?.telefono}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactoProveedorInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="contactoProveedor.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${contactoProveedorInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactoProveedorInstance, field: 'proveedor', 'error')} required">
	<label for="proveedor">
		<g:message code="contactoProveedor.proveedor.label" default="Proveedor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="proveedor" name="proveedor.id" from="${mx.com.ideasydiseno.adn.Proveedor.list()}" optionKey="id" required="" value="${contactoProveedorInstance?.proveedor?.id}" class="many-to-one"/>
</div>

