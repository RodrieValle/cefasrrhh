<%@page import="com.colegiocefas.cefasrrhh.utilidades.ConexionDB"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int idPlanilla = Integer.parseInt(request.getParameter("idPlanilla"));
    Map parametros = new HashMap();
    parametros.put("idPlanilla", idPlanilla);
    Connection conn = ConexionDB.getConexion();
    
    //Obteniendo la fecha actual
    Calendar calendario = Calendar.getInstance();
    Date fechaActual = calendario.getTime();
    SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy");
    String dia = formato.format(fechaActual);
    
    File reportFile = new File(application.getRealPath("reportes/CEFAS_Planilla.jasper"));
    byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parametros, conn);
    response.setContentType("application/pdf");
    response.setHeader("Content-Disposition", "filename=planilla-"+dia+".pdf"); 
    response.setContentLength(bytes.length);
    try {
        ServletOutputStream ouputStream = response.getOutputStream();
        ouputStream.write(bytes, 0, bytes.length);
        ouputStream.flush();
        ouputStream.close();
    } catch (IllegalStateException e) {
        //System.out.print("Igual se descarga");
    }
%>