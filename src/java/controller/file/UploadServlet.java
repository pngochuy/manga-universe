package controller.file;

import dal.DBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet(name = "UploadServlet", urlPatterns = {"/UploadServlet"})
public class UploadServlet extends HttpServlet {

    PrintWriter out = null;
    Connection con = null;
    PreparedStatement ps = null;
    HttpSession session = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain;charset=UTF-8");

        request.setAttribute("successMessage", "Yêu cầu của bạn đã được gửi đi và đang được xử lý.");
        Date currentTime = new Date();
        String userID = request.getParameter("userID");
        String username = request.getParameter("username");
        Timestamp timestamp = new Timestamp(currentTime.getTime());
        String fileName = request.getParameter("coverUrl");
        String introduction = request.getParameter("introduction");

        Timestamp added_date = new Timestamp(System.currentTimeMillis());

        try {
            DBContext dbContext = new DBContext();
            con = dbContext.connection;
            System.out.println("connection done");
            String sql = "INSERT INTO VerifyUser (timeCreate, userID, username, fileVerify, introduction)\n"
                    + "VALUES (?, ?, ?, ?, ?);";

            ps = con.prepareStatement(sql);
            ps.setTimestamp(1, timestamp);
            ps.setInt(2, Integer.parseInt(userID));
            ps.setString(3, username);
            ps.setString(4, fileName);
            ps.setString(5, introduction);

            int status = ps.executeUpdate();
//            if (status > 0) {
//                response.sendRedirect(request.getContextPath() + "/");
//            }
            request.getRequestDispatcher("registerAuthor.jsp").forward(request, response);


        } catch (SQLException e) {
            out.println("Exception: " + e);
            System.out.println("Exception1: " + e);
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                out.println(e);
            }
        }
    }

}
