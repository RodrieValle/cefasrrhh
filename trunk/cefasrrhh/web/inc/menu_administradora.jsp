<%-- 
    Document   : menu_administradora
    Created on : 10-19-2014, 09:18:33 PM
    Author     : Rodrigo
--%>

<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <img id="logo" src="img/cefas-icono.png" alt="CEFAS">
            <!--<a href="#" class="navbar-brand">Sistema CIS-ISNA</a>-->
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="navbar-collapse collapse" id="navbar-main">
            <ul class="nav navbar-nav">
                <li><a href="avisos.jsp">CEFAS - RRHH</a></li>
                
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="avisos.jsp"><span class="glyphicon glyphicon-home"></span> Inicio</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="download"><span class="glyphicon glyphicon-book"></span> Planilla <span class="caret"></span></a>
                    <ul class="dropdown-menu" aria-labelledby="download">
                        <li><a href="horasExtras.jsp">Ingresar Horas Extras</a></li>
                        <li><a href="reportellegadas.jsp">Reportar Llegadas</a></li>
                        <li><a href="anticipo.jsp">Administrar Anticipos</a></li>
                        <li><a href="prestamo.jsp">Administrar Préstamos</a></li>
                        <li><a href="ordenDescuento.jsp">Administrar Ordenes de Descuentos</a></li>
                        <li><a href="viatico.jsp">Administrar Viáticos</a></li>
                        <li><a href="indemnizacion.jsp">Calcular Indemnización</a></li>
                         <li><a href="retencionesconfig.jsp">Configuración de las Retenciones</a></li>
                        <li><a href="planillaDelMes.jsp">Elaborar Planilla</a></li>
                        <li><a href="#">Generar Recibos</a></li>
                        <li><a href="#">Reportes</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="download"><span class="glyphicon glyphicon-ok"></span> Evaluaciones <span class="caret"></span></a>
                    <ul class="dropdown-menu" aria-labelledby="download">
                        <li><a href="evaluacionFunciones.jsp">Evaluar Funciones</a></li>
                        <li><a href="evaluacionCompetencias.jsp">Evaluar Competencias</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="download"><span class="glyphicon glyphicon-user"></span> Perfil <span class="caret"></span></a>
                    <ul class="dropdown-menu" aria-labelledby="download">
                        <li><a href="perfilempleado.jsp">Ver Perfil</a></li>
                        <li><a href="modificarperfil.jsp">Modificar Perfil</a></li>
                        <li><a href="seguridad.jsp">Seguridad</a></li>
                        <li><a href="logout.jsp">Cerrar Sesión</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>
