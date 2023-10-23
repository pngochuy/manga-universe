<%@page import="model.Chapter"%>
<%@page import="dal.ChapterDAO"%>
<%@page import="model.Manga"%>
<%@page import="dal.MangaDAO"%>
<%@page import="java.util.Date"%>
<%@page import="model.User"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <!-- Favicons -->
        <link href="${pageContext.request.contextPath}/assetsMain/img/logo.png" rel="icon">
        <link href="${pageContext.request.contextPath}/assetsMain/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="${pageContext.request.contextPath}/https://fonts.gstatic.com" rel="preconnect">
        <link
            href="${pageContext.request.contextPath}https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
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
        <script src="${pageContext.request.contextPath}https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>

    <body>
        <!-- ======= Header ======= -->
        <header id="header" class="header fixed-top d-flex align-items-center" style="background-color: #191a1c;">

            <div class="d-flex align-items-center justify-content-between">
                <a href="../home.jsp" class="logo d-flex align-items-center">
                    <img src="${pageContext.request.contextPath}/assetsMain/img/logo.png" alt="" width="100">
                    <span class="d-none d-lg-block" style="color: white">MangaUniverse</span>
                </a>
                <i class="bi bi-list toggle-sidebar-btn" style="color: white"></i>
            </div><!-- End Logo -->

            <div class="search-bar">
                <form class="search-form d-flex align-items-center" method="POST" action="#">
                    <input type="text" name="query" placeholder="Search" title="Enter search keyword">
                    <button type="submit" title="Search"><i class="bi bi-search"></i></button>
                </form>
            </div><!-- End Search Bar -->

            <nav class="header-nav ms-auto">
                <ul class="d-flex align-items-center">

                    <li class="nav-item d-block d-lg-none">
                        <a class="nav-link nav-icon search-bar-toggle " href="#">
                            <i class="bi bi-search" style="color: white"></i>
                        </a>
                    </li><!-- End Search Icon-->

                    <li class="nav-item dropdown">

                        <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
                            <i class="bi bi-bell" style="color: white"></i>
                            <span class="badge bg-primary badge-number">4</span>
                        </a><!-- End Notification Icon -->

                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
                            <li class="dropdown-header">
                                You have 4 new notifications
                                <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li class="notification-item">
                                <i class="bi bi-exclamation-circle text-warning"></i>
                                <div>
                                    <h4>Lorem Ipsum</h4>
                                    <p>Quae dolorem earum veritatis oditseno</p>
                                    <p>30 min. ago</p>
                                </div>
                            </li>

                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li class="notification-item">
                                <i class="bi bi-x-circle text-danger"></i>
                                <div>
                                    <h4>Atque rerum nesciunt</h4>
                                    <p>Quae dolorem earum veritatis oditseno</p>
                                    <p>1 hr. ago</p>
                                </div>
                            </li>

                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li class="notification-item">
                                <i class="bi bi-check-circle text-success"></i>
                                <div>
                                    <h4>Sit rerum fuga</h4>
                                    <p>Quae dolorem earum veritatis oditseno</p>
                                    <p>2 hrs. ago</p>
                                </div>
                            </li>

                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li class="notification-item">
                                <i class="bi bi-info-circle text-primary"></i>
                                <div>
                                    <h4>Dicta reprehenderit</h4>
                                    <p>Quae dolorem earum veritatis oditseno</p>
                                    <p>4 hrs. ago</p>
                                </div>
                            </li>

                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li class="dropdown-footer">
                                <a href="#">Show all notifications</a>
                            </li>

                        </ul><!-- End Notification Dropdown Items -->

                    </li><!-- End Notification Nav -->



                    <li class="nav-item dropdown pe-3">

                        <c:if test="${userSession != null}">
                            <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                                <% User u2 = (User) session.getAttribute("userSession");%>
                                <% if (!u2.getAvatarUrl().isEmpty()) {%>
                                <img  src="<%= u2.getAvatarUrl()%>"
                                      alt="Profile" class="img-fluid rounded-circle">
                                <% } else {%>
                                <i class="bi bi-person-circle" style="font-size: 30px; color: white"></i>
                                <% }%>

                                <span class="d-none d-md-block dropdown-toggle ps-2">${sessionScope.userSession.getUsername()}</span>
                            </a><!-- End Profile Iamge Icon -->
                            <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                                <li class="dropdown-header">

                                    <c:if test="${sessionScope.userSession != null}">
                                        <% User u = (User) session.getAttribute("userSession");%>
                                        <h6>${sessionScope.userSession.getUsername()}</h6>
                                        <% if (u.getRole().equalsIgnoreCase("Free")) {%>
                                        <span style="color: black;">${sessionScope.userSession.getRole()}</span>
                                        <% } else if (u.getRole().equalsIgnoreCase("Premium")) {%>
                                        <span style="color: black;">${sessionScope.userSession.getRole()} <i class="bi bi-star-fill" style="color: gold;"></i></span>
                                            <% } else if (u.getRole().equalsIgnoreCase("Author")) {%>   
                                        <span style="color: black;">${sessionScope.userSession.getRole()} <i class="bi bi-star-fill" style="color: greenyellow;"></i></span>
                                            <% }%>
                                        </c:if>
                                        <c:if test="${sessionScope.userSession == null}">
                                        <h6>${sessionScope.userRegister.getUsername()}</h6>
                                        <span style="color: black;">Free Account</span>
                                    </c:if>
                                </li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>

                                <li>
                                    <a class="dropdown-item d-flex align-items-center" href="../userProfile.jsp">
                                        <i class="bi bi-person"></i>
                                        <span style="color: black;">My Profile</span>
                                    </a>
                                </li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>

                                <c:if test="${sessionScope.userSession != null}">
                                    <%User u3 = (User) session.getAttribute("userSession");%>
                                    <% if (u3.getRole().equalsIgnoreCase("Free")) {%>
                                    <li>
                                        <a class="dropdown-item d-flex align-items-center" href="../upgradePremium.jsp">
                                            <i class="bi bi-stars"></i>
                                            <span style="color: black;">Upgrade Premium</span>
                                        </a>
                                    </li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <% }%>
                                </c:if>

                                <li>
                                    <a class="dropdown-item d-flex align-items-center" href="../userProfile.jsp">
                                        <i class="bi bi-gear"></i>
                                        <span style="color: black;">Account Settings</span>
                                    </a>
                                </li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>

                                <li>
                                    <a class="dropdown-item d-flex align-items-center" href="../needHelp.jsp">
                                        <i class="bi bi-question-circle"></i>
                                        <span style="color: black;">Need Help?</span>
                                    </a>
                                </li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>

                                <li>
                                    <a class="dropdown-item d-flex align-items-center" href="LogoutServlet">
                                        <i class="bi bi-box-arrow-right"></i>
                                        <span style="color: black;">Sign Out</span>
                                    </a>
                                </li>

                            </ul><!-- End Profile Dropdown Items -->
                        </c:if>
                        <c:if test="${userSession == null}">
                            <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                                <i class="bi bi-person-circle" style="font-size: 30px; color: white"></i>
                            </a><!-- End Profile Iamge Icon -->

                            <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                                <li class="dropdown-header">
                                    <h6>Guest</h6>
                                </li>

                                <li>
                                    <hr class="dropdown-divider">
                                </li>

                                <li>
                                    <a class="dropdown-item d-flex align-items-center" href="../needHelp.jsp">
                                        <i class="bi bi-question-circle"></i>
                                        <span style="color: black;">Need Help?</span>
                                    </a>
                                </li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>

                                <li>
                                    <a class="dropdown-item d-flex align-items-center" href="login.jsp">
                                        <i class="bi bi-box-arrow-left"></i>
                                        <span style="color: black; font-weight: bold">Sign In</span>
                                    </a>
                                </li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>   

                            </ul><!-- End Profile Dropdown Items -->
                        </c:if>
                    </li><!-- End Profile Nav -->

                </ul>
            </nav><!-- End Icons Navigation -->

        </header><!-- End Header -->

        <!-- ======= Sidebar ======= -->
        <aside id="sidebar" class="sidebar" style="background-color: #2c2c2c;">
            <ul class="sidebar-nav" id="sidebar-nav">

                <li class="nav-item">
                    <a class="nav-link collapsed" href="../home.jsp">
                        <i class="bi bi-grid"></i>
                        <span>Homepage</span>
                    </a>
                </li><!-- End Dashboard Nav -->

                <li class="nav-item">
                    <a class="nav-link collapsed" href="#">
                        <i class="bi bi-bookmark"></i><span>Follows</span><i class="bi bi-chevron-down ms-auto"></i>
                    </a>
                    <ul class="nav-content">
                        <li>
                            <a href="../follows/updates.jsp">
                                <i class="bi bi-circle"></i><span>Updates</span>
                            </a>
                        </li>
                        <li>
                            <a href="../follows/readingHistory.jsp">
                                <i class="bi bi-circle"></i><span>Reading History</span>
                            </a>
                        </li>
                    </ul>
                </li><!-- End Components Nav -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#">
                        <i class="bi bi-book"></i><span>Title</span><i class="bi bi-chevron-down ms-auto"></i>
                    </a>
                    <ul class="nav-content">
                        <li>
                            <a href="../title/advancedSearch.jsp">
                                <i class="bi bi-circle"></i><span>Advanced Search</span>
                            </a>
                        </li>
                        <li>
                            <a href="../title/recentlyAdded.jsp">
                                <i class="bi bi-circle"></i><span>Recently Added</span>
                            </a>
                        </li>
                        <li>
                            <a href="../title/latestUpdates.jsp">
                                <i class="bi bi-circle"></i><span>Latest Updates</span>
                            </a>
                        </li>
                        <li>
                            <a href="../title/random.jsp">
                                <i class="bi bi-circle"></i><span>Random</span>
                            </a>
                        </li>
                    </ul>
                </li><!-- End Components Nav -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="../forum/forum.jsp">
                        <i class="bi bi-people"></i><span>Forums</span>
                    </a>
                </li><!-- End Components Nav -->

                <li class="nav-item">
                    <a class="nav-link collapsed" href="#">
                        <i class="bi bi-pin-angle"></i><span>MangaUniverse</span><i class="bi bi-chevron-down ms-auto"></i>
                    </a>
                    <ul class="nav-content">
                        <li>
                            <a href="../about/aboutUs.jsp">
                                <i class="bi bi-circle"></i><span>About Us</span>
                            </a>
                        </li>
                        <li>
                            <a href="../about/siteRules.jsp">
                                <i class="bi bi-circle"></i><span>Site Rules</span>
                            </a>
                        </li>
                        <li>
                            <a href="../about/privacyPolicy.jsp">
                                <i class="bi bi-circle"></i><span>Privacy Policy</span>
                            </a>
                        </li>
                        <li>
                            <a href="../about/announcement.jsp">
                                <i class="bi bi-circle"></i><span>Announcements</span>
                            </a>
                        </li>
                    </ul>
                </li><!-- End Components Nav -->
                <hr>
                <li class="nav-item align-center d-flex justify-content-evenly ">

                    <a class=" collapsed" href="#">
                        <i class="bi bi-discord fs-4"></i>
                    </a>
                    <a class="collapsed" href="#">
                        <i class="bi bi-twitch fs-4"></i>
                    </a>
                    <a class="collapsed" href="#">
                        <i class="bi bi-reddit fs-4"></i>
                    </a>
                    <a class="collapsed" href="#">
                        <i class="bi bi-facebook fs-4"></i>
                    </a>

                </li><!-- End Components Nav -->
                <p style="color: white;">v2023.9.20<br />
                    © MangaUniverse 2023</p>


        </aside><!-- End Sidebar-->

        <main id="main" class="main">
            <section class="section profile">
                <div class="row">
                    <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                        Chapter start
        >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
                     <%
                        int imgid = Integer.parseInt(request.getParameter("cid"));
                        int mid = Integer.parseInt(request.getParameter("mid"));
                        String titleC = "";
                        int chapterId = 0;
                        String descriptionC = "";
                        
                        ChapterDAO manageChapter = new ChapterDAO();
                        for (Chapter chapter : manageChapter.getAllChapter()) {
                            if (imgid == chapter.getImageID() && mid == chapter.getMangaID()) {
                                chapterId = chapter.getChapterID();
                                titleC = chapter.getTitle();
                                descriptionC = chapter.getDescription();
                            }
                        }
                    %>
                    <%
                        int id = mid;
                        String title = "";
                        String description = "";
                        Integer userID = 0;
                        Date createdAt = null;
                        Boolean isCopyright = null;
                        Boolean isFree = null;
                        String coverImage = "";
                        MangaDAO manageManga = new MangaDAO();
                        for (Manga manga : manageManga.getAllMangas()) {
                            if (id == manga.getMangaID()) {
                                coverImage = manga.getCoverImage();
                                title = manga.getTitle();
                                description = manga.getDescription();
                                userID = manga.getUserID();
                                createdAt = manga.getCreateAt();
                                isCopyright = manga.isIsCopyRight();
                                isFree = manga.isIsFree();
                            }
                        }
                    %>
                    
                   
                    <section id="breadcrumb">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                         breadcrumb page start
        >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="../home.jsp">Home</a></li>
                                            <li class="breadcrumb-item"><a href="../follows/readingHistory.jsp">All Mangas</a></li>
                                            <li class="breadcrumb-item"><a href="mangaSPServlet?id=<%= id%>">
                                                    <%= title%>
                                                  </a></li>
                                            <li class="breadcrumb-item active" aria-current="page">
                                                <%= title%> - Chapter <%= imgid%>
                                            </li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </section>

                    <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                        breadcrumb part end
        >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
                    
                    
                    <section id="chapter" class="pt-50 pb-20">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="manga_name text-start">
                                        <h2><%= title%></h2>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="feedback_box d-flex flex-wrap justify-content-end">
                                        <a class="Bookmark" data-toggle="tooltip" data-placement="top" title="Bookmark"
                                           href="#">
                                            <i class="fa-solid fa-bookmark"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6 mb-30 mt-30">
                                    <select class="form-select form-select-sm" aria-label=".form-select-sm example"
                                            onchange="javascript:handleSelect(this)">
                                       
                                        <option selected="" disabled="">Chapter <%= imgid%> - <%= titleC%> </option>
                                      <c:forEach var="c" items="${listC}" varStatus="loop"> 
                                        <option value="../chapter/chapter.jsp?cid=${c.chapterID}">Chapter ${loop.index + 1} - ${c.title} </option>
                                      </c:forEach>

                                    </select>
                                    <script>
                                        function handleSelect(elm) {
                                            window.location = elm.value + ".jsp";
                                        }
                                    </script>
                                </div>
                                <div class="col-lg-6 mb-30 mt-30">
                                    <div class="manga_info">
                                        <ul>
                                            <li class="d-flex flex-wrap watch justify-content-end">
                                                <a class="mr-2" href="ChapterServlet?cid=<%= imgid-1%>&mid=<%= mid%>">
                                                    <i class="fa-solid fa-arrow-left"></i>
                                                    Prev</a>
                                                <a href="ChapterServlet?cid=<%= imgid+1%>&mid=<%= mid%>">Next <i
                                                        class="fa-solid fa-arrow-right"></i></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                               <c:forEach var="im" items="${listI}" varStatus="loop"> 
                                <div class="col-12"><img class="w-100 img-fluid align-items-center"
                                                         src="${im.getImageURL()}" alt=""></div>
                               </c:forEach>
                                
                            </div>


                            <div class="row">
                                <div class="col-lg-6 mb-30 mt-30">
                                    <select class="form-select form-select-sm" aria-label=".form-select-sm example"
                                            onchange="javascript:handleSelect(this)">
                                          <option selected="" disabled="">Chapter <%= imgid%> - <%= titleC%> </option>
                                      <c:forEach var="c" items="${listC}" varStatus="loop"> 
                                        <option value="../chapter/chapter.jsp?cid=${c.chapterID}">Chapter ${loop.index + 1} - ${c.title} </option>
                                      </c:forEach>

                                    </select>
                                    <script>
                                        function handleSelect(elm) {
                                            window.location = elm.value + ".jsp";
                                        }
                                    </script>
                                </div>
                                <div class="col-lg-6 mb-30 mt-30">
                                    <div class="manga_info">
                                        <ul>
                                            <li class="d-flex flex-wrap watch justify-content-end">
                                                <a class="mr-2" href="ChapterServlet?cid=<%= imgid-1%>&mid=<%= mid%>">
                                                    <i class="fa-solid fa-arrow-left"></i>
                                                    Prev</a>
                                                <a href="ChapterServlet?cid=<%= imgid+1%>&mid=<%= mid%>">Next <i
                                                        class="fa-solid fa-arrow-right"></i></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                        Chapter end
        >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->

                    <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                        commentbox start
        >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
                    <section id="commentbox">
                        <div class="container">

                            <div class="row">
                                <div class="col-12 col-lg-8">
                                    <!-- Comments Area -->
                                    <div class="comment_area mb-50 clearfix">
                                        <h5 class="title">12 Comments</h5>

                                        <ol>
                                            <!-- Single Comment Area -->
                                            <li class="single_comment_area">
                                                <!-- Comment Content -->
                                                <div class="comment-content d-flex">
                                                    <!-- Comment Author -->
                                                    <div class="comment-author">
                                                        <img class="w-100 img-fluid"
                                                             src="https://yae.hifive03.com/assets/img/comment/comment_1.png"
                                                             alt="author">
                                                    </div>
                                                    <!-- Comment Meta -->
                                                    <div class="comment-meta">
                                                        <a href="#" class="post-date">27 Aug 2024</a>
                                                        <h5>Jerome Leonard</h5>
                                                        <p>I'm usually an anime-only type person but watching the first 3
                                                            episodes of
                                                            this show made me read the manga its actually amazing</p>
                                                        <a href="#" class="like">Like</a>
                                                        <a href="#" class="reply">Reply</a>
                                                    </div>
                                                </div>

                                                <ol class="children">
                                                    <li class="single_comment_area">
                                                        <!-- Comment Content -->
                                                        <div class="comment-content d-flex">
                                                            <!-- Comment Author -->
                                                            <div class="comment-author">
                                                                <img class="w-100 img-fluid"
                                                                     src="https://yae.hifive03.com/assets/img/comment/comment_2.png"
                                                                     alt="author">
                                                            </div>
                                                            <!-- Comment Meta -->
                                                            <div class="comment-meta">
                                                                <a href="#" class="post-date">27 Aug 2024</a>
                                                                <h5>Theodore Adkins</h5>
                                                                <p>I started watching this by accident and it's so funny.
                                                                    Anya is
                                                                    possibly the cutest anime character I've seen in a while
                                                                    (and not in
                                                                    that cutesy anime ick way). I really want them to be a
                                                                    family in the
                                                                    end, even if the mission fails. </p>
                                                                <a href="#" class="like">Like</a>
                                                                <a href="#" class="reply">Reply</a>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ol>
                                            </li>

                                            <!-- Single Comment Area -->
                                            <li class="single_comment_area">
                                                <!-- Comment Content -->
                                                <div class="comment-content d-flex">
                                                    <!-- Comment Author -->
                                                    <div class="comment-author">
                                                        <img class="w-100 img-fluid"
                                                             src="https://yae.hifive03.com/assets/img/comment/comment_4.png"
                                                             alt="author">
                                                    </div>
                                                    <!-- Comment Meta -->
                                                    <div class="comment-meta">
                                                        <a href="#" class="post-date">27 Aug 2024</a>
                                                        <h5>Melode Mash</h5>
                                                        <p>Great show. Anya is lovely character. I hope the 3 of them become
                                                            a real
                                                            family. </p>
                                                        <a href="#" class="like">Like</a>
                                                        <a href="#" class="reply">Reply</a>
                                                    </div>
                                                </div>
                                            </li>
                                            <!-- Single Comment Area -->
                                            <li class="single_comment_area">
                                                <!-- Comment Content -->
                                                <div class="comment-content d-flex">
                                                    <!-- Comment Author -->
                                                    <div class="comment-author">
                                                        <img class="w-100 img-fluid"
                                                             src="https://yae.hifive03.com/assets/img/comment/comment_3.png"
                                                             alt="author">
                                                    </div>
                                                    <!-- Comment Meta -->
                                                    <div class="comment-meta">
                                                        <a href="#" class="post-date">27 Aug 2024</a>
                                                        <h5>Roger Marshall</h5>
                                                        <p>Anya is so freaking funny ! Im so happy T _ T </p>
                                                        <a href="#" class="like">Like</a>
                                                        <a href="#" class="reply">Reply</a>
                                                    </div>
                                                </div>
                                            </li>
                                        </ol>
                                    </div>

                                </div>
                                <div class="col-lg-3">
                                    <div class="app-poster d-none d-lg-block">
                                        <img src="https://yae.hifive03.com/assets/img/collection/news_card.jpg" alt="">
                                        <div class="app_overlay mt-3">
                                            <ul class="d-flex justify-content-between align-center">
                                                <li class="mr-1"><a href="#">
                                                        <img class="w-100"
                                                             src="https://yae.hifive03.com/assets/img/app/app1.png" alt="">
                                                    </a></li>
                                                <li class="ml-1"><a href="#">
                                                        <img class="w-100"
                                                             src="https://yae.hifive03.com/assets/img/app/app2.png" alt="">
                                                    </a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12">
                                    <div class="comment-form">
                                        <h4>Leave a Reply</h4>
                                        <form class="form-contact comment_form" action="#" id="commentForm">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <textarea class="form-control w-100" name="comment" id="comment"
                                                                  cols="30" rows="9" placeholder="Write Comment"></textarea>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <input class="form-control" name="name" id="name" type="text"
                                                               placeholder="Name">
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <input class="form-control" name="email" id="email-comment"
                                                               type="email" placeholder="Email">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <button class="btn btn-primary" type="submit">Send Message</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                        commentbox End
        >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
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

        <!-- Template Main JS File -->
        <script src="${pageContext.request.contextPath}/assetsMain/js/main.js"></script>
    </body>

</html>