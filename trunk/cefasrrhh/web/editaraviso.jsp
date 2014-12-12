<%-- 
    Document   : editaractividad
    Created on : 11-10-2014, 10:33:54 PM
    Author     : Rodrigo
--%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Aviso"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Aviso"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Actividad"%>
<%@page import="java.util.Date"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Actividad"%>
<%
    request.setCharacterEncoding("UTF-8");
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
    if(request.getParameter("fecha")!=null)
    {
        String id = request.getParameter("id");
        Date fecha = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("fecha"));
        String descripcion = request.getParameter("descripcion");
        CtrlCEFAS_Actividad ctrlActividad = new CtrlCEFAS_Actividad();
        ctrlActividad.actualizar(id, fecha, descripcion);
        response.sendRedirect("controldeavisos.jsp");
    }
    String id = request.getParameter("id");
    CtrlCEFAS_Aviso ctrlAviso = new CtrlCEFAS_Aviso();
    CEFAS_Aviso aviso = ctrlAviso.obtenerAvisoById(id);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Control de actividades</title>
        <jsp:include page='inc/head_common.jsp' /> 
        <link rel="stylesheet" type="text/css" href="css/bootstrap-formhelpers.css">
        <script type="text/javascript" src="js/bootstrap-formhelpers.js"></script>
         <link rel="stylesheet" type="text/css" href="css/jquery-clockpicker.min.css">
        <script type="text/javascript" src="js/jquery-clockpicker.min.js"></script>
    </head>
    <body>
        <div id="container">
            <%  if(tipo.equals("director"))
            {
        %>
                <jsp:include page='inc/menu_directora.jsp' />
         <% }
            else if(tipo.equals("subdirector"))
            {
         %>
                <jsp:include page='inc/menu_subdirector.jsp' />
         <% } %>
         <div class="container">
             <h1>Control de actividades</h1>
             <div class="row">
                 <div class="col-xs-4">
                     <div class="panel panel-primary">
                            <div class="panel-heading">Actualizar aviso</div>
                            <div class="panel-body">
                            <form action="editaraviso.jsp" method="post">
                                <input style="display: none" value="<%= aviso.getAvsCodigo() %>" name="id">
                                Fecha: <div class="bfh-datepicker" data-format="d/m/y" data-name="fecha" data-date="<%= new SimpleDateFormat("dd/MM/yyyy").format(aviso.getAvsFecha()) %>"
                         data-close="true" data-align="right" data-language="en_US" data-available="es_MX">
                    </div><br><br>
                    Descripción:<textarea name="descripcion" rows="3" cols="20" class="form-control input-sm" required><%= aviso.getAvsDescripcion() %></textarea><br><br>
                            
                            <input type="submit" value="Actualizar" class="btn btn-success center-block"/>
                            </form>
                            </div>
                     </div>
                 </div>
             </div>
         </div>
        </div>
    </body>
</html>