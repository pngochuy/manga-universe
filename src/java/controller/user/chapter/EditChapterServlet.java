/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user.chapter;

import dal.CategoryDAO;
import dal.ChapterDAO;
import dal.ImageSourceDAO;
import dal.MangaCategoryDAO;
import dal.MangaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Chapter;
import model.ImageSource;
import model.Manga;

/**
 *
 * @author PC
 */
public class EditChapterServlet extends HttpServlet {

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
            out.println("<title>Servlet EditChapterServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditChapterServlet at " + request.getContextPath() + "</h1>");
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
        
        int chapterID = Integer.parseInt(request.getParameter("chapterID"));
        int mangaID = Integer.parseInt(request.getParameter("mangaID"));
        
        Chapter chapter = chapterDAO.getChapter(chapterID);
        Manga manga = mangaDAO.getManga(mangaID);
        ArrayList<ImageSource> list = imageSourceDAO.getAllImageSourcesByChapterID_MangaID(chapterID, mangaID);
        
        mySession.setAttribute("chapterToEdit", chapter);
        mySession.setAttribute("mangaToChapterToEdit", manga);
        mySession.setAttribute("imageSourceListToEdit", list);
        
        response.sendRedirect("editChapter.jsp?mangaID=" + mangaID + "&chapterID=" + chapterID);
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

        
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String[] imageURLs = request.getParameterValues("imageURL");

////        out.println(mangaID);
//        out.println(title);
//        out.println(description);
//        out.println(imageURLs);
//        for(String s : imageURLs) {
//            out.println(s);
//        }
        // CHUA VALIDATE !!!!
        boolean hasError = true;

        if (title == null || title.isEmpty()) {
            request.setAttribute("titleError", "Title is required.");
            hasError = false;
        } else {
            request.setAttribute("titleValue", title);
        }

        if (description == null || description.isEmpty()) {
            request.setAttribute("descriptionError", "Description is required.");
            hasError = false;
        } else {
            request.setAttribute("descriptionValue", description);
        }

        if (imageURLs == null || imageURLs.length == 0) {
            request.setAttribute("imageURLsError", "You must upload more images for each chapter!.");
            hasError = false;
        } else {
            request.setAttribute("imageURLsValue", imageURLs);
        }

        if (hasError) {
            
            int mangaID = Integer.parseInt(request.getParameter("mangaID"));
            int chapterID = Integer.parseInt(request.getParameter("chapterID"));
            
            Chapter c = chapterDAO.getChapter(chapterID);
            Chapter chapter = new Chapter(chapterID, title, description, mangaID, c.getCreateAt());
//            out.println(chapter);
            chapterDAO.update(chapter);

//            // imageURL, chapterID, mangaID
//            for (String imageURL : imageURLs) {
//                ImageSource imageSource = new ImageSource(imageURL, chapterID, mangaID);
//                imageSourceDAO.create(imageSource);
//            }

            // no error message
            request.setAttribute("titleError", "");
            request.setAttribute("descriptionError", "");
            request.setAttribute("imageURLsError", "");

            // reset input value
            request.setAttribute("titleValue", null);
            request.setAttribute("descriptionValue", null);
            request.setAttribute("imageURLsValue", null);

            request.setAttribute("messageEditChapter", "Edit Chapter Successfully");

        }

        request.getRequestDispatcher("editChapter.jsp").forward(request, response);
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
