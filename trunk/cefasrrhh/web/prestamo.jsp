<%-- 
    Document   : prestamo
    Created on : 31-oct-2014, 9:38:43
    Author     : MARIA JUAREZ
--%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Prestamo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Anticipo"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Anticipo"%>
<%@page import="java.util.List"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Empleado"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
 
    // Verificación de sesión abierta
 
 HttpSession sesionOk = request.getSession();
    String tipo = (String) sesionOk.getAttribute("tipo");
    if (tipo == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
    if (!tipo.equals("administrador")) {
        response.sendRedirect("avisos.jsp");
    }


 //Datos  
    if(request.getParameter("fecha") != null)
    { 
        
        int codigo = Integer.parseInt(request.getParameter("empcodigo"));
       //String nombre = request.getParameter("nombre");
        Date fecha = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("fecha").toString());
        float monto= Float.parseFloat(request.getParameter("monto"));
        int plazo = Integer.parseInt(request.getParameter("numeroCuotas"));
        float cuota = Float.parseFloat(request.getParameter("cuotaMensual"));
        
  
        CtrlCEFAS_Prestamo ctrlPrestamo = new CtrlCEFAS_Prestamo();
        ctrlPrestamo.guardarPrestamo(codigo, fecha, monto, plazo, cuota);
}
    
        CtrlCEFAS_Empleado ctrlEmpleado = new CtrlCEFAS_Empleado();
    List<CEFAS_Empleado> listaEmpleados = ctrlEmpleado.obtenerEmpleados();
%>
<!DOCTYPE html>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administracion de Prestamos Institucionales</title>
         <jsp:include page='inc/head_common.jsp' /> 
    </head>
    <body>
       
        <div id="container">
            <jsp:include page='inc/menu_administradora.jsp' />
            <div class="container">
                <h1>Administracion de Prestamo Institucional.</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">Zona de búsqueda</div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-xs-8 col-xs-offset-2">
                                Buscar empleado por cualquier criterio
                                <div class="input-group">
                                    <input type="text" class="form-control">
                                    <span class="input-group-btn">
                                        <button class="btn btn-success" type="button">
                                            <span class="glyphicon glyphicon-search"></span> 
                                        </button>
                                    </span>
                                </div>
                            </div>
                        </div>

                    </div>
                </div><%-- fin del buscador --%>
                
                <%-- inicio lista de empleados --%>
                
                <div class="container">
                <a href="prestamoEmpleado.jsp" class="btn btn-primary btn-md" role="button">Ver Prestamos Otorgados</a>
                 </div>
                
                <div class="panel panel-primary">
                          <div class="panel-heading">Empleados: <%= listaEmpleados.size() %></div>
                        <div class="panel-body">
                            <table class="table table-striped table-hover">
                                    <tbody>
                                     <% for(CEFAS_Empleado empleado: listaEmpleados)
                                    {
                                    %>   
                                        <tr>
                                            <td><img src="<%= empleado.getEmpFoto() %>" class="center-block" alt="fotoempleado" width="150" height="100"/></td>
                                            <td><%= empleado.getEmpNombre() %></td>
                                            <td><a href="prestamoNuevo.jsp?codigo=<%= empleado.getEmpCodigo() %>" class="btn btn-primary btn-md" role="button">Otorgar Prestamo</a></td>
                                           
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
