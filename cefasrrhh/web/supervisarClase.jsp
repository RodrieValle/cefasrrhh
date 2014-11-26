<%-- 
    Document   : supervisarClase
    Created on : 10-31-2014, 10:57:43 AM
    Author     : Portillo
--%>
<%@page import="java.io.File"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_EvaluacionDeClases"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Empleado"%>
<%@page import="com.colegiocefas.cefasrrhh.utilidades.ConexionDB"%>
<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@page import="net.sf.jasperreports.engine.JRException"%>
<%@page import="net.sf.jasperreports.engine.util.JRLoader"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="net.sf.jasperreports.engine.JasperReport"%>
<%@page import="java.net.URL"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%
    HttpSession sesionOk = request.getSession();
    String tipo = (String) sesionOk.getAttribute("tipo");
    if (tipo == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
    request.setCharacterEncoding("UTF-8");
    String mensaje = "";
    if (request.getParameter("docente") != null) {
        Map parametros = new HashMap();
        parametros.put("docente", request.getParameter("docente"));
        parametros.put("grado/asignatura", request.getParameter("grado-asignatura"));
        parametros.put("recomendacionesUltimas", request.getParameter("recomendacionesUltimas"));
        parametros.put("superacionRecomendaciones", request.getParameter("superacionRecomendaciones"));
        parametros.put("fecha", request.getParameter("fecha"));
        for (int i = 1; i <= 17; i++) {
            parametros.put("c" + i, request.getParameter("item" + i));
        }
        parametros.put("logroObjetivo", request.getParameter("logroObjetivo"));
        parametros.put("felicitaciones", request.getParameter("felicitaciones"));
        parametros.put("recomendaciones", request.getParameter("recomendaciones"));

        try {
          //se carga el reporte
            //URL  in=this.getClass().getResource( "CEFAS_SupervisionClase.jasper" );
            File reportFile = new File(application.getRealPath("reportes/CEFAS_SupervisionClase.jasper"));
          //JasperReport jasperReport=(JasperReport)JRLoader.loadObject(in);
            //se procesa el archivo jasper
            JasperPrint jasperPrint = JasperFillManager.fillReport(reportFile.getPath(), parametros, ConexionDB.getConexion());
            //se crea el archivo PDF
            String rutaCompleta = request.getSession().getServletContext().getRealPath("/");
            String rutaParcial = "documentos/evaluaciones/ev_clase-" + request.getParameter("docente") + "-" + new SimpleDateFormat("ddMMyyHHmmss").format(new Date()) + ".pdf";
            rutaCompleta += rutaParcial;
            JasperExportManager.exportReportToPdfFile(jasperPrint, rutaCompleta);
            CtrlCEFAS_EvaluacionDeClases ctrlEvaluacionDeClases = new CtrlCEFAS_EvaluacionDeClases();
            ctrlEvaluacionDeClases.guardar(request.getParameter("docente"), new Date(), rutaParcial);
            mensaje = "<div class='alert alert-danger alert-dismissible' role='alert'><button type='button' class='close'"
                    + " data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>"
                    + "La evaluación se guardó correctamente</div>";
        } catch (JRException ex) {
            System.err.println("Error iReport: " + ex.getMessage());
        }
    }
    CtrlCEFAS_Empleado ctrlEmpleado = new CtrlCEFAS_Empleado();
    List<CEFAS_Empleado> empleados = ctrlEmpleado.obtenerEmpleados();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Supervisión de una Clase</title>
        <jsp:include page='inc/head_common.jsp' />
        <link rel="stylesheet" type="text/css" href="css/bootstrap-formhelpers.css">
        <script type="text/javascript" src="js/bootstrap-formhelpers.js"></script>
    </head>

    <body>
        <div id="container">
            <%  if (tipo.equals("director")) {
            %>
            <jsp:include page='inc/menu_directora.jsp' />
            <% } else if (tipo.equals("empleado")) {
            %>
            <jsp:include page='inc/menu_empleado.jsp' />
            <% } else if (tipo.equals("subdirector")) {
            %>
            <jsp:include page='inc/menu_subdirector.jsp' />
            <% } else if (tipo.equals("asistente")) {
            %>
            <jsp:include page='inc/menu_asistente.jsp' />
            <% } else if (tipo.equals("administrador")) {
            %>
            <jsp:include page='inc/menu_administradora.jsp' />
            <% }%>


            <div class="container">
                <h1>Supervisión de una Clase</h1>
                <%= mensaje%>

                <form action="supervisarClase.jsp" method="post">

                    <div class="panel panel-primary">
                        <div class="panel-heading">Generalidades</div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-4 col-xs-offset-1">
                                    Fecha: <div class="bfh-datepicker" data-format="d/m/y"  data-name="fecha" data-language="es" data-input="input-sm form-control" data-icon=""
                                           data-close="true" data-align="right">
                                    </div>
                                    Docente: 
                                    <select name="docente" id="" class="form-control input-sm" required>
                                        <% for (CEFAS_Empleado e : empleados) {%><option value="<%= e.getEmpCodigo()%>"><%= e.getEmpNombre()%></option> 
                                        <% }%>
                                    </select> 
                                    Grado/Asignatura: <input type="text" name="grado-asignatura" class="form-control input-sm" required>
                                </div>
                                <div class="col-xs-4 col-xs-offset-2">
                                    Recomendaciones hechas en la última evaluación: <textarea name="recomendacionesUltimas" id="" cols="30" rows="2" class="form-control input-sm"></textarea><br>
                                    ¿Se superaron esas recomendaciones?   <input type="text" name="superacionRecomendaciones" class="form-control input-sm">
                                </div>
                            </div>
                        </div>
                    </div>

                    <p align=center><strong>Checking Points para el supervisor </strong></p>
                    <table border="1" align="center" class="table table-hover">
                        <thead>
                        <tr>
                            <td> </td>
                            <td><strong>Criterio</strong> </td>
                            <td><strong>Comentario</strong></td>
                        </tr>
                        </thead>
                        <tr>
                            <td>1</td>
                            <td>Intro (dijo tema/subtema/objetivo)</td>
                            <td><input required name="item1" type="text" size="80" maxlength="80">

                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Clase magistral completa y sencilla</td>
                            <td><input required name="item2" type="text" size="80" maxlength="80">

                        </tr>
                        <tr>
                            <td>3</td>
                            <td>Conocimiento de la lección</td>
                            <td><input required name="item3" type="text" size="80" maxlength="80">

                        </tr>
                        <tr>
                            <td>4</td>
                            <td>Refuerzo positivo</td>
                            <td><input required name="item4" type="text" size="80" maxlength="80">

                        </tr>
                        <tr>
                            <td>5</td>
                            <td>Clase planificada, maestro preparado</td>
                            <td><input required name="item5" type="text" size="80" maxlength="80">

                        </tr>

                        <tr>
                            <td>6</td>
                            <td>Clase activa y variada</td>
                            <td><input required name="item6" type="text" size="80" maxlength="80">
                        </tr>

                        <tr>
                            <td>7</td>
                            <td>Comunicación cordial y con autoridad</td>
                            <td><input required name="item7" type="text" size="80" maxlength="80">

                        </tr>

                        <tr>
                            <td>8</td>
                            <td>Evaluó, logró el objetivo</td>
                            <td><input required name="item8" type="text" size="80" maxlength="80">

                        </tr>

                        <tr>
                            <td>9</td>
                            <td>Disciplina y control</td>
                            <td><input required name="item9" type="text" size="80" maxlength="80">

                        </tr>

                        <tr>
                            <td>10</td>
                            <td>Hábitos y Procedimientos</td>
                            <td><input required name="item10" type="text" size="80" maxlength="80">

                        </tr>

                        <tr>
                            <td>11</td>
                            <td>Uso del tiempo</td>
                            <td><input required name="item11" type="text" size="80" maxlength="80">

                        </tr>


                        <tr>
                            <td>12</td>
                            <td>Participación</td>
                            <td><input required name="item12" type="text" size="80" maxlength="80">

                        </tr>

                        <tr>
                            <td>13</td>
                            <td>Supervisión de alumnos</td>
                            <td><input required name="item13" type="text" size="80" maxlength="80">

                        </tr>

                        <tr>
                            <td>14</td>
                            <td>Aclaración de dudas con paciencia</td>
                            <td><input required name="item14" type="text" size="80" maxlength="80">

                        </tr>

                        <tr>
                            <td>15</td>
                            <td>Uso del inglés (para bilingues)</td>
                            <td><input required name="item15" type="text" size="80" maxlength="80">

                        </tr>

                        <tr>
                            <td>16</td>
                            <td>Aula (murales, mantenimiento, orden)</td>
                            <td><input required name="item16" type="text" size="80" maxlength="80">

                        </tr>

                        <tr>
                            <td>17</td>
                            <td>Tarea integrada al objetivo de la clase</td>
                            <td><input required name="item17" type="text" size="80" maxlength="80">

                        </tr>

                    </table>
                    
                    <div class="row">
                        <div class="col-xs-4">
                            ¿Se logró el objetivo?
                            <textarea required name="logroObjetivo" type="text" size="100" maxlength="100" cols="30" rows="3" class="form-control input-sm"></textarea>
                        </div>
                        <div class="col-xs-4">
                            Felicitaciones:
                            <textarea required name="felicitaciones" type="text" size="100" maxlength="100" cols="30" rows="3" class="form-control input-sm"></textarea>
                        </div>
                        <div class="col-xs-4">
                            Recomendaciones:
                            <textarea required name="recomendaciones" type="text" size="100" maxlength="100" cols="30" rows="3" class="form-control input-sm"></textarea>
                        </div>
                    </div>
                    <br><br>
                    <input type="submit" value="Guardar" class="btn btn-success center-block">
                    <br><br>
                </form>
            </div>
        </div>
    </body>
</html>
