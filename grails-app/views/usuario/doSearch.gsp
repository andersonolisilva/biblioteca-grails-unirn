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
			<td><a href="#" class="btn btn-danger" onclick="excluir('${usuarioInstance.id}')">Remover</a></td>
		</tr>
		</g:each>
	</tbody>
</table>