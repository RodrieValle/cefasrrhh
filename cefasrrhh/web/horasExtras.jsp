<%-- 
    Document   : horasExtras
    Created on : 10-28-2014, 10:25:09 PM
    Author     : ANIBAL
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_TiempoExtra"%>
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
    //Accesible con usuario: emp03 y password: 12345
    if (!tipo.equals("subdirector") && !tipo.equals("administrador")) {
        response.sendRedirect("avisos.jsp");
    }

    CtrlCEFAS_Empleado ctrlEmpleado = new CtrlCEFAS_Empleado();
    List<CEFAS_Empleado> listaEmpleados;
    listaEmpleados = ctrlEmpleado.obtenerEmpleados();
    if (request.getParameter("codigo") != null) {
        int codigoemp = Integer.parseInt(request.getParameter("codigo"));
               Date fecha = new SimpleDateFormat("DD/MM/YYYY").parse(request.getParameter("fecha").toString());
      
      
        Date hInicio = new SimpleDateFormat("HH:mm").parse(request.getParameter("hinicio").toString());
        Date hFinal = new SimpleDateFormat("HH:mm").parse(request.getParameter("hfinal").toString());
        String codigoemp2 = request.getParameter("codigo2");
        CtrlCEFAS_TiempoExtra textra = new CtrlCEFAS_TiempoExtra();
        textra.guardarHoras(codigoemp,fecha,hInicio,hFinal);
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reporte horas extras</title>
        <jsp:include page='inc/head_common.jsp' /> 
        <link rel="stylesheet" type="text/css" href="css/bootstrap-formhelpers.css">
        <script type="text/javascript" src="js/bootstrap-formhelpers.js"></script>
        <link rel="stylesheet" type="text/css" href="css/jquery-clockpicker.min.css">
        <script type="text/javascript" src="js/jquery-clockpicker.min.js"></script>

    </head>
    <body>
        <div id="container">
            <%  if (tipo.equals("subdirector")) {
            %>
            <jsp:include page='inc/menu_subdirector.jsp' />
            <% } else if (tipo.equals("administrador")) {
            %>
            <jsp:include page='inc/menu_administradora.jsp' />
            <% }
            %>
            <div class="container">
                <h1>Reporte de horas extras</h1>
                <div class="row">
                    <div class="col-xs-4 col-xs-offset-4">
                        <form action="horasExtras.jsp" method="post">

                            Empleado: <select name="codigo" id="empleado" class="form-control">
                                <% for (CEFAS_Empleado emp : listaEmpleados) {%>
                                <option value="<%= emp.getEmpCodigo()%>"><%= emp.getEmpNombre()%></option>
                                <% }%>
                            </select> <br>
                            Fecha:
                            <div class="bfh-datepicker" data-format="d/m/y" data-max="today" data-name="fecha"
                                 data-close="true" data-align="right" data-language="en_US" data-available="es_MX">
                            </div>
                            Hora de inicio:
                            <div class="input-group clockpicker">
                                <input type="text" name="hinicio" class="form-control" value="07:00" maxlength="5" readonly="true">
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-time"></span>
                                </span>
                            </div>
                            <script type="text/javascript">
                                $('.clockpicker').clockpicker({
                                    donetext: 'Hecho'
                                });
                            </script>
                            Hora de fin:
                            <div class="input-group clockpicker">
                                <input type="text" name="hfinal" class="form-control" value="07:00" maxlength="5" readonly="true">
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-time"></span>
                                </span>
                            </div>
                            <script type="text/javascript">
                                $('.clockpicker').clockpicker({
                                    donetext: 'Hecho'
                                });
                            </script>

                            ¿A quién cubrió?
                            <select name="codigo2" id="empleado" class="form-control">
                                <% for (CEFAS_Empleado emp : listaEmpleados) {%>
                                <option value="<%= emp.getEmpCodigo()%>"><%= emp.getEmpNombre()%></option>
                                <% }%>
                            </select> <br

                                <br> 
                            <input type="submit" value="Guardar" class="btn btn-success center-block"/>
                        </form>

                    </div>
                </div>

            </div>
        </div>
    </body>
</html>
