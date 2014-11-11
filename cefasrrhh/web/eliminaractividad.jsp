<%-- 
    Document   : eliminaractividad
    Created on : 11-10-2014, 11:43:09 PM
    Author     : Rodrigo
--%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Actividad"%>
<%
    request.setCharacterEncoding("UTF-8");
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
    String id = request.getParameter("id");
    CtrlCEFAS_Actividad ctrlActividad = new CtrlCEFAS_Actividad();
    ctrlActividad.eliminarActividadById(id);
    response.sendRedirect("controldeactividades.jsp");
%>
