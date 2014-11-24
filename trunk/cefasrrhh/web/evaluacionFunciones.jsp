<%-- 
    Document   : evaluacionFunciones
    Created on : 10-31-2014, 09:09:04 AM
    Author     : Portillo
--%>



<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_EvaluacionPorFunciones"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_EvaluacionPorFunciones"%>
<%
    //Verificación de sesión abierta
    HttpSession sesionOk = request.getSession();
    String tipo = (String) sesionOk.getAttribute("tipo");
    if (tipo == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
    String usuario = (String) sesionOk.getAttribute("usuario");
    //CtrlCEFAS_Aviso ctrlAviso = new CtrlCEFAS_Aviso();
    //List<CEFAS_Aviso> lista = ctrlAviso.consultarAvisos(usuario);
%>





<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
  
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <title>Evaluacion por funciones</title>
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
   <h1>Evaluación por Funciones</h1>
        Introduzca los datos de la Evaluación<br>
      <form class="form-signin" role="form" method="post" action="evaluacionFunciones.jsp">
   <div class="row"> 
       <div class="col-xs-4">  
                            </div> 
                             <div class="col-xs-4">  
    
      Codigo del empleado: <input type="text" name="codigo" class="form-control input-sm" required><br>
      Nombre del empleado: <input type="text" name="nombre" class="form-control input-sm" required><br>
      Codigo de la evaluacion: <input type="text" name="codeva" class="form-control input-sm" required><br>
      Fecha:    <input type="text" name="fecha" class="form-control input-sm" required><br>
    <br>
 </div>
      
</div>


          
     <table border="1" align="center">
       <tr>
         
           <td colspan="2"><h1>Evaluacion por funciones</h1></td>
       </tr>

       <tr>
           <td> <h2>Criterios</h2></td>
         <td><h2>Observaciones</h2></td>

       </tr>


    <tr>
       <td>Clases, Deacuerdo a formato de supervision de clases</td>
       <td><input name="item1" type="text" size="50" maxlength="50"></td>
    </tr>
  
    <tr>
       <td>Tareas, Distribuidas, Apropiadas, Revisadas</td>
      <td><input name="item2" type="text" size="50" maxlength="50"></td>
     
    </tr>

    <tr>
       <td>Cuadernos, Contenido, Revisado, Corregido</td>
       <td><input name="item3" type="text" size="50" maxlength="50"></td>
    </tr>

    <tr>
       <td>Libros, Limpieza, útiles, forrados, revisados</td>
       <td><input name="item4" type="text"  size="50" maxlength="50"></td>
    </tr>

    <tr>
       <td>Examenes,Formato, ortografía, contenido, aplicativo, revisión</td>
       <td><input name="item5" type="text" size="50" maxlength="50"></td>

    </tr>

    <tr>
       <td>Planificaciones, Contenido, entrega a tiempo, utilizadas</td>
       <td><input name="item6" type="text" size="50" maxlength="50"></td>

    </tr>

    <tr>
       <td>Responsabilidades, Cuidos, Asamblea, Per. Mur., Reu. c/Padres</td>
       <td><input name="item7" type="text" size="50" maxlength="50"></td>

    </tr>

    <tr>
       <td>Disciplina, Seguimiento Manual, Pastoreo, claro y consistente, orden</td>
       <td><input name="item8" type="text" size="50" maxlength="50"></td>

    </tr>

    
    <tr>
       <td>Habitos y procedimientos</td>
       <td><input name="item10" type="text" size="50" maxlength="50"></td>

    </tr>

    <tr>
       <td>Aula</td>
       <td><input name="item11" type="text" size="50" maxlength="50"></td>

    </tr>

    <tr>
       <td>Teachers book</td>
       <td><input name="item12" type="text" size="50" maxlength="50"></td>

    </tr>

    <tr>
       <td>Lealtad al ausente</td>
       <td><input name="item15" type="text" size="50" maxlength="50"></td>

    </tr>

    
    <tr>
       <td>Respeto a autoridades</td>
       <td><input name="item15" type="text" size="50" maxlength="50"></td>

    </tr>

    <tr>
       <td>Puntualidad, asistencia y permisos</td>
       <td><input name="item16" type="text" size="50" maxlength="50"></td>

    </tr>

    <tr>
       <td>Presentacion personal</td>
       <td><input name="item17" type="text" size="50" maxlength="50"></td>

    </tr>

    <tr>
       <td>Sigue indicaciones</td>
       <td><input name="item18" type="text" size="50" maxlength="50"></td>

    </tr>

    <tr>
       <td>Disposicion y actitud</td>
       <td><input name="item19" type="text" size="50" maxlength="50"></td>

    </tr>
      
      <tr>
       <td>Cuida propiedad del colegio</td>
       <td><input name="item121" type="text" size="50" maxlength="50"></td>

    </tr>

   </table><br><br>
   
   <input type="submit" value="Procesa" class="btn btn-success center-block">
  
   </form>
    </div> <%-- fin del div id=container --%>
 </div>
     </body>
</html>

