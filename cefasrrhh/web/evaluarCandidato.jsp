<%-- 
    Document   : evaluarCandidato
    Created on : 12/11/2014, 01:57:25 PM
    Author     : Sergio
--%>

<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Candidato"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Candidato"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_EvaluacionCandidato"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_EvaluacionCandidato"%>

<%
    //Verificación de sesión abierta
    HttpSession sesionOk = request.getSession();
    String tipo = (String) sesionOk.getAttribute("tipo");
    if (tipo == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
    if (!tipo.equals("director")) {
        response.sendRedirect("avisos.jsp");
    }
    
    
    String cdtDui = request.getParameter("dui");
    CtrlCEFAS_Candidato ctrlCandidato = new CtrlCEFAS_Candidato();
    CEFAS_Candidato cdt = ctrlCandidato.obtenerDui(cdtDui);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <form class="form-signin"  action="evaluarCandidato.jsp" method="post">
                    <div class="panel panel-primary">
                        <div class="panel-body">
                            <div class="row">
                            <div class="col-xs-5 col-xs-offset-1">
                     <p></p>
                         DUI: <input  type="text" name="duicdt" value="<%= cdt.getCdtDUI() %>" class="form-control input-sm"  required readonly/>
                        <input type="checkbox" name="hecho"> Hecho
                        </div>
                        </div>
                        </div>
                        <p></p>
                        
                        <div class="panel-body">
                            <div class="row">
                            <div class="col-xs-5 col-xs-offset-1">
                                Observaciones de llamadas a referencia: <textarea name="comenll"  cols="100" rows="5" class="form-control"> </textarea>
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
                                    Fecha de entrevista:
                                    <div class="bfh-datepicker" data-format="d/m/y" data-name="fechaen" data-icon="" data-input="form-control input-sm"
                                        data-close="true" data-align="right" data-language="en_US" data-available="es_MX">
                                   </div>
                                    <!--<input type="text" name="fechaen" value="" class="form-control input-sm" placeholder= "Formato: dd/MM/yyyy" required /> -->
                                </div>
                                <div class="col-xs-2 col-xs-offset-5">
                                    <input type="checkbox" name="hecho"> Hecho
                                </div>
                                <div class="col-xs-1"></div>
                                <div class="col-xs-8 col-xs-offset-2">
                                    <br>
                                    Comentarios:
                                    <textarea name="comenen" cols="100" rows="5" class="form-control input-sm"> </textarea>
                                </div>
                            </div>
                         </div>
                     </div>
                     <div class="panel panel-primary">
                      <div class="panel-heading">Examen de aptitud</div>
                         <div class="panel-body">
                             <div class="row">
                             <div class="col-xs-3 col-xs-offset-1">
                                Fecha de examen :
                                <div class="bfh-datepicker" data-format="d/m/y" data-name="fechaex" data-icon="" data-input="form-control input-sm"
                                        data-close="true" data-align="right" data-language="en_US" data-available="es_MX">
                                   </div>
                                <!--<input type="text" name="fechaex" value="" class="form-control input-sm" placeholder= "Formato: dd/MM/yyyy" required />-->
                             </div>
                                 <div class="col-xs-3 col-xs-offset-1">
                                     Nota: <input type="number" name="notaap" min="0.0" max="10.0" step="0.1" class="form-control input-sm"> 
                                 </div>
                                 <div class="col-xs-2 col-xs-offset-1">
                                     <input type="checkbox" name="hecho"> Hecho
                                 </div>
                                 <div class="col-xs-1"></div>
                                 <div class="col-xs-8 col-xs-offset-2">
                                     <br>
                                     Comentarios: <textarea name="comenap" cols="100" rows="5" class="form-control"> </textarea>
                                 </div>
                             </div>
                         </div>
                     </div>
                     <div class="panel panel-primary">
                      <div class="panel-heading">Examen psicológico</div>
                         <div class="panel-body">
                             <div class="row">
                             <div class="col-xs-3 col-xs-offset-1">
                                Fecha de examen :
                                <div class="bfh-datepicker" data-format="d/m/y" data-name="fechapsi" data-icon="" data-input="form-control input-sm"
                                        data-close="true" data-align="right" data-language="en_US" data-available="es_MX">
                                   </div>
                                <!--<input type="text" name="fechapsi" value="" class="form-control input-sm" placeholder= "Formato: dd/MM/yyyy" required />-->
                             </div>
                                 <div class="col-xs-3 col-xs-offset-1">
                                     Nota: <input type="number" name="notapsi" min="0.0" max="10.0" step="0.1" class="form-control input-sm"> 
                                 </div>
                                 <div class="col-xs-2 col-xs-offset-1">
                                     <input type="checkbox" name="hecho"> Hecho
                                 </div>
                                 <div class="col-xs-1"></div>
                                 <div class="col-xs-8 col-xs-offset-2">
                                     <br>
                                     Comentarios: <textarea name="comenpsi" cols="100" rows="5" class="form-control"> </textarea>
                                 </div>
                             </div>
                         </div>
                     </div>
                     <input type="submit" value="Guardar" class="btn btn-success center-block"/><br><br>


                     </form>
                     </div>
                     </div>

        
    </body>
</html>
