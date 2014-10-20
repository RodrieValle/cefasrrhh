<%-- 
    Document   : menu_directora
    Created on : 10-19-2014, 07:32:42 PM
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
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="download"><span class="glyphicon glyphicon-book"></span> Recurso Humano <span class="caret"></span></a>
                    <ul class="dropdown-menu" aria-labelledby="download">
                        <li><a href="#">Gestionar perfiles de empleado</a></li>
                        <li><a href="#">Aplicar sanción</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="download"><span class="glyphicon glyphicon-ok"></span> Evaluaciones <span class="caret"></span></a>
                    <ul class="dropdown-menu" aria-labelledby="download">
                        <li><a href="#">Evaluar funciones</a></li>
                        <li><a href="#">Evaluar competencias</a></li>
                        <li><a href="#">Supervisar clase</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="download"><span class="glyphicon glyphicon-list"></span> Contratación <span class="caret"></span></a>
                    <ul class="dropdown-menu" aria-labelledby="download">
                        <li><a href="#">Administrar currículos</a></li>
                        <li><a href="#">Evaluar candidatos</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="download"><span class="glyphicon glyphicon-user"></span> Perfil <span class="caret"></span></a>
                    <ul class="dropdown-menu" aria-labelledby="download">
                        <li><a href="#">Ver perfil</a></li>
                        <li><a href="#">Modificar perfil</a></li>
                        <li><a href="#">Cerrar sesión</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>

