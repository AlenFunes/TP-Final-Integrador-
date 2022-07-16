<%@page import="Clases.SociosDAO"  %>
<%@page import="Clases.Socios"%>
<%@page import="java.util.List"%>  


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modificar Socio</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

	<style>
    
    	.fondo{
    		background: #6190E8;  /* fallback for old browsers */
			background: -webkit-linear-gradient(to right, #A7BFE8, #6190E8);  /* Chrome 10-25, Safari 5.1-6 */
			background: linear-gradient(to right, #A7BFE8, #6190E8); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

    </style>


</head>
<body class="fondo">
	<div class="container">
		<h1 class="text-center"><ins>Modificar Socio</ins></h1>

		<div class="row" >
				<%
				String id=request.getParameter("id");
				int mid;
				mid=Integer.parseInt(id);				
				Socios resultado=null;
				SociosDAO  socio=new SociosDAO();
				resultado=socio.mostrarSocio(mid);				
				%>
		
		<form class="p-5" action="SociosController?accion=actualizar" method="post">
			
			<div class="mb-3">				
				<input type="hidden"  class="form-control" id="id" name="id"  value=<%=resultado.getId_socio() %> >
			</div>
					
			<div class="mb-3">
				<label for="nombre" class="form-label" ><b>Nombre</b></label>
				<input type="text" class="form-control" id="nombre" name="nombre"  value=<%=resultado.getNombre() %> >
			</div>
			
			<div class="mb-3">
				<label for="apellido" class="form-label" ><b>Apellido</b></label>
				<input type="text" class="form-control" id="apellido" name="apellido" value=<%=resultado.getApellido() %> >
			</div>
			
			<div class="mb-3">
				<label for="DNI" class="form-label" ><b>DNI</b></label>
				<input type="number" class="form-control" id="dni" name="dni" value=<%=resultado.getDni() %> >
			</div>
			
			<div class="mb-3">
				<label for="mail" class="form-label" ><b>mail</b></label>
				<input type="text" class="form-control" id="mail" name="mail" value=<%=resultado.getMail() %> >
			</div>

			<div class="mb-3">
				<label for="Estado" class="form-label" ><b>Estado:      1=Presente     2=Ausente</b></label>
				<select type="text" class="form-control" id="mail" name="estado" value=<%=resultado.getEstado() %>>
						<option>1</option>
						<option>2</option>
				</select>
			</div>
			
			<button type="submit" class="btn btn-primary">Modificar</button>
			<a class="btn btn-danger col-1 m-4"  href="SociosController?SociosController">Cancelar</a>
	
			</form>

		</div>	
	</div>

</body>
</html>