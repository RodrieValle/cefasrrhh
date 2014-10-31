<%-- 
    Document   : controldeactividades
    Created on : 10-31-2014, 12:04:54 AM
    Author     : Rodrigo
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Date"%>
<%
    //Verificación de sesión abierta
    HttpSession sesionOk = request.getSession();
    String tipo = (String) sesionOk.getAttribute("tipo");
    if (tipo == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
    /*String usuario = (String) sesionOk.getAttribute("usuario");
    CtrlCEFAS_Aviso ctrlAviso = new CtrlCEFAS_Aviso();
    List<CEFAS_Aviso> lista = ctrlAviso.consultarAvisos(usuario);*/
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
                 <div class="col-xs-4 col-xs-offset-4">
                     <div class="panel panel-primary">
                            <div class="panel-heading">Guardar actividad</div>
                            <div class="panel-body">
                            <form action="controldeactividades.jsp" method="post">
                            Fecha: <div class="bfh-datepicker" data-format="d/m/y"
                         data-close="true" data-align="right" data-language="en_US" data-available="es_MX">
                    </div><br><br>
                            Descripción:<textarea name="descripcion" rows="3" cols="20" class="form-control input-sm"></textarea><br><br>
                            
                            <input type="submit" value="Guardar" class="btn btn-success center-block"/>
                            </form>
                            </div>
                     </div>
                 </div>
             </div>
         </div>
        </div>
    </body>
</html>
