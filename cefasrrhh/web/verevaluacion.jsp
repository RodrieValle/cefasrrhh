<%-- 
    Document   : verevaluacion
    Created on : 29/11/2014, 10:22:33 PM
    Author     : Sergio
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Candidato"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Candidato"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_EvaluacionCandidato"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_EvaluacionCandidato"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    HttpSession sesionOk = request.getSession();
    String tipo = (String) sesionOk.getAttribute("tipo");
    if (tipo == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
    if (!tipo.equals("director")) {
        response.sendRedirect("avisos.jsp");
    } 
    
    
    
    String duiCdt = request.getParameter("Dui");
    CtrlCEFAS_EvaluacionCandidato ctrlEvaluacionCandidato = new CtrlCEFAS_EvaluacionCandidato();
    CEFAS_EvaluacionCandidato evcCandidato = ctrlEvaluacionCandidato.getEvaluacion(duiCdt);

    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Evaluar Candidato-CEFAS RRHH</title>
        <jsp:include page='inc/head_common.jsp' /> 
        <link rel="stylesheet" type="text/css" href="css/bootstrap-formhelpers.css">
        <script type="text/javascript" src="js/bootstrap-formhelpers.js"></script>
    </head>
    <body>
        <div id="container">
           
            <jsp:include page='inc/menu_directora.jsp' />
         
            <div class="container">
                <h1>Evaluacion de Candidato</h1>
                <form class="form-signin"  action="" method="post">
                    <div class="panel panel-primary">
                        <div class="panel-body">
                            <div class="row">
                            <div class="col-xs-5 col-xs-offset-1">
                     <p></p>
                        DUI: <%= evcCandidato.getCdtDUI()%>
                        <input type="checkbox" name="hecho"> Hecho
                        </div>
                        </div>
                        </div>
                        <p></p>
                        
                        <div class="panel-body">
                            <div class="row">
                            <div class="col-xs-5 col-xs-offset-1">
                                Observaciones de llamadas a referencia: <%= evcCandidato.getEvcObservacionesReferencias()%>
                                <p></p>
                            </div>
                        </div>
                        </div>
                     </div>
                     <div class="panel panel-primary">
                         <div class="panel-heading">Entrevista</div>
                         <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-3 col-xs-offset-1">
                                    Fecha de entrevista:<%= evcCandidato.getEvcFechaEntrevista()%>
                                    
                                </div>
                                <div class="col-xs-2 col-xs-offset-5">
                                    <input type="checkbox" name="hecho"> Hecho
                                </div>
                                <div class="col-xs-1"></div>
                                <div class="col-xs-8 col-xs-offset-2">
                                    <br>
                                    Comentarios:<%= evcCandidato.getEvcComentarioEntrevista()%>
                                    
                                </div>
                            </div>
                         </div>
                     </div>
                     <div class="panel panel-primary">
                      <div class="panel-heading">Examen de aptitud</div>
                         <div class="panel-body">
                             <div class="row">
                             <div class="col-xs-3 col-xs-offset-1">
                                Fecha de examen :<%= evcCandidato.getEvcFechaExamenAptitud()%>
                                
                             </div>
                                 <div class="col-xs-3 col-xs-offset-1">
                                     Nota: <%= evcCandidato.getEvcNotaExamenAptitud()%>
                                 </div>
                                 <div class="col-xs-2 col-xs-offset-1">
                                     <input type="checkbox" name="hecho"> Hecho
                                 </div>
                                 <div class="col-xs-1"></div>
                                 <div class="col-xs-8 col-xs-offset-2">
                                     <br>
                                     Comentarios: <%= evcCandidato.getEvcComentarioExamenAptitud()%>
                                 </div>
                             </div>
                         </div>
                     </div>
                     <div class="panel panel-primary">
                      <div class="panel-heading">Examen psicológico</div>
                         <div class="panel-body">
                             <div class="row">
                             <div class="col-xs-3 col-xs-offset-1">
                                Fecha de examen : <%= evcCandidato.getEvcFechaExamenPsico()%>
                                
                             </div>
                                 <div class="col-xs-3 col-xs-offset-1">
                                     Nota: <%= evcCandidato.getEvcNotaExamenPsico()%>
                                 </div>
                                 <div class="col-xs-2 col-xs-offset-1">
                                     <input type="checkbox" name="hecho"> Hecho
                                 </div>
                                 <div class="col-xs-1"></div>
                                 <div class="col-xs-8 col-xs-offset-2">
                                     <br>
                                     Comentarios: <%= evcCandidato.getEvcCometarioExamenPsico()%>
                                 </div>
                             </div>
                         </div>
                     </div>
                     


                     </form>
                     </div>
                     </div>

        
    </body>
</html>
