
<%@ page import="biblioteca.grails.unirn.TipoAcervo"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'tipoAcervo.label', default: 'TipoAcervo')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
<g:javascript library="jquery" />
<script type="text/javascript">
	function carregarLista() {
		<g:remoteFunction controller="tipoAcervo" action="lista" update="divLista" />
	}
	function excluir(id) {
		if (confirm("Deseja realmente excluir?")) {
			<g:remoteFunction controller="tipoAcervo" action="excluir" update="divLista" id="'+id+'" />
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
			<h1 class="page-header">
				<g:message code="default.list.label" args="[entityName]" />
			</h1>
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


		<%-- <g:remoteLink controller="tipoAcervo" action="adicionar" update="divForm">Adicionar</g:remoteLink>
		
		<div id="divLista">
			<g:render template="lista" model="{tipoAcervoInstanceList: tipoAcervoInstanceList}"></g:render>
		</div>
		
		<div id="divForm">
			
		</div> --%>

		<div class="col-lg-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<i class="fa fa-search fa-fw"></i>Buscar TipoAcervo
				</div>
				<div class="panel-body">
					<g:formRemote name="frmBuscarTipoAcervo"
						url="[controller:'tipoAcervo', action:'doSearch']"
						update="divLista">
					<label for="descricao"> <g:message
							code="tipoAcervo.descricao.label" default="Descri&ccedil;&atilde;o" /> <span
						class="required-indicator">*</span>
					</label> <input type="text" name="descricao"
							value="${tipoAcervo?.descricao}" class="form-control" /> <br />
						<input type="submit" name="btnBuscar" value="Buscar"
							class="btn btn-default" />
					</g:formRemote>
				</div>
			</div>
		</div>

		<div class="col-lg-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<i class="fa fa-list-alt fa-fw"></i>
					<g:message code="default.list.label" args="[entityName]" />
					<div class="pull-right">
						<g:remoteLink class="btn btn-default btn-xs"
							controller="tipoAcervo" action="adicionar" update="divForm">
							<g:message code="default.new.label" args="[entityName]" />
						</g:remoteLink>
					</div>
				</div>

				<div class="panel-body" id="divLista">
					<g:render template="lista"
						model="[tipoAcervoInstanceList: tipoAcervoInstanceList]"></g:render>
				</div>
			</div>
		</div>
	</div>
	<div class="row">

		<div id="divForm"></div>
	</div>
</body>
</html>
