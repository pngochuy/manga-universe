/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import dal.DBContext;
import dal.NotificationDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.Notification;
import model.User;

/**
 *
 * @author PC
 */
@MultipartConfig
public class UpgradeToAuthorServlet extends HttpServlet {

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
            out.println("<title>Servlet UpgradeToAuthorServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpgradeToAuthorServlet at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        String id = request.getParameter("userID");

        if ("approve".equals(action)) {
            UserDAO userDAO = new UserDAO();
            User u = userDAO.getUserById(Integer.parseInt(request.getParameter("userID")));
            u.setRole("Author");
            userDAO.update(u);

            Connection con = null;
            PreparedStatement ps = null;
            DBContext dbContext = new DBContext();
            con = dbContext.connection;
            String deleteSQL = "DELETE FROM [MangaUniverse].[dbo].[VerifyUser] WHERE userID = ?";
            try {
                ps = con.prepareStatement(deleteSQL);
                ps.setInt(1, Integer.parseInt(id));
                ps.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(UpgradeToAuthorServlet.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                try {
                    if (ps != null) {
                        ps.close();
                    }
                    if (con != null) {
                        con.close();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UpgradeToAuthorServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            ///xu ly noti
            NotificationDAO notificationDAO = new NotificationDAO();
            List<Notification> notifications = notificationDAO.getAllNotifications();
            Notification newNotification = new Notification();
            newNotification.setUserID(Integer.parseInt(request.getParameter("userID")));
            newNotification.setMessage("Your request to become Author has been approved");
            newNotification.setNotificationDate(new Date());
            newNotification.setIsRead(false);

            notificationDAO.insertNotification(newNotification);

            response.sendRedirect("authorVerify.jsp");
        } else if ("reject".equals(action)) {
            UserDAO userDAO = new UserDAO();
            User u = userDAO.getUserById(Integer.parseInt(request.getParameter("userID")));
            u.setRole("Free");
            userDAO.update(u);
            
            Connection con = null;
            PreparedStatement ps = null;
            DBContext dbContext = new DBContext();
            con = dbContext.connection;
            String deleteSQL = "DELETE FROM [MangaUniverse].[dbo].[VerifyUser] WHERE userID = ?";
            try {
                ps = con.prepareStatement(deleteSQL);
                ps.setInt(1, Integer.parseInt(id));
                ps.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(UpgradeToAuthorServlet.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                try {
                    if (ps != null) {
                        ps.close();
                    }
                    if (con != null) {
                        con.close();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UpgradeToAuthorServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
            ///xu ly noti
            NotificationDAO notificationDAO = new NotificationDAO();
            List<Notification> notifications = notificationDAO.getAllNotifications();
            Notification newNotification = new Notification();
            newNotification.setUserID(Integer.parseInt(request.getParameter("userID")));
            newNotification.setMessage("Your request to become Author has been Rejected");
            newNotification.setNotificationDate(new Date());
            newNotification.setIsRead(false);

            notificationDAO.insertNotification(newNotification);
            
            response.sendRedirect("authorVerify.jsp");
        } else {

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
