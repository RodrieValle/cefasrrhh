<%-- 
    Document   : modificarperfil
    Created on : 10-25-2014, 06:36:53 PM
    Author     : Rodrigo
--%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Titulo"%>
<%@page import="java.util.List"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Titulo"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    int codigoEmp = Integer.parseInt(request.getParameter("codigo"));
    CtrlCEFAS_Empleado ctrlEmpleado = new CtrlCEFAS_Empleado();
    CEFAS_Empleado empleado = ctrlEmpleado.getEmpleadoPorUsuario(codigoEmp);
    CtrlCEFAS_Titulo ctrlTitulo = new CtrlCEFAS_Titulo();
    List<CEFAS_Titulo> titulos = ctrlTitulo.getTitulos(Integer.parseInt(empleado.getEmpCodigo()));
    response.setContentType("text/html;charset=UTF-8");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar perfil de empleado - CEFAS RRHH</title>
        <jsp:include page='inc/head_common.jsp' /> 
    </head>
    <body>
        <div id="container">
            <jsp:include page='inc/menu_directora.jsp' />
             <div class="container">
                 <h1>Modificar perfil de empleado</h1>
                 <form action="empleado.jsp?codigo=<%= codigoEmp%>" method="post" onsubmit="cantidadDeTitulos()">
                    <div class="panel panel-primary">
                        <div class="panel-heading">Datos personales</div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-4">
                                    <img id="foto" src="<%= empleado.getEmpFoto() %>" class="center-block" alt="fotoempleado" width="200" height="200"/><br>
                                    <input type="button" value="Cambiar foto" class="center-block" onclick="$('#filefoto').click();" />
                                    <input type="file" name="filefoto" style="display:none;" id="filefoto"  accept="image/*" onchange="cargarImagen()">
                                    <!-- Este input es para enviar el parametro de la url de la foto y asi guardarla en la base de datos -->
                                    <input type="text" style="display: none" value="<%= empleado.getEmpFoto() %>" id="urlFoto" name="urlFoto">
                                </div>
                                <div class="col-xs-4">
                                    Nombre: <input type="text" name="nombre" value="<%= empleado.getEmpNombre() %>" class="form-control input-sm"  required><br>
                                    Fecha de nacimiento: <input type="text" name="fechaNacimiento" value="<%= new SimpleDateFormat("dd/MM/yyyy").format(empleado.getEmpFechaNacimiento()) %>" class="form-control input-sm" required><br>
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
                        <div class="panel-heading">Datos de trabajo</div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-5 col-xs-offset-1">
                                    Año de contratación: <input type="text" name="anioContratacion" value="<%= empleado.getEmpAnioContratacion() %>" class="form-control input-sm" required><br>
                                    Plaza actual: <input type="text" name="plazaActual" value="<%= empleado.getEmpPlazaActual() %>" class="form-control input-sm" required> <br>
                                    Plaza anterior: <input type="text" name="plazaAnterior" value="<%= empleado.getEmpPlazaAnterior() %>" class="form-control input-sm" required><br>
                                </div>
                                <div class="col-xs-5">
                                    Jefe inmediato: <input type="text" name="jefeInmediato" value="<% %>" class="form-control input-sm" required><br>
                                    Salario: <br>
                                    <div class="input-group">
                                        <span class="input-group-addon input-sm">$</span>
                                        <input type="text" name="salario" value="<%= new DecimalFormat("#,###.00").format(empleado.getEmpSalario()) %>" class="form-control input-sm" required><br>
                                    </div><br>
                                    Tipo de contrato: <input type="text" name="tipoContrato" value="<%= empleado.getEmpTipoDeContrato() %>" class="form-control input-sm" required><br>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-primary">
                        <div class="panel-heading">Títulos y diplomas</div>
                        <div class="panel-body">
                            <input type="button" value="Agregar" onclick="agregarTitulo()"/>
                            <div class="row" id="titulos">
                                <% 
                                int x = 0;
                                for(CEFAS_Titulo titulo: titulos)
                                {
                                %>
                                <div id="tit<%= x%>">
                                    <div class="col-xs-5">
                                        Título: <input type="text" name="titulo<%= x%>" value="<%= titulo.getTtltitulo() %>" class="form-control input-sm" required/> 
                                    </div>
                                    <div class="col-xs-4">
                                        Lugar: <input type="text" name="lugar<%= x%>" value="<%= titulo.getTtllugar()%>" class="form-control input-sm" required/> 
                                    </div>
                                    <div class="col-xs-2">
                                        Fecha: <input type="text" name="fecha<%= x%>" value="<%= new SimpleDateFormat("dd/MM/yyyy").format(titulo.getTtlfecha())%>" class="form-control input-sm" required/> 
                                    </div>
                                    <div class="col-xs-1">
                                        <br>
                                        <button type="button" class="btn btn-danger btn-sm center-block" onclick="eliminarTitulo(<%= x%>)">
                                            <span class="glyphicon glyphicon-remove"></span>
                                        </button>
                                    </div>
                                </div>
                                <%
                                x++;
                                } %>
                                <script> noDeTitulos = <%= titulos.size() %> </script>
                            </div>
                        </div>
                    </div>
                     <input type="text" style="display:none" value="" id="noDeTitulos" name="noDeTitulos">
                    <input type="submit" value="Guardar" class="btn btn-success center-block"/><br><br>
             </form>
             </div>
        </div><%-- fin del div id=container --%>
        
    </body>
</html>
