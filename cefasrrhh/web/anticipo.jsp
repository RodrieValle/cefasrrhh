<%-- 
    Document   : anticipo
    Created on : 25-oct-2014, 18:25:17
    Author     : MARIA JUAREZ
--%>


    
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Bitacora"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Anticipo"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Anticipo"%>
<%@page import="java.util.List"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Empleado"%>

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

 //Datos  mira si es una solicitud de ingresar un nuevo registro
    if(request.getParameter("fecha") != null)
    { 
        
        int codigo = Integer.parseInt(request.getParameter("empcodigo"));
       //String nombre = request.getParameter("nombre");
        Date fecha = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("fecha").toString());
        float cantidad = Float.parseFloat(request.getParameter("cantidad"));
   
           
        CtrlCEFAS_Anticipo ctrlAnticipo = new CtrlCEFAS_Anticipo();
        int resultado=ctrlAnticipo.guardarAnticipo(codigo, fecha, cantidad);
        
         if(resultado==1){
             mensaje = "<br><br><div class='alert alert-success' role='alert'><button type='button' class='close'"
                + " data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>"
                + "El nuevo anticipo fue guardado correctamente</div>";
               CtrlCEFAS_Bitacora ctrlBitacora= new CtrlCEFAS_Bitacora();
        ctrlBitacora.guardarBitacora((Integer) sesionOk.getAttribute("codigo"), "Se almaceno un nuevo anticipo al empleado con codigo "+codigo);
        }else{
         mensaje = "<br><br><div class='alert alert-success' role='alert'><button type='button' class='close'"
                + " data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>"
                + "No se pudo guardar el nuevo anticipo.</div>";
        }     
}
    
    //obtiene todos los empleados
    CtrlCEFAS_Empleado ctrlEmpleado = new CtrlCEFAS_Empleado();
    List<CEFAS_Empleado> listaEmpleados;
    if(request.getParameter("dato")!= null)
    {
        int criterio = Integer.parseInt(request.getParameter("criterio"));
        String dato = request.getParameter("dato");
        listaEmpleados = ctrlEmpleado.obtenerEmpleados(criterio, dato);
    }
    else
    {
        listaEmpleados = ctrlEmpleado.obtenerEmpleados();
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingreso Anticipos</title>
         <jsp:include page='inc/head_common.jsp' /> 
    </head>
    <body>
       <%= mensaje%>
        <div id="container">
            <jsp:include page='inc/menu_administradora.jsp' />
            <div class="container">
                <h1>Ingreso Anticipo a Empleados.</h1>
                
                 <div class="panel panel-primary">
                    <div class="panel-heading">Zona de búsqueda</div>
                    <div class="panel-body">
                        <div class="row">
                            <form action="anticipo.jsp" method="post">
                            <div class="col-xs-4 col-xs-offset-1">
                                <select name="criterio" id="criterio" class="form-control input-sm">
                                    <option value="1">Código de empleado</option>
                                    <option value="2">Nombre</option>
                                    <option value="3">Fecha de nacimiento</option>
                                    <option value="4">Dirección</option>
                                    <option value="5">Año de contratación</option>
                                    <option value="6">Plaza actual</option>
                                    <option value="7">Plaza anterior</option>
                                    <option value="8">Jefe inmediato</option>
                                    <option value="9">Salario</option>
                                    <option value="10">Tipo de contrato</option>
                                    <option value="11">NUP</option>
                                    <option value="12">DUI</option>
                                    <option value="13">NIT</option>
                                    <option value="14">NIP</option>
                                    <option value="15">Teléfono</option>
                                    <option value="16">Celular</option>
                                    <option value="17">Correo</option>
                                    <option value="18">Título</option>
                                    <option value="19">Lugar de título</option>
                                    <option value="20">Fecha de título</option>
                                </select>
                            </div>
                            <div class="col-xs-4 col-xs-offset-2">
                                <div class="input-group">
                                    <input type="text" name="dato" class="form-control input-sm">
                                    <span class="input-group-btn">
                                        <button class="btn btn-sm btn-success" type="submit">
                                            <span class="glyphicon glyphicon-search"></span> 
                                        </button>
                                    </span>
                                </div>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
                
                <%-- inicio lista de empleados --%>
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
                                            <td><a href="anticipoNuevo.jsp?codigo=<%= empleado.getEmpCodigo() %>" class="btn btn-primary btn-md" role="button">Generar Anticipo</a></td>
                                            <td><a href="anticipoEmpleado.jsp?codigo=<%= empleado.getEmpCodigo() %>" class="btn btn-primary btn-md" role="button">Ver Anticipos</a></td>
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
