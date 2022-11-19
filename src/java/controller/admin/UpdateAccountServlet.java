/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import controller.account.ProfileServlet;
import dal.auth.AccountDAO;
import dal.product.CategoryDAO;
import dal.product.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Product;

/**
 *
 * @author NamND
 */
public class UpdateAccountServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateAccountServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateAccountServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        int aid = Integer.parseInt(request.getParameter("aid"));
        AccountDAO adao = new AccountDAO();
        Account account = adao.getAccountById(aid);
        request.setAttribute("account", account);
        request.getRequestDispatcher("pages/admin/updateaccount.jsp").forward(request, response);
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
        int aid = Integer.parseInt(request.getParameter("aid"));
        CategoryDAO cdao = new CategoryDAO();
        AccountDAO adao = new AccountDAO();
        Account account = adao.getAccountById(aid);
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String dobRaw = request.getParameter("dob");
        String depositRaw = request.getParameter("deposit");
        int deposit = 0;
        if (depositRaw != null && !depositRaw.isEmpty()) {
            deposit = Integer.parseInt(depositRaw);
        }
        if (adao.getAccountByUsername(username) != null && !username.equals(account.getUsername())) {
            request.setAttribute("alert", "Username already exists!");
            request.getRequestDispatcher("pages/account/profile.jsp").forward(request, response);
        } else if (adao.getAccountByEmail(email) != null && !email.equals(account.getEmail())) {
            request.setAttribute("alert", "Email already used!");
            request.getRequestDispatcher("pages/account/profile.jsp").forward(request, response);
        } else if ((-account.getAmount()) > deposit) {
            request.setAttribute("alert", "Withdraw cannot greater than balance");
            request.getRequestDispatcher("pages/account/profile.jsp").forward(request, response);
        } else {
            account.setUsername(username);
            account.setPassword(password);
            account.setFullname(fullname);
            account.setEmail(email);
            account.setPhone(phone);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
            try {
                java.util.Date date = sdf.parse(dobRaw + " 00:00:00");
                java.sql.Date dob = new Date(date.getTime());
                account.setDob(dob);
            } catch (ParseException ex) {
                Logger.getLogger(ProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            account.setAmount(account.getAmount() + deposit);
            adao.update(account);
            response.sendRedirect("updateaccount?aid=" + aid);
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
