<%@ page import="biblioteca.grails.unirn.Usuario" %>


<g:formRemote name="frmUsuario"
	url="[controller: 'usuario', action: 'salvar']" update="divMensagem"
	onSuccess="carregarLista()">

	<%--<div
		class="form-group ${hasErrors(bean: tipoAcervoInstance, field: 'descricao', 'has-error')} required">

		<label for="descricao"> <g:message
				code="tipoAcervo.descricao.label" default="Descricao" /> <span
			class="required-indicator">*</span>
		</label> <input class="form-control" type="text" name="descricao"
			value="${tipoAcervoInstance?.descricao}" required="required" /><br />
			<input class="btn btn-default" type="submit" name="btnSalvar"
			value="Salvar" /> 
			<input class="btn btn-default" type="button"
			name="btnCancelar" value="Cancelar" onclick="cancelar()" /> 
			<input
			type="hidden" name="id" value="" />
	</div>
--%>
	<div class="col-lg-12">
		<div>
			<div class="panel panel-primary">
				<div class="panel-heading">
					<i class="fa fa-plus-circle fa-fw"></i>Criar Usu&aacute;rio
				</div>
				<div class="panel-body">
				<label for="email"> <g:message
							code="usuario.email.label" default="E-mail" /> <span
						class="required-indicator">*</span>
					</label> <input type="text" name="email"
					value="${usuarioInstance.email}" class="form-control" /> <br />
					
				<label for="nome"> <g:message
							code="usuario.nome.label" default="Nome" /> <span
						class="required-indicator">*</span>
					</label> <input type="text" name="nome"
					value="${usuarioInstance.nome}" class="form-control" /> <br />
					
				<label for="senha"> <g:message
							code="usuario.senha.label" default="Senha" /> <span
						class="required-indicator">*</span>
					</label> <input type="text" name="senha"
					value="${usuarioInstance.senha}" class="form-control" /> <br />
					
					 <input type="submit"
					name="btnSalvar" value="Salvar" class="btn btn-default" /> <input type="button"
					name="btnCancelar" value="Cancelar" onclick="cancelar()" class="btn btn-default" /> <input
					type="hidden" name="id" value="${usuarioInstance.id}" />
					<div id="divMensagem" style="color:red"></div>
				</div>
			</div>
		</div>
	</div>

</g:formRemote>

<%--
<div class="form-group ${hasErrors(bean: usuarioInstance, field: 'email', 'has-error')} required">
	<label for="email">
		<g:message code="usuario.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field class="form-control" type="email" name="email" required="" value="${usuarioInstance?.email}"/>

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
 --%>
