<%-- 
    Document   : evaluacionFunciones
    Created on : 10-31-2014, 09:09:04 AM
    Author     : Portillo
--%>



<%@page import="java.util.ArrayList"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Aviso"%>
<%@page import="net.sf.jasperreports.engine.JRException"%>
<%@page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import="net.sf.jasperreports.engine.JREmptyDataSource"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Date"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Empleado"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_EvaluacionPorFunciones"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_EvaluacionPorFunciones"%>
<%
    //Verificación de sesión abierta
    HttpSession sesionOk = request.getSession();
    String tipo = (String) sesionOk.getAttribute("tipo");
    if (tipo == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
    String mensaje = "";
    request.setCharacterEncoding("UTF-8");
    if(request.getParameter("item1")!=null)
    {
        Map parametros = new HashMap();
        for(int x= 1; x<=19; x++)
        {
            parametros.put("parameter"+x, request.getParameter("item"+x));
        }
        parametros.put("mes", "Enero");
        
        try {
            //se carga el reporte
            File reportFile = new File(application.getRealPath("reportes/CEFAS_EvaluacionFunciones.jasper"));
            //se procesa el archivo jasper
            JasperPrint jasperPrint = JasperFillManager.fillReport(reportFile.getPath(), parametros, new JREmptyDataSource());
            //se crea el archivo PDF
            String rutaCompleta = request.getSession().getServletContext().getRealPath("/");
            String rutaParcial = "documentos/evaluaciones/ev_funciones-"+ request.getParameter("codigo") + "-" + new SimpleDateFormat("ddMMyyHHmmss").format(new Date()) + ".pdf";
            rutaCompleta += rutaParcial;
            JasperExportManager.exportReportToPdfFile(jasperPrint, rutaCompleta);
            CtrlCEFAS_EvaluacionPorFunciones ctrlEvaluacionFunciones = new CtrlCEFAS_EvaluacionPorFunciones();
            ctrlEvaluacionFunciones.guardar(request.getParameter("codigo"), new Date(), rutaParcial);
          mensaje = "<div class='alert alert-danger alert-dismissible' role='alert'><button type='button' class='close'"
             + " data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>"
             + "La evaluación se guardó correctamente</div>";
        CtrlCEFAS_Aviso ctrlAviso = new CtrlCEFAS_Aviso();
          List<CEFAS_Empleado> destino = new ArrayList();
          CEFAS_Empleado emp = new CEFAS_Empleado();
          emp.setEmpCodigo(request.getParameter("codigo"));
          destino.add(emp);
          ctrlAviso.guardar(new Date(), "Usted ha recibido una nueva evaluación por funciones. Dirijase a su perfil para verlo", destino , "Sistema de Recursos Humanos - CEFAS");
        
        } catch (JRException ex) {
            System.err.println("Error iReport: " + ex.getMessage());
        }
        
        
    }
    
    CtrlCEFAS_Empleado ctrlEmpleado = new CtrlCEFAS_Empleado();
    List<CEFAS_Empleado> empleados = ctrlEmpleado.obtenerEmpleados();
%>





<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
  
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <title>Evaluación por funciones</title>
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
              
           <h1>Evaluación por Funciones</h1>
           <%= mensaje %>
          <form class="form-signin" role="form" method="post" action="evaluacionFunciones.jsp">
          <div class="panel panel-primary">
                    <div class="panel-heading">Datos de la Evaluación</div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-xs-4 col-xs-offset-1">
                                Empleado:
                                <select name="codigo" id="empleado" class="input-sm form-control">
                                 <% for(CEFAS_Empleado emp: empleados)
                                 { %>
                                 <option value="<%= emp.getEmpCodigo() %>"><%= emp.getEmpNombre() %></option> 
                                 <%}%>   
                                </select>
                            </div>
                            <div class="col-xs-4 col-xs-offset-2">
                                Fecha: <input type="text" name="fecha" value="<%= new SimpleDateFormat("dd/MM/yyyy").format(new Date()) %>" readonly class="form-control input-sm"/> 
                            </div>
                        </div>
                    </div>
                </div>

       <table border="1" align="center" class="table table-hover">
       
           
        <tr>
           <td> <h2>Criterios</h2></td>
         <td><h2>Observaciones</h2></td>

       </tr>


    <tr>
       <td>Clases. De acuerdo a formato de supervisión de clases</td>
       <td><input required name="item1" type="text" size="60" maxlength="50"></td>
    </tr>
  
    <tr>
       <td>Tareas. Distribuidas, Apropiadas, Revisadas</td>
      <td><input required name="item2" type="text" size="60" maxlength="50"></td>
     
    </tr>

    <tr>
       <td>Cuadernos. Contenido, Revisado, Corregido</td>
       <td><input required name="item3" type="text" size="60" maxlength="50"></td>
    </tr>

    <tr>
       <td>Libros. Limpieza, útiles, forrados, revisados</td>
       <td><input required name="item4" type="text"  size="60" maxlength="50"></td>
    </tr>

    <tr>
       <td>Exámenes. Formato, ortografía, contenido, aplicativo, revisión</td>
       <td><input required name="item5" type="text" size="60" maxlength="50"></td>

    </tr>

    <tr>
       <td>Planificaciones. Contenido, entrega a tiempo, utilizadas</td>
       <td><input required name="item6" type="text" size="60" maxlength="50"></td>

    </tr>

    <tr>
       <td>Responsabilidades. Cuidos, Asamblea, Per. Mur., Reu. c/Padres</td>
       <td><input required name="item7" type="text" size="60" maxlength="50"></td>

    </tr>

    <tr>
       <td>Disciplina. Seguimiento Manual, Pastoreo, claro y consistente, orden</td>
       <td><input required name="item8" type="text" size="60" maxlength="50"></td>

    </tr>

    
    <tr>
       <td>Hábitos y procedimientos</td>
       <td><input required name="item9" type="text" size="60" maxlength="50"></td>

    </tr>

    <tr>
       <td>Aula</td>
       <td><input required name="item10" type="text" size="60" maxlength="50"></td>

    </tr>

    <tr>
       <td>Teacher's book</td>
       <td><input required name="item11" type="text" size="60" maxlength="50"></td>

    </tr>

    <tr>
       <td>Lealtad al ausente</td>
       <td><input required name="item12" type="text" size="60" maxlength="50"></td>

    </tr>

    
    <tr>
       <td>Respeto a autoridades</td>
       <td><input required name="item13" type="text" size="60" maxlength="50"></td>

    </tr>

    <tr>
       <td>Puntualidad, asistencia y permisos</td>
       <td><input required name="item14" type="text" size="60" maxlength="50"></td>

    </tr>
    
    <tr>
       <td>Entrega de documentos</td>
       <td><input required name="item15" type="text" size="60" maxlength="50"></td>

    </tr>

    <tr>
       <td>Presentación personal</td>
       <td><input required name="item16" type="text" size="60" maxlength="50"></td>

    </tr>

    <tr>
       <td>Sigue indicaciones</td>
       <td><input required name="item17" type="text" size="60" maxlength="50"></td>

    </tr>

    <tr>
       <td>Disposición y actitud</td>
       <td><input required name="item18" type="text" size="60" maxlength="50"></td>

    </tr>
      
      <tr>
       <td>Cuida propiedad del colegio</td>
       <td><input required name="item19" type="text" size="60" maxlength="50"></td>

    </tr>

   </table><br><br>
   
   <input type="submit" value="Guardar" class="btn btn-success center-block"><br><br>
  
   </form>
    </div> <%-- fin del div id=container --%>
 </div>
     </body>
</html>

