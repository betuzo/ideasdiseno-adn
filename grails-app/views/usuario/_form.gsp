<%@ page import="mx.com.ideasydiseno.adn.Usuario" %>



<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="usuario.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${usuarioInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'apellidoPaterno', 'error')} required">
	<label for="apellidoPaterno">
		<g:message code="usuario.apellidoPaterno.label" default="Apellido Paterno" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellidoPaterno" required="" value="${usuarioInstance?.apellidoPaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'apellidoMaterno', 'error')} ">
	<label for="apellidoMaterno">
		<g:message code="usuario.apellidoMaterno.label" default="Apellido Materno" />
		
	</label>
	<g:textField name="apellidoMaterno" value="${usuarioInstance?.apellidoMaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'sexo', 'error')} required">
	<label for="sexo">
		<g:message code="usuario.sexo.label" default="Sexo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="sexo" from="${usuarioInstance.constraints.sexo.inList}" required="" value="${usuarioInstance?.sexo}" valueMessagePrefix="usuario.sexo"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'fechaNacimiento', 'error')} required">
	<label for="fechaNacimiento">
		<g:message code="usuario.fechaNacimiento.label" default="Fecha Nacimiento" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaNacimiento" precision="day"  value="${usuarioInstance?.fechaNacimiento}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'direccion', 'error')} required">
	<label for="direccion">
		<g:message code="usuario.direccion.label" default="Direccion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="direccion" required="" value="${usuarioInstance?.direccion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'colonia', 'error')} required">
	<label for="colonia">
		<g:message code="usuario.colonia.label" default="Colonia" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="colonia" name="colonia.id" from="${mx.com.ideasydiseno.adn.Colonia.list()}" optionKey="id" required="" value="${usuarioInstance?.colonia?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'codigoPostal', 'error')} required">
	<label for="codigoPostal">
		<g:message code="usuario.codigoPostal.label" default="Codigo Postal" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="codigoPostal" required="" value="${usuarioInstance?.codigoPostal}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'telefono', 'error')} ">
	<label for="telefono">
		<g:message code="usuario.telefono.label" default="Telefono" />
		
	</label>
	<g:textField name="telefono" value="${usuarioInstance?.telefono}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="usuario.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${usuarioInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="usuario.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${usuarioInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="usuario.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${usuarioInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'entradas', 'error')} ">
	<label for="entradas">
		<g:message code="usuario.entradas.label" default="Entradas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${usuarioInstance?.entradas?}" var="e">
    <li><g:link controller="entrada" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="entrada" action="create" params="['usuario.id': usuarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'entrada.label', default: 'Entrada')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'ventas', 'error')} ">
	<label for="ventas">
		<g:message code="usuario.ventas.label" default="Ventas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${usuarioInstance?.ventas?}" var="v">
    <li><g:link controller="venta" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="venta" action="create" params="['usuario.id': usuarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'venta.label', default: 'Venta')])}</g:link>
</li>
</ul>

</div>

