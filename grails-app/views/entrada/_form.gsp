<%@ page import="mx.com.ideasydiseno.adn.Entrada" %>



<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'empleado', 'error')} required">
	<label for="empleado">
		<g:message code="entrada.empleado.label" default="Empleado" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="empleado" name="empleado.id" from="${mx.com.ideasydiseno.adn.Usuario.list()}" optionKey="id" required="" value="${entradaInstance?.empleado?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'fechaSolicitud', 'error')} required">
	<label for="fechaSolicitud">
		<g:message code="entrada.fechaSolicitud.label" default="Fecha Solicitud" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaSolicitud" precision="day"  value="${entradaInstance?.fechaSolicitud}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'totalEntrada', 'error')} required">
	<label for="totalEntrada">
		<g:message code="entrada.totalEntrada.label" default="Total Entrada" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="totalEntrada" required="" value="${fieldValue(bean: entradaInstance, field: 'totalEntrada')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="entrada.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="estado" from="${entradaInstance.constraints.estado.inList}" required="" value="${entradaInstance?.estado}" valueMessagePrefix="entrada.estado"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'observaciones', 'error')} ">
	<label for="observaciones">
		<g:message code="entrada.observaciones.label" default="Observaciones" />
		
	</label>
	<g:textField name="observaciones" maxlength="50" value="${entradaInstance?.observaciones}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'fechaRecepcion', 'error')} required">
	<label for="fechaRecepcion">
		<g:message code="entrada.fechaRecepcion.label" default="Fecha Recepcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaRecepcion" precision="day"  value="${entradaInstance?.fechaRecepcion}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'productos', 'error')} ">
	<label for="productos">
		<g:message code="entrada.productos.label" default="Productos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${entradaInstance?.productos?}" var="p">
    <li><g:link controller="detalleEntradaProducto" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="detalleEntradaProducto" action="create" params="['entrada.id': entradaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'detalleEntradaProducto.label', default: 'DetalleEntradaProducto')])}</g:link>
</li>
</ul>

</div>

