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
    Connection conn = null;
    try {
        Class.forName("com.mysql.jdbc.Driver"); //se carga el driver
        conn = ConexionDB.getConexion();// DriverManager.getConnection("jdbc:mysql://localhost:3306/cefasrrhhdb", "cefasusuariodb", "we7854*/++");
    } catch (Exception ex) {
        ex.printStackTrace();
        //out.print("Excepcion");
    }
    //Obteniendo la fecha actual
    Calendar calendario = Calendar.getInstance();
    Date fechaActual = calendario.getTime();
    SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy");
    String dia = formato.format(fechaActual);
    
    Map parametros = new HashMap();
    
    parametros.put("fecha", new Date());
    
    File reportFile = new File(application.getRealPath("reportes/CEFAS_Recibos.jasper"));
    byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), null, conn);
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
    }
%>