<%-- 
    Document   : index
    Created on : 09-24-2014, 08:13:19 PM
    Author     : Rodrigo
--%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Usuario"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Usuario"%>
<% 
    String usuario = request.getParameter("usuario");
    String password = request.getParameter("password");
    String error=""; 
    if(usuario !=null && password != null)
    {
        CtrlCEFAS_Usuario ctrlUsuario = new CtrlCEFAS_Usuario();
        CEFAS_Usuario objUsuario = ctrlUsuario.verificarUsuario(usuario, password);
        if(objUsuario != null)
        {
            
            HttpSession sesionhttp = request.getSession(true);
            sesionhttp.setAttribute("usuario", objUsuario.getUsrNombre());
            sesionhttp.setAttribute("tipo", objUsuario.getUsrTipo());
            sesionhttp.setAttribute("codigo", objUsuario.getUsrCodigo());
            sesionhttp.setAttribute("empleado", objUsuario.getEmpCodigo());
            response.sendRedirect("avisos.jsp");
        }
        else{
            error = "<div class=\"alert alert-danger\"><h5>Credenciales inválidas</h5></div>";
        }
    }
    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Sistema de Recursos Humanos de CEFAS</title>
        <link rel="stylesheet" href="css/signin.css"/>
        <jsp:include page='inc/head_common.jsp' />
        
        <style>
            body{
                padding-top: 150px;
            }
        </style>
    </head>

    <body>
        <div id="container">

            <header>
                <div class="container">
                    <div class="row">
                        <div class="col-xs-2">
                            <img src="img/cefas-icono.png" alt="CEFAS" class="img-circle">
                        </div>
                        <div class="col-xs-10">
                            <h2 align="right">Sistema de Recursos Humanos de Colegio CEFAS</h2>
                        </div>
                    </div>
                </div>
            </header>

            <div class="container">
                <div class="row">
                    <div class="col-xs-6" align="center" class="img-rounded">
                        <img src="img/cefas-logo.jpg" alt="CEFAS" width="350px" >
                    </div>
                    <div class="col-xs-6">
                        <form class="form-signin" role="form" method="post" action="index.jsp">
                            <h2 class="form-signin-heading">Ingrese sus credenciales</h2>
                            <input id="usuario" name="usuario" type="text" class="form-control" placeholder="Usuario" required autofocus>
                            <input id="password" name="password" type="password" class="form-control" placeholder="Contraseña" required>
                            <button id="ingresar" class="btn btn-lg btn-primary btn-block" type="submit">Ingresar</button>
                        </form>
                        <div id="error">
                            <%= error %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
