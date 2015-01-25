<%@ page import="biblioteca.grails.unirn.Usuario" %>



<div class="form-group ${hasErrors(bean: usuarioInstance, field: 'email', 'has-error')} required">
	<label for="email">
		<g:message code="usuario.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field class="form-control" type="email" name="email" required="" value="${usuarioInstance?.email}"/>

</div>

<div class="form-group ${hasErrors(bean: usuarioInstance, field: 'emprestimos', 'has-error')} ">
	<label for="emprestimos">
		<g:message code="usuario.emprestimos.label" default="Emprestimos" />
		
	</label>
	
<ul>
<g:each in="${usuarioInstance?.emprestimos?}" var="e">
    <li><g:link controller="emprestimo" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="emprestimo" action="create" params="['usuario.id': usuarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'emprestimo.label', default: 'Emprestimo')])}</g:link>
</li>
</ul>


</div>

<div class="form-group ${hasErrors(bean: usuarioInstance, field: 'nome', 'has-error')} required">
	<label for="nome">
		<g:message code="usuario.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="nome" required="" value="${usuarioInstance?.nome}"/>

</div>

<div class="form-group ${hasErrors(bean: usuarioInstance, field: 'senha', 'has-error')} required">
	<label for="senha">
		<g:message code="usuario.senha.label" default="Senha" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="senha" required="" value="${usuarioInstance?.senha}"/>

</div>

