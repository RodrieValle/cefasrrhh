<%-- 
    Document   : ingresarcurriculum
    Created on : 10-26-2014, 10:26:35 PM
    Author     : ANIBAL
--%>

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
        JOptionPane.showMessageDialog(null, "Si recibe dato");
        String dui = request.getParameter("dui");
        String nombre = request.getParameter("nombre");
        String especialidad = request.getParameter("especialidad");
        String url = request.getParameter("url");
    
        //Código para subir pdf del curriculum al servidor
        /*try {
            List items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
            for (int i = 0; i < items.size(); i++) {
                FileItem item = (FileItem) items.get(i);
                if (item.isFormField()) {
                } else {
                    Date fecha = Calendar.getInstance().getTime();
                    SimpleDateFormat formato = new SimpleDateFormat("yyyyMMdd-hhmmss-");
                    String nombreImagen = formato.format(fecha);
                    nombreImagen += dui;
                    //String fileName = item.getName();
                    response.setContentType("text/plain");
                    response.setCharacterEncoding("UTF-8");
                    String realPath = request.getSession().getServletContext().getRealPath("/");
                    File fichero = new File(realPath + "documentos/candidatos/", nombreImagen+".pdf");
                    item.write(fichero);
                    url = "documentos/candidatos/"  + fichero.getName();
                }
            }
        } catch (Exception e) {
            out.write(e.getMessage());
            JOptionPane.showMessageDialog(null, e.getMessage());
            throw new ServletException("Parsing file upload failed.", e);
        }*/
        
        //Otro código
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);


        // req es la HttpServletRequest que recibimos del formulario.
        // Los items obtenidos serán cada uno de los campos del formulario,
        // tanto campos normales como ficheros subidos.
        List items = upload.parseRequest(request);

        // Se recorren todos los items, que son de tipo FileItem
        for (Object item : items) {
           FileItem uploaded = (FileItem) item;

           // Hay que comprobar si es un campo de formulario. Si no lo es, se guarda el fichero
           // subido donde nos interese
           if (!uploaded.isFormField()) {
              // No es campo de formulario, guardamos el fichero en algún sitio
              File fichero = new File("documentos/candidatos", uploaded.getName());
              uploaded.write(fichero);
           } else {
              // es un campo de formulario, podemos obtener clave y valor
              String key = uploaded.getFieldName();
              String valor = uploaded.getString();
           }
        }
        
        
        
        CtrlCEFAS_Candidato ctrlcandidato = new CtrlCEFAS_Candidato();
        ctrlcandidato.guardarCurriculum(dui, nombre, especialidad,url);
        mensaje ="<div class='alert alert-success' role='alert'>Guardado</div>";
    }
    
    /*int usuario = Integer.parseInt(sesionOk.getAttribute("codigo").toString());
    CtrlCEFAS_Empleado ctrlEmpleado = new CtrlCEFAS_Empleado();
    CEFAS_Empleado empleado = ctrlEmpleado.getEmpleadoPorUsuario(usuario);*/
    
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
                 <form action="ingresarcurriculum.jsp" enctype="multipart/form-data" method="post">
                         <div class="col-xs-4 col-xs-offset-4">
                             DUI: <input type="text" name="dui" class="form-control input-sm" value="" required>
                             Nombre: <input type="text" name="nombre" class="form-control input-sm">
                             Especialidad: <input type="text" name="especialidad" class="form-control input-sm">
                             Archivo de curriculum: <input type="file" name="url" id="url" class="form-control input-sm" onchange="cargarCurriculo()">
                             <p>
                                 <br><br>
                         <input type="submit" value="Guardar" class="btn btn-success center-block"/><br><br>          
                          </div>
                
                  
                     
             </form>
                 <%= mensaje %>
        </div><%-- fin del div id=container --%>
        
    </body>
</html>