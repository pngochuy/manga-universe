<%@page import="dal.MangaDAO"%>
<%@page import="dal.ChapterDAO"%>
<%@page import="model.Manga"%>
<%@page import="model.Category"%>
<%@page import="dal.CategoryDAO"%>
<%@page import="model.User"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="org.jsoup.select.Elements"%>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.nodes.Element" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="${pageContext.request.contextPath}/assetsMain/img/logo.png" rel="icon">
        <link href="${pageContext.request.contextPath}/assetsMain/img/apple-touch-icon.png" rel="apple-touch-icon">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.5.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Google Fonts -->
        <link href="https://fonts.gstatic.com" rel="preconnect">
        <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
            rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="${pageContext.request.contextPath}/assetsMain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assetsMain/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assetsMain/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assetsMain/vendor/quill/quill.snow.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assetsMain/vendor/quill/quill.bubble.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assetsMain/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assetsMain/vendor/simple-datatables/style.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="${pageContext.request.contextPath}/assetsMain/css/style.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


        <style>
            .form-control-borderless {
                border: none;
            }

            .cateListStyle{
                padding-top: 20px;
                display: flex;
                justify-content: space-between;
            }
            .form-control-borderless:hover, .form-control-borderless:active, .form-control-borderless:focus {
                border: none;
                outline: none;
                box-shadow: none;
            }
            .custom-control-label-container {
                width: 100%;
                padding: 5px;
                border-radius: 10px;
                cursor: pointer;
            }
            .custom-control-label-container span {
                font-size: 18px;
            }
            .custom-control-label-container:hover {
                background-color: #aab7cf;
            }
            .custom-control-input{
                margin-right: 5px;
                display: none;
                cursor: pointer;
            }
            .spanCategory {
                position: relative;
                display: inline-block;
                background: #424242;
                padding: 10px 20px;
                color: #FFFFFF;
                text-shadow: 0 1px 4px rgba(0, 0, 0, .5);
                border-radius: 10px;
                cursor: pointer;
            }
            .spanCategory:hover {
                background-color: #aab7cf;
                color: #555;
                text-shadow: 0 1px 4px rgba(0, 0, 0, .5);
                cursor: pointer;
            }
            .spanCategory.clicked {
                background-color: #aab7cf;
                color: #424242;
                text-shadow: 0 1px 4px rgba(0, 0, 0, .5);
            }
            .custom-control-input:checked~span{
                background: #aab7cf;
            }

            .spanCategory {
                margin-right: 10px;
            }
            .categoryCheckBox{
                padding-bottom: 10px;
            }
            .searchbtn{
                position: relative;
                display: inline-block;
                background: #1da0f2;
                padding: 10px 20px;
                text-shadow: 0 1px 4px rgba(0, 0, 0, .5);
                border-radius: 10px;
                float: right;
            }
        </style>

    </head>

    <body>

        <%@include file="layouts/layoustOthers/headerOthers.jsp" %> 
        <%@include file="layouts/layoustOthers/sidebarOthers.jsp" %> 

        <%
            MangaDAO mangaDAO = new MangaDAO();

            ArrayList<Manga> mangaListAll = mangaDAO.getAll();
            session.setAttribute("mangaListAll", mangaListAll);


        %>

        <main id="main" class="main">
            <section class="section profile">
                <div class="row">
                    <!-- ======= Filter Area Start ======= -->
                    <section class="filter sec-mar">
                        <div class="container">
                            <div class="heading style-1">
                                <h2>Search Manga <span> <a class="active"><i class="bi bi-grid"></i></a> <a
                                            href="./list-view.jsp" class="ms-2 me-2"><i
                                                class="fa fa-solid fa-list"></i></a> Showing ${listMbyCate != null ? listMbyCate.size() : (listSM != null ? listSM.size() : '0')} out of ${mangaListAll.size()}
                                        Manga</span></h2>
                            </div>

                            <div class="container">
                                <div class="row justify-content-center">
                                    <div class="col-12 col-md-10 col-lg-8">
                                        <form class="card card-sm" action="SearchMangaSevlet?index=1" method="post">

                                            <div class="card-body row no-gutters align-items-center" style="padding: 20px;">
                                                <div class="col-auto">
                                                    <i class="bi bi-search-heart" style="font-size: 30px"></i>
                                                </div>
                                                <!--end of col-->
                                                <div class="col">
                                                    <input value="${save}" name="txtSearch" class="form-control form-control-lg form-control-borderless" type="search" placeholder="Search topics or keywords">
                                                </div>
                                                <!--end of col-->
                                                <div class="col-auto">
                                                    <button class="btn btn-primary" type="submit">Search</button>
                                                </div>
                                                <!--end of col-->
                                            </div>
                                        </form>
                                    </div>
                                    <!--end of col-->
                                </div>
                            </div>


                            <ul class="filter-block style-2">
                                <li>
                                    <a href="#" class="anime-btn btn-dark dropdown-toggle" id="genre"
                                       data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false" >
                                        Category <span><i class="fa fa-chevron-down"></i></span>
                                    </a>

                                    <div class="container cateListStyle">
                                        <form action="SearchController" method="post">
                                            <%                                                CategoryDAO categoryDAO = new CategoryDAO();
                                                for (Category cate : categoryDAO.getAllCategoryAscending()) {
                                            %>
                                            <label class="categoryCheckBox"><input class="custom-control-input" type='checkbox' name="fullControl" value='<%= cate.getType()%>'/><span class="spanCategory"><%= cate.getType()%></span></label>
                                                <%
                                                    }
                                                %>
                                            <input class="searchbtn" type="submit" value="Search" />
                                        </form>
                                    </div>
                                    <!--dùng JS de du doan mua trong nam theo thang-->

                                    <!-- ======= Filter Area End ======= -->

                                    <div class="mb-5">
                                        <div class="title">
                                            <h2 class="fw-bold mt-4 mb-5">Result Manga 1:</h2>
                                            <div class="row mt-2">

                                                <c:forEach var="manga" items="${listMbyCate}" varStatus="loop"> 

                                                    <div class="col-lg-2 col-md-4 col-sm-6">
                                                        <a href="/MangaUniverse/MangaDetailServlet?id=${manga.getMangaID()}">
                                                            <div class="product-card grow-box">
                                                                <div class="img-con set-bg"
                                                                     style="background-image: url('${manga.getCoverImage()}');"
                                                                     data-setbg="${manga.getCoverImage()}">
                                                                    <!--so chapter => UPDATE!!-->
                                                                    <c:set var="manga" value="${manga}" />
                                                                    <%
                                                                        Manga manga = (Manga) pageContext.getAttribute("manga");
                                                                        ChapterDAO chapterDAO = new ChapterDAO();
                                                                        request.setAttribute("chapters", chapterDAO.getAllChaptersByMangaID(manga.getMangaID()));

                                                                    %>
                                                                    <div class="ep">${chapters.size()} / ?</div>
                                                                    <!-- <div class="comment"><i class="bi bi-chat"></i> 21</div>
                                                                     <div class="view"><i class="bi bi-eye"></i> 7141</div> -->
                                                                </div>
                                                                <div class="product-card-con">
                                                                    <ul>
                                                                        <%                                                                            CategoryDAO categoryDAO2 = new CategoryDAO();
                                                                            request.setAttribute("cate", categoryDAO2.getCategoriesByMangaID(manga.getMangaID()));

                                                                        %>
                                                                        <c:forEach items="${cate}" var="category">
                                                                            <li>${category.getType()}</li>
                                                                            </c:forEach>

                                                                    </ul>
                                                                    <h5>${manga.getTitle()}</h5>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </div>
                                                </c:forEach> 

                                                <c:forEach var="manga" items="${listSM}" varStatus="loop"> 

                                                    <div class="col-lg-2 col-md-4 col-sm-6">
                                                        <a href="/MangaUniverse/MangaDetailServlet?id=${manga.getMangaID()}">
                                                            <div class="product-card grow-box">
                                                                <div class="img-con set-bg"
                                                                     style="background-image: url('${manga.getCoverImage()}');"
                                                                     data-setbg="${manga.getCoverImage()}">
                                                                    <!--so chapter => UPDATE!!-->
                                                                    <c:set var="manga" value="${manga}" />
                                                                    <%                                                                        Manga manga = (Manga) pageContext.getAttribute("manga");
                                                                        ChapterDAO chapterDAO = new ChapterDAO();
                                                                        request.setAttribute("chapters", chapterDAO.getAllChaptersByMangaID(manga.getMangaID()));

                                                                    %>
                                                                    <div class="ep">${chapters.size()} / ?</div>
                                                                    <!-- <div class="comment"><i class="bi bi-chat"></i> 21</div>
                                                                     <div class="view"><i class="bi bi-eye"></i> 7141</div> -->
                                                                </div>
                                                                <div class="product-card-con">
                                                                    <ul>
                                                                        <%                                                                            request.setAttribute("cate", categoryDAO.getCategoriesByMangaID(manga.getMangaID()));

                                                                        %>
                                                                        <c:forEach items="${cate}" var="category">
                                                                            <li>${category.getType()}</li>
                                                                            </c:forEach>

                                                                    </ul>
                                                                    <h5>${manga.getTitle()}</h5>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </div>
                                                </c:forEach> 

                                            </div>


                                        </div>
                                    </div>
                                    <div class="mb-5">
                                        <div class="title">
                                            <h2 class="fw-bold mt-4 mb-5">Result Manga 2:</h2>
                                            <div class="row mt-2">

                                                <%                                                    String url = "https://ww7.mangakakalot.tv/";
                                                    String numberParam = request.getParameter("number");
                                                    String selectedCategory = (String) request.getAttribute("selectedCategory");
                                                    String[] stringArray = (String[]) request.getAttribute("stringArray");
                                                    int numberManga = 0;
                                                    if (numberParam != null && !numberParam.isEmpty()) {
                                                        try {
                                                            numberManga = Integer.parseInt(numberParam);
                                                            if (numberManga <= 0) {
                                                                response.sendRedirect("error.jsp");
                                                            }
                                                        } catch (NumberFormatException e) {
                                                            response.sendRedirect("error.jsp");
                                                        }
                                                    }
                                                    Document doc = Jsoup.connect(url).get();
                                                    Elements itemUpdates = doc.select(".doreamon .itemupdate");
                                                    for (int i = 0; i < Math.min(12, itemUpdates.size()); i++) {
                                                        Element itemUpdate = itemUpdates.get(i);
                                                        String title = itemUpdate.select("h3 a").text();
                                                        String Url = itemUpdate.select("h3 a").attr("href");
                                                        String mangaUrl = "https://ww7.mangakakalot.tv" + Url;
                                                        String encodedMangaUrl = java.net.URLEncoder.encode(mangaUrl, "UTF-8");

                                                        // ko dung encodedMangaUrl!!
                                                        doc = Jsoup.connect(mangaUrl).get();
                                                        Element mangaInfoTop = doc.select("div.manga-info-top").first();
                                                        String cover = mangaInfoTop.select("div.manga-info-pic img").attr("src");
                                                        String urlCover = "https://ww7.mangakakalot.tv" + cover;
//                                            String title = mangaInfoTop.select("h1").first().text();
                                                        Element genresList = mangaInfoTop.select("li:contains(Genres)").first();
                                                        StringBuilder genres = new StringBuilder();

                                                        if (genres.length() > 2) {
                                                            genres.setLength(genres.length() - 2);
                                                        }
                                                        String author = mangaInfoTop.select("li:contains(Author(s)) a").text();
                                                        Element chapterList = doc.select("div.chapter-list").first();
                                                        List<Element> chapters = chapterList.select("div.row");
                                                        Element noidungmDiv = doc.select("div#noidungm").first();
                                                        String summary = noidungmDiv.text();

                                                        int chapterNumber = chapters.size(); // Số chương

                                                        String[] parts = urlCover.split("/");
                                                        String filename = parts[parts.length - 1];
                                                        String[] filenameParts = filename.split("\\.");
                                                        String mangaCrawlID = filenameParts[0];

                                                        for (Element genre : genresList.select("a")) {
                                                            String genreText = genre.text();
                                                            if (selectedCategory != null || !selectedCategory.isEmpty()) {
                                                                stringArray = null;
                                                                if (selectedCategory.equals(genreText)) {


                                                %>
                                                <div class="col-lg-2 col-md-4 col-sm-6">
                                                    <a href="mangaSinglePage.jsp?mangaCrawlID=<%= mangaCrawlID%>">
                                                        <div class="product-card grow-box">
                                                            <div class="img-con set-bg"
                                                                 style="background-image: url('<%= urlCover%>');"
                                                                 data-setbg="<%= urlCover%>">

                                                                <div class="ep"><%= chapterNumber%> / ?</div>
                                                                <!-- <div class="comment"><i class="bi bi-chat"></i> 21</div>
                                                                 <div class="view"><i class="bi bi-eye"></i> 7141</div> -->
                                                            </div>
                                                            <div class="product-card-con">
                                                                <ul>

                                                                    <%
                                                                        for (Element genre2 : genresList.select("a")) {
                                                                            String genreText2 = genre2.text();
                                                                            //                                                                genres.append(genreText).append(", ");
                                                                    %>
                                                                    <li><%= genreText2%></li>
                                                                        <%
                                                                            }
                                                                        %>
                                                                </ul>
                                                                <h5><%= title%></h5>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>

                                                <%
                                                                }
                                                            }

                                                        }
                                                    }
                                                %>

                                            </div>


                                        </div>
                                    </div>
                                    </div>

                                    <!--                                    <div class="pagination-wrape">
                                                                            <ul class="pagination">
                                    <c:if test ="${tag > 1}">
                                        <li class="page-item">
                                            <a href="SearchMangaSevlet?index=${tag-1}&txtSearch=${save}" class="page-link arrow" aria-label="Previous">
                                                <i class="bi bi-caret-left-fill"></i>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:forEach var="j" begin="1" step="1" end="${endS}">  
                                        <li class="page-item">
                                            <a href="SearchMangaSevlet?index=${j}&txtSearch=${save}" class="${tag == j?"active":""} page-link current">${j}</a>
                                        </li>
                                    </c:forEach>
                                    <c:if test ="${tag < endS}">
                                        <li class="page-item">
                                            <a href="SearchMangaSevlet?index=${tag+1}&txtSearch=${save}" class=" page-link arrow" aria-label="next">
                                                <i class="bi bi-caret-right-fill"></i>
                                            </a>
                                        </li>
                                    </c:if>
                                </ul>
                            </div>-->
                                    </div>
                                    </section>
                                    </main>




                                    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                                            class="bi bi-arrow-up-short"></i></a>

                                    <!-- Vendor JS Files -->
                                    <script src="${pageContext.request.contextPath}/assetsMain/vendor/apexcharts/apexcharts.min.js"></script>
                                    <script src="${pageContext.request.contextPath}/assetsMain/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                                    <script src="${pageContext.request.contextPath}/assetsMain/vendor/chart.js/chart.umd.js"></script>
                                    <script src="${pageContext.request.contextPath}/assetsMain/vendor/echarts/echarts.min.js"></script>
                                    <script src="${pageContext.request.contextPath}/assetsMain/vendor/quill/quill.min.js"></script>
                                    <script src="${pageContext.request.contextPath}/assetsMain/vendor/simple-datatables/simple-datatables.js"></script>
                                    <script src="${pageContext.request.contextPath}/assetsMain/vendor/tinymce/tinymce.min.js"></script>
                                    <script src="${pageContext.request.contextPath}/assetsMain/vendor/php-email-form/validate.js"></script>
                                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.5.0/dist/js/bootstrap.bundle.min.js"></script>

                                    <!-- Template Main JS File -->
                                    <script src="${pageContext.request.contextPath}/assetsMain/js/main.js"></script>
                                    </body>

                                    </html>