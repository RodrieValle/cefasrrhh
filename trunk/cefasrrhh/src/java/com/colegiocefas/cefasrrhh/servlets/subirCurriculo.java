/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor. 
 */
package com.colegiocefas.cefasrrhh.servlets;

import com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Candidato;
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
import javax.swing.JOptionPane;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Rodrigo
 */
@WebServlet(name = "subirCurriculo", urlPatterns = {"/subirCurriculo"})
public class subirCurriculo extends HttpServlet {
    

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
        String dui = request.getParameter("dui");
        String nombre = request.getParameter("nombre");
        String especialidad = request.getParameter("especialidad");
        String url = request.getParameter("url");
        
        //Código para subir pdf del curriculum al servidor
        try {
            List items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
            for (int i = 0; i < items.size(); i++) {
                FileItem item = (FileItem) items.get(i);
                if (item.isFormField()) {
                    if(item.getFieldName().equals("dui"))
                        dui = item.getString("UTF-8");
                    if(item.getFieldName().equals("especialidad"))
                        especialidad = item.getString("UTF-8");
                    if(item.getFieldName().equals("nombre"))
                        nombre = item.getString("UTF-8");
                } else {
                    Date fecha = Calendar.getInstance().getTime();
                    SimpleDateFormat formato = new SimpleDateFormat("yyyyMMdd-hhmmss-");
                    String nombreImagen = formato.format(fecha);
                    nombreImagen += dui;
                    //String fileName = item.getName();
                    response.setContentType("text/plain");
                    response.setCharacterEncoding("UTF-8");
                    String realPath = request.getSession().getServletContext().getRealPath("/");
                    File fichero = new File(realPath + "documentos/candidatos/", nombreImagen+".pdf");
                    item.write(fichero);
                    url = "documentos/candidatos/"  + fichero.getName();
                }
            }
            CtrlCEFAS_Candidato ctrlcandidato = new CtrlCEFAS_Candidato();
            ctrlcandidato.guardarCurriculum(dui, nombre, Integer.parseInt(especialidad),url);
            String mensaje ="<div class='alert alert-success' role='alert'>Guardado</div>";
            response.sendRedirect("ingresarcurriculum.jsp");
        } catch (Exception e) {
            //out.write(e.getMessage());
            //JOptionPane.showMessageDialog(null, e.getMessage());
            throw new ServletException("Parsing file upload failed.", e);
        }
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
