<%-- 
    Document   : perfilempleado
    Created on : 10-24-2014, 11:23:43 PM
    Author     : Rodrigo
--%>
<%@page import="java.util.List"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Titulo"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Titulo"%>
<%@page import="java.text.DecimalFormat"%>
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
    CtrlCEFAS_Titulo ctrlTitulo = new CtrlCEFAS_Titulo();
    List<CEFAS_Titulo> titulos = ctrlTitulo.getTitulos(Integer.parseInt(empleado.getEmpCodigo()));
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil de empleado - CEFAS RRHH</title>
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
                <h1>Perfil de empleado</h1>
                <div class="panel panel-primary">
                            <div class="panel-heading">Datos personales</div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-4">
                                    <img src="<%= empleado.getEmpFoto() %>" class="center-block" alt="fotoempleado" width="150" height="150"/>
                                </div>
                                <div class="col-xs-4">
                                    Nombre: <%= empleado.getEmpNombre() %><br>
                                    Fecha de nacimiento: <%= empleado.getEmpFechaNacimiento() %><br>
                                    Dirección: <%= empleado.getEmpDireccion() %><br>
                                    DUI: <%= empleado.getEmpDUI() %><br>
                                    NIT: <%= empleado.getEmpNIT() %><br>
                                </div>
                                <div class="col-xs-4">
                                    NUP: <%= empleado.getEmpNUP() %><br>
                                    NIP: <%= empleado.getEmpNIP() %><br>
                                    Teléfono: <%= empleado.getEmpTelefono()%><br>
                                    Celular: <%= empleado.getEmpCelular()%><br>
                                    E-mail: <%= empleado.getEmpCorreo() %><br>
                                </div>
                                
                            </div>
                        </div>
                      </div>
                    <div class="panel panel-primary">
                        <div class="panel-heading">Datos de trabajo</div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-6">
                                    Año de contratación: <%= empleado.getEmpAnioContratacion() %><br>
                                    Plaza actual: <%= empleado.getEmpPlazaActual() %><br>
                                    Plaza anterior: <%= empleado.getEmpPlazaAnterior() %><br>
                                </div>
                                <div class="col-xs-6">
                                    Jefe inmediato: <% %><br>
                                    Salario: <%= new DecimalFormat("$ #,###.00").format(empleado.getEmpSalario()) %><br>
                                    Tipo de contrato: <%= empleado.getEmpTipoDeContrato() %><br>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-primary">
                        <div class="panel-heading">Títulos y diplomas</div>
                        <div class="panel-body">
                            <div class="row">
                                <% for(CEFAS_Titulo titulo: titulos)
                                {
                                %>
                                    <div class="col-xs-5">
                                        Título: <%= titulo.getTtltitulo() %>
                                    </div>
                                    <div class="col-xs-5">
                                        Lugar: <%= titulo.getTtllugar()%>
                                    </div>
                                    <div class="col-xs-2">
                                        Fecha: <%= titulo.getTtlfecha()%>
                                    </div>
                                <%
                                } %>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-primary">
                        <div class="panel-heading">Evaluaciones</div>
                        <div class="panel-body">
                            
                        </div>
                    </div>
            </div>
        </div> <%-- fin del div id=container --%>
    </body>
</html>

