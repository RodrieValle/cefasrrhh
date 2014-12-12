<%-- 
    Document   : ordenDescuentoEmpleado
    Created on : 31-oct-2014, 9:43:23
    Author     : MARIA JUAREZ
--%>
<%@page import="java.util.Date"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Bitacora"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_OrdenDeDescuento"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_OrdenDeDescuento"%>
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

    
    
    
    
       //peticion de modificacion
        if(request.getParameter("fecha") != null)
    { 
        int codigoOrden = Integer.parseInt(request.getParameter("codigoOrden"));
        int codigo = Integer.parseInt(request.getParameter("empcodigo"));
        Date fecha = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("fecha").toString());
        float monto = Float.parseFloat(request.getParameter("monto"));
        float cuota = Float.parseFloat(request.getParameter("cuotaMensual"));
        float saldo= Float.parseFloat(request.getParameter("saldo"));
        int plazo = Integer.parseInt(request.getParameter("numeroCuotas"));
        String institucion=request.getParameter("institucion");
        
       //String mensaje="";
          
        CtrlCEFAS_OrdenDeDescuento ctrlOrden = new CtrlCEFAS_OrdenDeDescuento();
        int resultado=ctrlOrden.actualizarOrden(codigoOrden, codigo, fecha, cuota, monto, plazo, saldo, institucion);
        if(resultado==1){
             mensaje = "<br><br><div class='alert alert-success' role='alert'><button type='button' class='close'"
                + " data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>"
                + "La actualizacion se realizo con exito</div>";
              CtrlCEFAS_Bitacora ctrlBitacora= new CtrlCEFAS_Bitacora();
        ctrlBitacora.guardarBitacora((Integer) sesionOk.getAttribute("codigo"), "Se actualizo la orden con codigo "+codigoOrden);
             
        }else{
         mensaje = "<br><br><div class='alert alert-danger' role='alert'><button type='button' class='close'"
                + " data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>"
                + "Error en la actualizacion del registro vuelva a intentar</div>";
        }    
}
    
    
    //peticion de eliminacion
      //peticion de eliminacion
    if(request.getParameter("codigoO") != null)
    { 
    int resultado=0;
     int codigoOrden = Integer.parseInt(request.getParameter("codigoO"));
     
       CtrlCEFAS_OrdenDeDescuento ctrlOrden = new CtrlCEFAS_OrdenDeDescuento();
       resultado=ctrlOrden.eliminarOrden(codigoOrden);
     
          if(resultado==1){
             mensaje = "<br><br><div class='alert alert-success' role='alert'><button type='button' class='close'"
                + " data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>"
                + "La eliminación se realizo con exito</div>";
              CtrlCEFAS_Bitacora ctrlBitacora= new CtrlCEFAS_Bitacora();
        ctrlBitacora.guardarBitacora((Integer) sesionOk.getAttribute("codigo"), "Se elimino la orden con codigo " +codigoOrden);
             
        }else{
         mensaje = "<br><br><div class='alert alert-danger' role='alert'><button type='button' class='close'"
                + " data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>"
                + "Error en la eliminación del registro vuelva a intentar</div>";
        }
   
    }
    

    
    

    CtrlCEFAS_OrdenDeDescuento ctrlOrden = new CtrlCEFAS_OrdenDeDescuento();
    List<CEFAS_OrdenDeDescuento> listaOrden = ctrlOrden.getOrdenesDeDescuento();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ordenes de Descuento</title>
        <jsp:include page='inc/head_common.jsp' /> 
    </head>
    <body>
        <%= mensaje%>
<div id="container">
<jsp:include page='inc/menu_administradora.jsp' />

            <div class="container">
        <h1>Lista Ordenes de Descuento</h1>
        
      
                      <div class="panel panel-primary">
                          <div class="panel-heading">Ordenes de descuento</div>
                          
                  
                        <div class="panel-body">
                            
                            
                            
                             <table class="table table-striped table-hover">
                                    <tbody>
                                                  <tr>
                                            <td>Código de Orden</td>
                                            <td>Código Empleado</td> 
                                            <td>Fecha de Ingreso</td>
                                            <td>Monto</td> 
                                            <td>Plazos</td> 
                                            <td>Saldo</td> 
                                            <td>Cuota Mensual</td> 
                                            <td>Institucion</td> 
                                            <td></td>
                                            <td></td>
                                        </tr> 
                                     <%
                    for(CEFAS_OrdenDeDescuento orden: listaOrden)
                    {
                %>  
                                        <tr>
                                            <td><%= orden.getOddCodigo() %></td>
                                            <td> <%= orden.getEmpCodigo() %></td>
                                            <td><%= new SimpleDateFormat("dd/MM/yyyy").format(orden.getOddFecha())%></td>
                                            
                                            <td>$ <%= String.format("%.2f", orden.getOddMonto()) %></td>
                                            <td> <%= orden.getOddPlazo() %></td>
                                            <td>$<%= String.format("%.2f", orden.getOddSaldo()) %></td>
                                            <td>$ <%= String.format("%.2f", orden.getOddCuota()) %></td>
                                            <td><%=orden.getOddInstitucion() %></td> 
                                            <td><a href="ordenDescuentoModificar.jsp?codigo=<%=orden.getOddCodigo()%>" class="btn btn-primary btn-md" role="button">Modificar Orden</a></td>
                                            <td><a href="ordenDescuentoEmpleado.jsp?codigoO=<%=orden.getOddCodigo()%>" class="btn btn-primary btn-md" role="button">Eliminar Orden</a></td>
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
