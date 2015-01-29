<%@ page import="biblioteca.grails.unirn.TipoAcervo"%>

<g:formRemote name="frmTipoAcervo"
	url="[controller: 'tipoAcervo', action: 'salvar']" update="divMensagem"
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
					<i class="fa fa-plus-circle fa-fw"></i>Criar TipoAcervo
				</div>
				<div class="panel-body">
				<label for="descricao"> <g:message
							code="tipoAcervo.descricao.label" default="Descri&ccedil;&atilde;o" /> <span
						class="required-indicator">*</span>
					</label> <input type="text" name="descricao"
					value="${tipoAcervoInstance.descricao}" class="form-control" /> <br /> <input type="submit"
					name="btnSalvar" value="Salvar" class="btn btn-default" /> <input type="button"
					name="btnCancelar" value="Cancelar" onclick="cancelar()" class="btn btn-default" /> <input
					type="hidden" name="id" value="${tipoAcervoInstance.id}" />
					<div id="divMensagem" style="color:red"></div>
				</div>
			</div>
		</div>
	</div>

</g:formRemote>
