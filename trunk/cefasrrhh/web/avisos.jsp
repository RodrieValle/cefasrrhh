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
        <%  if(tipo.equals("director"))
            {
        %>
                <jsp:include page='inc/menu_directora.jsp' />
         <% }
            else if(tipo.equals("empleado"))
            {
         %>
                <jsp:include page='inc/menu_empleado.jsp' />
         <% }
            else if(tipo.equals("subdirector"))
            {
         %>
                <jsp:include page='inc/menu_subdirector.jsp' />
         <% }
            else if(tipo.equals("asistente"))
            {
         %>
                <jsp:include page='inc/menu_asistente.jsp' />
         <% }
            else if(tipo.equals("administrador"))
            {
         %>
                <jsp:include page='inc/menu_administradora.jsp' />
         <% } %>
            
            
            <div class="container">
                <h1>Inicio - Avisos </h1>
                <%
                    for(CEFAS_Aviso avs: lista)
                    {
                %>
                      <div class="panel panel-primary">
                            <div class="panel-heading">Fecha: <%= avs.getAvsFecha() %></div>
                        <div class="panel-body">
                            <%= avs.getAvsDescripcion() %>
                        </div>
                      </div>
                <%        
                    }
                %>
            </div>
        </div> <%-- fin del div id=container --%>
    </body>
</html>
