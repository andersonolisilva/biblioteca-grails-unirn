<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta name="description" content="">
	    <meta name="author" content="">
		<title>Biblioteca Grails UniRN - <g:layoutTitle default="Grails"/></title>
		<asset:stylesheet src="application.css"/>
		<g:layoutHead/>
	</head>
	<body>
		<div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${g.createLink(uri:'/')}">Biblioteca Grails UniRN</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li class="divider"></li>
                        <li><a href="/biblioteca-grails-unirn/j_spring_security_logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                        <g:form name="frmBuscarTipoAcervo" controller="usuario" action="outraBusca">
                            <div class="input-group custom-search-form">
                                <input type="text" name="nome" class="form-control" placeholder="Buscar Usuario..." value="${tipoAcervo?.descricao}">
                                <span class="input-group-btn">
                                <button class="btn btn-default" name="btnBuscar" type="submit">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            </g:form>
                            <!-- /input-group -->

                        </li>
                        <li>
                            <a class="active" href="${g.createLink(uri:'/')}"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                        </li>
						<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
							<g:if test="${c.fullName?.startsWith("biblioteca.grails.unirn")}">
								<li><g:link controller="${c.logicalPropertyName}"><i class="fa fa-table fa-fw"></i> ${c.name}</g:link></li>
							</g:if>
						</g:each>					
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
        <div id="page-wrapper">
			<g:layoutBody/>
 		</div>
        <!-- /#page-wrapper -->
    </div>
	<asset:javascript src="application.js"/>		
	</body>
</html>
