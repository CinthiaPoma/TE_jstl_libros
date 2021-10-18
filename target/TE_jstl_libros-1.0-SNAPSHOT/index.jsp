<%@page import="com.emergente.modelo.Libros"%>
<%@page import="com.emergente.modelo.GestorLibro"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    if(session.getAttribute("registro")==null){
    GestorLibro objeto1=new GestorLibro();
    objeto1.insertarLibro(new Libros(1,"El hombrecillo dela lluvia","Gianni Rodai","es un hombrecillo ligero que vive en la nube ","Fisico"));
    session.setAttribute("registro", objeto1);
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSTL - Registro</title>
    </head>
    <body>
        <h1>REGISTRO DE LIBROS</h1>
        <a href="Controller?op=nuevo">Nuevo</a>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Titulo</th>
                <th>Autor</th>
                <th>Resumen</th>
                <th>Medio</th>
                <th></th>
                <th></th>
            </tr>
            <c:forEach var="item" items="${sessionScope.registro.getLista()}">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.titulo}</td>
                    <td>${item.autor}</td>
                    <td>${item.resumen}</td>
                    <td>${item.medio}</td>
                    <td><a href="Controller?op=modificar&id=${item.id}">Modificar</a></td>
                    <td><a href="Controller?op=eliminar&id=${item.id}">Elimiar</a></td>
                </tr>
            </c:forEach>
              
        </table>
    </body>
</html>
