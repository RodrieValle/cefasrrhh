<%-- 
    Document   : perfilempleado
    Created on : 10-24-2014, 11:23:43 PM
    Author     : Rodrigo
--%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Bitacora"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Titulo"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Titulo"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
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
    //Procesamiento de datos de modificarempleado si es que hay
    if(request.getParameter("nombre") != null)
    { 
        //Datos personales
        String codigo = request.getParameter("codigo");
        String nombre = request.getParameter("nombre");
        Date fechaNacimiento = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("fechaNacimiento").toString());
        String direccion = request.getParameter("direccion");
        String dui = request.getParameter("dui");
        String nit = request.getParameter("nit");
        String nup = request.getParameter("nup");
        String nip = request.getParameter("nip");
        String telefono = request.getParameter("telefono");
        String celular = request.getParameter("celular");
        String email = request.getParameter("email");
        String urlFoto = request.getParameter("urlFoto");
        //Datos de trabajo
        Date anioContratacion = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("anioContratacion"));
        String plazaActual = request.getParameter("plazaActual");
        String plazaAnterior = request.getParameter("plazaAnterior");
        String jefeInmediato = request.getParameter("jefeInmediato");
        float salario = Float.parseFloat(request.getParameter("salario"));
        String tipoContrato = request.getParameter("tipoContrato");
        //Objeto empleado
        CEFAS_Empleado emp = new CEFAS_Empleado();
        emp.setEmpCodigo(codigo);
        emp.setEmpNombre(nombre);
        emp.setEmpFechaNacimiento(fechaNacimiento);
        emp.setEmpDireccion(direccion);
        emp.setEmpDUI(dui);
        emp.setEmpNIT(nit);
        emp.setEmpNUP(nup);
        emp.setEmpNIP(nip);
        emp.setEmpTelefono(telefono);
        emp.setEmpCelular(celular);
        emp.setEmpCorreo(email);
        emp.setEmpFoto(urlFoto);
        emp.setEmpAnioContratacion(anioContratacion);
        emp.setEmpPlazaActual(plazaActual);
        emp.setEmpPlazaAnterior(plazaAnterior);
        emp.setEmpJefeInmediato(Integer.parseInt(jefeInmediato));
        emp.setEmpSalario(salario);
        emp.setEmpTipoDeContrato(tipoContrato);
        CtrlCEFAS_Empleado ctrlEmpleado = new CtrlCEFAS_Empleado();
        ctrlEmpleado.guardarEmpleadoCompleto(emp);
        int noDeTitulos = Integer.parseInt(request.getParameter("noDeTitulos").toString());
        List<CEFAS_Titulo> titulos = new ArrayList();
        CEFAS_Titulo t;
        for(int i = 0; i<noDeTitulos; i++)
        {
            String nombreTitulo = request.getParameter("titulo"+i);
            String lugarTitulo = request.getParameter("lugar"+i);
            String fechaTitulo = request.getParameter("fecha"+i);
            if(nombreTitulo != null)
            {
                t = new CEFAS_Titulo();
                t.setEmpcodigo(Integer.parseInt(codigo));
                t.setTtltitulo(nombreTitulo);
                t.setTtllugar(lugarTitulo);
                t.setTtlfecha(new SimpleDateFormat("dd/MM/yyyy").parse(fechaTitulo));
                titulos.add(t);
            }
        }
        if(!titulos.isEmpty())
        {
            CtrlCEFAS_Titulo ctrlTitulo = new CtrlCEFAS_Titulo();
        ctrlTitulo.actualizarTitulos(titulos);
        }
        
         CtrlCEFAS_Bitacora ctrlBitacora= new CtrlCEFAS_Bitacora();
        ctrlBitacora.guardarBitacora((Integer) sesionOk.getAttribute("codigo"), "Se modifico perfil de empleado con codigo "+codigo);
    }
    int usuario = Integer.parseInt(request.getParameter("codigo"));
    CtrlCEFAS_Empleado ctrlEmpleado = new CtrlCEFAS_Empleado();
    CEFAS_Empleado empleado = ctrlEmpleado.getEmpleadoPorUsuario(usuario);
    CEFAS_Empleado jefe = ctrlEmpleado.getEmpleadoPorUsuario(empleado.getEmpJefeInmediato());
    CtrlCEFAS_Titulo ctrlTitulo = new CtrlCEFAS_Titulo();
    List<CEFAS_Titulo> titulos = ctrlTitulo.getTitulos(Integer.parseInt(empleado.getEmpCodigo()));
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil de empleado - CEFAS RRHH</title>
        <jsp:include page='inc/head_common.jsp' /> 
    </head>
    <body>
        <div id="container">
            <jsp:include page='inc/menu_directora.jsp' />
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
                                    Jefe inmediato: <%= jefe.getEmpNombre() %><br>
                                    Salario: <%= new DecimalFormat("$ #,###.00").format(empleado.getEmpSalario()) %><br>
                                    Tipo de contrato: <%= empleado.getEmpTipoDeContrato() %><br>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-primary">
                        <div class="panel-heading">Títulos y diplomas</div>
                        <div class="panel-body">
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th>Título</th>
                                            <th>Lugar</th>
                                            <th>Fecha</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                     <% for(CEFAS_Titulo titulo: titulos)
                                    {
                                    %>   
                                        <tr>
                                            <td><%= titulo.getTtltitulo() %></td>
                                            <td><%= titulo.getTtllugar()%></td>
                                            <td><%= new SimpleDateFormat("dd/MM/yyyy").format(titulo.getTtlfecha())%></td>
                                        </tr>
                                      <%
                                    } %>  
                                    </tbody>
                                </table>
                        </div>
                    </div>
                    <div class="panel panel-primary">
                        <div class="panel-heading">Historiales</div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-4 col-xs-offset-1">
                                    <a href="historialEvClase.jsp?codigo=<%= empleado.getEmpCodigo() %>" class="btn btn-sm btn-success center-block">Evaluaciones de clases</a><br>
                                <a href="historialEvCompetencias.jsp?codigo=<%= empleado.getEmpCodigo() %>" class="btn btn-sm btn-success center-block">Evaluaciones por competencias</a>
                                </div>
                                <div class="col-xs-4 col-xs-offset-2">
                                <a href="historialEvFunciones.jsp?codigo=<%= empleado.getEmpCodigo() %>" class="btn btn-sm btn-success center-block">Evaluaciones por funciones</a><br>
                                <a href="historialSanciones.jsp?codigo=<%= empleado.getEmpCodigo() %>" class="btn btn-sm btn-success center-block">Sanciones</a>
                                </div>
                                
                            </div>
                        </div>
                    </div>
            </div>
        </div> <%-- fin del div id=container --%>
    </body>
</html>

