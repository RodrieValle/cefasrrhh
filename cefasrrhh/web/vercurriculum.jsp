<%-- 
    Document   : vercurriculum
    Created on : 1/12/2014, 09:10:08 AM
    Author     : Sergio
--%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Candidato"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Candidato"%>
<%
    //Verificación de sesión abierta
    HttpSession sesionOk = request.getSession();
    String tipo = (String) sesionOk.getAttribute("tipo");
    if (tipo == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
    if (!tipo.equals("director")) {
        response.sendRedirect("avisos.jsp");
    }
    String duiCdt = request.getParameter("Dui");
    CtrlCEFAS_Candidato ctrlCandidato = new CtrlCEFAS_Candidato();
    CEFAS_Candidato curriculo = ctrlCandidato.consultarPorCodigo(duiCdt);
    %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver Curriculum CEFAS - RRHH </title>
        <jsp:include page='inc/head_common.jsp' /> 
    </head>
    <body>
        
        <div id="container">
            <jsp:include page='inc/menu_directora.jsp' />
            <div class="container">
                <h1>Curriculum del Candidato</h1>
                 <div class="col-xs-6 col-xs-offset-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading"></div>
                        <div class="panel-body">
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>Candidato</th>
                                        <th>Archivo</th>
                                    </tr>
                                    <tr>
                                    <th><%= curriculo.getCdtNombre()%></th>
                                    <th><a target="_blank" href="<%= curriculo.getCdtCurriculum()%>"></a>Ver Archivo</th>
                                    </tr>
                                </thead>
                                <tbody>
                                      
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                 
            </div>
    </div>
    </body>
    
</html>
