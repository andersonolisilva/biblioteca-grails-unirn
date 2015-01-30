<%@ page import="biblioteca.grails.unirn.Usuario"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Welcome to Grails</title>
<g:javascript library="jquery" />
<script type="text/javascript">
	function carregarLista() {
		<g:remoteFunction controller="usuario" action="lista" update="divLista" />
	}
</script>
<style type="text/css">
	p {font-size: 1.5em}
</style>
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Biblioteca - Disciplina de Grails</h1>
			<p>Desenvolvido por:</p>
			<p>- Anderson Oliveira<br />
			- Daniel Olinto<br />
			- Plecyo Nahay</p>
			<br />
			<p>
				- Os usu&aacute;rios que podem fazer login est&atilde;o em Conf -> BootStrap.groovy
			</p>
			<br />
			<p>
				- As 2 buscas com AJAX est&atilde;o apenas em Usu&aacute;rios e TipoAcervo.
			</p>
			<br />
			<p>
				- Nos menus Dashboard e Emprestimo n&atilde;o &eacute; necess&aacute;rio est&aacute; logado<br />
				- Nos demais &eacute; necess&aacute;rio est&aacute;  
			</p>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
</body>
</html>
