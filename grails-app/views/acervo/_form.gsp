<%@ page import="biblioteca.grails.unirn.Acervo"%>

<div
	class="form-group ${hasErrors(bean: acervoInstance, field: 'titulo', 'has-error')} required">
	<label for="titulo"> <g:message code="acervo.titulo.label"
			default="Titulo" /> <span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="titulo" required=""
		value="${acervoInstance?.titulo}" />

</div>

<div
	class="form-group ${hasErrors(bean: acervoInstance, field: 'autor', 'has-error')} required">
	<label for="autor"> <g:message code="acervo.autor.label"
			default="Autor" /> <span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="autor" required=""
		value="${acervoInstance?.autor}" />

</div>

<div
	class="form-group ${hasErrors(bean: acervoInstance, field: 'emprestimos', 'has-error')} ">
	<label for="emprestimos"> <g:message
			code="acervo.emprestimos.label" default="Emprestimos" />

	</label>

	<ul>
		<g:each in="${acervoInstance?.emprestimos?}" var="e">
			<li><g:link controller="emprestimo" action="show" id="${e.id}">
					${e?.encodeAsHTML()}
				</g:link></li>
		</g:each>
		<li class="add"><g:link controller="emprestimo" action="create"
				params="['acervo.id': acervoInstance?.id]">
				${message(code: 'default.add.label', args: [message(code: 'emprestimo.label', default: 'Emprestimo')])}
			</g:link></li>
	</ul>


</div>

<div
	class="form-group ${hasErrors(bean: acervoInstance, field: 'tipoAcervo', 'has-error')} required">
	<label for="tipoAcervo"> <g:message
			code="acervo.tipoAcervo.label" default="Tipo Acervo" /> <span
		class="required-indicator">*</span>
	</label>
	<g:select id="tipoAcervo" name="tipoAcervo.id"
		from="${biblioteca.grails.unirn.TipoAcervo.list()}"
		optionKey="id" required=""
		value="${acervoInstance?.tipoAcervo?.id}"
		noSelection="['':'- Escolher TipoAcervo -']" optionValue="descricao"
		class="form-control" />

</div>
