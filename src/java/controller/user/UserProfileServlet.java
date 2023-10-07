/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;
import model.UserRegister;

/**
 *
 * @author PC
 */
@MultipartConfig

public class UserProfileServlet extends HttpServlet {

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
            out.println("<title>Servlet UserProfileServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserProfileServlet at " + request.getContextPath() + "</h1>");
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

        request.getRequestDispatcher("userProfile.jsp").forward(request, response);

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

        // check duplicate when reload page using DB ...
        PrintWriter out = response.getWriter();
        HttpSession mySession = request.getSession();
        UserRegister userRegister = (UserRegister) mySession.getAttribute("userRegister");
        User u = (User) mySession.getAttribute("userSession");

        String username = request.getParameter("username"); // check
//        String password = request.getParameter("password");
        String password = "";
        String name = request.getParameter("name"); // check 
        String email = request.getParameter("email"); // check 
        String phone = request.getParameter("phone"); // check 
        String genderStr = request.getParameter("gender"); // check 
        String role = request.getParameter("role");
        String avatarUrl = request.getParameter("avatarUrl");
//        out.println("username: "+username);
//        out.println("profileImageUrl: "+avatarUrl);
//        if (u != null) {
//            if (u.getEmail().equals(email)) {
//                response.sendRedirect("userProfile.jsp");
//            }  
//        }
        
         
        boolean checkEdit = true;
        if (!avatarUrl.isEmpty()) {
            
            request.setAttribute("valueAvatarUrl", avatarUrl);
        }
//        if (avatarUrl.isEmpty()) {
//            request.setAttribute("errAvatarUrl", "Avatar url is not valid");
//            checkEdit = false;
//        } else {
//            request.setAttribute("valueAvatarUrl", avatarUrl);
//        }
        
        if (username.isEmpty()) {
            request.setAttribute("errUsername", "Username is not valid");
            checkEdit = false;
        } else {
            request.setAttribute("valueUsername", username);
        }
        
        if (userRegister != null) {
            password = userRegister.getPassword();
        } else {
            
            if (u != null) {
                password = u.getPassword();
            } else {
                password = "";
            }
            
        }
        
        if (name.isEmpty()) {
            request.setAttribute("errName", "Name is not valid");
            checkEdit = false;
        } else {
            request.setAttribute("valueName", name);
        }
        
        if (email.isEmpty()) {
            request.setAttribute("errEmail", "Email is not valid");
            checkEdit = false;
        } else {
            request.setAttribute("valueEmail", email);
        }
        
        if (phone.isEmpty()) {
            request.setAttribute("errPhone", "Phone is not valid");
            checkEdit = false;
        } else {
            request.setAttribute("valuePhone", phone);
        }
//        out.println(genderStr);
        if (genderStr == null) {
            request.setAttribute("errGender", "Choose your gender");
            checkEdit = false;
        } else {
            request.setAttribute("valueGender", genderStr);
        }
        
        
        if (checkEdit) {
            LocalDateTime dateCreated = LocalDateTime.now();
            LocalDateTime expiredTime = dateCreated;
            int coinQuantity = 0;
            LocalDateTime createAt = dateCreated;

            boolean gender = true;
            if (genderStr.equals("true")) {
                gender = true;
            } else if (genderStr.equals("false")) {
                gender = false;
            }
            User userSession = new User(avatarUrl, username, password, name,
                    email, phone, gender, role, expiredTime, coinQuantity, createAt);
            mySession.removeAttribute("tokenVerify");
//            mySession.removeAttribute("userRegister");
            
            mySession.setAttribute("userSession", userSession);
            
            // no error message
            request.setAttribute("errUsername", "");
            request.setAttribute("errName", "");
            request.setAttribute("errEmail", "");
            request.setAttribute("errPhone", "");
            request.setAttribute("errGender", "");
            // reset input value
            request.setAttribute("valueUsername", "");
            request.setAttribute("valueName", "");
            request.setAttribute("valueEmail", "");
            request.setAttribute("valuePhone", "");
            request.setAttribute("valueGender", "");
            
            request.setAttribute("messageSave", "Save successfully");
//            request.getRequestDispatcher("home.jsp").forward(request, response);
//            return;
        }
        request.getRequestDispatcher("userProfile.jsp").forward(request, response);
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
