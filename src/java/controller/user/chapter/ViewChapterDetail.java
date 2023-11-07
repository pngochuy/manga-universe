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

import org.jsoup.select.Elements;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.ChapterCrawl;
import model.ImageSourceCrawl;

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
        boolean isCrawl = false;
        String mangaCrawlID = request.getParameter("mangaCrawlID");
        String chapterCrawlID = request.getParameter("chapterCrawlID");

        String mID = request.getParameter("mangaID");
        int mangaID = -1;
        if (mID != null) {
            mangaID = Integer.parseInt(mID);
        }

        if (mangaCrawlID != null && chapterCrawlID != null) {
            isCrawl = true;
        }

        ArrayList<ImageSourceCrawl> imageSourceCrawllist = new ArrayList<>();
        ArrayList<ChapterCrawl> chapterCrawlList = new ArrayList<>();
        ChapterCrawl chapterCrawl = new ChapterCrawl();

        Chapter chapter = new Chapter();
        ImageSource imageSource = new ImageSource();

        if (action.equals("read-first-chapter")) {
            if (isCrawl == false) {
                chapter = chapterDAO.getFirstChapterByMangaID(mangaID);
                imageSource = imageSourceDAO.getFirstImageSourcesByChapterID_MangaID(mangaID, mangaID);
            } else {
                chapterCrawl = getChapterCrawl(mangaCrawlID, chapterCrawlID);
                imageSourceCrawllist = getImageSourceCrawl(mangaCrawlID, chapterCrawlID);
            }

        } else if (action.equals("read-last-chapter")) {
            if (isCrawl == false) {

                chapter = chapterDAO.getLastChapterByMangaID(mangaID);
                imageSource = imageSourceDAO.getLastImageSourcesByChapterID_MangaID(mangaID, mangaID);
            } else {
                chapterCrawl = getChapterCrawl(mangaCrawlID, chapterCrawlID);
                imageSourceCrawllist = getImageSourceCrawl(mangaCrawlID, chapterCrawlID);
            }
        } else if (action.equals("read-chapter")) {
            if (isCrawl == false) {

                int chapterID = Integer.parseInt(request.getParameter("chapterID"));
                chapter = chapterDAO.getChapter(chapterID);
            } else {
                chapterCrawl = getChapterCrawl(mangaCrawlID, chapterCrawlID);
                imageSourceCrawllist = getImageSourceCrawl(mangaCrawlID, chapterCrawlID);
            }

        }

        ArrayList<ImageSource> imageSourcelist = new ArrayList<>();
        ArrayList<Chapter> chapterList = new ArrayList<>();

        if (isCrawl == false) {

            // get all
            imageSourcelist = imageSourceDAO.getAllImageSourcesByChapterID_MangaID(chapter.getChapterID(), mangaID);
            chapterList = chapterDAO.getAllChaptersByMangaID(mangaID);
        } else {
            // get all
//            imageSourceCrawllist = imageSourceCrawllist;
            chapterCrawlList = (ArrayList<ChapterCrawl>) mySession.getAttribute("chaptersByMangaDetail");
        }

        /*
            - khi click vào sẽ bao gồm:
        + mảng Ảnh từng chapter của manga => imageSourcelist
        + mảng Chapter của manga          => chapterList
        + thông tin Manga                 => 
        + thông tin Chapter               => 
        + thông tin ImageSource           => imageSource
        
         */
