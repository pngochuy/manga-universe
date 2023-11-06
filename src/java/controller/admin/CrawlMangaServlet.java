    /*
     * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
     * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
     */
    package controller.admin;

    import java.io.IOException;
    import java.io.PrintWriter;
    import java.util.ArrayList;
    import javax.servlet.ServletException;
    import javax.servlet.http.HttpServlet;
    import javax.servlet.http.HttpServletRequest;
    import javax.servlet.http.HttpServletResponse;
    import javax.servlet.http.HttpSession;
    import model.MangaCrawl;

    import org.jsoup.select.Elements;
    import org.jsoup.Jsoup;
    import org.jsoup.nodes.Document;
    import org.jsoup.nodes.Element;

    import com.google.gson.Gson;
    import com.google.gson.JsonObject;
import model.Category;

    /**
     *
     * @author PC
     */
    public class CrawlMangaServlet extends HttpServlet {

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
                out.println("<title>Servlet CrawlMangaServlet</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Servlet CrawlMangaServlet at " + request.getContextPath() + "</h1>");
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

            PrintWriter out = response.getWriter();
            HttpSession mySession = request.getSession();
            String url = "https://ww7.mangakakalot.tv/";
            String numberParam = request.getParameter("number");

            int numberManga = 0;
            if (numberParam != null && !numberParam.isEmpty()) {
                numberManga = Integer.parseInt(numberParam);
                if (numberManga <= 0) {
                    request.setAttribute("errorNumber", "Please enter a positive number!");
                    request.getRequestDispatcher("crawlManga.jsp").forward(request, response);
    //                    response.sendRedirect("error.jsp");
                }

            } else {
                request.setAttribute("errorNumber", "Please enter a valid number!");
                request.getRequestDispatcher("crawlManga.jsp").forward(request, response);
            }

            Document doc = Jsoup.connect(url).get();
            Elements itemUpdates = doc.select(".doreamon .itemupdate");

            ArrayList<String> encodedMangaUrlList = new ArrayList<>();
            for (int i = 0; i < Math.min(numberManga, itemUpdates.size()); i++) {
                Element itemUpdate = itemUpdates.get(i);
                String title = itemUpdate.select("h3 a").text();
                String Url = itemUpdate.select("h3 a").attr("href");
                String mangaUrl = "https://ww7.mangakakalot.tv" + Url;
    //            String encodedMangaUrl = java.net.URLEncoder.encode(mangaUrl, "UTF-8");
                encodedMangaUrlList.add(mangaUrl);
            }

            ArrayList<MangaCrawl> mangaCrawlList = new ArrayList<>();
            ArrayList<Category> categoryCrawlList = new ArrayList<>();
            
            for (String mangaUrl : encodedMangaUrlList) {
                Document doc2 = Jsoup.connect(mangaUrl).get();
                Element mangaInfoTop = doc2.select("div.manga-info-top").first();
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
                Element noidungmDiv = doc2.select("div#noidungm").first();
                String description = noidungmDiv.text();

                if (genres.length() > 2) {
                    genres.setLength(genres.length() - 2);
                }
                String author = mangaInfoTop.select("li:contains(Author(s)) a").text();
                Element chapterList = doc2.select("div.chapter-list").first();
                ArrayList<Element> chapters = chapterList.select("div.row");

                int chapterNumber = chapters.size(); // Số chương
                
                
                String[] parts = urlCover.split("/");
                String filename = parts[parts.length - 1];
                String[] filenameParts = filename.split("\\.");
                String mangaCrawlID = filenameParts[0];
                MangaCrawl mangaCrawl = new MangaCrawl(mangaCrawlID, title, description,
                        author, false, true, urlCover);
                mangaCrawlList.add(mangaCrawl);
                
                

                // MangaCrawl: title - urlCover - author 
                // CategoryCrawl: genres (categoryList) 
                // ChapterCrawl: chapters (chapterList)
                // ImageSourceCrawl: chapterContent.select("img") ->bên file khác
            }

//            for(MangaCrawl m : mangaCrawlList) {
//                out.println(m);
//                for (Category c : categoryCrawlList) {
//                    out.println(c);
//                }
//            }
                
           
    
    
    
            // Chuyển danh sách manga thành JSON và gửi về trang JSP
            Gson gson = new Gson();

            // Chuyển danh sách thành một chuỗi JSON
            String mangaCrawlListJson = gson.toJson(mangaCrawlList);

            JsonObject jsonResponse = new JsonObject();
            jsonResponse.addProperty("mangaCrawlListJson", mangaCrawlListJson);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonResponse.toString());

    //        request.setAttribute("errorNumber", "Please enter a valid number!");
    //        request.getRequestDispatcher("crawlManga.jsp").forward(request, response);
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
