<g:if test="${tipoAcervoInstanceList.size() > 0}">
<table class="table table-striped">
	<thead>
		<tr>
			<th>Descricao</th>
			<th>&nbsp;</th>
			<th>&nbsp;</th>
		</tr>
	</thead>
	<tbody>
		<g:each var="tipoAcervoInstance" in="${tipoAcervoInstanceList}">
		<tr>
			<td>${tipoAcervoInstance.descricao}</td>
			<td><g:remoteLink controller="tipoAcervo" action="alterar" update="divForm" id="${tipoAcervoInstance.id}">Alterar</g:remoteLink></td>
			<td><a href="#" onclick="excluir('${tipoAcervoInstance.id}')">Excluir</a></td>
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
</g:if>
<g:else>
	Não há
</g:else>
<g:paginate total="${tipoAcervoInstanceCount ?: 0}" />
