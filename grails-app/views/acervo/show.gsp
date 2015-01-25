
<%@ page import="biblioteca.grails.unirn.Acervo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'acervo.label', default: 'Acervo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	
	
	
		<div class="row">
          <div class="col-lg-12">
              <h1 class="page-header"><g:message code="default.show.label" args="[entityName]" /></h1>
          </div>
          <!-- /.col-lg-12 -->
		</div>
		<div class="row">
			<ol class="breadcrumb">
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li class="active"><g:message code="default.show.label" args="[entityName]" /></li>
			</ol>
			<g:if test="${flash.message}">
				<div class="alert alert-warning alert-dismissible" role="alert">
				  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				  ${flash.message}
				</div>
			</g:if>
			<div class="col-lg-12">
		        <div class="panel panel-primary">
		            <div class="panel-heading">
	                	<i class="fa fa-list-alt fa-fw"></i><g:message code="default.show.label" args="[entityName]" />
		            </div>
		            <div class="panel-body">
			            
							
								<g:if test="${acervoInstance?.titulo}">
									<div class="panel panel-default">
										<div class="panel-heading">
											<g:message code="acervo.titulo.label" default="Titulo" />
										</div>
										<div class="panel-body">
											
												<g:fieldValue bean="${acervoInstance}" field="titulo"/>
											
										</div>
									</div>
								</g:if>
							
								<g:if test="${acervoInstance?.autor}">
									<div class="panel panel-default">
										<div class="panel-heading">
											<g:message code="acervo.autor.label" default="Autor" />
										</div>
										<div class="panel-body">
											
												<g:fieldValue bean="${acervoInstance}" field="autor"/>
											
										</div>
									</div>
								</g:if>
							
								<g:if test="${acervoInstance?.emprestimos}">
									<div class="panel panel-default">
										<div class="panel-heading">
											<g:message code="acervo.emprestimos.label" default="Emprestimos" />
										</div>
										<div class="panel-body">
											
												<g:each in="${acervoInstance.emprestimos}" var="e">
													<g:link controller="emprestimo" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
												</g:each>
											
										</div>
									</div>
								</g:if>
							
								<g:if test="${acervoInstance?.tipoAcervo}">
									<div class="panel panel-default">
										<div class="panel-heading">
											<g:message code="acervo.tipoAcervo.label" default="Tipo Acervo" />
										</div>
										<div class="panel-body">
											
												<g:link controller="tipoAcervo" action="show" id="${acervoInstance?.tipoAcervo?.id}">${acervoInstance?.tipoAcervo?.encodeAsHTML()}</g:link></span>
											
										</div>
									</div>
								</g:if>
							
						
		            	<g:link class="btn btn-warning" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
		            	<g:link class="btn btn-default" action="edit" resource="${acervoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:form url="[resource:acervoInstance, action:'delete']" method="DELETE">
							<g:actionSubmit class="btn btn-danger pull-right" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						</g:form>
		            </div>
	            </div>
            </div>
		</div>
	</body>
