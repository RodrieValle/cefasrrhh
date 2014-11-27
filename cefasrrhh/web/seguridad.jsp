<%-- 
    Document   : seguridad
    Created on : 11-26-2014, 05:27:45 PM
    Author     : Rodrigo
--%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Usuario"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Usuario"%>
<%
    //Verificación de sesión abierta
    HttpSession sesionOk = request.getSession();
    String tipo = (String) sesionOk.getAttribute("tipo");
    if (tipo == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
    String mensaje = "";
    request.setCharacterEncoding("UTF-8");
    if(request.getParameter("c1")!=null)
    {
        if(!request.getParameter("c2").equals(request.getParameter("c3")))
        {
            mensaje = "<div class='alert alert-danger alert-dismissible' role='alert'><button type='button' class='close'"
             + " data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>"
             + "Las nuevas contraseñas no coinciden</div>";
        }
        else{
            CtrlCEFAS_Usuario ctrlUsuario = new CtrlCEFAS_Usuario();
        CEFAS_Usuario usuario =  ctrlUsuario.verificarUsuario(sesionOk.getAttribute("usuario").toString(), request.getParameter("c1"));
        if(usuario == null)
        {
            mensaje = "<div class='alert alert-danger alert-dismissible' role='alert'><button type='button' class='close'"
             + " data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>"
             + "La contraseña actual es incorrecta</div>";

        }
        else{
            boolean exito = ctrlUsuario.actualizar(usuario.getUsrCodigo(), usuario.getUsrNombre(), request.getParameter("c3"));
            if(exito)
            {
                mensaje = "<div class='alert alert-danger alert-dismissible' role='alert'><button type='button' class='close'"
                + " data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>"
                + "El cambio se realizó correctamente</div>";

            }
            else{
                mensaje = "<div class='alert alert-danger alert-dismissible' role='alert'><button type='button' class='close'"
                + " data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>"
                + "No se pudo completar la acción</div>";
            }
        }
        }
        
        
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seguridad</title>
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
             <h1>Cambio de contraseña</h1>
             <%= mensaje  %>
             <form action="seguridad.jsp" method="post">
             <div class="row">
                 <div class="col-xs-4 col-xs-offset-4">
                     
                     Contraseña actual: <input type="password" name="c1" class="form-control input-sm" required/><br>
                     Nueva contraseña: <input type="password" name="c2" class="form-control input-sm" required/><br>
                         Confirmar nueva contraseña: <input type="password" name="c3" class="form-control input-sm" required/><br>
                         <input type="submit" value="Aceptar" class="btn btn-danger center-block"/>
                  </div>
             </div>
             </form>    
         </div>
        </div>
    </body>
</html>
