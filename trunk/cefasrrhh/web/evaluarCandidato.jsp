<%-- 
    Document   : evaluarCandidato
    Created on : 12/11/2014, 01:57:25 PM
    Author     : Sergio
--%>

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
    if (request.getParameter("dui") != null) {
        String dui = request.getParameter("dui");
        String notaap = request.getParameter("notaap");
        String comenll = request.getParameter("comenll");
        String comenen = request.getParameter("comenen");
        String comenap = request.getParameter("comenap");
        String notapsi = request.getParameter("notapsi");
        String comenpsi = request.getParameter("comenpsi");
        Date fechaen = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("fechaen").toString());
        Date fechaex = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("fechaex").toString());
        Date fechapsi = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("fechapsi").toString());

        CtrlCEFAS_EvaluacionCandidato ctrlevccandidato = new CtrlCEFAS_EvaluacionCandidato();
        ctrlevccandidato.guardarEvaluacion(dui, comenll, fechaen, comenen, fechaex, notaap, comenap, fechapsi, notapsi, comenpsi);
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Evaluar Candidato-CEFAS RRHH</title>
        <jsp:include page='inc/head_common.jsp' /> 
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
                        DUI: <input type="text" name="dui" value="" class="form-control input-sm"  required> 
                       <%-- Codigo de evaluacion: <input type="text" name="codigo" value="" class="form-control input-sm"  required> --%>
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
                         <div class="row">

                             <div class="col-xs-5 col-xs-offset-1">
                             <p></p>
                                 Fecha de entrevista:<input type="text" name="fechaen" value="" class="form-control input-sm" placeholder= "Formato: dd/MM/yyyy" required /> 
                                 <input type="checkbox" name="hecho"> Hecho
                                 <p></p>

                               
                        <div class="panel-body">
                            <div class="row">
                            Comentarios:
                                <textarea name="comenen" cols="100" rows="5" class="form-control"> </textarea>
                                <p></p>
                            </div>
                        </div>
                             </div>
                         </div>
                     </div>
                     <div class="panel panel-primary">
                      <div class="panel-heading">Examen de aptitud</div>
                         <div class="row">
                             <div class="col-xs-5 col-xs-offset-1">
                             <p></p>
                                 Fecha de examen :<input type="text" name="fechaex" value="" class="form-control input-sm" placeholder= "Formato: dd/MM/yyyy" required />
                                 Nota: <input type="number" name="notaap" min="0.0" max="10.0" step="0.1" class="form-control input-sm"> 
                                 <input type="checkbox" name="hecho"> Hecho
                                 <p></p>
                                 
                                    
                        <div class="panel-body">
                            <div class="row">
                                Comentarios: <textarea name="comenap" cols="100" rows="5" class="form-control"> </textarea>
                                <p></p>
                                
                            </div>
                        </div>
                             </div>
                         </div>
                     </div><div class="panel panel-primary">
                      <div class="panel-heading">Examen Psicologico</div>
                         <div class="row">
                             <div class="col-xs-5 col-xs-offset-1">
                             <p></p>
                                 Fecha de examen :<input type="text" name="fechapsi" value="" class="form-control input-sm" placeholder= "Formato: dd/MM/yyyy" required />
                                 Nota: <input type="number" name="notapsi" min="0.0" max="10.0" step="0.1" class="form-control input-sm"> 
                                 <input type="checkbox" name="hecho"> Hecho
                                 <p></p>
                                 
                                    
                        <div class="panel-body">
                            <div class="row">
                                Comentarios: <textarea name="comenpsi" cols="100" rows="5" class="form-control"> </textarea>
                                <p></p>
                                
                            </div>
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
