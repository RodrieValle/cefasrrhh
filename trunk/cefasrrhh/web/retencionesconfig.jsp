<%-- 
    Document   : retencionesconfig
    Created on : 11-11-2014, 10:12:21 PM
    Author     : Rodrigo
--%>
<%@page import="java.util.List"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_ConfiguracionRetenciones"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_ConfiguracionRetenciones"%>
<%
    // Verificación de sesión abierta
    HttpSession sesionOk = request.getSession();
    String tipo = (String) sesionOk.getAttribute("tipo");
    if (tipo == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
    if (!tipo.equals("administrador")) {
        response.sendRedirect("avisos.jsp");
    }
    CtrlCEFAS_ConfiguracionRetenciones ctrlCfgRetenciones = new CtrlCEFAS_ConfiguracionRetenciones();
    List<CEFAS_ConfiguracionRetenciones> retenciones =  ctrlCfgRetenciones.obtenerRetenciones();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Configuración de rentenciones</title>
         <jsp:include page='inc/head_common.jsp' /> 
    </head>
    <body>
        <div id="container">
            <jsp:include page='inc/menu_administradora.jsp' />
            <div class="container">
                <h1>Configuración de retenciones</h1>
                <form action="retencionesconfig.jsp" method="post" class="form-group">
                <div class="col-xs-4 col-xs-offset-1">
                    <h3>ISSS</h3>
                    ISSS laboral:<input type="text" class="form-control input-sm" name="issslaboral"/>
                    ISSS patronal:<input type="text" class="form-control input-sm"  name="isspatronal"/>
                    Techo ISSS:<input type="text" class="form-control input-sm" name="techoisss" />
                    <h3>AFP</h3>
                    AFP laboral Crecer:<input type="text" class="form-control input-sm" name="afplaboralcrecer" />
                    AFP laboral Confía:<input type="text" class="form-control input-sm" name="afplaboralconfia" />
                    AFP patronal Crecer:<input type="text" class="form-control input-sm" name="afppatronalcrecer" />
                    AFP patronal Confía:<input type="text" class="form-control input-sm" name="afppatronalconfia" />
                    Techo AFP:<input type="text" class="form-control input-sm" name="techoafp" />
                </div>
                <div class="col-xs-5 col-xs-offset-1">
                    <h3>Valores de impuesto sobre la renta</h3>
                    <table class="table table-hover form-group">
                        <tr>
                            <th></th>
                            <th>DESDE</th>
                            <th>HASTA</th>
                            <th>% A APLICAR</th>
                            <th>SOBRE EL EXCESO DE</th>
                            <th>MÁS CUOTA FIJA DE</th>
                        </tr>
                        <tr>
                            <td>Tramo I</td>
                            <td><input type="text" class="form-control input-sm"  name=""/></td>
                            <td><input type="text" class="form-control input-sm" name="" /></td>
                            <td><input type="text" class="form-control input-sm" name="" /></td>
                            <td><input type="text" class="form-control input-sm" name="" /></td>
                            <td><input type="text" class="form-control input-sm" name="" /></td>
                        </tr>
                        <tr>
                            <td>Tramo II</td>
                            <td><input type="text" class="form-control input-sm" name="" /></td>
                            <td><input type="text" class="form-control input-sm" name="" /></td>
                            <td><input type="text" class="form-control input-sm" name="" /></td>
                            <td><input type="text" class="form-control input-sm" name="" /></td>
                            <td><input type="text" class="form-control input-sm" name="" /></td>
                        </tr>
                        <tr>
                            <td>Tramo III</td>
                            <td><input type="text" class="form-control input-sm" name="" /></td>
                            <td><input type="text" class="form-control input-sm" name="" /></td>
                            <td><input type="text" class="form-control input-sm" name="" /></td>
                            <td><input type="text" class="form-control input-sm" name="" /></td>
                            <td><input type="text" class="form-control input-sm" name="" /></td>
                        </tr>
                        <tr>
                            <td>Tramo IV</td>
                            <td><input type="text" class="form-control input-sm" name="" /></td>
                            <td><input type="text" class="form-control input-sm" name="" /></td>
                            <td><input type="text" class="form-control input-sm" name="" /></td>
                            <td><input type="text" class="form-control input-sm" name="" /></td>
                            <td><input type="text" class="form-control input-sm" name="" /></td>
                        </tr>
                        <tr>
                            <td>Tramo V</td>
                            <td><input type="text" class="form-control input-sm" name="" /></td>
                            <td><input type="text" class="form-control input-sm" name="" /></td>
                            <td><input type="text" class="form-control input-sm" name="" /></td>
                            <td><input type="text" class="form-control input-sm" name="" /></td>
                            <td><input type="text" class="form-control input-sm" name="" /></td>
                        </tr>
                        
                    </table>
                </div>
                    <div class="col-xs-1"></div>
                    <br><br><input type="submit" value="Actualizar" class="btn btn-success center-block"/>
                </form>
            </div>
        </div>
    </body>
</html>
