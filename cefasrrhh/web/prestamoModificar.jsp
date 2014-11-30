<%-- 
    Document   : anticipoModificar
    Created on : 30-oct-2014, 21:49:53
    Author     : MARIA JUAREZ
--%>

<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Prestamo"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Prestamo"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_OrdenDeDescuento"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_OrdenDeDescuento"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Bitacora"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Anticipo"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Anticipo"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Empleado"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
String mensaje="";
 HttpSession sesionOk = request.getSession();
    String tipo = (String) sesionOk.getAttribute("tipo");
    if (tipo == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
    if (!tipo.equals("administrador")) {
        response.sendRedirect("avisos.jsp");
    }

 int codigoPrestamo = Integer.parseInt(request.getParameter("codigo"));
    //CtrlCEFAS_Empleado ctrlEmpleado = new CtrlCEFAS_Empleado();
    //CEFAS_Empleado empleado = ctrlEmpleado.getEmpleadoPorUsuario(codigoEmp);
    
    CtrlCEFAS_Prestamo ctrlPrestamo  = new CtrlCEFAS_Prestamo();
    CEFAS_Prestamo  prestamo=ctrlPrestamo.getPrestamo(codigoPrestamo);
     
    CtrlCEFAS_Empleado ctrlEmpleado = new CtrlCEFAS_Empleado();
    CEFAS_Empleado empleado = ctrlEmpleado.getEmpleadoPorUsuario(prestamo.getEmpCodigo());
    response.setContentType("text/html;charset=UTF-8");
    
    
    
    
%>


<!DOCTYPE html>
<html>
    <head>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Prestamo</title>
         <jsp:include page='inc/head_common.jsp' />
         <link rel="stylesheet" type="text/css" href="css/bootstrap-formhelpers.css">
        <script type="text/javascript" src="js/bootstrap-formhelpers.js"></script>
    </head>
<body>
        
        
         <div id="container">
<jsp:include page='inc/menu_administradora.jsp' />

            <div class="container">
                
                <h2 class="form-signin-heading">Modificar Prestamo</h2>
                 <form class="form-signin" role="form" method="post" action="prestamoEmpleado.jsp">
                <div class="panel panel-primary">
                    <div class="panel-heading">Ingrese la Modificación del Prestamo. Empleado: <%=empleado.getEmpNombre()%> </div>
                        <div class="panel-body">
                <div class="row">
                   
                      <div class="col-xs-4">
                                    <img src="<%=empleado.getEmpFoto()%>" class="center-block" alt="fotoempleado" width="150" height="150"/>
                                </div>
                    
                           
                     <div class="col-xs-4">  
                          Codigo de Prestamo:<input  type="text" name="codigoPres" value="<%=prestamo.getPrmCodigo() %>" class="form-control input-sm"  required readonly />        
                        
                         
                                  
                         Fecha: <div class="bfh-datepicker" data-format="d/m/y" data-name="fecha" data-language="es" data-input="input-sm form-control" data-icon=""
                                data-close="true" data-align="right" data-date="<%= new SimpleDateFormat("dd/MM/yyyy").format(prestamo.getPrmFecha()) %>">
                                </div>
                         
                        Cuota Mensual: <br>
                                    <div class="input-group">
                                        <span class="input-group-addon input-sm">$</span>
                                        <input type="number" name="cuotaMensual" value="<%=prestamo.getPrmCuota() %>" class="form-control input-sm" required min="0.00"><br>
                                    </div><br>
                          Saldo: <br>
                                    <div class="input-group">
                                        <span class="input-group-addon input-sm">$</span>
                                        <input type="number" name="saldo" value="<%=prestamo.getPrmSaldo() %>" class="form-control input-sm" required min="0.00"><br>
                                    </div><br>
                           </div>
                    <div class="col-xs-4">  
                        Codigo Empleado:<input  type="text" name="empcodigo" value="<%=prestamo.getEmpCodigo() %>" class="form-control input-sm"  required readonly/>
                        
                       
                        Numero de cuotas:<input  type="number" name="numeroCuotas" value="<%=prestamo.getPrmPlazo() %>" class="form-control input-sm"  required min="0"/> 
                        Monto: <br>
                                    <div class="input-group">
                                        <span class="input-group-addon input-sm">$</span>
                                        <input type="number" name="monto" value="<%=prestamo.getPrmMonto() %>" class="form-control input-sm" required min="0.00"><br>
                                    </div><br>
                       
                    </div>
                </div>
               </div>
             </div>
 <input type="submit" value="Guardar" class="btn btn-success center-block"/><br>
 </form>

  </div><%-- fin class=container --%>
  </div><%-- fin id=container --%>
        
    </body>
</html>