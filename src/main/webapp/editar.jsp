<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSTL -Libro</title>
    </head>
    <body>
        <h1>
            <c:if test="${requestScope.op== 'nuevo'}" var="res" scope="request">
                REGISTRO DE 
            </c:if>
            <c:if test="${requestScope.op== 'modificar'}" var="res" scope="request">
                MODIFICAR
            </c:if>
            LIBROS
        </h1>
        <jsp:useBean id="miLibro" scope="request" class="com.emergente.modelo.Libros"/>
        <form action="Controller" method="post">
            <table>
                <tr>
                    <td>Id</td>
                    <td><input type="text" name="id" 
                               value="<jsp:getProperty name="miLibro" property="id"/>">
                    </td>
                </tr>
                <tr>
                    <td>Titulo</td>
                    <td><input type="text" name="titulo" 
                               value="<jsp:getProperty name="miLibro" property="titulo"/>">
                    </td>
                </tr>
                <tr>
                    <td>Autor</td>
                    <td><input type="text" name="autor" 
                               value="<jsp:getProperty name="miLibro" property="autor"/>">
                    </td>
                </tr>
                <tr>
                    <td>Resumen</td>
                    <td><input type="text" name="resumen" 
                               value="<jsp:getProperty name="miLibro" property="resumen"/>">
                    </td>
                </tr>
                <tr>
                    <td>Medio</td>
                    <td><input type="radio" name="medio"  value="Fisico"
                               
                               <c:if test="${miLibro.medio=='Fisico'}" var="res" scope="request">
                                          radio
                                      </c:if>
                                          >Fisico
                       <input type="radio" name="medio"  value="Magnetico"
                               
                               <c:if test="${miLibro.medio=='Magnetico'}" var="res" scope="request">
                                          radio
                                      </c:if>
                                          >Magnetico</td> 
                </tr>
                 
                <tr>
                    <td>
                        <input type="hidden" name="opg" value="${requestScope.op}"/>
                        <input type="hidden" name="op" value="grabar"/>
                    </td> 
                    <td><input type="submit" value="Enviar"/></td>
                </tr>
            </table>

        </form>
    </body>
</html>
