/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manga;

import dal.MangaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Manga;

/**
 *
 * @author OS
 */
public class SearchController extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String txtSearch = request.getParameter("txtSearch");
            String indexString = request.getParameter("index");
            String type = request.getParameter("type");
//            out.print(indexString);
            if (indexString == null) {
                indexString = "1";
            }
            int index = Integer.parseInt(indexString);

            MangaDAO dao = new MangaDAO();
            int countSearch = dao.getCountSearch(txtSearch);
//            out.print(countSearch);
            int pageSize = 6;
            int endPage = countSearch / pageSize;
            if (countSearch % pageSize != 0) {
                endPage++;

            }
            List<Manga> listMbyCate = dao.searchMangaByCategory(type);
            out.print(listMbyCate);

           List<Manga> listSearch = dao.searchMangaByTitle(txtSearch,index,pageSize);
//            if(listSearch.size() == 0){
//                out.println("ko có danh sách");
//            }else out.println("hank DP");
//            out.print(listSearch);
            request.setAttribute("endS", endPage);
            request.setAttribute("listSM", listSearch);
            request.setAttribute("listMbyCate", listMbyCate);
            request.setAttribute("save", txtSearch);
            request.setAttribute("tag", index);

            request.getRequestDispatcher("title/searchResult.jsp").forward(request, response);

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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(SearchController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(SearchController.class.getName()).log(Level.SEVERE, null, ex);
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
