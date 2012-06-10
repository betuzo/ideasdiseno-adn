<%@ page import="mx.com.ideasydiseno.adn.Pago" %>



<div class="fieldcontain ${hasErrors(bean: pagoInstance, field: 'venta', 'error')} required">
	<label for="venta">
		<g:message code="pago.venta.label" default="Venta" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="venta" name="venta.id" from="${mx.com.ideasydiseno.adn.Venta.list()}" optionKey="id" required="" value="${pagoInstance?.venta?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pagoInstance, field: 'concepto', 'error')} required">
	<label for="concepto">
		<g:message code="pago.concepto.label" default="Concepto" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="concepto" cols="40" rows="5" maxlength="300" required="" value="${pagoInstance?.concepto}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pagoInstance, field: 'totalPago', 'error')} required">
	<label for="totalPago">
		<g:message code="pago.totalPago.label" default="Total Pago" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="totalPago" required="" value="${fieldValue(bean: pagoInstance, field: 'totalPago')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pagoInstance, field: 'fechaPago', 'error')} required">
	<label for="fechaPago">
		<g:message code="pago.fechaPago.label" default="Fecha Pago" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaPago" precision="day"  value="${pagoInstance?.fechaPago}"  />
</div>

