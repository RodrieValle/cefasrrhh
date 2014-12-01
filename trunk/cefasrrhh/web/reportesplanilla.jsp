<%-- 
    Document   : reportesplanilla
    Created on : 12-01-2014, 12:00:21 PM
    Author     : Rodrigo
--%>
<%@page import="java.util.Date"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Planilla"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Planilla"%>
<%@page import="com.colegiocefas.cefasrrhh.utilidades.ConexionDB"%>
<%@page import="java.sql.Connection"%>
<%
    //Verificación de sesión abierta
    HttpSession sesionOk = request.getSession();
    String tipo = (String) sesionOk.getAttribute("tipo");
    if (tipo == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
    if (!tipo.equals("administrador")) {
        response.sendRedirect("avisos.jsp");
    }
    request.setCharacterEncoding("UTF-8");
    if(request.getParameter("reporte") != null)
    {
        String meses[] = {"ENERO", "FEBRERO", "MARZO", "ABRIL", "MAYO", "JUNIO", "JULIO",
        "AGOSTO", "SEPTIEMBRE", "OCTUBRE", "NOVIEMBRE", "DICIEMBRE"}; 
        int reporte = Integer.parseInt(request.getParameter("reporte"));
        Connection conn = ConexionDB.getConexion();
        CtrlCEFAS_Planilla ctrlPlanilla = new CtrlCEFAS_Planilla();
        CEFAS_Planilla planilla = ctrlPlanilla.getUltimaPlanilla();
        String datos[] = new SimpleDateFormat("dd/MM/yyyy").format( planilla.getPlnFecha()).split("/");
        int anio = Integer.parseInt(datos[2]);
        int mes = Integer.parseInt(datos[1]);
        int dias = Integer.parseInt(datos[0]);
        if(dias<=2)
            mes--;
        if(mes==0)
        {
            mes = 12;
            anio--;
        }
        String periodo = meses[mes-1] + " " + anio;
        Map parametros = new HashMap();
    
        parametros.put("idPlanilla", planilla.getPlnCodigo());
        parametros.put("periodo", periodo);
        
        String urlReporte;
        String header;
        String dia = new SimpleDateFormat("dd-MM-yyyy").format(new Date());
        switch(reporte)
        {
            case 0:
                response.sendRedirect("planillasHistorial.jsp");
            break;
            case 1:
                urlReporte = "reportes/CEFAS_Recibos.jasper";
                header = "filename=horasextras-"+dia+".pdf";
            break;
                
        }
        /*File reportFile = new File(application.getRealPath("reportes/CEFAS_Recibos.jasper"));
        byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parametros, conn);
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "filename=recibos-"+dia+".pdf"); 
        response.setContentLength(bytes.length);
        try {
            ServletOutputStream ouputStream = response.getOutputStream();
            ouputStream.write(bytes, 0, bytes.length);
            ouputStream.flush();
            ouputStream.close();
        } catch (IllegalStateException e) {
            //System.out.print("Igual se descarga");
        }*/
    }
    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de usuario</title>
        <jsp:include page='inc/head_common.jsp' /> 
        <link rel="stylesheet" type="text/css" href="css/bootstrap-formhelpers.css">
        <script type="text/javascript" src="js/bootstrap-formhelpers.js"></script>
    </head>
    <body>
        <div id="container">
            <jsp:include page='inc/menu_directora.jsp' />
            <div class="container">
                <h1>Reportes de planilla</h1>
                Seleccione el reporte deseado
                <div class="row">
                    <div class="col-xs-6 col-xs-offset-3">
                        <form action="visorreportesplanilla.jsp" method="post">
                        <label><input type="radio" name="reporte" value="0" required >
                        Reporte de planilla</label><br>
                        <label><input type="radio" name="reporte" value="1" >
                            Reporte de horas extras</label><br>
                        <label><input type="radio" name="reporte" value="2" >
                          Reporte de minutos tarde</label><br>
                        <label><input type="radio" name="reporte" value="3" >
                          Reporte de AFP Confía</label><br>
                        <label><input type="radio" name="reporte" value="4" >
                          Reporte de AFP Crecer</label><br>
                        <label><input type="radio" name="reporte" value="5" >
                          Reporte de impuesto sobre la renta</label><br>
                        <label><input type="radio" name="reporte" value="6" >
                            Reporte de anticipos</label><br>
                        <label><input type="radio" name="reporte" value="7" >
                          Reporte de préstamos</label><br>
                        <label><input type="radio" name="reporte" value="8" >
                          Reporte de órdenes de descuento</label><br>
                        <label><input type="radio" name="reporte" value="9" >
                          Reporte de pago a ISSS</label><br>
                        <label><input type="radio" name="reporte" value="10" >
                            Reporte de viáticos</label><br><br><br>
                          <input type="submit" value="Generar"  class="btn btn-success"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
