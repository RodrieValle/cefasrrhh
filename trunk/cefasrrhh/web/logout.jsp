<%
    HttpSession sesionOk = request.getSession();
    String tipo = (String)sesionOk.getAttribute("tipo");
    if(tipo != null)
    {
        sesionOk.invalidate();
    }
    response.sendRedirect("index.jsp");
%>