//        if (chapterList == null || chapterList.isEmpty()) {
//            if (checkMangaID) {
//                response.sendRedirect("mangaSinglePage.jsp?mangaId=" + mangaID);
//                return;
//            } else {
//                response.sendRedirect("mangaSinglePage.jsp?mangaCrawlID=" + mangaID);
//                return;
//            }
//        }
        if (isCrawl == false) {
//        mySession.setAttribute("mangaToView", mangaDAO.getManga(mangaID));
            mySession.setAttribute("imageSourcelistToView", imageSourcelist);
            mySession.setAttribute("chapterListByMangaIDToView", chapterList);
            mySession.setAttribute("chapterToView", chapter);
            mySession.setAttribute("isCrawl", false);
//        mySession.setAttribute("imageSourceToView", imageSource);
            response.sendRedirect("chapter/chapter.jsp?mangaID=" + mangaID + "&chapterID=" + chapter.getChapterID());
            return;
        } else {
//        mySession.setAttribute("mangaToView", mangaDAO.getManga(mangaID));
            mySession.setAttribute("imageSourcelistToView", imageSourceCrawllist);
            mySession.setAttribute("chapterListByMangaIDToView", chapterCrawlList);
            mySession.setAttribute("chapterToView", chapterCrawl);
            mySession.setAttribute("isCrawl", true);
//            out.println(chapterCrawl);
//        mySession.setAttribute("imageSourceToView", imageSource);
            response.sendRedirect("chapter/chapter.jsp?mangaID=" + mangaCrawlID + "&chapterID=" + chapterCrawlID);
            return;
        }

    }

    public ArrayList<ImageSourceCrawl> getImageSourceCrawl(String mangaCrawlID, String chapterCrawlID) {
        ArrayList<ImageSourceCrawl> list = new ArrayList<>();
        try {

            String chapterUrl = "https://ww7.mangakakalot.tv/chapter/" + mangaCrawlID + "/" + chapterCrawlID;
            Document chapterDoc = Jsoup.connect(chapterUrl).get();

            // Trích xuất và hiển thị danh sách hình ảnh
            Element chapterContent = chapterDoc.select("div#vungdoc").first();
            if (chapterContent != null) {
                int pageNumber = 1;
                for (Element image : chapterContent.select("img")) {
                    String imageUrl = image.attr("data-src");
                    if (imageUrl.isEmpty()) {
                        imageUrl = image.attr("src");

                    }
                    ImageSourceCrawl imageSourceCrawl = new ImageSourceCrawl("", imageUrl, chapterCrawlID, mangaCrawlID);
                    list.add(imageSourceCrawl);
                }
            }
        } catch (IOException ex) {
            Logger.getLogger(ViewChapterDetail.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public ChapterCrawl getChapterCrawl(String mangaCrawlID, String chapterCrawlID) {

        ChapterCrawl chapterCrawl = new ChapterCrawl();
        String url = "https://ww7.mangakakalot.tv/manga/" + mangaCrawlID;

        ArrayList<Category> categoryCrawlList = new ArrayList<>();
        if (url != null && !url.isEmpty()) {
            try {
                Document doc = Jsoup.connect(url).get();
                Element mangaInfoTop = doc.select("div.manga-info-top").first();
                String cover = mangaInfoTop.select("div.manga-info-pic img").attr("src");
                String urlCover = "https://ww7.mangakakalot.tv" + cover;
                String title = mangaInfoTop.select("h1").first().text();
                Element genresList = mangaInfoTop.select("li:contains(Genres)").first();
                StringBuilder genres = new StringBuilder();
                for (Element genre : genresList.select("a")) {
                    String genreText = genre.text();
                    Category category = new Category(genreText, "category_crawl");
                    categoryCrawlList.add(category);
//                    genres.append(genreText).append(", ");
                }

                if (genres.length() > 2) {
                    genres.setLength(genres.length() - 2);
                }
                String author = mangaInfoTop.select("li:contains(Author(s)) a").text();
                Element chapterList = doc.select("div.chapter-list").first();
                List<Element> chapters = chapterList.select("div.row");
                Element noidungmDiv = doc.select("div#noidungm").first();
                String description = noidungmDiv.text();

                int chapterNumber = chapters.size(); // Số chương
                String chapterUrlFirst = chapterList.select("div.row").last().select("a").attr("href");
                String chapterUrlLast = chapterList.select("div.row").first().select("a").attr("href");

                String[] partsFirst = chapterUrlFirst.split("/");
                String chapterIDFirstCrawl = partsFirst[partsFirst.length - 1];
                String[] partsLast = chapterUrlLast.split("/");
                String chapterIDLastCrawl = partsLast[partsLast.length - 1];

                for (Element chap : chapters) {
                    String chapterTitle = chap.select("a").text();
                    String Url = chap.select("a").attr("href");

                    String[] parts2 = Url.split("/");
                    String chapterID = parts2[parts2.length - 1];

                    String createdAt = chap.select("span").last().text();

                    if (chapterID.equals(chapterCrawlID)) {
                        ChapterCrawl chapter = new ChapterCrawl(chapterID, chapterTitle, "", mangaCrawlID, createdAt);
                        chapterCrawl = chapter;
                        
                    }

                }

            } catch (IOException ex) {
                Logger.getLogger(ViewChapterDetail.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return chapterCrawl;
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
