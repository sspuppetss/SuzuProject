/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/
package controller;

import entity.Susu;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.SusuModel;

/**
 *
 * @author Surya
 */
@WebServlet(name = "SusuEdit", urlPatterns = {"/SusuEdit"})
public class SusuEdit extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session.getAttribute("username")==null){
            RequestDispatcher rd = null;
            rd = request.getRequestDispatcher("/view/login.jsp");
            rd.forward(request, response);
        }else{
            int id = Integer.parseInt(request.getParameter("id"));
            SusuModel model = new SusuModel();
            Susu s = model.getDetail(id);
            request.setAttribute("s", s);
            String title="Ubah Data Susu";
            request.setAttribute("t", title);
            
            RequestDispatcher rd = null;
            rd = request.getRequestDispatcher("/view/susuEdit.jsp");
            rd.forward(request, response);
        }
    }
    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        if(session.getAttribute("username")==null){
            RequestDispatcher rd = null;
            rd = request.getRequestDispatcher("/view/login.jsp");
            rd.forward(request, response);
        }else{
            int id = Integer.parseInt(request.getParameter("id"));
            
            Susu s = new Susu();
            s.setId_susu(Integer.parseInt(request.getParameter("idBaru")));
            s.setNama(request.getParameter("namaBaru"));
            s.setVol_liter(Integer.parseInt(request.getParameter("volBaru")));
            s.setHarga(Integer.parseInt(request.getParameter("hargaBaru")));
            request.setAttribute("s", s);
            
            SusuModel model = new SusuModel();
            String info = model.update(id, s);
            if (info.equals("success")) {
                response.sendRedirect("SusuView");
            } else {
                out.println(info);
                RequestDispatcher rd = null;
                rd = request.getRequestDispatcher("/view/susuEdit.jsp");
                rd.include(request, response);
            }}
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