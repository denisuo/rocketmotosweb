<!DOCTYPE html>
<%@page import="br.com.rocketmotos.dominio.DominioSimNao"%>
<%@page import="br.com.rocketmotos.entidade.EntidadeOrdemServico"%>
<%@page import="br.com.rocketmotos.servlet.ServletOrdemServico"%>
<%@page import="java.util.ArrayList"%>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Consulta de Ordem de Servi�o</title>

</head>
<script type="text/javascript">

//monta o link para redirecionar para itemOrdemServico com cdOrdemServico do radio button selecionado
function recuperarLink(){
	return "${pageContext.request.contextPath}\\ServletItemOrdemServico?evento=consultarTodos&cdOrdemServico="
		+ $("input[name='cdOrdemServico']:checked").val();
}

function consultar(){
	document.getElementById("<%=ServletOrdemServico.NM_EVENTO%>").value = "<%=ServletOrdemServico.NM_EVENTO_CONSULTAR_TODOS%>";
}

function excluir(){
	document.getElementById("<%=ServletOrdemServico.NM_EVENTO%>").value = "<%=ServletOrdemServico.NM_EVENTO_EXCLUIR%>";
}

function exibirAlteracao(){
	document.getElementById("<%=ServletOrdemServico.NM_EVENTO%>").value = "<%=ServletOrdemServico.NM_EVENTO_EXIBIR_ALTERACAO%>";
}

function exibirInclusao(){
	document.getElementById("<%=ServletOrdemServico.NM_EVENTO%>").value = "<%=ServletOrdemServico.NM_EVENTO_EXIBIR_INCLUSAO%>";
}

function gerarPdf(){
	$("input[name='cdOrdemServico']:checked").val();
	document.getElementById("<%=ServletOrdemServico.NM_EVENTO%>").value = "<%=ServletOrdemServico.NM_EVENTO_GERAR_RELATORIO%>";
}

function fecharOrdemServico(){
	$("input[name='cdOrdemServico']:checked").val();
	document.getElementById("<%=ServletOrdemServico.NM_EVENTO%>").value = "<%=ServletOrdemServico.NM_EVENTO_CALCULAR_ORDEM_SERVICO%>";
}


</script>
<%
	ArrayList<EntidadeOrdemServico> alOrdemServico;
	
	alOrdemServico = (ArrayList<EntidadeOrdemServico>) request.getAttribute(ServletOrdemServico.NM_PARAMETRO_ArrayOrdemServico);
	
	if(alOrdemServico == null){
		alOrdemServico = new ArrayList<EntidadeOrdemServico>();
	}
%>
<body>
<jsp:include page="/template.jsp"/>

<div id="main" class="container-fluid">
<h3 class="page-header">Consultar Ordem de Servi�o</h3>
<form class="form-horizontal" action="ServletOrdemServico" method="post">

<div id="barraPesquisa" class="row">
    <div class="col-md-3">
    </div>
 
    <div class="col-md-6">
        <div class="input-group h2">
            <input id="cdOrdemServicoBusca" name="cdOrdemServicoBusca" class="form-control" type="text" placeholder="Pesquisar por codigo da ordem de servi�o">
            <span class="input-group-btn">
                <button class="btn btn-primary" type="submit" onclick="consultar();">
                    <span class="glyphicon glyphicon-search"></span>
                </button>
            </span>
        </div>
    </div>
    <div class="col-md-3">
		<button class="btn btn-primary pull-center h1" type="submit" onclick="exibirInclusao();">Incluir</button>
    </div>
</div>

<input type="hidden" id="<%=ServletOrdemServico.NM_EVENTO%>" name="<%=ServletOrdemServico.NM_EVENTO%>" value="">
<input type="hidden" id="cdOrdemHidden" name="cdOrdemHidden" value="">
	<div class="container">
	  
	  <%if(!alOrdemServico.isEmpty()){ %>
	  <table class="table table-striped">
		<thead>
			<tr>
				<th>C�digo</th>
				<th>Placa Moto</th>
				<th>Data</th>
				<th>Indicador Or�amento</th>
				<th>Valor</th>
			</tr>
		</thead>
		<tbody>
	    <%
			for(EntidadeOrdemServico eServico : alOrdemServico){
		%>
			<tr>
				<td><input type="radio" id="cdOrdemServico" name="cdOrdemServico" value="<%=eServico.getCodigo()%>">&nbsp<%=eServico.getCodigo()%></td>
				<td><%=eServico.getPlacaMoto()%></td>
				<td><%=eServico.getData()%></td>
				<td><%=DominioSimNao.getInstance().getValor(eServico.getIndicadorOrcamento())%></td>
				<td><%=eServico.getValor()%></td>
			</tr>
	        
		<%} %>
	    </tbody>
	  </table>
	  <%} %>
	 
	   <%if(!alOrdemServico.isEmpty()){ %>
	  <div class="container" align="center">
	  	<td>
	  		<input type="button" class="btn btn-warning btn-xs" value="Incluir Itens" onclick='window.location.href=recuperarLink();'>
	  		<button class="btn btn-warning btn-xs" type="submit" onclick="fecharOrdemServico();">Fechar OS</button>
	  		<button class="btn btn-warning btn-xs" type="submit" onclick="gerarPdf();">Gerar PDF</button>
			<!--  <button id="btnAlterar" name="btnAlterar" class="btn btn-warning btn-xs" onclick="exibirAlteracao();">Alterar</button>
			<button id="btnExcluir" name="btnExcluir" class="btn btn-danger btn-xs" onclick="excluir();">Excluir</button>-->
		</td>
	  <%} %>
	  </div>
	  
	</div>
</form>
</div>

</body>
</html>