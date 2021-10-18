
package com.emergente.controlador;

import com.emergente.modelo.GestorLibro;
import com.emergente.modelo.Libros;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Controller", urlPatterns = {"/Controller"})
public class Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
             Libros objLibro =new Libros();
        int id;
        int pos;
        String opcion = request.getParameter("op");
        String op=(opcion!= null)? request.getParameter("op"):"view";
        
        if(op.equals("nuevo")){
            HttpSession ses= request.getSession();
            GestorLibro registro=(GestorLibro) ses.getAttribute("registro");
            objLibro.setId(registro.ObtieneId());
            request.setAttribute("op",op);
            request.setAttribute("miLibro",objLibro);
            request.getRequestDispatcher("editar.jsp").forward(request, response);
        }
        if(op.equals("modificar")){
            id=Integer.parseInt(request.getParameter("id"));
             HttpSession ses= request.getSession();
             GestorLibro registro=(GestorLibro)ses.getAttribute("registro");
             pos =registro.ubicarLibro(id);
             objLibro =registro.getLista().get(pos);
             
             request.setAttribute("op", op);
             request.setAttribute("miLibro",objLibro);
             request.getRequestDispatcher("editar.jsp").forward(request, response);
        }
        if(op.equals("eliminar")){
            id=Integer.parseInt(request.getParameter("id"));
             HttpSession ses= request.getSession();
             GestorLibro registro=(GestorLibro)ses.getAttribute("registro");
             pos =registro.ubicarLibro(id);
             registro.eliminarLibro(pos);
             ses.setAttribute("registro",registro);
             response.sendRedirect("index.jsp");
        }
        if(op.equals("view")){
            response.sendRedirect("index.jsp");
        }  
    }
 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         Libros objLibro = new Libros();
        int pos;
        String op =request.getParameter("op");
        if(op.equals("grabar")){
            objLibro.setId(Integer.parseInt(request.getParameter("id")));
            objLibro.setTitulo(request.getParameter("titulo"));
            objLibro.setAutor(request.getParameter("autor"));
            objLibro.setResumen(request.getParameter("resumen"));
            objLibro.setMedio(request.getParameter("medio"));
            
            
              HttpSession ses= request.getSession();
             GestorLibro registro=(GestorLibro)ses.getAttribute("registro");
             
             String opg=request.getParameter("opg");
             if(opg.equals("nuevo")){
                 registro.insertarLibro(objLibro);
             }
             else{
                 pos=registro.ubicarLibro(objLibro.getId());
                 registro.modificarLibro(pos, objLibro);
             }
             ses.setAttribute("registro",registro);
             response.sendRedirect("index.jsp");
        }        
    }
 }

    

