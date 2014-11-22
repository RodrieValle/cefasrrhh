<%-- 
    Document   : eliminarsancion
    Created on : 20/11/2014, 09:51:00 PM
    Author     : Sergio
--%>

<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Sancion"%>
<%@page import="java.util.List"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Sancion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesionOk = request.getSession();
    String tipo = (String) sesionOk.getAttribute("tipo");
    if (tipo == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
    if (!tipo.equals("director")) {
        response.sendRedirect("avisos.jsp");
    }
   
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Sancion - CEFAS RRHH</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
