
<%@ page import="biblioteca.grails.unirn.Usuario"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'usuario.label', default: 'Usuario')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
<g:javascript library="jquery" />
<script type="text/javascript">
	function carregarLista() {
		<g:remoteFunction controller="usuario" action="lista" update="divLista" />
	}
	function excluir(id) {
		if (confirm("Deseja realmente excluir?")) {
			<g:remoteFunction controller="usuario" action="excluir" update="divLista" id="'+id+'" />
		}
	}
	function cancelar() {
		jQuery("#divForm").html("")
	}
</script>
<g:javascript library="prototype" />
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Resultado da Busca</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<g:if test="${flash.message}">
			<div class="alert alert-warning alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				${flash.message}
			</div>
		</g:if>
		<div class="panel-body" id="divLista">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<i class="fa fa-list-alt fa-fw"></i>
					Usu&aacute;rio Encontrado
				</div>
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
								<td>
									${usuarioInstance?.nome}
								</td>
								<td>
									${usuarioInstance?.email}
								</td>
								<td><g:remoteLink class="btn btn-default"
										controller="usuario" action="alterar" update="divForm"
										id="${usuarioInstance.id}">Editar</g:remoteLink></td>
								<td><a href="#" class="btn btn-danger"
									onclick="excluir('${usuarioInstance.id}')">Remover</a></td>
							</tr>
						</g:each>
					</tbody>
				</table>
			</div>
		</div>
</body>
</html>