/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/
package controller;

import entity.Order;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.OrderModel;

/**
 *
 * @author Surya
 */
@WebServlet(name = "OrderEdit", urlPatterns = {"/OrderEdit"})
public class OrderEdit extends HttpServlet {
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
            OrderModel model = new OrderModel();
            Order o = model.getDetail(id);
            request.setAttribute("o", o);
            String title="Ubah Data Order";
            request.setAttribute("t", title);            
            RequestDispatcher rd = null;
            rd = request.getRequestDispatcher("/view/orderEdit.jsp");
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
            
            Order o = new Order();
            o.setId_order(Integer.parseInt(request.getParameter("idBaru")));
            o.setNama(request.getParameter("namaBaru"));
            request.setAttribute("o", o);
            
            OrderModel model = new OrderModel();
            String info = model.update(id, o);
            if (info.equals("success")) {
                response.sendRedirect("OrderView");
            } else {
                out.println(info);
                RequestDispatcher rd = null;
                rd = request.getRequestDispatcher("/view/orderEdit.jsp");
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