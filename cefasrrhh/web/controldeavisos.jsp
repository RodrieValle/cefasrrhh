<%-- 
    Document   : controldeavisos
    Created on : 10-31-2014, 12:04:26 AM
    Author     : Rodrigo
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Empleado"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Aviso"%>
<%@page import="java.util.List"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Aviso"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
    request.setCharacterEncoding("UTF-8");
    CtrlCEFAS_Empleado ctrlEmpleado = new CtrlCEFAS_Empleado();
    List<CEFAS_Empleado> empleados = ctrlEmpleado.obtenerEmpleados();
    CtrlCEFAS_Aviso ctrlAviso = new CtrlCEFAS_Aviso();
    if(request.getParameter("descripcion")!= null)
    {
        Date fecha = new Date();
        String descripcion = request.getParameter("descripcion");
        List<CEFAS_Empleado> destinatarios = new ArrayList<CEFAS_Empleado>();
        for(CEFAS_Empleado empleado : empleados)
        {
            if(request.getParameter(empleado.getEmpCodigo())!= null)
            {
                destinatarios.add(empleado);
            }
        }
        ctrlAviso.guardar(fecha, descripcion, destinatarios, sesionOk.getAttribute("empleado").toString());
    }
    List<CEFAS_Aviso> lista = ctrlAviso.consultarAvisos();
    
    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Control de avisos</title>
        <jsp:include page='inc/head_common.jsp' /> 
    </head>
    <script type="javascript">
        
    </script>
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
             <h1>Control de avisos</h1>
             <div class="row">
                 <div class="col-xs-4">
                     <div class="panel panel-primary">
                            <div class="panel-heading">Crear nuevo aviso</div>
                            <div class="panel-body">
                            <form action="controldeavisos.jsp" method="post">
                            Fecha:      <%= new SimpleDateFormat("dd/MM/yyyy").format(new Date()) %><br><br>
                            Descripción:<textarea name="descripcion" rows="3" cols="20" class="form-control input-sm" required></textarea><br>
                            <div id="destinatarios">
                                <label>Destinatarios:</label><br>
                                <input id="todos" type="checkbox" name="destinatarios" value="All" onclick="checkTodos(this.id,'destinatrios');"> Seleccionar todo<br><br>
                            <%
                                for(CEFAS_Empleado empleado : empleados)
                                {%>
                                <input type="checkbox" name="<%= empleado.getEmpCodigo()%>" value="<%= empleado.getEmpCodigo()%>">  <%= empleado.getEmpNombre() %><br>
                            <%  }
                            %>
                            
                            </div>
                            <br><br>
                            <input type="submit" value="Enviar" class="btn btn-success center-block"/>
                            </form>
                            </div>
                     </div>
                 </div>
                <div class="col-xs-7 col-xs-offset-1">
                        <div class="panel panel-primary">
                            <div class="panel-heading">Últimos avisos creados</div>
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
                                        <% for(CEFAS_Aviso aviso : lista)
                                        { %>
                                        <tr>
                                            <td><%= new SimpleDateFormat("dd/MM/yyyy").format(aviso.getAvsFecha()) %></td>
                                            <td><%= aviso.getAvsDescripcion() %></td>
                                            <td><a href="editaraviso.jsp?id=<%= aviso.getAvsCodigo() %>" class="btn btn-primary btn-md" role="button"><span class="glyphicon glyphicon-pencil"></span></a></td>
                                            <td><a href="eliminaraviso.jsp?id=<%= aviso.getAvsCodigo() %>" class="btn btn-primary btn-md" role="button"><span class="glyphicon glyphicon-remove"></span></a></td>
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
