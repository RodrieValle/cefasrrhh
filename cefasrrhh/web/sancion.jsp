<%-- 
    Document   : sancion
    Created on : 30/10/2014, 10:32:35 AM
    Author     : Sergio
--%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Bitacora"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Sancion"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Sancion"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Empleado"%>
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

    int codigoEmp = Integer.parseInt(request.getParameter("codigo"));
    CtrlCEFAS_Empleado ctrlEmpleado = new CtrlCEFAS_Empleado();
    CEFAS_Empleado empleado = ctrlEmpleado.getEmpleadoPorUsuario(codigoEmp);

    response.setContentType("text/html;charset=UTF-8");

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aplicar Sanción-CEFAS RRHH</title>
        <jsp:include page='inc/head_common.jsp' /> 
        <link rel="stylesheet" type="text/css" href="css/bootstrap-formhelpers.css">
        <script type="text/javascript" src="js/bootstrap-formhelpers.js"></script>
    </head>
    <body>
        <div id="container">

            <jsp:include page='inc/menu_directora.jsp' />

            <div class="container">
                <h1 class="form-signin-heading">Ingresar Sanción</h1>
                <form class="form-signin" action="sancion.jsp" method="post">   

                    <div class="row">
                        <div class="col-xs-6 col-xs-offset-3">      
                            <div class="panel panel-primary">
                                <div class="panel-heading">Ingrese Datos de la Nueva Sanción</div>
                                <div class="panel-body">
                                    Nombre:<input  type="text" name="nombre"  value="<%= empleado.getEmpNombre()%>" class="form-control input-sm"  required readonly/><br>
                                    Fecha:  <div class="bfh-datepicker" data-format="d/m/y" data-name="fecha" data-icon="" data-input="form-control input-sm"
                                                 data-close="true" data-align="right" data-language="en_US" data-available="es_MX">
                                    </div><br>
                                    Código de Empleado:<input  type="text" name="empcodigo" value="<%= empleado.getEmpCodigo()%>" class="form-control input-sm"  required readonly/><br>
                                    Sanción:<textarea name="sancion" rows="4" cols="40" class="form-control input-sm" required></textarea><br>
                                    Motivo:<textarea name="motivo" rows="4" cols="40" class="form-control input-sm" required></textarea><br>
                                    <input type="submit" value="Guardar" class="btn btn-success center-block"/>
                                </div>
                            </div>
                        </div>
                    </div>               
                </form>
            </div> 
        </div>
    </body>
</html>
