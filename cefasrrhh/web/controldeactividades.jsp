<%-- 
    Document   : controldeactividades
    Created on : 10-31-2014, 12:04:54 AM
    Author     : Rodrigo
--%>
<%@page import="java.util.List"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Actividad"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Actividad"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Date"%>
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
    CtrlCEFAS_Actividad ctrlActividad = new CtrlCEFAS_Actividad();
    if(request.getParameter("descripcion") !=null)
    {
        Date fecha = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("fecha"));
        String descripcion = request.getParameter("descripcion");
        ctrlActividad.guardar(fecha, descripcion);
    }
    List<CEFAS_Actividad> listaActividades =  ctrlActividad.obtenerActividades();
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
                            <div class="panel-heading">Guardar actividad</div>
                            <div class="panel-body">
                            <form action="controldeactividades.jsp" method="post">
                            Fecha: <div class="bfh-datepicker" data-format="d/m/y" data-name="fecha"
                         data-close="true" data-align="right" data-language="en_US" data-available="es_MX">
                    </div><br><br>
                    Descripción:<textarea name="descripcion" rows="3" cols="20" class="form-control input-sm" required></textarea><br><br>
                            
                            <input type="submit" value="Guardar" class="btn btn-success center-block"/>
                            </form>
                            </div>
                     </div>
                 </div>
                 <div class="col-xs-7 col-xs-offset-1">
                     <div class="panel panel-primary">
                            <div class="panel-heading">Actividades guardadas recientemente</div>
                            <div class="panel-body">
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th class="col-xs-2">Fecha</th>
                                            <th class="col-xs-6">Descripción</th>
                                            <th class="col-xs-2">Editar</th>
                                            <th class="col-xs-2">Eliminar</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for(CEFAS_Actividad actividad : listaActividades)
                                        { %>
                                        <tr>
                                            <td><%= new SimpleDateFormat("dd/MM/yyyy").format(actividad.getActFecha()) %></td>
                                            <td><%= actividad.getActDescripcion() %></td>
                                            <td><a href="editaractividad.jsp?id=<%= actividad.getActCodigo() %>" class="btn btn-primary btn-md" role="button"><span class="glyphicon glyphicon-pencil"></span></a></td>
                                            <td><a href="eliminaractividad.jsp?id=<%= actividad.getActCodigo() %>" class="btn btn-primary btn-md" role="button"><span class="glyphicon glyphicon-remove"></span></a></td>
                                        </tr>
                                     <% } %>
                                        
                                        
                                    </tbody>
                                </table>
                            </div>
                     </div>
                 </div>
             </div>
         </div>
        </div>
    </body>
</html>
