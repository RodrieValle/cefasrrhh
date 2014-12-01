<%-- 
    Document   : registro
    Created on : 11-26-2014, 08:32:23 PM
    Author     : Rodrigo
--%>
<%@page import="java.util.List"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Usuario"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Empleado"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Candidato"%>
<%
    //Verificación de sesión abierta
    HttpSession sesionOk = request.getSession();
    String tipo = (String) sesionOk.getAttribute("tipo");
    if (tipo == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
    if (!tipo.equals("director")) {
        response.sendRedirect("avisos.jsp");
    }
    request.setCharacterEncoding("UTF-8");
    if(request.getParameter("usuario")!=null)
    {
        String nombre = request.getParameter("nombre");
        Date fechaContratacion = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("fechaContratacion"));
        String plaza = request.getParameter("plaza");
        int jefeInmediato = Integer.parseInt(request.getParameter("jefeInmediato"));
        float salario = Float.parseFloat(request.getParameter("salario"));
        String tipoContrato = request.getParameter("tipoContrato");
        CtrlCEFAS_Empleado ctrlEmpleado = new CtrlCEFAS_Empleado();
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("pw1");
        String tipoUsuario = request.getParameter("tipoUsuario");
        ctrlEmpleado.registrar(nombre, fechaContratacion, plaza, jefeInmediato, salario, tipoContrato);
        CtrlCEFAS_Usuario ctrlUsuario = new CtrlCEFAS_Usuario();
        ctrlUsuario.registrar(usuario, password, tipoUsuario);
    }
    //Saber de cual página viene
    String nombre = "";
    if (request.getHeader("Referer") != null) {
        String partes[] = request.getHeader("Referer").split("/");
        String pagina = partes[partes.length - 1];

        if (pagina.equals("gestionarcandidato.jsp")) {
            CtrlCEFAS_Candidato ctrlCandidato = new CtrlCEFAS_Candidato();
            nombre = ctrlCandidato.consultarPorCodigo(Integer.parseInt(request.getParameter("codigo").toString())).getCdtNombre();
        }
    }
    CtrlCEFAS_Empleado ctrlEmpleado = new CtrlCEFAS_Empleado();
    List<CEFAS_Empleado> empleados = ctrlEmpleado.obtenerEmpleados();

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de usuario</title>
        <jsp:include page='inc/head_common.jsp' /> 
        <link rel="stylesheet" type="text/css" href="css/bootstrap-formhelpers.css">
        <script type="text/javascript" src="js/bootstrap-formhelpers.js"></script>
    </head>
    <body>
        <div id="container">
            <jsp:include page='inc/menu_directora.jsp' />
            <div class="container">
                <h1>Registro de empleado</h1>
                <form action="registro.jsp" method="post">
                    <div class="panel panel-primary">
                    <div class="panel-heading">Datos de usuario</div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-xs-4 col-xs-offset-1">
                                Nombre de usuario:
                                <input type="text" class="form-control input-sm" maxlength="50" name="usuario" required/><br>

                                Tipo de usuario:
                                <select name="tipoUsuario" required class="form-control input-sm">
                                    <option value="director">Director</option>
                                    <option value="subdirector">Subdirector</option>
                                    <option value="asistente">Asistente</option>
                                    <option value="administrador">Administrador</option>
                                    <option value="empleado">Empleado</option>
                                </select><br>
                            </div>
                            <div class="col-xs-4 col-xs-offset-2">
                                Contraseña:
                                <input type="password" class="form-control input-sm" maxlength="50" name="pw1" required /><br>
                                Confirmación de contraseña:
                                <input type="password" class="form-control input-sm" maxlength="50" name="pw2" required /><br>
                            </div><div class="col-xs-1"> </div>
                            <div class="col-xs-12"> *La contraseña puede ser modificada más tarde por el empleado</div>
                            
                        </div>
                    </div>
                  </div>
                  <div class="panel panel-primary">
                  <div class="panel-heading">Datos de empleado</div>
                    <div class="panel-body">
                        <div class="col-xs-4 col-xs-offset-1">
                            Nombre de empleado:
                            <input type="text" class="form-control input-sm" maxlength="50" name="nombre" required value="<%= nombre %>"/><br>
                            Fecha de contratación:
                            <div class="bfh-datepicker" data-format="d/m/y"  data-name="fechaContratacion" data-language="es" data-input="input-sm form-control" data-icon=""
                                                data-close="true" data-align="right">
                            </div><br>
                            Plaza:
                            <input type="text" class="form-control input-sm" maxlength="50" name="plaza" required /><br>
                        </div>
                        <div class="col-xs-4 col-xs-offset-2">
                            Jefe inmediato:
                            <select name="jefeInmediato" class="form-control input-sm">
                                <%
                                    for(CEFAS_Empleado emp : empleados)
                                    { %>
                                    <option value="<%= emp.getEmpCodigo() %>"><%= emp.getEmpNombre() %></option>
                                 <% }
                                %>
                            </select><br>
                            Salario:
                            <input type="number" class="form-control input-sm" maxlength="50" name="salario" required /><br>
                            Tipo de contrato:
                            <input type="text" class="form-control input-sm" maxlength="50" name="tipoContrato" required /><br>
                        </div>
                    </div>
                  </div> 
                            <input type="submit" value="Registrar" class="btn btn-success center-block"/><br><br>
               </form>
            </div>
        </div>
    </body>
</html>