<%-- 
    Document   : supervisarClase
    Created on : 10-31-2014, 10:57:43 AM
    Author     : Portillo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Supervision de una Clase</title>
  <jsp:include page='inc/head_common.jsp' />
 </head>

 <body>
   <h1>Supervision de una Clase</h1>
      
<form method="post">
   <p>
      I- Generalidades<br>
      1. Docente: <input type="text" name="nombre"><br>
      2.Grado/Asignatura: <input type="text" name="materia"><br>
      3.Recomendaciones hechas enla ultima evaluacion: <input type="text" name="receva"><br>
      4.Se superaron esas recoendaciones:   <input type="text" name="reco"><br
      5.Fecha:    <input type="text" name="fecha"><br>
    <br>
  </p>
</form>

      <p align=center><strong>II Checking Points para el supervisor </strong></p>
     <table border="1" align="center">
       <tr>
          <td> </td>
          <td><strong>Criterio</strong> </td>
          <td><strong>Comentario</strong></td>
    
       </tr>

    

    <tr>
       <td>1</td>
       <td>Intro (dijo tema/subtema/objetivo)</td>
       <td><input name="item1" type="text" size="80" maxlength="80">

    </tr>


    <tr>
       <td>2</td>
       <td>Clase magitral completa y sencilla</td>
       <td><input name="item2" type="text" size="80" maxlength="80">

    </tr>


    <tr>
       <td>3</td>
       <td>Conocimiento de la leccion</td>
       <td><input name="item3" type="text" size="80" maxlength="80">

    </tr>
    
    <tr>
       <td>4</td>
       <td>Refuerzo positivo</td>
       <td><input name="item4" type="text" size="80" maxlength="80">

    </tr>
    <tr>
       <td>5</td>
       <td>Clase planificada, maestro preparadp</td>
       <td><input name="item5" type="text" size="80" maxlength="80">

    </tr>

    <tr>
       <td>6</td>
       <td>Clase activa y variada</td>
       <td><input name="item6" type="text" size="80" maxlength="80">
    </tr>

    <tr>
       <td>7</td>
       <td>Comunicacion cordial y con autoridad</td>
       <td><input name="item7" type="text" size="80" maxlength="80">

    </tr>

    <tr>
       <td>8</td>
       <td>Evaluo, logro el objetivo</td>
       <td><input name="item8" type="text" size="80" maxlength="80">

    </tr>

    <tr>
       <td>9</td>
       <td>Disciplina y control</td>
       <td><input name="item9" type="text" size="80" maxlength="80">

    </tr>
    
    <tr>
       <td>10</td>
       <td>Habitos y Procedimientos</td>
       <td><input name="item10" type="text" size="80" maxlength="80">

    </tr>

    <tr>
       <td>11</td>
       <td>Uso del tiempo</td>
       <td><input name="item11" type="text" size="80" maxlength="80">

    </tr>

    
    <tr>
       <td>12</td>
       <td>Participacion</td>
       <td><input name="item12" type="text" size="80" maxlength="80">

    </tr>

    <tr>
       <td>13</td>
       <td>Supervision de alumnos</td>
       <td><input name="item13" type="text" size="80" maxlength="80">

    </tr>

    <tr>
       <td>14</td>
       <td>Aclaracion de dudas con paciencia</td>
       <td><input name="item14" type="text" size="80" maxlength="80">

    </tr>

    <tr>
       <td>15</td>
       <td>Uso del ingles (para bilingues)</td>
       <td><input name="item15" type="text" size="80" maxlength="80">

    </tr>

    <tr>
       <td>16</td>
       <td>Aula (murales, mantenimiento, orden)</td>
       <td><input name="item16" type="text" size="80" maxlength="80">

    </tr>

    <tr>
       <td>17</td>
       <td>Tarea integrada al objetivo de la clase</td>
       <td><input name="item17" type="text" size="80" maxlength="80">

    </tr>

   </table>

   <table border = "0" align="center" >
     
     <tr>
       <td>Se logro el objetivo:</td>
       <td><input name="logro" type="text" size="100" maxlength="100">
    </tr>

     <tr>
       <td>Felicitaciones:</td>
       <td><input name="logro" type="text" size="100" maxlength="100">
    </tr>

     <tr>
       <td>Recomendaciones:</td>
       <td><input name="logro" type="text" size="100" maxlength="100">
    </tr>



   </table>

   <input type="submit" value="Procesa">
 </body>
</html>
