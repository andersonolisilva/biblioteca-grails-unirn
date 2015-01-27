<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Área restrita - Biblioteca Grails - UniRN</title>
	</head>
	<body>
		<form action="${request.contextPath}/j_spring_security_check" method="post" id="frmlogar" name="frmLogar">
		
			<p>
				Usuário
				<input type="text" name="j_username" id="username" />
			</p>
			<p>
				Senha
				<input type="password" name="j_password" id="password" />
			</p>
			<input type="submit" value="Entrar" />
		</form>
	</body>
	
</html>
