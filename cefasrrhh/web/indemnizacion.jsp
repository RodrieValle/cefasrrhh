<%-- 
    Document   : indemnizacion
    Created on : 24-nov-2014, 1:37:57
    Author     : MARIA JUAREZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_LineaDePlanilla"%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
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
    if (!tipo.equals("administrador")) {
        response.sendRedirect("avisos.jsp");
    }
    
  CtrlCEFAS_Empleado ctrlEmpleado = new CtrlCEFAS_Empleado();
    List<CEFAS_Empleado> listaEmpleados;
    listaEmpleados = ctrlEmpleado.obtenerEmpleados();
    String mensaje="";
   
    if (request.getParameter("codigo") != null) {
       
        int codigoemp = Integer.parseInt(request.getParameter("codigo"));
          CtrlCEFAS_LineaDePlanilla ctrlLinea = new CtrlCEFAS_LineaDePlanilla() ;      
    ctrlEmpleado.obtenerEmpleados(1, Integer.toString(codigoemp));
        float indemnizacion=ctrlLinea.calculoIndemnizacion(codigoemp);
        String nomb=ctrlEmpleado.getEmpleadoPorID(codigoemp).getEmpNombre();
        
      mensaje = "<br><br><div class='alert alert-success' role='alert'><button type='button' class='close'"
                + " data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>"
                + "La indemnizacion del empleado con codigo " +codigoemp+ " con nombre " + nomb+ " es de $" +indemnizacion+ " quien ha laborado en la empresa"
                +" durante " +ctrlEmpleado.tiempoTrabajado(codigoemp).get(2) + " años.</div>";
    }
   
    
%>


<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calculo de Indemnizacion</title>
        <jsp:include page='inc/head_common.jsp' /> 
        <link rel="stylesheet" type="text/css" href="css/bootstrap-formhelpers.css">
        <script type="text/javascript" src="js/bootstrap-formhelpers.js"></script>

    </head>
    <body>
        <div id="container">
           
            <jsp:include page='inc/menu_administradora.jsp' />
         
            <div class="container">
                <h1>Calculo de indemnizacion del Empleado</h1>
                
                <div class="row">
                    <div class="col-xs-4 col-xs-offset-4">
                        <form action="indemnizacion.jsp" method="post">

                            Empleado: <select name="codigo" id="empleado" class="form-control">
                                <% for (CEFAS_Empleado emp: listaEmpleados) {%>
                                <option value="<%= emp.getEmpCodigo()%>"><%= emp.getEmpNombre()%></option>
                              
                                <% }%>
                            </select> <br>
                            

                           

                                <br> 
                            <input type="submit" value="Calcular" class="btn btn-success center-block"/>
                                                
                        </form>
                        <%= mensaje%>
                    </div>
                </div>

            </div>
          </div>
    </body>
</html>
