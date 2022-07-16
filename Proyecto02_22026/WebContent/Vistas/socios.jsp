<%@page import="Clases.SociosDAO"  %>
<%@page import="Clases.Socios"%>
<%@page import="java.util.List"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<meta charset="utf-8">
    <script language="javascript">
        function doSearch()
        {
            const tableReg = document.getElementById('datos');
            const searchText = document.getElementById('searchTerm').value.toLowerCase();
            let total = 0;
 
            // Recorremos todas las filas con contenido de la tabla
            for (let i = 1; i < tableReg.rows.length; i++) {
                // Si el td tiene la clase "noSearch" no se busca en su cntenido
                if (tableReg.rows[i].classList.contains("noSearch")) {
                    continue;
                }
 
                let found = false;
                const cellsOfRow = tableReg.rows[i].getElementsByTagName('td');
                // Recorremos todas las celdas
                for (let j = 0; j < cellsOfRow.length && !found; j++) {
                    const compareWith = cellsOfRow[j].innerHTML.toLowerCase();
                    // Buscamos el texto en el contenido de la celda
                    if (searchText.length == 0 || compareWith.indexOf(searchText) > -1) {
                        found = true;
                        total++;
                    }
                }
                if (found) {
                    tableReg.rows[i].style.display = '';
                } else {
                    // si no ha encontrado ninguna coincidencia, esconde la
                    // fila de la tabla
                    tableReg.rows[i].style.display = 'none';
                }
            }
 
            // mostramos las coincidencias
            const lastTR=tableReg.rows[tableReg.rows.length-1];
            const td=lastTR.querySelector("td");
            lastTR.classList.remove("hide", "red");
            if (searchText == "") {
                lastTR.classList.add("hide");
            } else if (total) {
                td.innerHTML="Se ha encontrado "+total+" coincidencia"+((total>1)?"s":"");
            } else {
                lastTR.classList.add("red");
                td.innerHTML="No se han encontrado coincidencias";
            }
        }
    </script> 
    <style>
    
    	.fondo{
	    	background: #283c86;  /* fallback for old browsers */
			background: -webkit-linear-gradient(to right, #45a247, #283c86);  /* Chrome 10-25, Safari 5.1-6 */
			background: linear-gradient(to right, #45a247, #283c86); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	    }
    
    </style>

</head>
<body class="fondo" >
	<h1 class="text-center"><ins>Listado de Socios</ins></h1>
	<div  class="container" >
			<div class="row" >
				
					<a class="btn btn-primary col-4 m-4 text-center" href="SociosController?accion=nuevo">Agregar Socio</a>
		
					<table class="table "  id="datos" class="table table-bordered">
					<thead >
						<th >Id</th>
						<th >Nombre</th>
						<th >Apellido</th>
						<th >DNI</th>				
						<th >Mail</th>		
						<th >Estado</th>			
						<th >Modificar</th>
						<th >Eliminar</th>				
					</thead>
					<%
					List<Socios> resultado=null;
					SociosDAO socio=new SociosDAO();
					resultado=socio.listarSocios();
						
					for(int i=0;i<resultado.size();i++)
					{
					String ruta="SociosController?accion=modificar&id="+resultado.get(i).getId_socio();	
					String rutaE="SociosController?accion=eliminar&id="+resultado.get(i).getId_socio();
					%>
					<%
					String estadoo=null;
					
					if(resultado.get(i).getEstado()==1){
					estadoo="Presente";}
					else if(resultado.get(i).getEstado()>1){
					estadoo="Ausente";
					}
					%>		
					<tr class=<% if(estadoo=="Presente"){%>"table-dark"<%}else if(estadoo=="Ausente"){%>"table-danger " <%} %>>
						<td ><%=resultado.get(i).getId_socio()%></td>				
						<td ><%=resultado.get(i).getNombre() %></td>				
						<td ><%=resultado.get(i).getApellido() %></td>
						<td ><%=resultado.get(i).getDni()%></td>
						<td ><%=resultado.get(i).getMail()%></td>	
						<td ><%=estadoo%></td>						
						<td class="text-center"><a href=<%=ruta %>> <i class="fa-solid fa-arrow-right-arrow-left"></i> </a></td>
						<td class="text-center"><a href=<%=rutaE%>><i class="fa-solid fa-arrow-down"></i> </a></td>
					</tr>	
					
							
					<%
					}
					%>
					<tr class='noSearch hide'>
	                	<td colspan="8"></td>
	            	</tr>
	            	
					</table>
					
					<form>
				        <b>BUSCAR :</b> <input id="searchTerm" placeholder="Ej=Jose" type="text" onkeyup="doSearch()" />
				    </form>
			</div>
	</div>

</body>
</html>