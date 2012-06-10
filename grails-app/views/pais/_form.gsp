<%@ page import="mx.com.ideasydiseno.adn.Pais" %>



<div class="fieldcontain ${hasErrors(bean: paisInstance, field: 'nombreCorto', 'error')} required">
	<label for="nombreCorto">
		<g:message code="pais.nombreCorto.label" default="Nombre Corto" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombreCorto" required="" value="${paisInstance?.nombreCorto}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: paisInstance, field: 'nombreCompleto', 'error')} ">
	<label for="nombreCompleto">
		<g:message code="pais.nombreCompleto.label" default="Nombre Completo" />
		
	</label>
	<g:textField name="nombreCompleto" value="${paisInstance?.nombreCompleto}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: paisInstance, field: 'estados', 'error')} ">
	<label for="estados">
		<g:message code="pais.estados.label" default="Estados" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${paisInstance?.estados?}" var="e">
    <li><g:link controller="estado" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="estado" action="create" params="['pais.id': paisInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'estado.label', default: 'Estado')])}</g:link>
</li>
</ul>

</div>

