<%-- 
    Document   : index
    Created on : 09-24-2014, 08:13:19 PM
    Author     : Rodrigo
--%>

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
                        <form class="form-signin" role="form" method="post" action="login">
                            <h2 class="form-signin-heading">Ingrese sus credenciales</h2>
                            <input id="usuario" name="usuario" type="text" class="form-control" placeholder="Usuario" required autofocus>
                            <input id="password" name="password" type="password" class="form-control" placeholder="Contraseña" required>
                            <button id="ingresar" class="btn btn-lg btn-primary btn-block" type="submit">Ingresar</button>
                        </form>
                        <div id="error">
                            <%
                                String error = (String) request.getAttribute("error");
                                if (error != null) {
                                    out.print(error);
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
