<%-- 
    Document   : reportellegadas
    Created on : 10-28-2014, 10:09:05 PM
    Author     : Rodrigo
--%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_reporteLLegada"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado"%>
<%@page import="java.util.List"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Empleado"%>
<%    HttpSession sesionOk = request.getSession();
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
    String error="";
    if (request.getParameter("codigo") != null) {
        int codigoemp = Integer.parseInt(request.getParameter("codigo"));
               Date fecha = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("fecha").toString());
      
      //SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Date)
        //Date hInicio = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse("2000-01-01 "+request.getParameter("hinicio")+":00");
        Date hEntrada = new SimpleDateFormat("HH:mm").parse(request.getParameter("hinicio").toString());
        Date hLLegada = new SimpleDateFormat("HH:mm").parse(request.getParameter("hfinal").toString());
       
        
        CtrlCEFAS_reporteLLegada report= new CtrlCEFAS_reporteLLegada();
        boolean exito=report.guardarReporteLLegada(codigoemp, fecha, hEntrada, hLLegada);
        if(exito){
        error = "<div class='alert alert-success' role='alert'><button type='button' class='close'"
                + " data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>"
                + "Guardado con éxito</div>";
        }else
        {
        error = "<div class='alert alert-danger alert-dismissible' role='alert'><button type='button' class='close'"
                + " data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>"
                + "Hora inicio no puede ser mayor o sustituto no debe ser igual</div>";
        }
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
                <%= error%>
                <div class="row">
                    <div class="col-xs-4 col-xs-offset-4">
                        <form action="reportellegadas.jsp" method="post">

                            Empleado: <select name="codigo" id="empleado" class="form-control">
                                <% for (CEFAS_Empleado emp : listaEmpleados) {%>
                                <option value="<%= emp.getEmpCodigo()%>"><%= emp.getEmpNombre()%></option>
                                <% }%>
                            </select> <br>
                            Fecha:
                            <div class="bfh-datepicker" data-format="d/m/y" data-max="today" data-name="fecha"
                                 data-close="true" data-align="right" data-language="en_US" data-available="es_MX">
                            </div>
                            Hora de Entrada:
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
                            Hora de LLegada:
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

                                <br> 
                            <input type="submit" value="Guardar" class="btn btn-success center-block"/>
                                                
                        </form>
                        
                    </div>
                </div>

            </div>
          </div>
    </body>
</html>

