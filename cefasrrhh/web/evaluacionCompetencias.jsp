
<%@page import="net.sf.jasperreports.engine.JRException"%>
<%@page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@page import="java.util.Date"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import="net.sf.jasperreports.engine.JREmptyDataSource"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%-- 
    Document   : evaluacionCompetencias
    Created on : 10-31-2014, 01:38:05 AM
    Author     : Portillo
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_EvaluacionPorCompetencias"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_EvaluacionPorCompetencias"%>
<%
    //Verificación de sesión abierta
    HttpSession sesionOk = request.getSession();
    String tipo = (String) sesionOk.getAttribute("tipo");
    if (tipo == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
    String cadena="abcdefghij";
    if(request.getParameter("a1")!=null)
    {
        Map parametros = new HashMap();
        for(int x=0; x<=9; x++)
        {
            for(int y=1; y<=5; y++)
            {
                parametros.put(String.valueOf(cadena.charAt(x))+y, Integer.parseInt(request.getParameter(String.valueOf(cadena.charAt(x))+y)) );
            }
        }
        
        try
        {
          //se carga el reporte
          //URL  in=this.getClass().getResource( "CEFAS_SupervisionClase.jasper" );
          File reportFile = new File(application.getRealPath("reportes/CEFAS_EvaluacionCompetencias.jasper"));
          //JasperReport jasperReport=(JasperReport)JRLoader.loadObject(in);
          //se procesa el archivo jasper
          JasperPrint jasperPrint = JasperFillManager.fillReport(reportFile.getPath(), parametros,  new JREmptyDataSource());
          //se crea el archivo PDF
          String realPath = request.getSession().getServletContext().getRealPath("/");
          realPath += "documentos/evaluaciones/ev_competencias_"+ "-" + new SimpleDateFormat("dd-MM-yy").format(new Date()) +".pdf";
          JasperExportManager.exportReportToPdfFile( jasperPrint, realPath);
          //CtrlCEFAS_EvaluacionDeClases ctrlEvaluacionDeClases = new CtrlCEFAS_EvaluacionDeClases();
          //ctrlEvaluacionDeClases.guardar(request.getParameter("docente"), new Date(), realPath);
          /*mensaje = "<div class='alert alert-danger alert-dismissible' role='alert'><button type='button' class='close'"
                + " data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>"
                + "La evaluación se guardó correctamente</div>";*/
        }
        catch (JRException ex)
        {
          System.err.println( "Error iReport: " + ex.getMessage() );
        }
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
  <title>Evaluacion por Competencias</title>
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
   <h1>Evaluacion por Competencias</h1>
        Introduzca los datos de la Evaluacion<br>
      <form class="form-signin" role="form" method="post" action="">
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




<table border = "1">

<tr>
  <td><strong>Evaluacion por competencias</strong></td>
  <td><strong>1</strong></td>
  <td><strong>2</strong></td>
  <td><strong>3</strong></td>
  <td><strong>4</strong></td>
</tr>
<tr>
   <td><strong>A. Compromiso</strong></td>
</tr>


<tr>
  <td>Comprende y asume como propios los objetivos de la organizacion.</td>
    <td><input type="radio" name="a1" value="1"> </td>
  <td><input type="radio" name="a1" value="2"> </td>
  <td><input type="radio" name="a1" value="3"> </td>
  <td><input type="radio" name="a1" value="4"> </td>
</tr>

<tr>
  <td>Se mantiene motivado y motiva a sus compañeros para guiar su accionar según los objetivos pautados.</td>
  <td><input type="radio" name="a2" value="1"> </td>
  <td><input type="radio" name="a2" value="2"> </td>
  <td><input type="radio" name="a2" value="3"> </td>
  <td><input type="radio" name="a2" value="4"> </td>
</tr>


<tr>
  <td>Tiene un buen nivel de desempeño, y alcanza siempre los objetivos que se le pautan, esforzándose por mejorar continuamente y por participar y aportar ideas y soluciones superadoras.</td>

  <td><input type="radio" name="a3" value="1"> </td>
  <td><input type="radio" name="a3" value="2"> </td>
  <td><input type="radio" name="a3" value="3"> </td>
  <td><input type="radio" name="a3" value="4"> </td>
</tr>


<tr>
  <td>Genera informaciónón para el control de la gestión, y busca feedbak para chequear su nivel de desempeño.</td>
   <td><input type="radio" name="a4" value="1"> </td>
  <td><input type="radio" name="a4" value="2"> </td>
  <td><input type="radio" name="a4" value="3"> </td>
  <td><input type="radio" name="a4" value="4"> </td>
</tr>


<tr>
  <td>Nunca se compromete a realizar algo que no puede cumplir</td>
  <td><input type="radio" name="a5" value="1"> </td>
  <td><input type="radio" name="a5" value="2"> </td>
  <td><input type="radio" name="a5" value="3"> </td>
  <td><input type="radio" name="a5" value="4"> </td>
</tr>

<tr>
   <td><strong>B.Calidad de Trabajo</strong></td>
</tr>

<tr>
  <td>Define objetivos claros, y diseña procesos adecuados, prácticos y operables en beneficio de todos.</td>
   <td><input type="radio" name="b1" value="1"> </td>
  <td><input type="radio" name="b1" value="2"> </td>
  <td><input type="radio" name="b1" value="3"> </td>
  <td><input type="radio" name="b1" value="4"> </td>
</tr>

<tr>
  <td>Es líder experto de equipos eficientes, en los que promueve la mejora continua.</td>
   <td><input type="radio" name="b2" value="1"> </td>
  <td><input type="radio" name="b2" value="2"> </td>
  <td><input type="radio" name="b2" value="3"> </td>
  <td><input type="radio" name="b2" value="4"> </td>
</tr>

<tr>
  <td>Supervisa y corrige el trabajo del equipo anticipando errores o fallas.</td>
  <td><input type="radio" name="b3" value="1"> </td>
  <td><input type="radio" name="b3" value="2"> </td>
  <td><input type="radio" name="b3" value="3"> </td>
  <td><input type="radio" name="b3" value="4"> </td>
</tr>

<tr>
  <td>Trabaja con altos estándares de calidad y resultados.</td>
  <td><input type="radio" name="b4" value="1"> </td>
  <td><input type="radio" name="b4" value="2"> </td>
  <td><input type="radio" name="b4" value="3"> </td>
  <td><input type="radio" name="b4" value="4"> </td>
</tr>

<tr>
  <td>Hace preguntas, investiga, y busca siempre la mejor manera de hacer las cosas y de crecer como profesional.</td>
   <td><input type="radio" name="b5" value="1"> </td>
  <td><input type="radio" name="b5" value="2"> </td>
  <td><input type="radio" name="b5" value="3"> </td>
  <td><input type="radio" name="b5" value="4"> </td>
</tr>

<tr>
  <td><strong>C. Orientación al Cliente</strong></td>
</tr>

<tr>
  <td>Adecua su servicio a las necesidades tanto actuales y potenciales de sus clientes.</td>
  <td><input type="radio" name="c1" value="1"> </td>
  <td><input type="radio" name="c1" value="2"> </td>
  <td><input type="radio" name="c1" value="3"> </td>
  <td><input type="radio" name="c1" value="4"> </td>
</tr>

<tr>
  <td>Está disponible para los clientes internos y externos.</td>
  <td><input type="radio" name="c2" value ="1"> </td>
  <td><input type="radio" name="c2" value ="2"> </td>
  <td><input type="radio" name="c2" value ="3"> </td>
  <td><input type="radio" name="c2" value ="4"> </td>
</tr>

<tr>
  <td>Responde a las demandas de los clientes brindándoles satisfacción más allá de lo esperado.</td>
  <td><input type="radio" name="c3" value="1"> </td>
  <td><input type="radio" name="c3" value="2"> </td>
  <td><input type="radio" name="c3" value="3"> </td>
  <td><input type="radio" name="c3" value="4"> </td>
</tr>

<tr>
  <td>Es paciente y tolerante con sus clientes internos y externos, aun en situaciones complejas.</td>
  <td><input type="radio" name="c4" value="1"> </td>
  <td><input type="radio" name="c4" value="2"> </td>
  <td><input type="radio" name="c4" value="3"> </td>
  <td><input type="radio" name="c4" value="4"> </td>
</tr>

<tr>
  <td>Comprende que el cliente es fundamental para su organización y actúa en consecuencia</td>
  <td><input type="radio" name="c5" value="1"> </td>
  <td><input type="radio" name="c5" value="2"> </td>
  <td><input type="radio" name="c5" value="3"> </td>
  <td><input type="radio" name="c5" value="4"> </td>
</tr>

<tr>
  <td><strong>D. Trabajo en equipo</strong></td>
</tr>

<tr>
  <td>Anima y motiva a los demás.</td>
  <td><input type="radio" name="d1" value="1"> </td>
  <td><input type="radio" name="d1" value="2"> </td>
  <td><input type="radio" name="d1" value="3"> </td>
  <td><input type="radio" name="d1" value="4"> </td>
</tr>

<tr>
  <td>Actúa para generar un ambiente de trabajo amistoso, de buen clima y cooperación.</td>
    <td><input type="radio" name="d2" value="1"> </td>
  <td><input type="radio" name="d2" value="2"> </td>
  <td><input type="radio" name="d2" value="3"> </td>
  <td><input type="radio" name="d2" value="4"> </td>
</tr>

<tr>
  <td>Resuelve los conflictos de su equipo.</td>
  <td><input type="radio" name="d3" value="1"> </td>
  <td><input type="radio" name="d3" value="2"> </td>
  <td><input type="radio" name="d3" value="3"> </td>
  <td><input type="radio" name="d3" value="4"> </td>
</tr>

<tr>
  <td>Mantiene una actitud abierta para aprender de los otros.</td>
    <td><input type="radio" name="d4" value="1"> </td>
  <td><input type="radio" name="d4" value="2"> </td>
  <td><input type="radio" name="d4" value="3"> </td>
  <td><input type="radio" name="d4" value="4"> </td>
</tr>

<tr>
  <td>Apoya las decisiones de su equipo.</td>
    <td><input type="radio" name="d5" value="1"> </td>
  <td><input type="radio" name="d5" value="2"> </td>
  <td><input type="radio" name="d5" value="3"> </td>
  <td><input type="radio" name="d5" value="4"> </td>
</tr>

<tr>
  <td><strong>E. Liderazgo</strong></td></tr>
<tr>
  <td>Fija objetivos, los transmite y realiza un adecuado seguimiento al respecto, brindando feedback a los integrantes de su equipo.</td>
  <td><input type="radio" name="e1" value="1"> </td>
  <td><input type="radio" name="e1" value="2"> </td>
  <td><input type="radio" name="e1" value="3"> </td>
  <td><input type="radio" name="e1" value="4"> </td>
</tr>

<tr>
  <td>Escucha a los demás y es escuchado. Suele ser buscado para consejo.</td>
  <td><input type="radio" name="e2" value="1"> </td>
  <td><input type="radio" name="e2" value="2"> </td>
  <td><input type="radio" name="e2" value="3"> </td>
  <td><input type="radio" name="e2" value="4"> </td>
</tr>

<tr>
  <td>Tiene energía y perseverancia, lo cual transmite a los demás.</td>
  <td><input type="radio" name="e3" value="1"> </td>
  <td><input type="radio" name="e3" value="2"> </td>
  <td><input type="radio" name="e3" value="3"> </td>
  <td><input type="radio" name="e3" value="4"> </td>
</tr>

<tr>
  <td>Motiva a cada uno de acuerdo con sus necesidades, y en pos del logro de los objetivos generales e individuales de desarrollo.</td>
   <td><input type="radio" name="e4" value="1"> </td>
  <td><input type="radio" name="e4" value="2"> </td>
  <td><input type="radio" name="e4" value="3"> </td>
  <td><input type="radio" name="e4" value="4"> </td>
</tr>

<tr>
  <td>Inspira con su ejemplo</td>
   <td><input type="radio" name="e5" value="1"> </td>
  <td><input type="radio" name="e5" value="2"> </td>
  <td><input type="radio" name="e5" value="3"> </td>
  <td><input type="radio" name="e5" value="4"> </td>
</tr>


<tr>
  <td><strong>F. Desarrollo de Relaciones</strong></td>
</tr>

<tr>
  <td>Se conduce con naturalidad y cordialidad en el intercambio con sus pares; mantiene una actitud de escuchar y es atinado en sus comentarios y en la información que brinda.</td>
  <td><input type="radio" name="f1" value="1"> </td>
  <td><input type="radio" name="f1" value="2"> </td>
  <td><input type="radio" name="f1" value="3"> </td>
  <td><input type="radio" name="f1" value="4"> </td>
</tr>

<tr>
  <td>Logra la cooperación de las personas involucradas directa o indirectamente con su área, ya que mantiene relaciones cordiales y fluidas con ellas.</td>
    <td><input type="radio" name="f2" value="1"> </td>
  <td><input type="radio" name="f2" value="2"> </td>
  <td><input type="radio" name="f2" value="3"> </td>
  <td><input type="radio" name="f2" value="4"> </td>
</tr>

<tr>
  <td>Se preocupa por establecer, entre sus relaciones, el compromiso de colaborar, de modo de poder satisfacer sus necesidades o recurrir a ellas en los momentos que sea necesario.</td>
    <td><input type="radio" name="f3" value="1"> </td>
  <td><input type="radio" name="f3" value="2"> </td>
  <td><input type="radio" name="f3" value="3"> </td>
  <td><input type="radio" name="f3" value="4"> </td>
</tr>

<tr>
  <td>Es abierto a conocer nuevas personas, con quienes procura establecer contactos duraderos.</td>
  <td><input type="radio" name="f4" value="1"> </td>
  <td><input type="radio" name="f4" value="2"> </td>
  <td><input type="radio" name="f4" value="3"> </td>
  <td><input type="radio" name="f4" value="4"> </td>
</tr>

<tr>
  <td>Privilegia, dentro y fuera de la organización, el contacto con aquellas personas con quienes comparte temas en comu&#39n.</td>
   <td><input type="radio" name="f5" value="1"> </td>
  <td><input type="radio" name="f5" value="2"> </td>
  <td><input type="radio" name="f5" value="3"> </td>
  <td><input type="radio" name="f5" value="4"> </td>
</tr>

<tr>
  <td><strong>G. Integridad</strong></td>
</tr>

<tr>
  <td>Genera y promueve equipos de trabajo orientados por valores.</td>
    <td><input type="radio" name="g1" value="1"> </td>
  <td><input type="radio" name="g1" value="2"> </td>
  <td><input type="radio" name="g1" value="3"> </td>
  <td><input type="radio" name="g1" value="4"> </td>
</tr>

<tr>
  <td>Sus acciones son congruentes con sus dichos.</td>
  <td><input type="radio" name="g2" value="1"> </td>
  <td><input type="radio" name="g2" value="2"> </td>
  <td><input type="radio" name="g2" value="3"> </td>
  <td><input type="radio" name="g2" value="4"> </td>
</tr>

<tr>
  <td>Supervisa el trabajo de sus equipos de acuerdo con los objetivos, ideas y expectativas que previamente les ha expuesto.</td>
  <td><input type="radio" name="g3" value="1"> </td>
  <td><input type="radio" name="g3" value="2"> </td>
  <td><input type="radio" name="g3" value="3"> </td>
  <td><input type="radio" name="g3" value="4"> </td>
</tr>

<tr>
  <td>Cuando se equivoca admite sus errores y actúa en consecuencia.</td>
   <td><input type="radio" name="g4" value="1"> </td>
  <td><input type="radio" name="g4" value="2"> </td>
  <td><input type="radio" name="g4" value="3"> </td>
  <td><input type="radio" name="g4" value="4"> </td>
</tr>

<tr>
  <td>Es ejemplo de integridad y promueve acciones integrad entre sus compañeros.</td>
    <td><input type="radio" name="g5" value="1"> </td>
  <td><input type="radio" name="g5" value="2"> </td>
  <td><input type="radio" name="g5" value="3"> </td>
  <td><input type="radio" name="g5" value="4"> </td>
</tr>


<tr> 
  <td><strong>H. Orientacion a resultados</strong></td>
</tr>

<tr>
  <td>Trabaja con objetivos claramente establecidos, realistas y desafiantes.</td>
  <td><input type="radio" name="h1" value="1"> </td>
  <td><input type="radio" name="h1" value="2"> </td>
  <td><input type="radio" name="h1" value="3"> </td>
  <td><input type="radio" name="h1" value="4"> </td>
</tr>


<tr>
  <td>Fija para sí y para los otros, los parámetros a alcanzar, y orienta su accionar para lograr y superar los estándares de desempeño y respetar los plazos establecidos.</td>
   <td><input type="radio" name="h2" value="1"> </td>
  <td><input type="radio" name="h2" value="2"> </td>
  <td><input type="radio" name="h2" value="3"> </td>
  <td><input type="radio" name="h2" value="4"> </td>
</tr>


<tr>
  <td>Reconoce y recompensa el valor de los resultados tanto grupales como individuales de su equipo.</td>
  <td><input type="radio" name="h3" value="1"> </td>
  <td><input type="radio" name="h3" value="2"> </td>
  <td><input type="radio" name="h3" value="3"> </td>
  <td><input type="radio" name="h3" value="4"> </td>
</tr>


<tr>
  <td>Es un referente dentro de la organización en lo que respecta a la mejora continua de la eficiencia.</td>
  <td><input type="radio" name="h4" value="1"> </td>
  <td><input type="radio" name="h4" value="2"> </td>
  <td><input type="radio" name="h4" value="3"> </td>
  <td><input type="radio" name="h4" value="4"> </td>
</tr>


<tr>
  <td>Estimula y premia las actitudes y las acciones de los colaboradores orientadas a promover la mejora continua y la eficiencia.</td>
    <td><input type="radio" name="h5" value="1"> </td>
  <td><input type="radio" name="h5" value="2"> </td>
  <td><input type="radio" name="h5" value="3"> </td>
  <td><input type="radio" name="h5" value="4"> </td>
</tr>

<tr>
  <td><strong>I. Responsabilidad</strong></td>
</tr>

<tr>
  <td>Tiene una actitud comprometida con las tareas en las que está involucrado, y puede dar cuenta de los resultados, que siempre procura cumplir en tiempo y forma.</td>
  <td><input type="radio" name="i1" value="1"> </td>
  <td><input type="radio" name="i1" value="2"> </td>
  <td><input type="radio" name="i1" value="3"> </td>
  <td><input type="radio" name="i1" value="4"> </td>
</tr>

<tr>
  <td>Identifica con claridad aquellas tareas que requieren de mayor dedicación y sabe redistribuir sus tiempos para desarrollarse adecuadamente.</td>
  <td><input type="radio" name="i2" value="1"> </td>
  <td><input type="radio" name="i2" value="2"> </td>
  <td><input type="radio" name="i2" value="3"> </td>
  <td><input type="radio" name="i2" value="4"> </td>
</tr>

<tr>
  <td>Se fija altos objetivos que siempre cumple, auto exigiéndose plazos y mejorando la calidad del trabajo o proyecto asignado.</td>
  <td><input type="radio" name="i3" value="1"> </td>
  <td><input type="radio" name="i3" value="2"> </td>
  <td><input type="radio" name="i3" value="3"> </td>
  <td><input type="radio" name="i3" value="4"> </td>
</tr>

<tr>
  <td>Prefiere organizar en primer lugar sus tareas y luego distribuir el tiempo libre que pueda quedarle para dedicarse a otras actividades.</td>
  <td><input type="radio" name="i4" value="1"> </td>
  <td><input type="radio" name="i4" value="2"> </td>
  <td><input type="radio" name="i4" value="3"> </td>
  <td><input type="radio" name="i4" value="4"> </td>
</tr>

<tr>
  <td>Propone modalidades alternativas de trabajo en pos del cumplimiento del proyecto o tarea asignada, sin necesidad de indicación alguna por parte de sus superiores.</td>
  <td><input type="radio" name="i5" value="1"> </td>
  <td><input type="radio" name="i5" value="2"> </td>
  <td><input type="radio" name="i5" value="3"> </td>
  <td><input type="radio" name="i5" value="4"> </td>
</tr>

<tr>
  <td><strong>J. Desarrollo de Personas</strong></td>
</tr>


<tr>
  <td>Plantea objetivos y plazo, y da feedback para que los colaboradores conozcan sus resultados y estén al tanto de si logran lo esperado.</td>
   <td><input type="radio" name="j1" value="1"> </td>
  <td><input type="radio" name="j1" value="2"> </td>
  <td><input type="radio" name="j1" value="3"> </td>
  <td><input type="radio" name="j1" value="4"> </td>
</tr>

<tr>
  <td>Facilita el aprendizaje explicando cómo y por qué se hacen las cosas de determinada forma.</td>
  <td><input type="radio" name="j2" value="1"> </td>
  <td><input type="radio" name="j2" value="2"> </td>
  <td><input type="radio" name="j2" value="3"> </td>
  <td><input type="radio" name="j2" value="4"> </td>
</tr>

<tr>
  <td>Verifica que sus explicaciones e instrucciones hayan sido comprendidas.</td>
   <td><input type="radio" name="j3" value="1"> </td>
  <td><input type="radio" name="j3" value="2"> </td>
  <td><input type="radio" name="j3" value="3"> </td>
  <td><input type="radio" name="j3" value="4"> </td>
</tr>

<tr>
  <td>Monitorea las mejoras en los resultados a partir de sus explicaciones.</td>
  <td><input type="radio" name="j4" value="1"> </td>
  <td><input type="radio" name="j4" value="2"> </td>
  <td><input type="radio" name="j4" value="3"> </td>
  <td><input type="radio" name="j4" value="4"> </td>
</tr>

<tr>
  <td>Detecta las falencias de formación en las personas que lo rodean e idea estrategias grupales e individuales de mejora.</td>
   <td><input type="radio" name="j5" value="1"> </td>
  <td><input type="radio" name="j5" value="2"> </td>
  <td><input type="radio" name="j5" value="3"> </td>
  <td><input type="radio" name="j5" value="4"> </td>
</tr>


</table>
 
 
   <input type="submit" value="Crear" class="btn btn-success center-block">
  
   </form>
 </div> <%-- fin del div id=container --%>
</body>
</html>
