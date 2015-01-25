<%@ page import="biblioteca.grails.unirn.Emprestimo" %>



<div class="form-group ${hasErrors(bean: emprestimoInstance, field: 'acervo', 'has-error')} required">
	<label for="acervo">
		<g:message code="emprestimo.acervo.label" default="Acervo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="acervo" name="acervo.id" from="${biblioteca.grails.unirn.Acervo.list()}" optionKey="id" required="" value="${emprestimoInstance?.acervo?.id}" class="form-control"/>

</div>

<div class="form-group ${hasErrors(bean: emprestimoInstance, field: 'dataEmprestimo', 'has-error')} required">
	<label for="dataEmprestimo">
		<g:message code="emprestimo.dataEmprestimo.label" default="Data Emprestimo" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataEmprestimo" precision="day"  value="${emprestimoInstance?.dataEmprestimo}"  />

</div>

<div class="form-group ${hasErrors(bean: emprestimoInstance, field: 'usuario', 'has-error')} required">
	<label for="usuario">
		<g:message code="emprestimo.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="usuario.id" from="${biblioteca.grails.unirn.Usuario.list()}" optionKey="id" required="" value="${emprestimoInstance?.usuario?.id}" class="form-control"/>

</div>

