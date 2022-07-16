<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Nuevo Socio</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

	<style>
    
    	.fondo{
	    	background: #283c86;  /* fallback for old browsers */
			background: -webkit-linear-gradient(to right, #45a247, #283c86);  /* Chrome 10-25, Safari 5.1-6 */
			background: linear-gradient(to right, #45a247, #283c86); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	    }
    
    </style>
	


</head>
<body class="fondo">

	<div class="container">
		<h1 class="text-center" ><ins>Añadir Socio</ins></h1>

		<div class="row" >

			<form class="p-5" action="SociosController?accion=insert" method="post">
			
			<div class="mb-3">
				<label for="nombre" class="form-label" ><b>Nombre</b></label>
				<input type="text" class="form-control" id="nombre" name="nombre" >
			</div>
			
			<div class="mb-3">
				<label for="apellido" class="form-label" ><b>Apellido</b></label>
				<input type="text" class="form-control" id="apellido" name="apellido" >
			</div>
			
			<div class="mb-3">
				<label for="dni" class="form-label" ><b>DNI:</b></label>
				<input type="text" class="form-control" id="dni" name="dni" >
			</div>
			
			<div class="mb-3">
				<label for="mail" class="form-label" ><b>Mail:</b></label>
				<input type="text" class="form-control" id="mail" name="mail" >
			</div>	
			
			<div class="mb-3">
				<label for="estado" class="form-label" ><b>Estado:      1=Presente     2=Ausente</b></label>
				<select type="text" class="form-control" id="mail" name="estado">
						<option>1</option>
						<option>2</option>
				</select>
			</div>			
			
			<button type="submit" class="btn btn-primary">Insertar</button>
			<a class="btn btn-danger col-1 m-4" href="SociosController?SociosController">Cancelar</a>
			
			
			
			</form>
		</div>	
	
	
	</div>

</body>
</html>