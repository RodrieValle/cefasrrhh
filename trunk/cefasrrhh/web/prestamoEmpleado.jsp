<%-- 
    Document   : prestamoEmpleado
    Created on : 31-oct-2014, 9:44:09
    Author     : MARIA JUAREZ
--%>
<%@page import="java.util.Date"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Bitacora"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Prestamo"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Prestamo"%>
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
        int codigoPrestamo = Integer.parseInt(request.getParameter("codigoPres"));
        int codigo = Integer.parseInt(request.getParameter("empcodigo"));
        Date fecha = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("fecha").toString());
        float monto = Float.parseFloat(request.getParameter("monto"));
        float cuota = Float.parseFloat(request.getParameter("cuotaMensual"));
        float saldo= Float.parseFloat(request.getParameter("saldo"));
        int plazo = Integer.parseInt(request.getParameter("numeroCuotas"));
        
       //String mensaje="";
          
        CtrlCEFAS_Prestamo ctrlPrestamo  = new CtrlCEFAS_Prestamo ();
        int resultado=ctrlPrestamo.actualizarPrestamo(codigoPrestamo, codigo, fecha, cuota, monto, plazo, saldo);
        if(resultado==1){
             mensaje = "<br><br><div class='alert alert-success' role='alert'><button type='button' class='close'"
                + " data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>"
                + "La actualizacion se realizo con exito</div>";
              CtrlCEFAS_Bitacora ctrlBitacora= new CtrlCEFAS_Bitacora();
        ctrlBitacora.guardarBitacora((Integer) sesionOk.getAttribute("codigo"), "Se actualizo el prestamo con codigo "+codigoPrestamo);
             
        }else{
         mensaje = "<br><br><div class='alert alert-success' role='alert'><button type='button' class='close'"
                + " data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>"
                + "Error en la actualizacion del registro vuelva a intentar</div>";
        }    
}
    
    
    //peticion de eliminacion
      //peticion de eliminacion
    if(request.getParameter("codigoP") != null)
    { 
    int resultado=0;
     int codigoPres = Integer.parseInt(request.getParameter("codigoP"));
     
       CtrlCEFAS_Prestamo ctrlPrestamo = new CtrlCEFAS_Prestamo();
       resultado=ctrlPrestamo.eliminarPrestamo(codigoPres);
     
          if(resultado==1){
             mensaje = "<br><br><div class='alert alert-success' role='alert'><button type='button' class='close'"
                + " data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>"
                + "La eliminación se realizo con exito</div>";
              CtrlCEFAS_Bitacora ctrlBitacora= new CtrlCEFAS_Bitacora();
        ctrlBitacora.guardarBitacora((Integer) sesionOk.getAttribute("codigo"), "Se elimino el Prestamo con codigo " +codigoPres);
             
        }else{
         mensaje = "<br><br><div class='alert alert-success' role='alert'><button type='button' class='close'"
                + " data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>"
                + "Error en la eliminación del registro vuelva a intentar</div>";
        }
   
    }
    


    CtrlCEFAS_Prestamo ctrlPrestamo= new CtrlCEFAS_Prestamo();
    List<CEFAS_Prestamo> listaPrestamos = ctrlPrestamo.getPrestamos();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Prestamos Institucionales</title>
        <jsp:include page='inc/head_common.jsp' /> 
    </head>
    <body>
      
     <%= mensaje%>
            
<div id="container">
<jsp:include page='inc/menu_administradora.jsp' />

            <div class="container">
        <h1>Lista de Préstamos</h1>
        
      
                      <div class="panel panel-primary">
                          <div class="panel-heading">Préstamos Otorgados</div>
                          
                  
                        <div class="panel-body">
                            
                            
                            
                             <table class="table table-striped table-hover">
                                    <tbody>
                                                  <tr>
                                            <td>Código de Préstamo</td>
                                            <td>Código Empleado</td> 
                                            <td>Fecha de Ingreso</td>
                                            <td>Monto</td> 
                                            <td>Plazos</td> 
                                            <td>Saldo</td> 
                                            <td>Cuota Mensual</td> 
                                            
                                            <td></td>
                                            <td></td>
                                        </tr> 
                                     <%
                    for(CEFAS_Prestamo prestamo: listaPrestamos)
                    {
                %>  
                                        <tr>
                                            <td><%= prestamo.getPrmCodigo() %></td>
                                            <td> <%= prestamo.getEmpCodigo() %></td>
                                            <td><%= new SimpleDateFormat("dd/MM/yyyy").format(prestamo.getPrmFecha())%></td>
                                            
                                            <td>$ <%= String.format("%.2f", prestamo.getPrmMonto()) %></td>
                                            <td> <%= prestamo.getPrmPlazo() %></td>
                                            <td>$<%= String.format("%.2f", prestamo.getPrmSaldo()) %></td>
                                            <td>$ <%= String.format("%.2f", prestamo.getPrmCuota()) %></td>
                                            <td><a href="prestamoModificar.jsp?codigo=<%=prestamo.getPrmCodigo()%>" class="btn btn-primary btn-md" role="button">Modificar Prestamo</a></td>
                                            <td><a href="prestamoEmpleado.jsp?codigoP=<%=prestamo.getPrmCodigo()%>" class="btn btn-primary btn-md" role="button">Eliminar Prestamo</a></td>
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
