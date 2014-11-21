<%-- 
    Document   : viaticoNuevo
    Created on : 28-oct-2014, 11:23:11
    Author     : MARIA JUAREZ
--%>

<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Empleado"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
  
//Verificación de sesión abierta
 
 HttpSession sesionOk = request.getSession();
    String tipo = (String) sesionOk.getAttribute("tipo");
    if (tipo == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
    if (!tipo.equals("administrador")) {
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
        <title>Nuevo Viático</title>
         <jsp:include page='inc/head_common.jsp' />
         <link rel="stylesheet" type="text/css" href="css/bootstrap-formhelpers.css">
        <script type="text/javascript" src="js/bootstrap-formhelpers.js"></script>
    </head>
    <body>
        
        
        
         <div id="container">
<jsp:include page='inc/menu_administradora.jsp' />

            <div class="container">
                
                <h2 class="form-signin-heading">Nuevo Viático</h2>
                 <form class="form-signin" role="form" method="post" action="viatico.jsp">
                <div class="panel panel-primary">
                        <div class="panel-heading">Ingrese Datos del Viatico Nuevo</div>
                        <div class="panel-body">
                <div class="row">
                   
                      <div class="col-xs-4">
                                    <img src="<%= empleado.getEmpFoto() %>" class="center-block" alt="fotoempleado" width="150" height="150"/>
                                </div>
                    
                           
                     <div class="col-xs-4">  
                                  
                         Codigo Empleado:<input  type="text" name="empcodigo" value="<%= empleado.getEmpCodigo() %>" class="form-control input-sm"  required readonly/>
                         
                                  
                        
                         Fecha: <div class="bfh-datepicker" data-format="d/m/y"  data-name="fecha" data-language="es" data-input="input-sm form-control" data-icon=""
                                data-close="true" data-align="right">
                                </div>
                         
                           </div>
                    <div class="col-xs-4">  
                        Nombre:<input  type="text" name="nombre" value="<%= empleado.getEmpNombre() %>" class="form-control input-sm"  required readonly/>
                        Cantidad: <br>
                                    <div class="input-group">
                                        <span class="input-group-addon input-sm">$</span>
                                        <input type="number" name="cantidad"  class="form-control input-sm" required min="0.00"><br>
                                    </div><br>
                          
                    </div>
                </div>
                        
                     <div class="row">   
                         <div class="col-xs-4">  
                            </div> 
                             <div class="col-xs-8">  
                                
                            Descripción: <textarea name="descripcion" rows="4" cols="40" class="form-control input-sm" placeholder="Escriba una breve descripción."></textarea>
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
