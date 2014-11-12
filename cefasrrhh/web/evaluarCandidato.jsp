<%-- 
    Document   : evaluarCandidato
    Created on : 30/10/2014, 12:10:07 PM
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
            <%  if (tipo.equals("subdirector")) 
            %>
            <jsp:include page='inc/menu_subdirector.jsp' />
            <div class="container">
                 <h1>Evaluacion de Candidato</h1>
                 <form action="evaluarCandidato.jsp" method="post">
                     <div class="panel panel-primary">
                        DUI: <input type="text" name="dui" value="" class="form-control input-sm"  required> Codigo de evaluacion: <input type="text" name="codigo" value="" class="form-control input-sm"  required>
                        <p></p>
                        <div class="panel-heading">Observaciones de llamadas a referencia: <input type="checkbox" name="hecho"> Hecho</div>
                        <div class="panel-body">
                            <div class="row">
                                <textarea name="comenll"  cols="100" rows="5" class="form-control"> </textarea>
                                <p></p>
                            </div>
                        </div>
                     </div>
                     <div class="panel panel-primary">
                             <h2>Entrevista</h2>
                         <div class="panel-heading"></div>
                         <div class="row">
                             <div class="col-xs-5 col-xs-offset-1">
                                 Fecha de entrevista:<input type="text" name="fechaen" value="" class="form-control input-sm" placeholder= "Formato: dd/MM/yyyy" required /> <input type="checkbox" name="hecho"> Hecho<br>
                                 <p></p>

                                 <div class="panel-heading">Comentario: </div>
                        <div class="panel-body">
                            <div class="row">
                                <textarea name="comenen" cols="100" rows="5" class="form-control"> </textarea>
                                <p></p>
                            </div>
                        </div>
                             </div>
                         </div>
                     </div>
                     <div class="panel panel-primary">
                     <h2>Examen de aptitud</h2>
                         <div class="panel-heading"></div>
                         <div class="row">
                             <div class="col-xs-5 col-xs-offset-1">
                                 Fecha de examen:<input type="text" name="fechaex" value="" class="form-control input-sm" placeholder= "Formato: dd/MM/yyyy" required /> <input type="checkbox" name="hecho"> Hecho
                                 <p></p>
                                 <div class="input-group" style="margin-top: 10px">
                                     Nota:<input type="text" name="notaap" class="form-control">
                                     <span class="input-group-addon">0.0-10.0</span>
                                     <p></p>
                                 </div>
                                     <div class="panel-heading">Comentario: </div>
                        <div class="panel-body">
                            <div class="row">
                                <textarea name="comenap" cols="100" rows="5" class="form-control"> </textarea>
                                <p></p>
                            </div>
                        </div>
                         </div>
                     </div>
                     </div>
                      <div class="panel panel-primary">
                      <h2>Examen psicologico</h2>
                         <div class="panel-heading"></div>
                         <div class="row">
                             <div class="col-xs-5 col-xs-offset-1">
                                 Fecha de examen :<input type="text" name="fechapsi" value="" class="form-control input-sm" placeholder= "Formato: dd/MM/yyyy" required /> <input type="checkbox" name="hecho"> Hecho
                                 <p></p>
                                 <div class="input-group" style="margin-top: 10px">
                                  Nota:<input type="text" name="notapsi" class="form-control">
                                     <span class="input-group-addon">0.0-10.0</span>
                                     <p></p>
                                 </div>
                                     <div class="panel-heading">Comentario: </div>
                        <div class="panel-body">
                            <div class="row">
                                <textarea name="comenpsi" cols="100" rows="5" class="form-control"> </textarea>
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
