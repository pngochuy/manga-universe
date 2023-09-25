/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.login;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.UserDemo;

/**
 *
 * @author PC
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
        request.getRequestDispatcher("login.jsp").forward(request, response);
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

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        
        boolean checkLoginValid = true;

        if (username == null || username.equals("")) {
            request.setAttribute("errUsername", "Username is not valid");
            checkLoginValid = false;
        } else {
            request.setAttribute("valueUsername", username);
        }

        if (password == null || password.equals("")) {
            request.setAttribute("errPassword", "Password is not valid");
            checkLoginValid = false;

        } else {
            request.setAttribute("valuePassword", password);
        }

        if (checkLoginValid) {

            UserDemo user = (UserDemo) session.getAttribute("user");
            boolean checkLogin = true;
            PrintWriter out = response.getWriter();
            if (user != null) {

                // CODE: for loop in DB to check username and passwod...
                if (user.getUsername().equals(username) == false) {
                    request.setAttribute("status", "failedUsername");
                    checkLogin = false;
                    request.setAttribute("valueUsername", "");
                    request.setAttribute("valuePassword", "");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else {
                    request.setAttribute("valueUsername", username);
                }

                if (user.getPassword().equals(password) == false) {
                    request.setAttribute("status", "failedPassword");
                    request.setAttribute("valuePassword", "");
                    checkLogin = false;
                }

                if (checkLogin) {
                    // Login success thi nen setTimeout trc khi toi trang nhap thong tin ca nhan

                    request.setAttribute("valueUsername", "");
                    request.setAttribute("valuePassword", "");
                    request.setAttribute("status", "success");
                    request.getRequestDispatcher("userInfo.jsp").forward(request, response);
                }

            }
        }

        request.getRequestDispatcher("login.jsp").forward(request, response);

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
