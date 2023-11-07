<%@page import="model.ChapterCrawl"%>
<%@page import="model.MangaCrawl"%>
<%@page import="java.util.List"%>
<%@page import="dal.ChapterDAO"%>
<%@page import="model.Chapter"%>
<%@page import="dal.UserDAO"%>
<%@page import="dal.CategoryDAO"%>
<%@page import="dal.MangaDAO"%>
<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Manga"%>
<%@page import="model.User"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="org.jsoup.select.Elements"%>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.nodes.Element" %>
<!DOCTYPE html>
<html lang="en">
    <script>
        document.getElementById("reportForm").addEventListener("submit", function (event) {
            event.preventDefault(); // Ngăn chặn biểu mẫu gửi yêu cầu theo cách thông thường

            var reportReason = document.getElementById("reportReason").value;
            var mangaID = document.getElementById("mangaID").value;

            // Sử dụng AJAX để gửi dữ liệu đến máy chủ
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "ManageReport?reportReason=" + reportReason + "&mangaID=" + mangaID, true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    // Xử lý phản hồi từ máy chủ
                    document.getElementById("result").innerHTML = xhr.responseText;
                }
            };
            xhr.send();
        });
    </script>
    <script>
        function openOverlay() {
            document.getElementById("reportOverlay").style.display = "block";
        }

        function closeOverlay() {
            document.getElementById("reportOverlay").style.display = "none";
        }

        function submitReport() {
            // Lấy lý do báo cáo được chọn
            var selectedReason = document.getElementById("reportReason").value;

            // Gửi lý do báo cáo đi hoặc thực hiện xử lý báo cáo tại đây
            // Để ví dụ, chúng ta chỉ đóng overlay ở đây
            closeOverlay();
        }
    </script>
    <style>
        /* CSS cho overlay */
        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
        }

        /* CSS cho nội dung trong overlay */
        .overlay-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        }

        /* CSS cho nút đóng overlay */
        .close-button {
            position: absolute;
            top: 10px;
            right: 10px;
            cursor: pointer;
        }
    </style>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="assetsMain/img/logo.png" rel="icon">
        <link href="assetsMain/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.gstatic.com" rel="preconnect">
        <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
            rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assetsMain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assetsMain/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assetsMain/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assetsMain/vendor/quill/quill.snow.css" rel="stylesheet">
        <link href="assetsMain/vendor/quill/quill.bubble.css" rel="stylesheet">
        <link href="assetsMain/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="assetsMain/vendor/simple-datatables/style.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="assetsMain/css/style.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>

    <body>

        <%@include file="layouts/layoustOthers/headerOthers.jsp" %> 
        <%@include file="layouts/layoustOthers/sidebarOthers.jsp" %>

        <%
            MangaDAO mangaDAO = new MangaDAO();
            CategoryDAO categoryDAO = new CategoryDAO();
            UserDAO userDAO = new UserDAO();
            ChapterDAO chapterDAO = new ChapterDAO();
            String id = request.getParameter("mangaId");

            if (id != null) {
                int mangaID = Integer.parseInt(request.getParameter("mangaId"));
                Manga m = mangaDAO.getManga(mangaID);
                ArrayList<Category> categoriesByMangaDetail = categoryDAO.getCategoriesByMangaID(mangaID);
                int userID = mangaDAO.getUserIDByMangaID(mangaID);
                String username = userDAO.getUserById(userID).getUsername();
                ArrayList<Chapter> chaptersByMangaDetail = chapterDAO.getAllChaptersByMangaID(mangaID);

                session.setAttribute("mangaDetail", m);
                session.setAttribute("usernameDetail", username);
                session.setAttribute("categoriesByMangaDetail", categoriesByMangaDetail);
                session.setAttribute("mangaListTop4", mangaDAO.getTop4MangaList());
                session.setAttribute("chaptersByMangaDetail", chaptersByMangaDetail);
                session.setAttribute("isCrawl", false);

            } else {
                String mangaCrawlID = request.getParameter("mangaCrawlID");
                String url = "https://ww7.mangakakalot.tv/manga/" + mangaCrawlID;

                ArrayList<Category> categoryCrawlList = new ArrayList<>();
                if (url != null && !url.isEmpty()) {
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

                    session.setAttribute("chapterIDFirstCrawl", chapterIDFirstCrawl);
                    session.setAttribute("chapterIDLastCrawl", chapterIDLastCrawl);

                    // MangaCrawl: title - urlCover - author 
                    // CategoryCrawl: genres (categoryList) 
                    // ChapterCrawl: chapters (chapterList)
                    // ImageSourceCrawl: chapterContent.select("img") ->bên file khác
//                    String[] parts = urlCover.split("/");
//                    String filename = parts[parts.length - 1];
//                    String[] filenameParts = filename.split("\\.");
//                    String mangaCrawlID = filenameParts[0];
                    ArrayList<ChapterCrawl> chaptersByMangaDetail = new ArrayList<>();
                    for (Element chap : chapters) {
                        String chapterTitle = chap.select("a").text();
                        String Url = chap.select("a").attr("href");

                        String[] parts2 = Url.split("/");
                        String chapterID = parts2[parts2.length - 1];

                        String createdAt = chap.select("span").last().text();

                        ChapterCrawl chapter = new ChapterCrawl(chapterID, chapterTitle, "", mangaCrawlID, createdAt);
                        chaptersByMangaDetail.add(chapter);
                        String chapterUrl = "https://ww7.mangakakalot.tv/" + Url;
//                        String encodedChapterUrl = java.net.URLEncoder.encode(chapterUrl, "UTF-8");

                    }

                    MangaCrawl mangaCrawl = new MangaCrawl(mangaCrawlID, title, description,
                            author, false, true, urlCover);
                    session.setAttribute("mangaDetail", mangaCrawl);
                    session.setAttribute("categoriesByMangaDetail", categoryCrawlList);
                    session.setAttribute("usernameDetail", author);
                    session.setAttribute("mangaListTop4", mangaDAO.getTop4MangaList());
                    session.setAttribute("chaptersByMangaDetail", chaptersByMangaDetail);
                    session.setAttribute("isCrawl", true);
                }
            }
        %>

        <main id="main" class="main">
            <section class="section profile">
                <div class="row">


                    <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                         breadcrumb page start
        >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
                    <section id="breadcrumb">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="home.jsp">Home</a></li>
                                            <li class="breadcrumb-item"><a href="home.jsp">All Manga</a></li>
                                            <li class="breadcrumb-item active">${mangaDetail.getTitle()}</li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </section>

                    <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                        breadcrumb part end
        >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
                    <section id="manga_single_page" class="pt-50 pb-20">
                        <div class="container-manga-single-page">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="manga_name text-start">
                                        <h2>${mangaDetail.getTitle()}</h2>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-3">
                                    <img class="w-100 img-fluid" src="${mangaDetail.getCoverImage()}" alt="">
                                </div>
                                <div class="col-lg-6">
                                    <div class="manga_info">
                                        <ul>
                                            <li class="d-flex flex-wrap">
                                                <h6>Rank </h6>
                                                <p>N/A, it has 333.4K views </p>
                                            </li>
                                            <li class="d-flex flex-wrap">
                                                <!--alternative keyword-->
                                                <h6>Alternative </h6> 
                                                <p>${mangaDetail.getTitle()}</p>
                                            </li>
                                            <li class="d-flex flex-wrap">
                                                <h6>Category(s) </h6>
                                                <p>
                                                    <c:forEach items="${categoriesByMangaDetail}" var="category" varStatus="loop">
                                                        <a href="OneGenreServlet?selectedCategory=${category.type}">${category.type}</a>
                                                        <c:if test="${!loop.last}">,</c:if>
                                                    </c:forEach>
                                                </p>
                                            </li>
                                            <li class="d-flex flex-wrap">
                                                <h6>Author(s) </h6>
                                                <p>${usernameDetail} </p>
                                            </li>

                                            <!--KO CHO GUEST SUBMIT-->
                                            <li class="d-flex flex-wrap watch">
                                                <c:if test="${isCrawl == true}">
                                                    <a class="mr-2" href="ViewChapterDetail?action=read-first-chapter&mangaCrawlID=${mangaDetail.getMangaID()}&chapterCrawlID=${chapterIDFirstCrawl}">Read First</a>
                                                    <a  class="mr-2" href="ViewChapterDetail?action=read-last-chapter&mangaCrawlID=${mangaDetail.getMangaID()}&chapterCrawlID=${chapterIDLastCrawl}">Read Last</a>

                                                </c:if>
                                                <c:if test="${isCrawl == false}">
                                                    <a class="mr-2" href="ViewChapterDetail?action=read-first-chapter&mangaID=${mangaDetail.getMangaID()}">Read First</a>
                                                    <a  class="mr-2" href="ViewChapterDetail?action=read-last-chapter&mangaID=${mangaDetail.getMangaID()}">Read Last</a>
                                                    <c:if test="${isCrawl == false}">
                                                    </c:if>
                                                    <c:if test="${sessionScope.userSession != null}">
                                                        <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#modalDialogScrollable">
                                                            Report
                                                        </button>
                                                    </c:if>
                                                </c:if>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="modal fade" id="modalDialogScrollable" tabindex="-1">
                                    <div class="modal-dialog modal-dialog-scrollable">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Report Content</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <form id="reportForm" action="ManageReport" method="GET">
                                                    <div class="mb-3">
                                                        <label for="reportReason" class="form-label">Report Reason:</label>
                                                        <textarea class="form-control" id="reportReason" name="reportReason" rows="4" placeholder="Enter your report reason" required></textarea>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="submit" class="btn btn-primary">Submit Report</button>
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                    </div>
                                                </form>
                                            </div>
                                            <div id="result"></div>
                                        </div>
                                    </div>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-8">
                                <div class="section-tittle mt-30 mb-30">
                                    <h3>Summary</h3>
                                </div>
                                <div class="manga_info">
                                    <c:set var="maxCharacters" value="200" />
                                    <c:set var="description" value="${mangaDetail.getDescription()}" />
                                    <c:choose>
                                        <c:when test="${fn:length(description) > maxCharacters}">
                                            <p id="text">${fn:substring(description, 0, maxCharacters)}...</p>
                                            <p id="fullText" style="display: none">${description}</p>
                                            <button onclick="toggleText()" id="read_more">Read more</button>
                                        </c:when>
                                        <c:otherwise>
                                            <p id="text">${description}</p>
                                        </c:otherwise>
                                    </c:choose>

                                    <script>
                                        var expanded = false;
                                        var text = document.getElementById("text");
                                        var fullText = document.getElementById("fullText");
                                        var readMoreButton = document.getElementById("read_more");

                                        function toggleText() {
                                            expanded = !expanded;

                                            if (expanded) {
                                                text.style.display = "none";
                                                fullText.style.display = "block";
                                                readMoreButton.innerHTML = "Read less";
                                            } else {
                                                text.style.display = "block";
                                                fullText.style.display = "none";
                                                readMoreButton.innerHTML = "Read more";
                                            }
                                        }
                                    </script>


                                </div>
                                <div class="manga_info">
                                    <div class="section-tittle mt-30 mb-30">
                                        <h3>LATEST CHAPTER RELEASES</h3>
                                    </div>
                                    <ul class="chapter mb-3">

                                        <c:if test="${sessionScope.userSession == null}">
                                            <c:if test="${isCrawl == false}">
                                                <c:forEach items="${chaptersByMangaDetail}" var="chapter" varStatus="loop">
                                                    <c:if test="${loop.index >= (chaptersByMangaDetail.size()-2)}">
                                                        <li>
                                                            <a href="ViewChapterDetail?action=read-chapter&mangaID=${mangaDetail.getMangaID()}&chapterID=${chapter.getChapterID()}"
                                                               class="d-flex flex-wrap justify-content-between">
                                                                <span>${chapter.getTitle()} - ${chapter.getDescription()}</span><span>${chapter.getCreateAtFormat()} </span>
                                                            </a>
                                                        </li>
                                                    </c:if>

                                                    <c:if test="${loop.index < (chaptersByMangaDetail.size()-2)}">
                                                        <li>
                                                            <a href="ViewChapterDetail?action=read-chapter&mangaID=${mangaDetail.getMangaID()}&chapterID=${chapter.getChapterID()}"
                                                               class="d-flex flex-wrap justify-content-between disabled-link">
                                                                <span>${chapter.getTitle()} - ${chapter.getDescription()} <i class="bi bi-lock-fill"></i></span><span>${chapter.getCreateAtFormat()} </span>
                                                            </a>
                                                        </li>
                                                    </c:if>

                                                </c:forEach>
                                            </c:if>

                                            <c:if test="${isCrawl == true}">
                                                <c:forEach items="${chaptersByMangaDetail}" var="chapter" varStatus="loop">
                                                    <c:if test="${loop.index >= (chaptersByMangaDetail.size()-2)}">
                                                        <li>
                                                            <a href="ViewChapterDetail?action=read-chapter&mangaCrawlID=${mangaDetail.getMangaID()}&chapterCrawlID=${chapter.getChapterID()}"
                                                               class="d-flex flex-wrap justify-content-between">
                                                                <span>${chapter.getTitle()} - ${chapter.getDescription()}</span><span>${chapter.getCreateAtFormat()} </span>
                                                            </a>
                                                        </li>
                                                    </c:if>

                                                    <c:if test="${loop.index < (chaptersByMangaDetail.size()-2)}">
                                                        <li>
                                                            <a href="ViewChapterDetail?action=read-chapter&mangaCrawlID=${mangaDetail.getMangaID()}&chapterCrawlID=${chapter.getChapterID()}"
                                                               class="d-flex flex-wrap justify-content-between disabled-link">
                                                                <span>${chapter.getTitle()} - ${chapter.getDescription()} <i class="bi bi-lock-fill"></i></span><span>${chapter.getCreateAtFormat()} </span>
                                                            </a>
                                                        </li>
                                                    </c:if>

                                                </c:forEach>
                                            </c:if>           
                                        </c:if>




                                        <!--<i class="bi bi-lock-fill"></i>-->
                                        <c:if test="${sessionScope.userSession != null}">
                                            <% User u4 = (User) session.getAttribute("userSession");%>
                                            <% if (u4.getRole().equalsIgnoreCase("Free")) {%>
                                            <c:if test="${isCrawl == false}">
                                                <c:forEach items="${chaptersByMangaDetail}" var="chapter" varStatus="loop">
                                                    <c:if test="${loop.index >= (chaptersByMangaDetail.size()-2)}">
                                                        <li>
                                                            <a href="ViewChapterDetail?action=read-chapter&mangaID=${mangaDetail.getMangaID()}&chapterID=${chapter.getChapterID()}"
                                                               class="d-flex flex-wrap justify-content-between">
                                                                <span>${chapter.getTitle()} - ${chapter.getDescription()}</span><span>${chapter.getCreateAtFormat()} </span>
                                                            </a>
                                                        </li>
                                                    </c:if>

                                                    <c:if test="${loop.index < (chaptersByMangaDetail.size()-2)}">
                                                        <li>
                                                            <a href="ViewChapterDetail?action=read-chapter&mangaID=${mangaDetail.getMangaID()}&chapterID=${chapter.getChapterID()}"
                                                               class="d-flex flex-wrap justify-content-between disabled-link">
                                                                <span>${chapter.getTitle()} - ${chapter.getDescription()} <i class="bi bi-lock-fill"></i></span><span>${chapter.getCreateAtFormat()} </span>
                                                            </a>
                                                        </li>
                                                    </c:if>

                                                </c:forEach>
                                            </c:if>

                                            <c:if test="${isCrawl == true}">
                                                <c:forEach items="${chaptersByMangaDetail}" var="chapter" varStatus="loop">
                                                    <c:if test="${loop.index >= (chaptersByMangaDetail.size()-2)}">
                                                        <li>
                                                            <a href="ViewChapterDetail?action=read-chapter&mangaCrawlID=${mangaDetail.getMangaID()}&chapterCrawlID=${chapter.getChapterID()}"
                                                               class="d-flex flex-wrap justify-content-between">
                                                                <span>${chapter.getTitle()} - ${chapter.getDescription()}</span><span>${chapter.getCreateAtFormat()} </span>
                                                            </a>
                                                        </li>
                                                    </c:if>

                                                    <c:if test="${loop.index < (chaptersByMangaDetail.size()-2)}">
                                                        <li>
                                                            <a href="ViewChapterDetail?action=read-chapter&mangaCrawlID=${mangaDetail.getMangaID()}&chapterCrawlID=${chapter.getChapterID()}"
                                                               class="d-flex flex-wrap justify-content-between disabled-link">
                                                                <span>${chapter.getTitle()} - ${chapter.getDescription()} <i class="bi bi-lock-fill"></i></span><span>${chapter.getCreateAtFormat()} </span>
                                                            </a>
                                                        </li>
                                                    </c:if>

                                                </c:forEach>
                                            </c:if>    

                                            <% } else if (u4.getRole().equalsIgnoreCase("Premium") || u4.getRole().equalsIgnoreCase("Author")) {%>
                                            <c:forEach items="${chaptersByMangaDetail}" var="chapter" varStatus="loop">
                                                <c:if test="${isCrawl == false}">
                                                    <li>
                                                        <a href="ViewChapterDetail?action=read-chapter&mangaID=${mangaDetail.getMangaID()}&chapterID=${chapter.getChapterID()}"
                                                           class="d-flex flex-wrap justify-content-between">
                                                            <span>${chapter.getTitle()} - ${chapter.getDescription()}</span><span>${chapter.getCreateAtFormat()} </span>
                                                        </a>
                                                    </li>
                                                </c:if>
                                                <c:if test="${isCrawl == true}">

                                                    <li>
                                                        <a href="ViewChapterDetail?action=read-chapter&mangaCrawlID=${mangaDetail.getMangaID()}&chapterCrawlID=${chapter.getChapterID()}"
                                                           class="d-flex flex-wrap justify-content-between">
                                                            <span>${chapter.getTitle()} - ${chapter.getDescription()}</span><span>${chapter.getCreateAtFormat()} </span>
                                                        </a>
                                                    </li>
                                                </c:if>


                                            </c:forEach>
                                            <% }%>
                                        </c:if>


                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="section-tittle mb-30 mt-30">
                                    <h3>Related Manga</h3>
                                </div>
                                <c:forEach items="${mangaListTop4}" var="manga" varStatus="loop">
                                    <a href="MangaDetailServlet?id=${manga.getMangaID()}">
                                        <div class="trand-right-single d-flex">
                                            <div class="trand-right-img">
                                                <img class="play" src="${manga.getCoverImage()}"
                                                     alt="" style="width: 120px; height: 120px">
                                                <div class="overlay_play2">
                                                    <i class="fa-solid fa-heart"> 61M</i>
                                                </div>
                                            </div>
                                            <div class="trand-right-cap">
                                                <h4>${manga.getTitle()} </h4>

                                                <div class="tag2 d-flex flex-wrap">
                                                    <h6>Category(s):</h6>
                                                    <ul class="d-flex flex-wrap">
                                                        <c:set var="manga" value="${manga}" />
                                                        <%
                                                            Manga manga = (Manga) pageContext.getAttribute("manga");
                                                            request.setAttribute("cate", categoryDAO.getCategoriesByMangaID(manga.getMangaID()));

                                                        %>
                                                        <c:forEach items="${cate}" var="category" varStatus="loop">
                                                            <li>${category.getType()}</li>
                                                            <c:if test="${!loop.last}">,</c:if>
                                                        </c:forEach>

                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </c:forEach>


                            </div>
                        </div>
                </div>
            </section>

        </div>
    </section>
</main>


<c:if test="${userSession == null || userSession.getRole().equals('Free')}">
    <%@include file="layouts/layoustOthers/adsOthers.jsp" %>
</c:if>

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>

<!-- Vendor JS Files -->
<script src="assetsMain/vendor/apexcharts/apexcharts.min.js"></script>
<script src="assetsMain/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assetsMain/vendor/chart.js/chart.umd.js"></script>
<script src="assetsMain/vendor/echarts/echarts.min.js"></script>
<script src="assetsMain/vendor/quill/quill.min.js"></script>
<script src="assetsMain/vendor/simple-datatables/simple-datatables.js"></script>
<script src="assetsMain/vendor/tinymce/tinymce.min.js"></script>
<script src="assetsMain/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="assetsMain/js/main.js"></script>
</body>

</html>