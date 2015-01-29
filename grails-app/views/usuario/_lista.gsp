<table class="table table-striped">
	<thead>
		<tr>
			
			<g:sortableColumn property="nome"
									title="${message(code: 'usuario.nome.label', default: 'Nome')}" />
			<g:sortableColumn property="email"
									title="${message(code: 'usuario.email.label', default: 'E-mail')}" />
			<th>&nbsp;</th>
			<th>&nbsp;</th>
			<th>&nbsp;</th>
		</tr>
	</thead>
	<tbody>
		<g:each var="usuarioInstance" in="${usuarioInstanceList}">
		<tr>
			<td>${usuarioInstance?.nome}</td>
			<td>${usuarioInstance?.email}</td>
			<td><g:remoteLink class="btn btn-default" controller="usuario" action="alterar" update="divForm" id="${usuarioInstance.id}">Editar</g:remoteLink></td>
			<td><a href="#" class="btn btn-danger" onclick="excluir('${usuarioInstance.id}')">Remover</a>
			
				
			</td>
		</tr>
		</g:each>
	</tbody>

	<%--<thead>
		<tr>

			<g:sortableColumn property="descricao"
				title="${message(code: 'tipoAcervo.descricao.label', default: 'Descricao')}" />

			<th>&nbsp;</th>
			<th>&nbsp;</th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${tipoAcervoInstanceList}" status="i"
			var="tipoAcervoInstance">
			<tr>

				<td><g:link action="show" resource="${tipoAcervoInstance}">
						${fieldValue(bean: tipoAcervoInstance, field: "descricao")}
					</g:link></td>
					<td>
						<g:remoteLink controller="tipoAcervo" action="alterar" update="divForm" id="${tipoAcervoInstance.id}"><g:message code="default.button.edit.label" default="Edit" /></g:remoteLink>
					</td>
					<td>	
						
					</td>
				<td><g:link class="btn btn-default" action="edit"
						resource="${tipoAcervoInstance}">
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link></td>
				<td><g:form
						url="[resource:tipoAcervoInstance, action:'delete']"
						method="DELETE">
						<g:actionSubmit class="btn btn-danger" action="delete"
							value="${message(code: 'default.button.delete.label', default: 'Delete')}"
							onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</g:form></td>
			</tr>
		</g:each>
	</tbody>
--%></table>
<g:paginate total="${usuarioInstanceCount ?: 0}" />
