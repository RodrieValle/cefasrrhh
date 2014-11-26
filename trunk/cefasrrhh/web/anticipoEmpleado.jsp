<%-- 
    Document   : anticipoEmpleado
    Created on : 28-oct-2014, 11:17:46
    Author     : JUAREZ
--%>

<%@page import="java.util.Date"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Bitacora"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Empleado"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Anticipo"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Anticipo"%>
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
    
    //peticion de eliminacion
    if(request.getParameter("codigoAnt") != null)
    { 
    int resultado=0;
     int codigoAtp = Integer.parseInt(request.getParameter("codigoAnt"));
     
       CtrlCEFAS_Anticipo ctrlAnticipo = new CtrlCEFAS_Anticipo();
       resultado=ctrlAnticipo.eliminarAnticipo(codigoAtp);
     
          if(resultado==1){
             mensaje = "<br><br><div class='alert alert-success' role='alert'><button type='button' class='close'"
                + " data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>"
                + "La eliminación se realizo con exito</div>";
              CtrlCEFAS_Bitacora ctrlBitacora= new CtrlCEFAS_Bitacora();
        ctrlBitacora.guardarBitacora((Integer) sesionOk.getAttribute("codigo"), "Se elimino el anticipo con codigo " +codigoAtp);
             
        }else{
         mensaje = "<br><br><div class='alert alert-success' role='alert'><button type='button' class='close'"
                + " data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>"
                + "Error en la eliminación del registro vuelva a intentar</div>";
        }
        
        
    }
    
    
if(request.getParameter("fecha") != null)
    { 
        int codigoAtp = Integer.parseInt(request.getParameter("atpcodigo"));
        int codigo = Integer.parseInt(request.getParameter("codigo"));
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
    
    
int codigoEmp = Integer.parseInt(request.getParameter("codigo"));
    CtrlCEFAS_Empleado ctrlEmpleado = new CtrlCEFAS_Empleado();
    CEFAS_Empleado empleado = ctrlEmpleado.getEmpleadoPorUsuario(codigoEmp);

    CtrlCEFAS_Anticipo ctrlAnticipo = new CtrlCEFAS_Anticipo();
    List<CEFAS_Anticipo> listaAnticipo = ctrlAnticipo.getAnticiposEmpleado(codigoEmp);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Anticipos de Empleado: <%= empleado.getEmpNombre() %></title>
        <jsp:include page='inc/head_common.jsp' /> 
    </head>
    <body>
        <%= mensaje%>
<div id="container">
<jsp:include page='inc/menu_administradora.jsp' />

            <div class="container">
        <h1>Lista de anticipos del empleado</h1>
        
      
                      <div class="panel panel-primary">
                          <div class="panel-heading">Anticipos del empleado: <%= empleado.getEmpNombre() %></div>
                          
                  
                        <div class="panel-body">
                            
                            
                            
                             <table class="table table-striped table-hover">
                                    <tbody>
                                                  <tr>
                                            <td>Codigo Anticipo</td>
                                            <td>Fecha</td> 
                                            <td>Cantidad</td>
                                            <td></td>
                                            <td></td>
                                        </tr> 
                                     <%
                    for(CEFAS_Anticipo anticipo: listaAnticipo)
                    {
                %>  
                                        <tr>
                                            <td><%= anticipo.getAtpCodigo() %></td>
                                            <td><%= new SimpleDateFormat("dd/MM/yyyy").format(anticipo.getAtpFecha())%></td>
                                            <td>$ <%= String.format("%.2f", anticipo.getAtpCantidad()) %></td>
                                            <td><a href="anticipoModificar.jsp?codigo=<%=anticipo.getAtpCodigo()%>" class="btn btn-primary btn-md" role="button">Modificar Anticipo</a></td>
                                            <td><a href="anticipoEmpleado.jsp?codigoAnt=<%=anticipo.getAtpCodigo()%>&codigo=<%=empleado.getEmpCodigo()%>" class="btn btn-primary btn-md" role="button">Eliminar Anticipo</a></td>
                                        </tr>
                                      <%
                                    } %>  
                                    </tbody>
                                </table>

                        </div>
                      </div>
                
        </div>
        </div>
    </body>
</html>
