<%@ page import="biblioteca.grails.unirn.TipoAcervo" %>



<div class="form-group ${hasErrors(bean: tipoAcervoInstance, field: 'descricao', 'has-error')} required">
	<label for="descricao">
		<g:message code="tipoAcervo.descricao.label" default="Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="descricao" required="" value="${tipoAcervoInstance?.descricao}"/>

</div>

