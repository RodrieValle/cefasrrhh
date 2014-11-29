<%-- 
    Document   : ingresarcurriculum
    Created on : 10-26-2014, 10:26:35 PM
    Author     : ANIBAL
--%>

<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Especialidad"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Especialidad"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.io.File"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.util.List"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Candidato"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Empleado"%>
<%
    //Verificación de sesión abierta
    HttpSession sesionOk = request.getSession();
    String tipo = (String) sesionOk.getAttribute("tipo");
    if (tipo == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
    if(!(!tipo.equals("director") || !tipo.equals("asistente")))
    {
        response.sendRedirect("avisos.jsp");
    }
    String mensaje = "";
    if(request.getParameter("dui") != null)
    {
        
    }
    
    CtrlCEFAS_Especialidad ctrlEspecialidad = new CtrlCEFAS_Especialidad();
    List<CEFAS_Especialidad> listaEspecialidad = ctrlEspecialidad.obtenerEspecialidad();
    //response.setHeader("Content-Type","multipart/form-data;");
        %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingresar Curriculum - CEFAS RRHH</title>
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
                 <h1>Ingresar Curriculum</h1>
                 <form action="subirCurriculo" enctype="multipart/form-data" method="POST">
                         <div class="col-xs-4 col-xs-offset-4">
                             DUI: <input type="text" name="dui" class="form-control input-sm" value="" required>
                             Nombre: <input type="text" name="nombre" class="form-control input-sm">
                             Especialidad:<select name="especialidad"  class="form-control input-sm">
                           <% for (CEFAS_Especialidad esp : listaEspecialidad) {%>
                           <option value="<%= esp.getEspCodigo()%>"><%= esp.getEspNombre()%></option>
                            <% }%>
                       </select> 
                             Archivo de curriculum: <input type="file" name="url" id="url" class="form-control input-sm">
                             <p>
                                 <br><br>
                         <input type="submit" value="Guardar" class="btn btn-success center-block"/><br><br>          
                          </div>
                
                  
                     
             </form>
                 <%= mensaje %>
        </div><%-- fin del div id=container --%>
        </div>
        
    </body>
</html>