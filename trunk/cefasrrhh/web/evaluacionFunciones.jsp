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
    CtrlCEFAS_Aviso ctrlAviso = new CtrlCEFAS_Aviso();
    List<CEFAS_Aviso> lista = ctrlAviso.consultarAvisos(usuario);
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
   <h1>Evaluacion por Competencias</h1>
      
      <form method="post">
   <p>
      Introduzca los datos de la Evaluacion<br>
      Codigo del empleado: <input type="text" name="codigo"><br>
      Nombre del empleado: <input type="text" name="nombre"><br>
      Codigo de la evaluacion: <input type="text" name="codeva"><br>
      Fecha:    <input type="text" name="fecha"><br>
    <br>
  </p>
</form>


     <table border="1" align="center">
       <tr>
       
          <td> Evaluacion por funciones</td>
          <td>Fecha</td>
    
       </tr>

       <tr>
         <td> Criterios</td>
         <td>Observaciones</td>

       </tr>


    <tr>
       <td>Clases, Deacuerdo a formato de supervision de clases</td>
       <td><input name="item1" type="text" size="50" maxlength="50">

    </tr>

    <tr>
       <td>Tareas, Distribuidas, Apropiadas, Revisadas<td>
       <td><input name="item2" type="text" size="50" maxlength="50">

    </tr>

    <tr>
       <td>Cuadernos, Contenido, Revisado, Corregido<td>
       <td><input name="item3" type="text" size="50" maxlength="50">

    </tr>

    <tr>
       <td>Libros, Limpieza, útiles, forrados, revisados<td>
       <td><input name="item4" type="text" size="50" maxlength="50">

    </tr>

    <tr>
       <td>Examenes,Formato, ortografía, contenido, aplicativo, revisión<td>
       <td><input name="item5" type="text" size="50" maxlength="50">

    </tr>

    <tr>
       <td>Planificaciones, Contenido, entrega a tiempo, utilizadas<td>
       <td><input name="item6" type="text" size="50" maxlength="50">

    </tr>

    <tr>
       <td>Responsabilidades, Cuidos, Asamblea, Per. Mur., Reu. c/Padres<td>
       <td><input name="item7" type="text" size="50" maxlength="50">

    </tr>

    <tr>
       <td>Disciplina, Seguimiento Manual, Pastoreo, claro y consistente, orden<td>
       <td><input name="item8" type="text" size="50" maxlength="50">

    </tr>

    
    <tr>
       <td>Habitos y procedimientos<td>
       <td><input name="item10" type="text" size="50" maxlength="50">

    </tr>

    <tr>
       <td>Aula<td>
       <td><input name="item11" type="text" size="50" maxlength="50">

    </tr>

    <tr>
       <td>Teachers book<td>
       <td><input name="item12" type="text" size="50" maxlength="50">

    </tr>

    <tr>
       <td>Lealtad al ausente<td>
       <td><input name="item15" type="text" size="50" maxlength="50">

    </tr>

    
    <tr>
       <td>Respeto a autoridades<td>
       <td><input name="item15" type="text" size="50" maxlength="50">

    </tr>

    <tr>
       <td>Puntualidad, asistencia y permisos<td>
       <td><input name="item16" type="text" size="50" maxlength="50">

    </tr>

    <tr>
       <td>Presentacion personal<td>
       <td><input name="item17" type="text" size="50" maxlength="50">

    </tr>

    <tr>
       <td>Sigue indicaciones<td>
       <td><input name="item18" type="text" size="50" maxlength="50">

    </tr>

    <tr>
       <td>Disposicion y actitud<td>
       <td><input name="item19" type="text" size="50" maxlength="50">

    </tr>
      
      <tr>
       <td>Cuida propiedad del colegio<td>
       <td><input name="item121" type="text" size="50" maxlength="50">

    </tr>

   </table>
   <input type="submit" value="Procesa">
 </body>
</html>

