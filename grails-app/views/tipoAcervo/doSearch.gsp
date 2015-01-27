<table>
	<tr>
		<td>Descricao</td>
	</tr>
	<g:each var="tipoAcervoInstance" in="${tipoAcervoInstanceList}">
		<tr>
			<td>${tipoAcervoInstance.descricao}</td>
		</tr>
	</g:each>
</table>
