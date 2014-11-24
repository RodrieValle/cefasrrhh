<%-- 
    Document   : anticipoModificar
    Created on : 30-oct-2014, 21:49:53
    Author     : MARIA JUAREZ
--%>

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
if(request.getParameter("fecha") != null)
    { 
        int codigoAtp = Integer.parseInt(request.getParameter("codigo"));
        int codigo = Integer.parseInt(request.getParameter("empcodigo"));
        Date fecha = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("fecha").toString());
        float cantidad = Float.parseFloat(request.getParameter("cantidad"));
       //String mensaje="";
          
        CtrlCEFAS_Anticipo ctrlAnticipo = new CtrlCEFAS_Anticipo();
        int resultado=ctrlAnticipo.actualizarAnticipo(codigoAtp, codigo, fecha, cantidad);
        
        if(resultado==1){
             mensaje = "<br><br><div class='alert alert-success' role='alert'><button type='button' class='close'"
                + " data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>"
                + "La actualizacion se realizo con exito</div>";
              CtrlCEFAS_Bitacora ctrlBitacora= new CtrlCEFAS_Bitacora();
        ctrlBitacora.guardarBitacora((Integer) sesionOk.getAttribute("codigo"), "Se actualizo el anticipo con codigo "+codigoAtp);
             
        }else{
         mensaje = "<br><br><div class='alert alert-success' role='alert'><button type='button' class='close'"
                + " data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>"
                + "Error en la actualizacion del registro vuelva a intentar</div>";
        }
        
        
}

    int codigoAnticipo = Integer.parseInt(request.getParameter("codigo"));
    //CtrlCEFAS_Empleado ctrlEmpleado = new CtrlCEFAS_Empleado();
    //CEFAS_Empleado empleado = ctrlEmpleado.getEmpleadoPorUsuario(codigoEmp);
    
    CtrlCEFAS_Anticipo ctrlAnticipo = new CtrlCEFAS_Anticipo();
    CEFAS_Anticipo anticipo=ctrlAnticipo.getAnticipo(codigoAnticipo);
       
    response.setContentType("text/html;charset=UTF-8");
    
    
    
    
%>


<!DOCTYPE html>
<html>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Anticipo</title>
         <jsp:include page='inc/head_common.jsp' />
         <link rel="stylesheet" type="text/css" href="css/bootstrap-formhelpers.css">
        <script type="text/javascript" src="js/bootstrap-formhelpers.js"></script>
    </head>
    <body>
        
        
         <div id="container">
<jsp:include page='inc/menu_administradora.jsp' />

            <div class="container">
                
                <h2 class="form-signin-heading">Modificar Anticipo</h2>
                 <form class="form-signin" role="form" method="post" action="anticipoModificar.jsp">
                <div class="panel panel-primary">
                        <div class="panel-heading">Modifique los datos del anticipo.</div>
                        <div class="panel-body">
                <div class="row">
                   
                      <div class="col-xs-4">
                                    <img src="" class="center-block" alt="fotoempleado" width="150" height="150"/>
                                </div>
                    
                           
                     <div class="col-xs-4">  
                                  
                         Codigo Empleado:<input  type="text" name="empcodigo" value="<%= anticipo.getEmpCodigo() %>" class="form-control input-sm"  required />
                         
                                  
                        
                         Fecha: <input id="fecha" type="text" name="fecha"  value="<%= new SimpleDateFormat("dd/MM/yyyy").format(anticipo.getAtpFecha())%>"class="form-control input-sm" placeholder="Formato: dd/MM/yyyy"required />
                         
                           </div>
                    <div class="col-xs-4">  
                        Codigo Anticipo:<input  type="text" name="codigo" value="<%= anticipo.getAtpCodigo() %>" class="form-control input-sm"  required />
                        Cantidad: <br>
                                    <div class="input-group">
                                        <span class="input-group-addon input-sm">$</span>
                                        <input type="text" name="cantidad"  value="<%= anticipo.getAtpCantidad() %>"class="form-control input-sm" required><br>
                                    </div><br>
                          
                    </div>
                </div>
               </div>
             </div>
 <input type="submit" value="Guardar" class="btn btn-success center-block"/><br>
 </form>
<%= mensaje%>
  </div><%-- fin class=container --%>
  </div><%-- fin id=container --%>
    </body>
</html>
