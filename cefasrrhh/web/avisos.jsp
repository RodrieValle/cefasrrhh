<%-- 
    Document   : avisos
    Created on : 10-19-2014, 06:58:34 PM
    Author     : Rodrigo
--%>
<%--
    //Verificación de sesión abierta
    HttpSession sesionOk = request.getSession();
    String tipo = (String) sesionOk.getAttribute("tipoUsuario");
    if (tipo == null) {
        //request.setAttribute("error", "<div class=\"alert alert-danger\"><h5>Es obligatorio identificarse</h5></div>");
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
    if (!tipo.equals("juridico")) {
        if (tipo.equals("director")) {
            response.sendRedirect("director.jsp");
        } else if (tipo.equals("profesor")) {
            response.sendRedirect("profesor.jsp");
        } else if (tipo.equals("educativo")) {
            response.sendRedirect("educativo.jsp");
        } else if (tipo.equals("referente")) {
            response.sendRedirect("referente.jsp");
        }
    }
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio - CEFAS RRHH</title>
         <jsp:include page='inc/head_common.jsp' /> 
    </head>
    <body>
        <div id="container">
            <jsp:include page='inc/menu_directora.jsp' />
            
            <div class="container">
                <h1>Inicio - Avisos</h1>
            </div>
        </div> <%-- fin del div id=container --%>
    </body>
</html>
