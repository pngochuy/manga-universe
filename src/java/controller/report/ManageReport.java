/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.report;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author ADMIN
 */
public class ManageReport extends HttpServlet {

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
            out.println("<title>Servlet ManageReport</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageReport at " + request.getContextPath() + "</h1>");
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
    LocalDateTime dateReport = LocalDateTime.now();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String dbURL = "jdbc:sqlserver://localhost:1433;databaseName=MangaUniverse";
    String username = "sa";
    String password = "324095589";

    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    HttpSession mySession = request.getSession();
    UserDAO userDAO = new UserDAO();
    User userSession = (User) mySession.getAttribute("userSession");    
    int userID = 3;
    int mangaID = Integer.parseInt(request.getParameter("mangaID"));
    String reportReason = request.getParameter("reportReason"); // Lấy reportReason từ form
    Timestamp date = new Timestamp(System.currentTimeMillis()); // Lấy thời gian hiện tại

    try {
        Connection connection = DriverManager.getConnection(dbURL, username, password);

        String insertSQL = "INSERT INTO [MangaUniverse].[dbo].[Report] ([userID], [mangaID], [reason], [createAt]) VALUES (?, ?, ?, ?)";
        PreparedStatement preparedStatement = connection.prepareStatement(insertSQL);

        preparedStatement.setInt(1, userID);
        preparedStatement.setInt(2, mangaID);
        preparedStatement.setString(3, reportReason);
        preparedStatement.setTimestamp(4, date);

        int rowsInserted = preparedStatement.executeUpdate();

        if (rowsInserted > 0) {
            response.getWriter().println("Dữ liệu đã được chèn thành công vào cơ sở dữ liệu.");
        }

        preparedStatement.close();
        connection.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    response.sendRedirect("home.jsp");
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
        processRequest(request, response);
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
