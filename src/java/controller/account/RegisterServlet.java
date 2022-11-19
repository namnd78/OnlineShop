/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.account;

import dal.auth.AccountDAO;
import dal.product.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Category;

/**
 *
 * @author NamND
 */
public class RegisterServlet extends HttpServlet {

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
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
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
        CategoryDAO cdao = new CategoryDAO();
        List<Category> categories = cdao.getAllCategories();
        HttpSession session = request.getSession();
        Account acount = (Account) session.getAttribute("account");
        if (acount != null) {
            response.sendRedirect("home");
        } else {
            request.setAttribute("categories", categories);
            request.setAttribute("path", "register");
            request.getRequestDispatcher("pages/account/login.jsp").forward(request, response);
        }
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
        CategoryDAO cdao = new CategoryDAO();
        AccountDAO adao = new AccountDAO();
        List<Category> categories = cdao.getAllCategories();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String dob = request.getParameter("dob");
        String alert;
        request.setAttribute("path", "register");
        request.setAttribute("categoories", categories);
        request.setAttribute("username", username);
        request.setAttribute("password", password);
        request.setAttribute("repassword", repassword);
        request.setAttribute("fullname", fullname);
        request.setAttribute("email", email);
        request.setAttribute("phone", phone);
        request.setAttribute("dob", dob);
        if (adao.getAccountByUsername(username) != null) {
            request.setAttribute("alert", "Username already exists!");
            request.getRequestDispatcher("pages/account/login.jsp").forward(request, response);
        } else if (!password.equals(repassword)) {
            request.setAttribute("alert", "Confirm-password not match password!");
            request.getRequestDispatcher("pages/account/login.jsp").forward(request, response);
        } else if (adao.getAccountByEmail(email) != null) {
            request.setAttribute("alert", "Email already used!");
            request.getRequestDispatcher("pages/account/login.jsp").forward(request, response);
        } else if (adao.getAccountByUsername(username) == null && adao.getAccountByEmail(email) == null && password.equals(repassword)) {
            adao.addAccount(username, password, email, fullname, dob, phone);
            request.setAttribute("notification", "Sign up success!");
            request.getRequestDispatcher("pages/account/login.jsp").forward(request, response);
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
