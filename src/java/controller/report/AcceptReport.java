/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.report;

import dal.MangaDAO;
import dal.NotificationDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Manga;
import model.Notification;
import model.User;

/**
 *
 * @author ADMIN
 */
public class AcceptReport extends HttpServlet {

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
            out.println("<title>Servlet AcceptReport</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AcceptReport at " + request.getContextPath() + "</h1>");
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

        String rID = request.getParameter("reportID");
        String mID = request.getParameter("mangaID");
        int reportID = -1;
        int mangaID = -1;
        if (rID != null || !rID.isEmpty()) {
            reportID = Integer.parseInt(rID);
        }
        if (mID != null || !mID.isEmpty()) {
            mangaID = Integer.parseInt(mID);
        }

//        int mangaID = Integer.parseInt(request.getParameter("mangaID"));
//        int reportID = Integer.parseInt(request.getParameter("reportID"));
        HttpSession mySession = request.getSession();
        
        UserDAO userDAO = new UserDAO();
        User userSession = (User) mySession.getAttribute("userSession");
        // Gọi phương thức xóa người dùng từ DAO
        int id = userSession.getUserId();
        userDAO.deleteReport(reportID);
        
//        // Gọi phương thức xóa người dùng từ DAO
//        int id = userSession.getUserId();
//        userDAO.deleteReport(reportID);

        // Gọi phương thức xóa người dùng từ DAO
        MangaDAO mangaDAO = new MangaDAO();
        Manga m = mangaDAO.getManga(mangaID);
        mangaDAO.delete(m);

        // Redirect hoặc forward tới trang kết quả
        ///xu ly noti
        NotificationDAO notificationDAO = new NotificationDAO();
        List<Notification> notifications = notificationDAO.getAllNotifications();
        Notification newNotification = new Notification();
        newNotification.setUserID(id);
        newNotification.setMessage("Your request to become Author has been approved");
        newNotification.setNotificationDate(new Date());
        newNotification.setIsRead(false);

        notificationDAO.insertNotification(newNotification);
        response.sendRedirect("listReport.jsp");
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
