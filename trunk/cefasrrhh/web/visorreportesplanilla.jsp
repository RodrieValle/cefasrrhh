<%-- 
    Document   : visorreportesplanilla
    Created on : 12-01-2014, 01:16:58 PM
    Author     : Rodrigo
--%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Planilla"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Planilla"%>
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
        int reporte = Integer.parseInt(request.getParameter("reporte"));
        if(reporte == 0)
        {
            response.sendRedirect("planillasHistorial.jsp");
            return;
        }
        String meses[] = {"ENERO", "FEBRERO", "MARZO", "ABRIL", "MAYO", "JUNIO", "JULIO",
        "AGOSTO", "SEPTIEMBRE", "OCTUBRE", "NOVIEMBRE", "DICIEMBRE"}; 
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
        
        String urlReporte ="";
        String header = "";
        String dia = new SimpleDateFormat("dd-MM-yyyy").format(new Date());
        switch(reporte)
        {
            case 1:
                urlReporte = "reportes/CEFAS_HorasExtra.jasper";
                header = "filename=horasextras-"+dia+".pdf";
            break;
            case 2:
                urlReporte = "reportes/CEFAS_Tardias.jasper";
                header = "filename=tardias-"+dia+".pdf";
            break;
            case 3:
                urlReporte = "reportes/CEFAS_AfpConfia.jasper";
                header = "filename=afpconfia-"+dia+".pdf";
            break;
            case 4:
                urlReporte = "reportes/CEFAS_AfpCrecer.jasper";
                header = "filename=afpcrecer-"+dia+".pdf";
            break;
            case 5:
                urlReporte = "reportes/CEFAS_Renta.jasper";
                header = "filename=renta-"+dia+".pdf";
            break;
            case 6:
                urlReporte = "reportes/CEFAS_Anticipo.jasper";
                header = "filename=anticipo-"+dia+".pdf";
            break;
            
            case 7:
                urlReporte = "reportes/CEFAS_Prestamos.jasper";
                header = "filename=prestamo-"+dia+".pdf";
            break;
            case 8:
                urlReporte = "reportes/CEFAS_Descuento.jasper";
                header = "filename=descuento-"+dia+".pdf";
            break;
            case 9:
                urlReporte = "reportes/CEFAS_ISSS.jasper";
                header = "filename=isss-"+dia+".pdf";
            break;
            case 10:
                urlReporte = "reportes/CEFAS_Viatico.jasper";
                header = "filename=viatico-"+dia+".pdf";
            break;
                
        }
        if(reporte != 0)
        {
            File reportFile = new File(application.getRealPath(urlReporte));
            byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parametros, conn);
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", header); 
            response.setContentLength(bytes.length);
            try {
                ServletOutputStream ouputStream = response.getOutputStream();
                ouputStream.write(bytes, 0, bytes.length);
                ouputStream.flush();
                ouputStream.close();
            } catch (IllegalStateException e) {
                //System.out.print("Igual se descarga");
            }
        }
        
    }
    
%>
