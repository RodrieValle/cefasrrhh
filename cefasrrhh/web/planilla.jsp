<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Planilla"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Planilla"%>
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
    String meses[] = {"ENERO", "FEBRERO", "MARZO", "ABRIL", "MAYO", "JUNIO", "JULIO",
        "AGOSTO", "SEPTIEMBRE", "OCTUBRE", "NOVIEMBRE", "DICIEMBRE"}; 
    int idPlanilla = Integer.parseInt(request.getParameter("idPlanilla"));
    Map parametros = new HashMap();
    parametros.put("idPlanilla", idPlanilla);
    Connection conn = ConexionDB.getConexion();
    
    CtrlCEFAS_Planilla ctrlPlanilla = new CtrlCEFAS_Planilla();
    CEFAS_Planilla planilla = ctrlPlanilla.getPlanillaPorID(idPlanilla);
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
    parametros.put("periodo", periodo);
    
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