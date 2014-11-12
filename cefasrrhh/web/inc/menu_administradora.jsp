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
                <li><a href="#">CEFAS - RRHH</a></li>
                
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="avisos.jsp"><span class="glyphicon glyphicon-home"></span> Inicio</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="download"><span class="glyphicon glyphicon-book"></span> Planilla <span class="caret"></span></a>
                    <ul class="dropdown-menu" aria-labelledby="download">
                        <li><a href="#">Ingresar horas extras</a></li>
                        <li><a href="reportellegadas.jsp">Reportar llegadas</a></li>
                        <li><a href="#">Asignar valor de horas extras</a></li>
                        <li><a href="anticipo.jsp">Ingresar anticipos</a></li>
                        <li><a href="prestamo.jsp">Administrar préstamos</a></li>
                        <li><a href="ordenDescuento.jsp">Ingresar órdenes de descuentos</a></li>
                        <li><a href="viatico.jsp">Ingresar viáticos</a></li>
                        <li><a href="#">Calcular indemnización</a></li>
                        <li><a href="#">Elaborar planilla</a></li>
                        <li><a href="#">Generar recibos</a></li>
                        <li><a href="#">Reportes</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="download"><span class="glyphicon glyphicon-ok"></span> Evaluaciones <span class="caret"></span></a>
                    <ul class="dropdown-menu" aria-labelledby="download">
                        <li><a href="evaluacionFunciones.jsp">Evaluar funciones</a></li>
                        <li><a href="evaluacionCompetencias.jsp">Evaluar competencias</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="download"><span class="glyphicon glyphicon-user"></span> Perfil <span class="caret"></span></a>
                    <ul class="dropdown-menu" aria-labelledby="download">
                        <li><a href="perfilempleado.jsp">Ver perfil</a></li>
                        <li><a href="modificarperfil.jsp">Modificar perfil</a></li>
                        <li><a href="logout.jsp">Cerrar sesión</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>
