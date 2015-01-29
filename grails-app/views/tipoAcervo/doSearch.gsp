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
				<td>
					${tipoAcervoInstance?.descricao}
				</td>
				<td><g:remoteLink class="btn btn-default" controller="tipoAcervo" action="alterar"
						update="divForm" id="${tipoAcervoInstance.id}">Alterar</g:remoteLink></td>
				<td><a href="#" class="btn btn-danger" onclick="excluir('${tipoAcervoInstance.id}')">Excluir</a></td>
			</tr>
		</g:each>
	</tbody>
</table>