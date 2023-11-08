/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user.manga;

import dal.MangaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Manga;

import org.jsoup.select.Elements;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.util.List;
import model.Category;
import model.MangaCrawl;

/**
 *
 * @author ADMIN
 */
public class OneGenreServlet extends HttpServlet {

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
            String selectedCategory = request.getParameter("selectedCategory"); // Lấy giá trị tham số
            String iCrawl = request.getParameter("isCrawl");
            if (selectedCategory != null && !selectedCategory.isEmpty()) {
                boolean isCrawl = Boolean.parseBoolean(iCrawl);
                MangaDAO dao = new MangaDAO();
                ArrayList<Manga> listMbyCate = dao.getMangasByOneCategory(selectedCategory);

                // Sử dụng listManga hoặc thực hiện xử lý khác ở đây
                // Forward hoặc gửi dữ liệu về trang JSP
                request.setAttribute("selectedCategory", selectedCategory);
                request.setAttribute("isCrawl", isCrawl);
                request.setAttribute("listMbyCate", listMbyCate);
                request.getRequestDispatcher("advancedSearchCrawl.jsp?isCrawl"+isCrawl).forward(request, response);
            }
        } catch (Exception ex) {
            Logger.getLogger(OneGenreServlet.class.getName()).log(Level.SEVERE, null, ex);
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
