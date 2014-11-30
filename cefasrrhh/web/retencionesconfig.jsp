<%-- 
    Document   : retencionesconfig
    Created on : 11-11-2014, 10:12:21 PM
    Author     : Rodrigo
--%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Bitacora"%>
<%@page import="java.util.ArrayList"%>
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
    if(request.getParameter("issslaboral") != null)
    {
        
        CtrlCEFAS_ConfiguracionRetenciones ctrlConfiguracion = new CtrlCEFAS_ConfiguracionRetenciones();
        
            //>>>>>>>>>>>>>>>>>>>>>>>>RENTAS<<<<<<<<<<<<<<<<<<<<<<
        
         //renta TRAMO 1
        ctrlConfiguracion.actualizarConfiguraciones(1, Float.parseFloat(request.getParameter("aplicarRenta1")),
                                                       Float.parseFloat(request.getParameter("desdeRenta1")),
                                                       Float.parseFloat(request.getParameter("hastaRenta1")),
                                                       Float.parseFloat(request.getParameter("excesoRenta1")),
                                                       Float.parseFloat(request.getParameter("cuotaRenta1")));
        
        //renta TRAMO 2
        ctrlConfiguracion.actualizarConfiguraciones(2, Float.parseFloat(request.getParameter("aplicarRenta2")),
                                                       Float.parseFloat(request.getParameter("desdeRenta2")),
                                                       Float.parseFloat(request.getParameter("hastaRenta2")),
                                                       Float.parseFloat(request.getParameter("excesoRenta2")),
                                                       Float.parseFloat(request.getParameter("cuotaRenta2")));
        
        //renta TRAMO 3
        ctrlConfiguracion.actualizarConfiguraciones(3, Float.parseFloat(request.getParameter("aplicarRenta3")),
                                                       Float.parseFloat(request.getParameter("desdeRenta3")),
                                                       Float.parseFloat(request.getParameter("hastaRenta3")),
                                                       Float.parseFloat(request.getParameter("excesoRenta3")),
                                                       Float.parseFloat(request.getParameter("cuotaRenta3")));
        
        //renta TRAMO 4
        ctrlConfiguracion.actualizarConfiguraciones(4, Float.parseFloat(request.getParameter("aplicarRenta4")),
                                                       Float.parseFloat(request.getParameter("desdeRenta4")),
                                                       Float.parseFloat(request.getParameter("hastaRenta4")),
                                                       Float.parseFloat(request.getParameter("excesoRenta4")),
                                                       Float.parseFloat(request.getParameter("cuotaRenta4")));
        
        //renta TRAMO 5
        ctrlConfiguracion.actualizarConfiguraciones(5, Float.parseFloat(request.getParameter("aplicarRenta5")),
                                                       Float.parseFloat(request.getParameter("desdeRenta5")),
                                                       Float.parseFloat(request.getParameter("hastaRenta5")),
                                                       Float.parseFloat(request.getParameter("excesoRenta5")),
                                                       Float.parseFloat(request.getParameter("cuotaRenta5")));
             
        
            //>>>>>>>>>>>>>>>>>>>>>>>AFP'S<<<<<<<<<<<<<<<<<<<<<<<<
        
        //afp laboral CRECER
        ctrlConfiguracion.actualizarConfiguraciones(6, Float.parseFloat(request.getParameter("afplaboralcrecer")),
                                                       Float.parseFloat(request.getParameter("techoafp")));
        //afp patronal CRECER
        ctrlConfiguracion.actualizarConfiguraciones(7, Float.parseFloat(request.getParameter("afppatronalcrecer")),
                                                       Float.parseFloat(request.getParameter("techoafp")));
        
        //afp laboral CONFIA
        ctrlConfiguracion.actualizarConfiguraciones(8, Float.parseFloat(request.getParameter("afplaboralconfia")),
                                                       Float.parseFloat(request.getParameter("techoafp")));
        
        //afp patronal CONFIA
        ctrlConfiguracion.actualizarConfiguraciones(9, Float.parseFloat(request.getParameter("afppatronalconfia")),
                                                       Float.parseFloat(request.getParameter("techoafp")));
        
  
        
        
                   //>>>>>>>>>>>>>>>>>>>>>>ISSS<<<<<<<<<<<<<<<<<<<<<<<<
        //isss laboral
        ctrlConfiguracion.actualizarConfiguraciones(10, Float.parseFloat(request.getParameter("issslaboral")),
                                                       Float.parseFloat(request.getParameter("techoisss")));
        
        //isss patronal
        ctrlConfiguracion.actualizarConfiguraciones(11, Float.parseFloat(request.getParameter("issspatronal")),
                                                       Float.parseFloat(request.getParameter("techoisss")));
    
        //aguinaldo
        ctrlConfiguracion.actualizarConfiAgui(12, Float.parseFloat(request.getParameter("aguinaldo")));
        //indemnizacion
        ctrlConfiguracion.actualizarConfiIndem(13, Float.parseFloat(request.getParameter("indemnizacion")));
    
     CtrlCEFAS_Bitacora ctrlBitacora= new CtrlCEFAS_Bitacora();
        ctrlBitacora.guardarBitacora((Integer) sesionOk.getAttribute("codigo"), "Se cambio la configuracion de las retenciones");
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
                <div class="col-xs-3 col-xs-offset-1">
                    <h3>ISSS</h3>
                    ISSS laboral:<input type="number" class="form-control input-sm" name="issslaboral" pattern="[0-9]+([\.|,][0-9]+)?" step="any" min="0.00" max="100.00" required value="<%= retenciones.get(9).getCfgPorcentaje() %>"/>
                    ISSS patronal:<input type="number" class="form-control input-sm"  name="issspatronal" pattern="[0-9]+([\.|,][0-9]+)?" step="any"  min="0.00" max="100.00" required value="<%= retenciones.get(10).getCfgPorcentaje() %>"/>
                    Techo ISSS:<input type="number" class="form-control input-sm" name="techoisss" pattern="[0-9]+([\.|,][0-9]+)?" step="any"  value="<%= retenciones.get(10).getCfgMaximo() %>" />
                    <h3>AFP</h3>
                    AFP laboral Crecer:<input type="number" class="form-control input-sm" name="afplaboralcrecer" pattern="[0-9]+([\.|,][0-9]+)?" step="any" min="0.0000" max="100.00" required value="<%= retenciones.get(5).getCfgPorcentaje() %>" />
                    AFP laboral Confía:<input type="number" class="form-control input-sm" name="afplaboralconfia" pattern="[0-9]+([\.|,][0-9]+)?" step="any"  min="0.0000" max="100.00" required value="<%= retenciones.get(7).getCfgPorcentaje() %>" />
                    AFP patronal Crecer:<input type="number" class="form-control input-sm" name="afppatronalcrecer" pattern="[0-9]+([\.|,][0-9]+)?" step="any"  min="0.00" max="100.00" required value="<%= retenciones.get(6).getCfgPorcentaje() %>" />
                    AFP patronal Confía:<input type="number" class="form-control input-sm" name="afppatronalconfia" pattern="[0-9]+([\.|,][0-9]+)?" step="any" min="0.00" max="100.00" required value="<%= retenciones.get(8).getCfgPorcentaje() %>" />
                    Techo AFP:<input type="number" class="form-control input-sm" name="techoafp" pattern="[0-9]+([\.|,][0-9]+)?" step="any"  value="<%= retenciones.get(8).getCfgMaximo() %>" />
               
                    <h3>Aguinaldo</h3>
                   Maximo Renta exento de renta:<input type="number" class="form-control input-sm" name="aguinaldo" pattern="[0-9]+([\.|,][0-9]+)?" step="any"  value="<%= retenciones.get(11).getCfgMinimo() %>" />
                    <h3>Indemnización</h3>
                    Maximo de Indemnizacion:<input type="number" class="form-control input-sm" name="indemnizacion" pattern="[0-9]+([\.|,][0-9]+)?" step="any"  value="<%= retenciones.get(12).getCfgMaximo() %>" />
                </div>
                <div class="col-xs-6 col-xs-offset-1">
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
                            <td><input type="number" class="form-control input-sm"  name="desdeRenta1" pattern="[0-9]+([\.|,][0-9]+)?" step="any" min="0.00" value="<%= retenciones.get(0).getCfgMinimo()%>" required/></td>
                            <td><input type="number" class="form-control input-sm" name="hastaRenta1" pattern="[0-9]+([\.|,][0-9]+)?" step="any"  min="0.00"  value="<%= retenciones.get(0).getCfgMaximo() %>" required/></td>
                            <td><input type="number" class="form-control input-sm" name="aplicarRenta1" pattern="[0-9]+([\.|,][0-9]+)?" step="any"  min="0.00" value="<%= retenciones.get(0).getCfgPorcentaje() %>" max="100.00" required /></td>
                            <td><input type="number" class="form-control input-sm" name="excesoRenta1" pattern="[0-9]+([\.|,][0-9]+)?" step="any"  min="0.00" value="<%= retenciones.get(0).getCfgSobreExceso() %>" required/></td>
                            <td><input type="number" class="form-control input-sm" name="cuotaRenta1" min="0.00" pattern="[0-9]+([\.|,][0-9]+)?" step="any"  value="<%= retenciones.get(0).getCfgCuotaFija() %>" required/></td>
                        </tr>
                        <tr>
                            <td>Tramo II</td>
                            <td><input type="number" class="form-control input-sm"  name="desdeRenta2" min="0.00" pattern="[0-9]+([\.|,][0-9]+)?" step="any"  value="<%= retenciones.get(1).getCfgMinimo()%>" required/></td>
                            <td><input type="number" class="form-control input-sm" name="hastaRenta2" min="0.00" pattern="[0-9]+([\.|,][0-9]+)?" step="any"  value="<%= retenciones.get(1).getCfgMaximo() %>" required/></td>
                            <td><input type="number" class="form-control input-sm" name="aplicarRenta2" min="0.00" pattern="[0-9]+([\.|,][0-9]+)?" step="any"  value="<%= retenciones.get(1).getCfgPorcentaje() %>" max="100.00" required /></td>
                            <td><input type="number" class="form-control input-sm" name="excesoRenta2" min="0.00" pattern="[0-9]+([\.|,][0-9]+)?" step="any" value="<%= retenciones.get(1).getCfgSobreExceso() %>" required/></td>
                            <td><input type="number" class="form-control input-sm" name="cuotaRenta2" min="0.00" pattern="[0-9]+([\.|,][0-9]+)?" step="any" value="<%= retenciones.get(1).getCfgCuotaFija() %>" required/></td>
                        </tr>
                        <tr>
                            <td>Tramo III</td>
                            <td><input type="number" class="form-control input-sm"  name="desdeRenta3" min="0.00" pattern="[0-9]+([\.|,][0-9]+)?" step="any"  value="<%= retenciones.get(2).getCfgMinimo() %>" required/></td>
                            <td><input type="number" class="form-control input-sm" name="hastaRenta3" min="0.00" pattern="[0-9]+([\.|,][0-9]+)?" step="any" value="<%= retenciones.get(2).getCfgMaximo() %>" required/></td>
                            <td><input type="number" class="form-control input-sm" name="aplicarRenta3" min="0.00"  pattern="[0-9]+([\.|,][0-9]+)?" step="any" value="<%= retenciones.get(2).getCfgPorcentaje() %>" max="100.00" required /></td>
                            <td><input type="number" class="form-control input-sm" name="excesoRenta3" min="0.00" pattern="[0-9]+([\.|,][0-9]+)?" step="any"  value="<%= retenciones.get(2).getCfgSobreExceso() %>" required/></td>
                            <td><input type="number" class="form-control input-sm" name="cuotaRenta3" min="0.00" pattern="[0-9]+([\.|,][0-9]+)?" step="any" value="<%= retenciones.get(2).getCfgCuotaFija() %>" required/></td>
                        </tr>
                        <tr>
                            <td>Tramo IV</td>
                            <td><input type="number" class="form-control input-sm"  name="desdeRenta4" min="0.00" pattern="[0-9]+([\.|,][0-9]+)?" step="any"  value="<%= retenciones.get(3).getCfgMinimo() %>" required/></td>
                            <td><input type="number" class="form-control input-sm" name="hastaRenta4" min="0.00"  pattern="[0-9]+([\.|,][0-9]+)?" step="any" value="<%= retenciones.get(3).getCfgMaximo() %>" required/></td>
                            <td><input type="number" class="form-control input-sm" name="aplicarRenta4" min="0.00" pattern="[0-9]+([\.|,][0-9]+)?" step="any"  value="<%= retenciones.get(3).getCfgPorcentaje() %>" max="100.00" required /></td>
                            <td><input type="number" class="form-control input-sm" name="excesoRenta4" min="0.00" pattern="[0-9]+([\.|,][0-9]+)?" step="any"  value="<%= retenciones.get(3).getCfgSobreExceso() %>" required/></td>
                            <td><input type="number" class="form-control input-sm" name="cuotaRenta4" min="0.00" pattern="[0-9]+([\.|,][0-9]+)?" step="any"  value="<%= retenciones.get(3).getCfgCuotaFija() %>" required/></td>
                        </tr>
                        <tr>
                            <td>Tramo V</td>
                            <td><input type="number" class="form-control input-sm"  name="desdeRenta5"  pattern="[0-9]+([\.|,][0-9]+)?" step="any" min="0.00" value="<%= retenciones.get(4).getCfgMinimo() %>" required/></td>
                            <td><input type="number" class="form-control input-sm" name="hastaRenta5" pattern="[0-9]+([\.|,][0-9]+)?" step="any"  min="0.00"  value="<%= retenciones.get(4).getCfgMaximo() %>" required/></td>
                            <td><input type="number" class="form-control input-sm" name="aplicarRenta5"  pattern="[0-9]+([\.|,][0-9]+)?" step="any" min="0.00" value="<%= retenciones.get(4).getCfgPorcentaje() %>" max="100.00" required /></td>
                            <td><input type="number" class="form-control input-sm" name="excesoRenta5"  pattern="[0-9]+([\.|,][0-9]+)?" step="any" min="0.00" value="<%= retenciones.get(4).getCfgSobreExceso() %>" required/></td>
                            <td><input type="number" class="form-control input-sm" name="cuotaRenta5"  pattern="[0-9]+([\.|,][0-9]+)?" step="any" min="0.00" value="<%= retenciones.get(4).getCfgCuotaFija() %>" required/></td>
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
