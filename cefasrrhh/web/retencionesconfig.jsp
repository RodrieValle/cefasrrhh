<%-- 
    Document   : retencionesconfig
    Created on : 11-11-2014, 10:12:21 PM
    Author     : Rodrigo
--%>
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
        List<CEFAS_ConfiguracionRetenciones> nuevasRetenciones = new ArrayList<CEFAS_ConfiguracionRetenciones>();
        for(int x=1; x<=5; x++)
        {
            CEFAS_ConfiguracionRetenciones retencion = new CEFAS_ConfiguracionRetenciones();
            retencion.setCfgTipo("renta1");
            retencion.setCfgMinimo( Float.parseFloat(request.getParameter("desdeRenta"+x)));
            retencion.setCfgMinimo( Float.parseFloat(request.getParameter("hastaRenta"+x)));
            retencion.setCfgMinimo( Float.parseFloat(request.getParameter("aplicarRenta"+x)));
            retencion.setCfgMinimo( Float.parseFloat(request.getParameter("excesoRenta"+x)));
            retencion.setCfgMinimo( Float.parseFloat(request.getParameter("cuotaRenta"+x)));
            nuevasRetenciones.add(retencion);
        }
        
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
                    ISSS laboral:<input type="number" class="form-control input-sm" name="issslaboral" min="0.00" max="100.00" required value="<%= retenciones.get(9).getCfgPorcentaje() %>"/>
                    ISSS patronal:<input type="number" class="form-control input-sm"  name="isspatronal" min="0.00" max="100.00" required value="<%= retenciones.get(10).getCfgPorcentaje() %>"/>
                    Techo ISSS:<input type="number" class="form-control input-sm" name="techoisss" value="<%= retenciones.get(9).getCfgMaximo() %>" />
                    <h3>AFP</h3>
                    AFP laboral Crecer:<input type="number" class="form-control input-sm" name="afplaboralcrecer" min="0.00" max="100.00" required value="<%= retenciones.get(5).getCfgPorcentaje() %>" />
                    AFP laboral Confía:<input type="number" class="form-control input-sm" name="afplaboralconfia" min="0.00" max="100.00" required value="<%= retenciones.get(7).getCfgPorcentaje() %>" />
                    AFP patronal Crecer:<input type="number" class="form-control input-sm" name="afppatronalcrecer" min="0.00" max="100.00" required value="<%= retenciones.get(6).getCfgPorcentaje() %>" />
                    AFP patronal Confía:<input type="number" class="form-control input-sm" name="afppatronalconfia" min="0.00" max="100.00" required value="<%= retenciones.get(8).getCfgPorcentaje() %>" />
                    Techo AFP:<input type="number" class="form-control input-sm" name="techoafp" value="<%= retenciones.get(8).getCfgMaximo() %>" />
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
                            <td><input type="number" class="form-control input-sm"  name="desdeRenta1" min="0.00" value="<%= retenciones.get(0).getCfgMinimo()%>" required/></td>
                            <td><input type="number" class="form-control input-sm" name="hastaRenta1" min="0.00"  value="<%= retenciones.get(0).getCfgMaximo() %>" required/></td>
                            <td><input type="number" class="form-control input-sm" name="aplicarRenta1" min="0.00" value="<%= retenciones.get(0).getCfgPorcentaje() %>" max="100.00" required /></td>
                            <td><input type="number" class="form-control input-sm" name="excesoRenta1" min="0.00" value="<%= retenciones.get(0).getCfgSobreExceso() %>" required/></td>
                            <td><input type="number" class="form-control input-sm" name="cuotaRenta1" min="0.00" value="<%= retenciones.get(0).getCfgCuotaFija() %>" required/></td>
                        </tr>
                        <tr>
                            <td>Tramo II</td>
                            <td><input type="number" class="form-control input-sm"  name="desdeRenta2" min="0.00" value="<%= retenciones.get(1).getCfgMinimo()%>" required/></td>
                            <td><input type="number" class="form-control input-sm" name="hastaRenta2" min="0.00"  value="<%= retenciones.get(1).getCfgMaximo() %>" required/></td>
                            <td><input type="number" class="form-control input-sm" name="aplicarRenta2" min="0.00" value="<%= retenciones.get(1).getCfgPorcentaje() %>" max="100.00" required /></td>
                            <td><input type="number" class="form-control input-sm" name="excesoRenta2" min="0.00" value="<%= retenciones.get(1).getCfgSobreExceso() %>" required/></td>
                            <td><input type="number" class="form-control input-sm" name="cuotaRenta2" min="0.00" value="<%= retenciones.get(1).getCfgCuotaFija() %>" required/></td>
                        </tr>
                        <tr>
                            <td>Tramo III</td>
                            <td><input type="number" class="form-control input-sm"  name="desdeRenta3" min="0.00" value="<%= retenciones.get(2).getCfgMinimo() %>" required/></td>
                            <td><input type="number" class="form-control input-sm" name="hastaRenta3" min="0.00"  value="<%= retenciones.get(2).getCfgMaximo() %>" required/></td>
                            <td><input type="number" class="form-control input-sm" name="aplicarRenta3" min="0.00" value="<%= retenciones.get(2).getCfgPorcentaje() %>" max="100.00" required /></td>
                            <td><input type="number" class="form-control input-sm" name="excesoRenta3" min="0.00" value="<%= retenciones.get(2).getCfgSobreExceso() %>" required/></td>
                            <td><input type="number" class="form-control input-sm" name="cuotaRenta3" min="0.00" value="<%= retenciones.get(2).getCfgCuotaFija() %>" required/></td>
                        </tr>
                        <tr>
                            <td>Tramo IV</td>
                            <td><input type="number" class="form-control input-sm"  name="desdeRenta4" min="0.00" value="<%= retenciones.get(3).getCfgMinimo() %>" required/></td>
                            <td><input type="number" class="form-control input-sm" name="hastaRenta4" min="0.00"  value="<%= retenciones.get(3).getCfgMaximo() %>" required/></td>
                            <td><input type="number" class="form-control input-sm" name="aplicarRenta4" min="0.00" value="<%= retenciones.get(3).getCfgPorcentaje() %>" max="100.00" required /></td>
                            <td><input type="number" class="form-control input-sm" name="excesoRenta4" min="0.00" value="<%= retenciones.get(3).getCfgSobreExceso() %>" required/></td>
                            <td><input type="number" class="form-control input-sm" name="cuotaRenta4" min="0.00" value="<%= retenciones.get(3).getCfgCuotaFija() %>" required/></td>
                        </tr>
                        <tr>
                            <td>Tramo V</td>
                            <td><input type="number" class="form-control input-sm"  name="desdeRenta5" min="0.00" value="<%= retenciones.get(4).getCfgMinimo() %>" required/></td>
                            <td><input type="number" class="form-control input-sm" name="hastaRenta5" min="0.00"  value="<%= retenciones.get(4).getCfgMaximo() %>" required/></td>
                            <td><input type="number" class="form-control input-sm" name="aplicarRenta5" min="0.00" value="<%= retenciones.get(4).getCfgPorcentaje() %>" max="100.00" required /></td>
                            <td><input type="number" class="form-control input-sm" name="excesoRenta5" min="0.00" value="<%= retenciones.get(4).getCfgSobreExceso() %>" required/></td>
                            <td><input type="number" class="form-control input-sm" name="cuotaRenta5" min="0.00" value="<%= retenciones.get(4).getCfgCuotaFija() %>" required/></td>
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
