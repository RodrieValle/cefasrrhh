/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor. 
 */
package com.colegiocefas.cefasrrhh.servlets;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Rodrigo
 */
@WebServlet(name = "subirImagen", urlPatterns = {"/subirImagen"})
public class subirImagen extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ajaxUpdateResult = "Error";
        try {
            List items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
            for (int i = 0; i < items.size(); i++) {
                FileItem item = (FileItem) items.get(i);
                if (item.isFormField()) {
                } else {
                    Date fecha = Calendar.getInstance().getTime();
                    SimpleDateFormat formato = new SimpleDateFormat("yyyyMMdd-hhmmss-");
                    String nombreImagen = formato.format(fecha);
                    HttpSession sesionOk = request.getSession();
                    String usuario = (String) sesionOk.getAttribute("usuario");
                    if (usuario == null) {
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                        return;
                    }
                    nombreImagen += usuario;
                    //String fileName = item.getName();
                    response.setContentType("text/plain");
                    response.setCharacterEncoding("UTF-8");
                    String realPath = request.getSession().getServletContext().getRealPath("/");
                    File fichero = new File(realPath + "img/fotos/", nombreImagen+".png");
                    item.write(fichero);
                    ajaxUpdateResult = "img/fotos/"  + fichero.getName();
                }
            }
        } catch (Exception e) {
            ajaxUpdateResult = "ErrorException";
            throw new ServletException("Parsing file upload failed.", e);
        }
        response.getWriter().print(ajaxUpdateResult);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
