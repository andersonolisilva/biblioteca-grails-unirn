
<%@ page import="biblioteca.grails.unirn.Emprestimo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'emprestimo.label', default: 'Emprestimo')}" />
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
			            
							
								<g:if test="${emprestimoInstance?.acervo}">
									<div class="panel panel-default">
										<div class="panel-heading">
											<g:message code="emprestimo.acervo.label" default="Acervo" />
										</div>
										<div class="panel-body">
											
												<g:link controller="acervo" action="show" id="${emprestimoInstance?.acervo?.id}">${emprestimoInstance?.acervo?.encodeAsHTML()}</g:link></span>
											
										</div>
									</div>
								</g:if>
							
								<g:if test="${emprestimoInstance?.dataEmprestimo}">
									<div class="panel panel-default">
										<div class="panel-heading">
											<g:message code="emprestimo.dataEmprestimo.label" default="Data Emprestimo" />
										</div>
										<div class="panel-body">
											
												<g:formatDate date="${emprestimoInstance?.dataEmprestimo}" /></span>
											
										</div>
									</div>
								</g:if>
							
								<g:if test="${emprestimoInstance?.usuario}">
									<div class="panel panel-default">
										<div class="panel-heading">
											<g:message code="emprestimo.usuario.label" default="Usuario" />
										</div>
										<div class="panel-body">
											
												<g:link controller="usuario" action="show" id="${emprestimoInstance?.usuario?.id}">${emprestimoInstance?.usuario?.encodeAsHTML()}</g:link></span>
											
										</div>
									</div>
								</g:if>
							
						
		            	<g:link class="btn btn-warning" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
		            	<g:link class="btn btn-default" action="edit" resource="${emprestimoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:form url="[resource:emprestimoInstance, action:'delete']" method="DELETE">
							<g:actionSubmit class="btn btn-danger pull-right" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						</g:form>
		            </div>
	            </div>
            </div>
		</div>
	</body>
