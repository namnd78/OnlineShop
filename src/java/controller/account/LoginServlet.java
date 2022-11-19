/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.account;

import dal.auth.AccountDAO;
import dal.product.CategoryDAO;
import dal.product.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
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
public class LoginServlet extends HttpServlet {

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
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
            request.setAttribute("path", "login");
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
        List<Category> categories = cdao.getAllCategories();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        AccountDAO adao = new AccountDAO();
        Account account = adao.checkAccount(username, password);
        HttpSession session = request.getSession();
        if (account == null) {
            request.setAttribute("categories", categories);
            request.setAttribute("path", "login");
            request.setAttribute("alert", "Username or Password is invalid!");
            request.getRequestDispatcher("pages/account/login.jsp").forward(request, response);
        } else {
            Cookie cusername = new Cookie("cusername", username);
            Cookie cpassword = new Cookie("cpassword", password);
            Cookie cremember = new Cookie("cremember", remember);
            if (remember != null) {
                cusername.setMaxAge(60 * 60 * 24 * 7);
                cpassword.setMaxAge(60 * 60 * 24 * 7);
                cremember.setMaxAge(60 * 60 * 24 * 7);
            } else {
                cusername.setMaxAge(0);
                cpassword.setMaxAge(0);
                cremember.setMaxAge(0);
            }
            response.addCookie(cusername);
            response.addCookie(cpassword);
            response.addCookie(cremember);
            session.setAttribute("account", account);
            if (account.getRole() == 0) {
                response.sendRedirect("home");
            } else {
                response.sendRedirect("dashboardadmin");
            }
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
