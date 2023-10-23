/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user.manga;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author PC
 */
public class AddMangaServlet extends HttpServlet {

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
            out.println("<title>Servlet AddMangaServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddMangaServlet at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8"); // works fine
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession mySession = request.getSession();
        User userSession = (User) mySession.getAttribute("userSession");

        String title = request.getParameter("title");
        String author = userSession.getUsername();
        String coverUrl = request.getParameter("coverUrl");
        String category = request.getParameter("category");
        String summary = request.getParameter("summary");

        boolean hasError = true;

        if (title == null || title.isEmpty()) {
            request.setAttribute("titleError", "Title is required.");
            hasError = false;
        } else {
            request.setAttribute("titleValue", title);
        }

        if (coverUrl == null || coverUrl.isEmpty()) {
            request.setAttribute("coverUrlError", "Cover Image is required.");
            hasError = false;
        } else {
            request.setAttribute("coverUrlValue", coverUrl);
        }

//        request.setAttribute("authorValue", author);

        if (category == null || category.isEmpty()) {
            request.setAttribute("categoryError", "Category is required.");
            hasError = false;
        } else {
            request.setAttribute("categoryValue", category);
        }

        if (summary == null || summary.isEmpty()) {
            request.setAttribute("summaryError", "Summary is required.");
            hasError = false;
        } else {
            request.setAttribute("summaryValue", summary);
        }

        if (hasError) {
            request.setAttribute("messageAdd", "Add Manga Successfully");
        }
        request.getRequestDispatcher("addManga.jsp").forward(request, response);

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
