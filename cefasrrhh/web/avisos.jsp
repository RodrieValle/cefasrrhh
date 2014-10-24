<%-- 
    Document   : avisos
    Created on : 10-19-2014, 06:58:34 PM
    Author     : Rodrigo
--%>
<%@page import="java.util.List"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Aviso"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Aviso"%>
<%
    //Verificación de sesión abierta
    HttpSession sesionOk = request.getSession();
    String tipo = (String) sesionOk.getAttribute("tipo");
    if (tipo == null) {
        //request.setAttribute("error", "<div class=\"alert alert-danger\"><h5>Es obligatorio identificarse</h5></div>");
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
    String usuario = (String) sesionOk.getAttribute("usuario");
    CtrlCEFAS_Aviso ctrlAviso = new CtrlCEFAS_Aviso();
    List<CEFAS_Aviso> lista = ctrlAviso.consultarAvisos(usuario);
%>
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
                <h1>Inicio - Avisos </h1>
            </div>
        </div> <%-- fin del div id=container --%>
    </body>
</html>
