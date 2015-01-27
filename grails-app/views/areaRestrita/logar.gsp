<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Área restrita - Biblioteca Grails - UniRN</title>
<style type="text/css">
	.negrito {font-weight: bold; font-size: 16px;}
	table tr td {line-height: 30px;}
	input[type=text],input[type=password] {padding: 0 6px; border: 1px solid #CCC; background: transparent; border-radius: 5px; box-shadow: 2px 2px 2px #CCC}
</style>
</head>
<body>
	<form action="${request.contextPath}/j_spring_security_check"
		method="post" id="frmlogar" name="frmLogar">

		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Fazer Login:</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>

		<div class="row">
			<div class="col-lg-12">
				<table>
					<tr>
						<td width="100" height="50" class="negrito">Usu&aacute;rio: 
						</td>
						<td>
							<input type="text" name="j_username"
							id="username" size="40" />
						</td>
					</tr>
					
					<tr>
						<td class="negrito">Senha: 
						</td>
						<td>
							<input type="password" name="j_password"
							id="password" size="40" />
						</td>
					</tr>
					<tr>
						<td colspan="2" style="padding-top:10px" align="right"><input type="submit" value="Entrar"
							class="btn btn-default" /></td>
					</tr>
				</table>
			</div>
			<!-- /.col-lg-12 -->
		</div>

	</form>
</body>

</html>
