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
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Chapter;
import model.ImageSource;

/**
 *
 * @author PC
 */
public class ViewChapterDetail extends HttpServlet {

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
            out.println("<title>Servlet ViewChapterDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewChapterDetail at " + request.getContextPath() + "</h1>");
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

        String action = request.getParameter("action");
        int mangaID = Integer.parseInt(request.getParameter("mangaID"));

        Chapter chapter = new Chapter();
        ImageSource imageSource = new ImageSource();

        if (action.equals("read-first-chapter")) {
            chapter = chapterDAO.getFirstChapterByMangaID(mangaID);
            imageSource = imageSourceDAO.getFirstImageSourcesByChapterID_MangaID(mangaID, mangaID);
//            out.println("mangaID: " + mangaID);
        } else if (action.equals("read-last-chapter")) {
            chapter = chapterDAO.getLastChapterByMangaID(mangaID);
            imageSource = imageSourceDAO.getLastImageSourcesByChapterID_MangaID(mangaID, mangaID);
//            out.println("mangaID: " + mangaID);
        } else if (action.equals("read-chapter")) {
            // ...
            int chapterID = Integer.parseInt(request.getParameter("chapterID"));
            chapter = chapterDAO.getChapterByMangaID(chapterID);

        }

//        out.println("chapter: " + chapter);
        // get all
        ArrayList<ImageSource> imageSourcelist = imageSourceDAO.getAllImageSourcesByChapterID_MangaID(chapter.getChapterID(), mangaID);
        ArrayList<Chapter> chapterList = chapterDAO.getAllChaptersByMangaID(mangaID);
        
        /*
            - khi click vào sẽ bao gồm:
        + mảng Ảnh từng chapter của manga => imageSourcelist
        + mảng Chapter của manga          => chapterList
        + thông tin Manga                 => 
        + thông tin Chapter               => 
        + thông tin ImageSource           => imageSource
        
        */
        
        mySession.setAttribute("mangaToView", mangaDAO.getManga(mangaID));
        mySession.setAttribute("imageSourcelistToView", imageSourcelist);
        mySession.setAttribute("chapterListByMangaIDToView", chapterList);
        mySession.setAttribute("chapterToView", chapter);
//        mySession.setAttribute("imageSourceToView", imageSource);
        
        response.sendRedirect("chapter/chapter.jsp");
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
