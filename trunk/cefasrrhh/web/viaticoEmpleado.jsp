<%-- 
    Document   : viaticoEmpleado
    Created on : 28-oct-2014, 11:23:24
    Author     : MARIA JUAREZ
--%>

<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Bitacora"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Viatico"%>
<%@page import="java.util.List"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Viatico"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Empleado"%>
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
        response.sendRedirect("avisos.jsp");}

    
    //peticion de modificacion
        if(request.getParameter("fecha") != null)
    { 
        int codigoVia = Integer.parseInt(request.getParameter("viacodigo"));
        int codigo = Integer.parseInt(request.getParameter("codigo"));
        Date fecha = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("fecha").toString());
        float cantidad = Float.parseFloat(request.getParameter("cantidad"));
        String descripcion = request.getParameter("descripcion");
       //String mensaje="";
          
        CtrlCEFAS_Viatico ctrlViatico = new CtrlCEFAS_Viatico();
        int resultado=ctrlViatico.actualizarViatico(codigoVia, codigo, fecha, cantidad, descripcion);
        if(resultado==1){
             mensaje = "<br><br><div class='alert alert-success' role='alert'><button type='button' class='close'"
                + " data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>"
                + "La actualizacion se realizo con exito</div>";
              CtrlCEFAS_Bitacora ctrlBitacora= new CtrlCEFAS_Bitacora();
        ctrlBitacora.guardarBitacora((Integer) sesionOk.getAttribute("codigo"), "Se actualizo el viatico con codigo "+codigoVia );
             
        }else{
         mensaje = "<br><br><div class='alert alert-success' role='alert'><button type='button' class='close'"
                + " data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>"
                + "Error en la actualizacion del registro vuelva a intentar</div>";
        }    
}
    
    
    //peticion de eliminacion
      //peticion de eliminacion
    if(request.getParameter("codigoAnt") != null)
    { 
    int resultado=0;
     int codigoVia = Integer.parseInt(request.getParameter("codigoAnt"));
     
       CtrlCEFAS_Viatico ctrlviatico = new CtrlCEFAS_Viatico();
       resultado=ctrlviatico.eliminarViatico(codigoVia);
     
          if(resultado==1){
             mensaje = "<br><br><div class='alert alert-success' role='alert'><button type='button' class='close'"
                + " data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>"
                + "La eliminación se realizo con exito</div>";
              CtrlCEFAS_Bitacora ctrlBitacora= new CtrlCEFAS_Bitacora();
        ctrlBitacora.guardarBitacora((Integer) sesionOk.getAttribute("codigo"), "Se elimino el Viatico con codigo " +codigoVia);
             
        }else{
         mensaje = "<br><br><div class='alert alert-success' role='alert'><button type='button' class='close'"
                + " data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>"
                + "Error en la eliminación del registro vuelva a intentar</div>";
        }
        
        
    }
    
    
    
int codigoEmp = Integer.parseInt(request.getParameter("codigo"));
    CtrlCEFAS_Empleado ctrlEmpleado = new CtrlCEFAS_Empleado();
    CEFAS_Empleado empleado = ctrlEmpleado.getEmpleadoPorUsuario(codigoEmp);

    CtrlCEFAS_Viatico ctrlViatico= new CtrlCEFAS_Viatico();
    List<CEFAS_Viatico> listaViatico=ctrlViatico.getViaticosEmpleado(codigoEmp);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Viaticos de Empleado</title>
        <jsp:include page='inc/head_common.jsp' />
    </head>
    <body>
        <%= mensaje%>
        
        <div id="container">
<jsp:include page='inc/menu_administradora.jsp' />

            <div class="container">
        <h1>Lista de Viaticos del Empleado</h1>
        
      
                      <div class="panel panel-primary">
                          <div class="panel-heading">Viaticos del empleado: <%= empleado.getEmpNombre() %></div>
                          
                  
                        <div class="panel-body">
                            
                            
                            
                             <table class="table table-striped table-hover">
                                    <tbody>
                                    <tr>
                                            <td>Codigo Viatico</td>
                                            <td>Fecha</td> 
                                            <td>Cantidad</td>
                                            <td>Descripcion</td>
                                            <td></td>
                                            <td></td>
                                        </tr> 
                                        
                                          <%
                    for(CEFAS_Viatico viatico: listaViatico)
                    {
                %>  
                                        <tr>
                                            <td><%= viatico.getViaCodigo() %></td>
                                            <td><%= new SimpleDateFormat("dd/MM/yyyy").format(viatico.getViaFecha())%></td>
                                            <td>$ <%= String.format("%.2f", viatico.getViaCantidad())%></td>
                                            <td><%= viatico.getViaDescripcion()%></td>
                                            <td><a href="viaticoModificar.jsp?codigo=<%=viatico.getViaCodigo() %>" class="btn btn-primary btn-md" role="button">Modificar Viatico</a></td>
                                            <td><a href="viaticoEmpleado.jsp?codigoAnt=<%=viatico.getViaCodigo()%>&codigo=<%=empleado.getEmpCodigo()%>" class="btn btn-primary btn-md" role="button">Eliminar Viatico</a></td>
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
