<%@ page import="biblioteca.grails.unirn.TipoAcervo"%>

<html>
	<head>
		<meta name="layout" content="main" />
		<g:javascript library="prototype" />
	</head>
	<body>
		Buscar:
		<g:formRemote name="ajaxForm" url="[controller:'tipoAcervo', action:'doSearch']">
			<table>
				<tr>
					<td>Descrição:</td>
					<td><input type="text" name="descricao" value="${tipoAcervo?.descricao}" /></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Search" /></td>
				</tr>
			</table>
		</g:formRemote>
	</body>
</html>
