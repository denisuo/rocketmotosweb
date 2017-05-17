<!DOCTYPE html>
<%@page import="br.com.rocketmotos.servlet.ServletMarcaMoto"%>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Altera��o de Marca de Moto</title>

<link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrap-3.3.7-dist/css/style.css" rel="stylesheet">

<script src="bootstrap-3.3.7-dist/js/jquery.min.js"></script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<script type="text/javascript">
function exibirAlteracao(){
	document.getElementById("<%=ServletMarcaMoto.NM_EVENTO%>").value = "<%=ServletMarcaMoto.NM_EVENTO_EXIBIR_ALTERACAO%>";
	//if(document.getElementById("nomeMarca").value == ""){
	//	alert('ABCD');
	//	return false;
	//}
}
</script>
</head>
<%
	String cdMarcaMoto = (String) request.getAttribute(ServletMarcaMoto.NM_PARAMETRO_CodigoMarcaMoto);
	String nmMarcaMoto = (String) request.getAttribute(ServletMarcaMoto.NM_PARAMETRO_NomeMarcaMoto);
%>

<input type="hidden" id="<%=ServletMarcaMoto.NM_EVENTO%>" name="<%=ServletMarcaMoto.NM_EVENTO%>" value="">

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand">Rocket Motos Web</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">In�cio</a></li>
					<li><a href="#">Op��es</a></li>
					<li><a href="#">Perfil</a></li>
					<li><a href="#">Ajuda</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<br><br><br>
	<div id="main" class="container-fluid">
		<h3 class="page-header">Adicionar Marca Moto</h3>
		<form class="form-horizontal" action="ServletMarcaMoto" method="post">
			<fieldset>
				<div style="background-color: #4ED4E8"></div>
				<div class="form-group">
					<label class="col-md-4 control-label">C�digo</label>
					<div class="col-md-3">
						<input id="cdMarcaMoto" name="cdMarcaMoto" value="<%=cdMarcaMoto%>" readonly="readonly">
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label">Nome</label>
					<div class="col-md-3">
						<input id="nmMarcaMoto" name="nmMarcaMoto" value="<%=nmMarcaMoto%>" type="text" placeholder="Nome do fabricante" class="form-control input-md" required="" maxlength="50">
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label"></label>
					<div class="col-md-4">
						<button id="btnIncluir" name="btnIncluir" class="btn btn-success">Incluir</button>
						<a id="btnCancelar" name="btnCancelar" class="btn btn-default" href="template.jsp">Cancelar</a>
					</div>
				</div>
		
			</fieldset>
		</form>
		
	</div>
</body>
</html>