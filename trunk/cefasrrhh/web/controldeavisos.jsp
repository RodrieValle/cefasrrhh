<%-- 
    Document   : controldeavisos
    Created on : 10-31-2014, 12:04:26 AM
    Author     : Rodrigo
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%
    //Verificación de sesión abierta
    HttpSession sesionOk = request.getSession();
    String tipo = (String) sesionOk.getAttribute("tipo");
    if (tipo == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
    /*String usuario = (String) sesionOk.getAttribute("usuario");
    CtrlCEFAS_Aviso ctrlAviso = new CtrlCEFAS_Aviso();
    List<CEFAS_Aviso> lista = ctrlAviso.consultarAvisos(usuario);*/
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Control de avisos</title>
        <jsp:include page='inc/head_common.jsp' /> 
    </head>
    <script type="javascript">
        
    </script>
    <body>
        <div id="container">
            <%  if(tipo.equals("director"))
            {
        %>
                <jsp:include page='inc/menu_directora.jsp' />
         <% }
            else if(tipo.equals("subdirector"))
            {
         %>
                <jsp:include page='inc/menu_subdirector.jsp' />
         <% } %>
         <div class="container">
             <h1>Control de avisos</h1>
             <div class="row">
                 <div class="col-xs-4">
                     <div class="panel panel-primary">
                            <div class="panel-heading">Crear nuevo aviso</div>
                            <div class="panel-body">
                            <form action="controldeavisos.jsp" method="post">
                            Fecha:      <%= new SimpleDateFormat("dd/MM/yyyy").format(new Date()) %><br><br>
                            Descripción:<textarea name="descripcion" rows="3" cols="20" class="form-control input-sm"></textarea><br>
                            <div id="destinatarios">
                            Destinatarios:<br>
                            <input id="todos" type="checkbox" name="destinatarios" value="All" onclick="checkTodos(this.id,'destinatrios');"> Seleccionar todo<br>
                            <input type="checkbox" name="dest" value="1"> Juan Perez<br>
                            <input type="checkbox" name="dest" value="2"> Ricardo Sanchez<br>
                            <input type="checkbox" name="dest" value="3"> Juan Perez<br>
                            <input type="checkbox" name="dest" value="4"> Ricardo Sanchez<br>
                            Grupos<br>
                            Todo el personal Primaria Secundaria<br>
                            Personas<br>
                            </div>
                            <input type="submit" value="Enviar" class="btn btn-success center-block"/>
                            </form>
                            </div>
                     </div>
                 </div>
                <div class="col-xs-7 col-xs-offset-1">
                        <div class="panel panel-primary">
                            <div class="panel-heading">Últimos avisos creados</div>
                            <div class="panel-body">
                            
                            Fecha:      <%= new SimpleDateFormat("dd/MM/yyyy").format(new Date()) %><br><br>
                            Descripción:<textarea name="descripcion" rows="3" cols="20" class="form-control input-sm"></textarea><br><br>
                            <a href="#" class="btn btn-primary btn-md" role="button">Modificar</a>
                            <a href="#" class="btn btn-primary btn-md" role="button">Eliminar</a>
                            <input type="submit" value="Enviar" class="btn btn-success center-block"/>
                            </div>
                        </div>
                </div>
             </div>
         </div>
        </div>
    </body>
</html>
