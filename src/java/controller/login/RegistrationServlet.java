/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.login;

import dal.UserDemoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;
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
public class RegistrationServlet extends HttpServlet {

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
            out.println("<title>Servlet RegistrationServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistrationServlet at " + request.getContextPath() + "</h1>");
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
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("contact");
        String rePassword = request.getParameter("re_password");
        String agreeTerm = request.getParameter("agree-term"); // on - NULL

        boolean checkRegister = false;

        // check input Username Length
        int maxName = 15;
        int minName = 3;
        if (checkLength("Username", minName, maxName) < minName) {
            request.setAttribute("errName", "Username must be at least " + minName + " characters");
            checkRegister = false;
        } else if (checkLength("Username", minName, maxName) > maxName) {
            request.setAttribute("errName", "Username must be less than " + maxName + " characters");
            checkRegister = false;
        } else if (name.isEmpty()) {
            request.setAttribute("errName", "Username is not valid");
            checkRegister = false;
        } else {
            request.setAttribute("valueName", name);
            checkRegister = true;
        }

        // check email is valid
        if (checkEmail(email) == false) {
            request.setAttribute("errEmail", "Email is not valid");
            checkRegister = false;
        } else {
            request.setAttribute("valueEmail", email);
            checkRegister = true;
        }

        // check input Password Length
        int maxPass = 25;
        int minPass = 6;
        if (checkLength("Password", minPass, maxPass) < minPass) {
            request.setAttribute("errPass", "Password must be at least " + minPass + " characters");
            checkRegister = false;
        } else if (checkLength("Password", minPass, maxPass) > maxPass) {
            request.setAttribute("errPass", "Password must be less than " + maxPass + " characters");
            checkRegister = false;
        } else if (password.isEmpty()) {
            request.setAttribute("errPass", "Password is not valid");
            checkRegister = false;
        } else if (checkPasswordMatch(password, rePassword) == false) {
            request.setAttribute("errPass", "Password is not valid");
            checkRegister = false;
        }

        // check input phone
        if (checkPhone(phone) == false) {
            request.setAttribute("errPhone", "Phone number is invalid");
            checkRegister = false;
        } else {
            request.setAttribute("valuePhone", phone);
            checkRegister = true;
        }

        // check passwords match
        if (checkPasswordMatch(password, rePassword) == false) {
            request.setAttribute("errRePass", "Passwords do not match");
            checkRegister = false;
        } else if (rePassword.isEmpty()) {
            request.setAttribute("errRePass", "Passwords do not match");
            checkRegister = false;
        }

        // check checkbox agree-term
        if (agreeTerm == null) {
            request.setAttribute("errAgreeTerm", "Please indicate that you have agree to the Terms of Services");
            checkRegister = false;
        }

        UserDemo user = new UserDemo(name, password, email, phone);

        if (checkRegister) {
            UserDemoDAO userDemoDAO = new UserDemoDAO();

            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            
            request.setAttribute("status", "success");

            // reset inputs
            request.setAttribute("valueName", "");
            request.setAttribute("valueEmail", "");
            request.setAttribute("valuePass", "");
            request.setAttribute("valueRePass", "");
            request.setAttribute("valuePhone", "");
//            response.sendRedirect("login.jsp?status=success");
            request.getRequestDispatcher("registration.jsp").forward(request, response);
            return;
        } else {
            request.setAttribute("status", "failed");
        }
        request.getRequestDispatcher("registration.jsp").forward(request, response);
        return;
    }   

    public int checkLength(String input, int min, int max) {
        if (input.length() < min) {
            return (min - 1);
        } else if (input.length() > max) {
            return (max + 1);
        }

        return (min + max) / 2;
    }

    public boolean checkEmail(String inputEmail) {
        // Tạo biểu thức chính quy để kiểm tra địa chỉ email
        String regex = "^(([^<>()\\[\\]\\.,;:\\s@\"]+(\\.[^<>()\\[\\]\\.,;:\\s@\"]+)*)|(\".+\"))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
        Pattern pattern = Pattern.compile(regex);

        // Kiểm tra xem địa chỉ email có khớp với biểu thức chính quy không
        Matcher matcher = pattern.matcher(inputEmail);
        return matcher.matches();
    }

    public boolean checkPhone(String phoneNumber) {
        // Biểu thức chính quy để kiểm tra số điện thoại
        String regex = "^(0[1-9][0-9]{8}|84[1-9][0-9]{7})$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(phoneNumber);

        // Kiểm tra xem số điện thoại có khớp với biểu thức chính quy không
        return matcher.matches();

        /*
        Ví dụ về số điện thoại hợp lệ:

        0912345678
        0849123456
        Ví dụ về số điện thoại không hợp lệ:

        0123456789 (Số 0 ở đầu không hợp lệ)
        84123456789 (Số điện thoại quốc tế có quá nhiều chữ số)
        084-123-456 (Có ký tự đặc biệt)
         */
    }

    public boolean checkPasswordMatch(String password, String rePassword) {
        return password.equals(rePassword);
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
