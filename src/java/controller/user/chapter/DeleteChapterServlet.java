/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user.chapter;

import com.google.gson.Gson;
import dal.CategoryDAO;
import dal.ChapterDAO;
import dal.ImageSourceDAO;
import dal.MangaCategoryDAO;
import dal.MangaDAO;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Chapter;
import model.Post;
import model.User;

/**
 *
 * @author PC
 */
public class DeleteChapterServlet extends HttpServlet {

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
            out.println("<title>Servlet DeleteChapterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteChapterServlet at " + request.getContextPath() + "</h1>");
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

//        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8"); // works fine
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession mySession = request.getSession();
        MangaDAO mangaDAO = new MangaDAO();
        MangaCategoryDAO mangaCategoryDAO = new MangaCategoryDAO();
        CategoryDAO categoryDAO = new CategoryDAO();
        ChapterDAO chapterDAO = new ChapterDAO();
        ImageSourceDAO imageSourceDAO = new ImageSourceDAO();

        String mID = request.getParameter("mangaID");
        String[] selectedChapters = request.getParameterValues("selectedChapters");

        if (selectedChapters != null) {
            for (String cId : selectedChapters) {
                int chapterId = Integer.parseInt(cId);
                
                imageSourceDAO.delete(chapterId);
                chapterDAO.delete(chapterId);
            }
            
            int mangaID = Integer.parseInt(mID);
            mySession.setAttribute("chapterListByManga", chapterDAO.getAllChaptersByMangaID(mangaID));
        }

        response.sendRedirect("viewChapterList.jsp");

    }
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        
//         // Đọc dữ liệu JSON được gửi từ client
//        BufferedReader reader = request.getReader();
//        StringBuilder jsonPayload = new StringBuilder();
//        String line;
//        while ((line = reader.readLine()) != null) {
//            jsonPayload.append(line);
//        }
//
//        // Chuyển đổi JSON thành danh sách các chapterIds bằng Gson (cần thêm thư viện Gson)
//        Gson gson = new Gson();
//        String[] chapterIds = gson.fromJson(jsonPayload.toString(), String[].class);
//
//        // Xử lý chapterIds ở đây, ví dụ: xóa các chapter có chapterIds tương ứng
//        ArrayList<String> deletedChapterIds = new ArrayList<>();
//        for (String chapterId : chapterIds) {
//            // Xử lý xóa chapter với chapterId
//            // Ví dụ: chapterService.deleteChapter(chapterId);
//            deletedChapterIds.add(chapterId);
//        }
//
//        // Gửi phản hồi trả về client (có thể là JSON phản hồi)
//        String jsonResponse = gson.toJson(deletedChapterIds);
//        response.setContentType("application/json");
//        response.getWriter().write(jsonResponse);
//    }

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
