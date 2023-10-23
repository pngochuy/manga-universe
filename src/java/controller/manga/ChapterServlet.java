/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manga;

import dal.ChapterDAO;
import dal.ImageSourceDAO;
import dal.MangaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Chapter;
import model.ImageSource;
import model.Manga;

/**
 *
 * @author OS
 */
public class ChapterServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChapterServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChapterServlet at " + request.getContextPath() + "</h1>");
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String chapterID = request.getParameter("cid");
        String mangaID = request.getParameter("mid");
        
        PrintWriter out = response.getWriter();
//        out.println(mangaID);
//        out.print(chapterID);
        
        ChapterDAO daoC = new ChapterDAO();
        List<Chapter> listC = daoC.getChapterByID(Integer.parseInt(mangaID));
        
        ImageSourceDAO dao = new ImageSourceDAO();
        List<ImageSource> listI = dao.getImgSourceByID(Integer.parseInt(chapterID), Integer.parseInt(mangaID));
        request.setAttribute("listC", listC);
        request.setAttribute("listI", listI);
        
//        for(ImageSource ima:listI ){
//            out.println(ima.getImageURL());
//        }
        request.getRequestDispatcher("chapter/chapter.jsp").forward(request, response);
//        response.sendRedirect("chapter/chapter.jsp");
        

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
