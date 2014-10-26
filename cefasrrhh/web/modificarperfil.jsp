<%-- 
    Document   : modificarperfil
    Created on : 10-25-2014, 06:36:53 PM
    Author     : Rodrigo
--%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Empleado"%>
<%
    //Verificación de sesión abierta
    HttpSession sesionOk = request.getSession();
    String tipo = (String) sesionOk.getAttribute("tipo");
    if (tipo == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
    int usuario = Integer.parseInt(sesionOk.getAttribute("codigo").toString());
    CtrlCEFAS_Empleado ctrlEmpleado = new CtrlCEFAS_Empleado();
    CEFAS_Empleado empleado = ctrlEmpleado.getEmpleadoPorUsuario(usuario);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar perfil de empleado - CEFAS RRHH</title>
        <jsp:include page='inc/head_common.jsp' /> 
    </head>
    <body>
        <div id="container">
             <%  if(tipo.equals("director"))
             {
             %>
                    <jsp:include page='inc/menu_directora.jsp' />
             <% }
                else if(tipo.equals("empleado"))
                {
             %>
                    <jsp:include page='inc/menu_empleado.jsp' />
             <% }
                else if(tipo.equals("subdirector"))
                {
             %>
                    <jsp:include page='inc/menu_subdirector.jsp' />
             <% }
                else if(tipo.equals("asistente"))
                {
             %>
                    <jsp:include page='inc/menu_asistente.jsp' />
             <% }
                else if(tipo.equals("administrador"))
                {
             %>
                    <jsp:include page='inc/menu_administradora.jsp' />
             <% } %>
             <div class="container">
                 <h1>Modificar perfil de empleado</h1>
                 <form action="modificarperfil.jsp">
                 <div class="panel panel-primary">
                            <div class="panel-heading">Datos personales</div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-4">
                                    <img id="foto" src="<%= empleado.getEmpFoto() %>" class="center-block" alt="fotoempleado" width="200" height="200"/><br>
                                    <input type="button" value="Cambiar foto" class="center-block" onclick="$('#filefoto').click();" />
                                    <input type="file" name="filefoto" style="display:none;" id="filefoto"  accept="image/*" onchange="cargarImagen()">
                                    <!-- Este input es para enviar el parametro de la url de la foto y asi guardarla en la base de datos -->
                                    <input type="text" style="display: none" value="" id="urlFoto" name="urlFoto">
                                </div>
                                <div class="col-xs-4">
                                    Nombre: <input type="text" name="nombre" value="<%= empleado.getEmpNombre() %>" class="form-control input-sm"  required><br>
                                    Fecha de nacimiento: <input type="text" name="fechaNacimiento" value="<%= empleado.getEmpFechaNacimiento() %>" class="form-control input-sm" required><br>
                                    Dirección: <input type="text" name="direccion" value="<%= empleado.getEmpDireccion() %>" class="form-control input-sm" required><br>
                                    DUI: <input type="text" name="dui" value="<%= empleado.getEmpDUI() %>" class="form-control input-sm" required><br>
                                    NIT: <input type="text" name="nit" value="<%= empleado.getEmpNIT() %>" class="form-control input-sm" required><br>
                                </div>
                                <div class="col-xs-4">
                                    NUP: <input type="text" name="nup" value="<%= empleado.getEmpNUP() %>" class="form-control input-sm" required><br>
                                    NIP: <input type="text" name="nip" value="<%= empleado.getEmpNIP() %>" class="form-control input-sm" required><br>
                                    Teléfono: <input type="text" name="telefono" value="<%= empleado.getEmpTelefono()%>" class="form-control input-sm" required><br>
                                    Celular: <input type="text" name="celular" value="<%= empleado.getEmpCelular()%>" class="form-control input-sm" required><br>
                                    E-mail: <input type="text" name="email" value="<%= empleado.getEmpCorreo() %>" class="form-control input-sm" required><br>
                                </div>
                            </div>
                        </div>
                      </div>
                    <div class="panel panel-primary">
                            <div class="panel-heading">Títulos y diplomas</div>
                        <div class="panel-body">
                            
                        </div>
                    </div>
                                <input type="submit" value="Guardar" class="btn btn-success center-block"/><br><br>
             </form>
             </div>
        </div><%-- fin del div id=container --%>
        
    </body>
</html>
