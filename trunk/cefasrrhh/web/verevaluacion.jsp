<%-- 
    Document   : verevaluacion
    Created on : 29/11/2014, 10:22:33 PM
    Author     : Sergio
--%>

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
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Evaluacion del Candidato - CEFAS RRHH</title>
        <jsp:include page='inc/head_common.jsp' />
    </head>
    <body>
        <div id="container">
            <jsp:include page='inc/menu_directora.jsp' />
            <div class="container">
                <h1>Evaluacion del candidato</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading"> Referencias </div>        
                   <div class="panel-body">
                             <table class="table table-striped table-hover">
                                    <tbody>
                                        <tr>
                                            <td>DUI</td>
                                            <td>Comentarios</td>            
                                        </tr> 
                
                                        <tr>
                                            <td></td>
                                            <td></td>
                                        </tr>
         
                                    </tbody>
                                </table>

                        </div>
                      </div>
                <div class="panel panel-primary">
                    <div class="panel-heading"> Entrevista</div>        
                   <div class="panel-body">
                             <table class="table table-striped table-hover">
                                    <tbody>
                                        <tr>
                                            <td>Fecha</td>
                                            <td>Comentarios</td>            
                                        </tr> 
                
                                        <tr>
                                            <td></td>
                                            <td></td>
                                        </tr>
         
                                    </tbody>
                                </table>

                        </div>
                      </div>
                <div class="panel panel-primary">
                    <div class="panel-heading"> Examen de Aptitud </div>        
                   <div class="panel-body">
                             <table class="table table-striped table-hover">
                                    <tbody>
                                        <tr>
                                            <td>Fecha</td>
                                            <td>Nota</td>
                                            <td>Comentarios</td>            
                                        </tr> 
                
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
         
                                    </tbody>
                                </table>

                        </div>
                      </div>
                <div class="panel panel-primary">
                    <div class="panel-heading"> Examen Psicologico </div>        
                   <div class="panel-body">
                             <table class="table table-striped table-hover">
                                    <tbody>
                                        <tr>
                                            <td>Fecha</td>
                                            <td>Nota</td>
                                            <td>Comentarios</td>            
                                        </tr> 
                
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
         
                                    </tbody>
                                </table>

                        </div>
                      </div>
            </div>
        </div>
        
    </body>
</html>
