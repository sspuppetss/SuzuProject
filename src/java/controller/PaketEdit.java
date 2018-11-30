/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/
package controller;

import entity.Paket;
import entity.Susu;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.PaketModel;
import model.SusuModel;

/**
 *
 * @author Surya
 */
@WebServlet(name = "PaketEdit", urlPatterns = {"/PaketEdit"})
public class PaketEdit extends HttpServlet {
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
            SusuModel modelS = new SusuModel();
            List<Susu> listSusu = modelS.getAll();
            request.setAttribute("listSusu", listSusu);
            PaketModel model = new PaketModel();
            Paket p = model.getDetail(id);
            request.setAttribute("p", p);
            String title="Ubah Data Paket";
            request.setAttribute("t", title);
            RequestDispatcher rd = null;
            rd = request.getRequestDispatcher("/view/paketEdit.jsp");
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
            Paket p = new Paket();
            p.setId_paket(Integer.parseInt(request.getParameter("idBaru")));
            p.setNama(request.getParameter("namaBaru"));
            p.setId_susu(Integer.parseInt(request.getParameter("susuBaru")));
            p.setJml_susu(Integer.parseInt(request.getParameter("jmlBaru")));
            request.setAttribute("p", p);
            
            int y = Integer.parseInt(request.getParameter("jmlBaru"));
            int x = Integer.parseInt(request.getParameter("susuBaru"));
            Susu s = new Susu();
            SusuModel m = new SusuModel();
            s = m.getDetail(x);
            int xxx = s.getHarga()*y;
            p.setHarga(xxx);
            
            PaketModel model = new PaketModel();
            String info = model.update(id, p);
            if (info.equals("success")) {
                response.sendRedirect("PaketView");
            } else {
                out.println(info);
                RequestDispatcher rd = null;
                rd = request.getRequestDispatcher("/view/paketEdit.jsp");
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