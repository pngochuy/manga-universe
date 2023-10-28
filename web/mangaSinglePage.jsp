<%@page import="java.util.Date"%>
<%@page import="model.Manga"%>
<%@page import="dal.MangaDAO"%>
<%@page import="model.User"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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
        <!-- ======= Header ======= -->
        <header id="header" class="header fixed-top d-flex align-items-center" style="background-color: #191a1c;">

            <div class="d-flex align-items-center justify-content-between">
                <a href="home.jsp" class="logo d-flex align-items-center">
                    <img src="assetsMain/img/logo.png" alt="" width="100">
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
                                        <span style="color: black;">Free</span>
                                    </c:if>
                                </li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>

                                <li>
                                    <a class="dropdown-item d-flex align-items-center" href="userProfile.jsp">
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
                                        <a class="dropdown-item d-flex align-items-center" href="userProfile.jsp">
                                            <i class="bi bi-stars"></i>
                                            <span style="color: black;">Upgrade Premium</span>
                                        </a>
                                    </li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <% }%>
                                </c:if>
                                <c:if test="${sessionScope.userSession == null}">
                                    <li>
                                        <a class="dropdown-item d-flex align-items-center" href="userProfile.jsp">
                                            <i class="bi bi-stars"></i>
                                            <span style="color: black;">Upgrade Premium</span>
                                        </a>
                                    </li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                </c:if>

                                <li>
                                    <a class="dropdown-item d-flex align-items-center" href="userProfile.jsp">
                                        <i class="bi bi-gear"></i>
                                        <span style="color: black;">Account Settings</span>
                                    </a>
                                </li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>

                                <li>
                                    <a class="dropdown-item d-flex align-items-center" href="pages-faq.jsp">
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
                                    <a class="dropdown-item d-flex align-items-center" href="pages-faq.jsp">
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

        <!-- ======= Sidebar =======  4154f1 -->
        <aside id="sidebar" class="sidebar" style="background-color: #2c2c2c;">
            <ul class="sidebar-nav" id="sidebar-nav">

                <li class="nav-item">
                    <a class="nav-link collapsed" href="home.jsp">
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
                            <a href="follows/updates.jsp">
                                <i class="bi bi-circle"></i><span>Updates</span>
                            </a>
                        </li>
                        <li>
                            <a href="follows/readingHistory.jsp">
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
                            <a href="title/advancedSearch.jsp">
                                <i class="bi bi-circle"></i><span>Advanced Search</span>
                            </a>
                        </li>
                        <li>
                            <a href="title/recentlyAdded.jsp">
                                <i class="bi bi-circle"></i><span>Recently Added</span>
                            </a>
                        </li>
                        <li>
                            <a href="title/latestUpdates.jsp">
                                <i class="bi bi-circle"></i><span>Latest Updates</span>
                            </a>
                        </li>
                        <li>
                            <a href="title/random.jsp">
                                <i class="bi bi-circle"></i><span>Random</span>
                            </a>
                        </li>
                    </ul>
                </li><!-- End Components Nav -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="forum/forum.jsp">
                        <i class="bi bi-people"></i><span>Forums</span>
                    </a>
                </li><!-- End Components Nav -->

                <li class="nav-item">
                    <a class="nav-link collapsed" href="#">
                        <i class="bi bi-pin-angle"></i><span>MangaUniverse</span><i class="bi bi-chevron-down ms-auto"></i>
                    </a>
                    <ul class="nav-content">
                        <li>
                            <a href="about/aboutUs.jsp">
                                <i class="bi bi-circle"></i><span>About Us</span>
                            </a>
                        </li>
                        <li>
                            <a href="about/siteRules.jsp">
                                <i class="bi bi-circle"></i><span>Site Rules</span>
                            </a>
                        </li>
                        <li>
                            <a href="about/privacyPolicy.jsp">
                                <i class="bi bi-circle"></i><span>Privacy Policy</span>
                            </a>
                        </li>
                        <li>
                            <a href="about/announcement.jsp">
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
                    &COPY; MangaUniverse 2023</p>


        </aside><!-- End Sidebar-->

        <main id="main" class="main">
            <section class="section profile">
                <div class="row">

                    <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                         breadcrumb page start
        >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
             
                    <!-- Take Manga from home.jsp -->
                    <%
                        int id = Integer.parseInt(request.getParameter("id"));
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
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="home.jsp">Home</a></li>
                                            <li class="breadcrumb-item"><a href="../manga_all.jsp">All Mangas</a></li>
                                            <li class="breadcrumb-item"><a href="mangaSPServlet?id=<%= id%>">
                                                    <%= title%> </a>
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
                                        <h2><%= title%></h2>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-3">
                                    <img class="w-100 img-fluid" src="<%= coverImage%>" alt="">
                                </div>
                                <div class="col-lg-6">
                                    <form class="form-1 mb-3 mt-3">
                                        <div class="form-field">
                                            <span class="gl-star-rating gl-star-rating--ltr" data-star-rating="">
                                                <select id="glsr-ltr" class="star-rating">
                                                    <option value="">Select a rating</option>
                                                    <option value="5">5</option>
                                                    <option value="4" selected="">4</option>
                                                    <option value="3">3</option>
                                                    <option value="2">2</option>
                                                    <option value="1">1</option>
                                                </select>
                                            </span>
                                            <div class="rating-box">
                                                <!-- <header>Rating manga</header> -->
                                                <div class="stars">
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                </div>
                                            </div>
                                            <script>
                                                const stars = document.querySelectorAll(".stars i");

                                                stars.forEach((star, index1) => {
                                                    star.addEventListener("click", () => {
                                                        stars.forEach((star, index2) => {

                                                            index1 >= index2 ? star.classList.add("active") : star.classList.remove("active");
                                                        });
                                                    });
                                                });
                                            </script>
                                        </div>
                                    </form>
                                    <div class="manga_info">
                                        <ul>
                                            <li class="d-flex flex-wrap">
                                                <h6>Rating</h6>
                                                <p>Average 4 / 5 out of 87</p>
                                            </li>
                                            <li class="d-flex flex-wrap">
                                                <h6>Rank </h6>
                                                <p>N/A, it has 333.4K views </p>
                                            </li>
                                            <li class="d-flex flex-wrap">
                                                <h6>Alternative </h6>
                                                <p>Boy in A Girls' School ; Nuzi Xueyuan de Nansheng</p>
                                            </li>
                                            <li class="d-flex flex-wrap">
                                                <h6>Genre(s)</h6>
                                                <p>
                                                    <c:if test="${cateL != null}">
                                                        
                                                        <c:forEach var="t" items="${cateL}" varStatus="loop">
                                                            <a href="genres.jsp">${t.getType()}</a>,
                                                        </c:forEach>
                                                    </c:if>

                                                 
                                                </p>
                                            </li>

                                            <li class="d-flex flex-wrap">
                                                <h6>Type </h6>
                                                <p>Author(s) Huy Handsome </p>
                                            </li>
                                            <li class="d-flex flex-wrap watch">
                                                <a class="mr-2" href="ChapterServlet?cid=${1}&mid=<%= id%>">Read First</a><a
                                                    href="chapter/chapter.jsp">Read Last</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="manga_info">
                                        <ul>
                                            <li class="d-flex mt-3">
                                                <h6>Status </h6>
                                                <p>OnGoing </p>
                                            </li>
                                            <li class="d-flex justify-content-center align-center">
                                                <div class="feedback_box">
                                                    <a href="#commentbox">
                                                        <i class="bi bi-chat-dots-fill"></i>
                                                        <h6>12 Comments</h6>
                                                    </a>
                                                </div>
                                                <div class="feedback_box">
                                                    <a href="#">
                                                        <i class="bi bi-bookmark-fill"></i>
                                                        <h6>Bookmark
                                                        </h6>
                                                    </a>
                                                </div>
                                            </li>
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
                                        <p><%= description%> 
                                            <span id="dots"style="display: inline;">...</span>
                                            <span id="more"style="display: none;">erisque enim
                                                ligula venenatis dolor. Maecenas nisl est, ultrices nec
                                                congue eget, auctor vitae massa. Fusce luctus vestibulum augue ut aliquet.
                                                Nunc
                                                sagittis dictum nisi, sed ullamcorper ipsum dignissim ac. In at libero sed
                                                nunc
                                                venenatis imperdiet sed ornare turpis. Donec vitae dui eget tellus gravida
                                                venenatis. Integer fringilla congue eros non fermentum. Sed dapibus pulvinar
                                                nibh tempor porta.</span></p>
                                        <button onclick="myFunction()" id="read_more">Read more</button>
                                        <script>
                                            function myFunction() {
                                                var dots = document.getElementById("dots");
                                                var moreText = document.getElementById("more");
                                                var btnText = document.getElementById("read_more");

                                                if (dots.style.display === "none") {
                                                    dots.style.display = "inline";
                                                    moreText.style.display = "none";
                                                    btnText.innerHTML = "Read more";
                                                } else {
                                                    dots.style.display = "none";
                                                    moreText.style.display = "inline";
                                                    btnText.innerHTML = "Read less";
                                                }
                                            }
                                        </script>
                                    </div>
                                    <div class="manga_info">
                                        <div class="section-tittle mt-30 mb-30">
                                            <h3>LATEST MANGA RELEASES</h3>
                                        </div>
                                        <ul class="chapter mb-3">
                                            <!<!-- add Chapter nè -->  
                                            <c:forEach var="c" items="${listC}" varStatus="loop"> 

                                                <li>
                                                    <a href="ChapterServlet?cid=${c.imageID}&mid=${c.mangaID}"
                                                       class="d-flex flex-wrap justify-content-between">
                                                        <span>Chapter ${loop.index + 1} - ${c.title}</span><span>07/19/2020 </span>
                                                    </a>
                                                </li>

                                            </c:forEach>
                                            <li>
                                                <a href="chapter/chapter.jsp"
                                                   class="d-flex flex-wrap justify-content-between">
                                                    <span>Chapter 1 - The Beginning of Everything </span><span>07/19/2020
                                                    </span>
                                                </a>
                                            </li>

                                            <!--<i class="bi bi-lock-fill"></i>-->
                                            <c:if test="${sessionScope.userSession != null}">
                                                <% User u3 = (User) session.getAttribute("userSession");%>
                                                <% if (u3.getRole().equalsIgnoreCase("Free")) {%>
                                                <li>
                                                    <a href="chapter/chapter.jsp"
                                                       class="d-flex flex-wrap justify-content-between disabled-link">
                                                        <span>Chapter 2 - Friends and Relatives <i class="bi bi-lock-fill"></i></span><span>07/19/2020 </span>
                                                    </a>  
                                                </li>

                                                <% } else if (u3.getRole().equalsIgnoreCase("Premium") || u3.getRole().equalsIgnoreCase("Author")) {%>
                                                <li>
                                                    <a href="chapter/chapter.jsp"
                                                       class="d-flex flex-wrap justify-content-between">
                                                        <span>Chapter 2 - Friends and Relatives</span><span>07/19/2020 </span>
                                                    </a>  
                                                </li>
                                                <% }%>
                                            </c:if>
                                            <c:if test="${sessionScope.userSession == null}">
                                                <li>
                                                    <a href="chapter/chapter.jsp"
                                                       class="d-flex flex-wrap justify-content-between disabled-link">
                                                        <span>Chapter 2 - Friends and Relatives <i class="bi bi-lock-fill"></i></span><span>07/19/2020 </span>
                                                    </a>  
                                                </li>
                                            </c:if>



                                            <c:if test="${sessionScope.userSession != null}">
                                                <% User u4 = (User) session.getAttribute("userSession");%>
                                                <% if (u4.getRole().equalsIgnoreCase("Free")) {%>
                                                <li>
                                                    <a href="chapter/chapter.jsp"
                                                       class="d-flex flex-wrap justify-content-between disabled-link">
                                                        <span>Chapter 3 - Friends and Relatives <i class="bi bi-lock-fill"></i></span><span>07/19/2020 </span>
                                                    </a>  
                                                </li>

                                                <% } else if (u4.getRole().equalsIgnoreCase("Premium") || u4.getRole().equalsIgnoreCase("Author")) {%>
                                                <li>
                                                    <a href="chapter/chapter.jsp"
                                                       class="d-flex flex-wrap justify-content-between">
                                                        <span>Chapter 3 - Friends and Relatives</span><span>07/19/2020 </span>
                                                    </a>  
                                                </li>
                                                <% }%>
                                            </c:if>
                                            <c:if test="${sessionScope.userSession == null}">
                                                <li>
                                                    <a href="chapter/chapter.jsp"
                                                       class="d-flex flex-wrap justify-content-between disabled-link">
                                                        <span>Chapter 3 - Friends and Relatives <i class="bi bi-lock-fill"></i></span><span>07/19/2020 </span>
                                                    </a>  
                                                </li>
                                            </c:if>

                                            <c:if test="${sessionScope.userSession != null}">
                                                <% User u5 = (User) session.getAttribute("userSession");%>
                                                <% if (u5.getRole().equalsIgnoreCase("Free")) {%>
                                                <li>
                                                    <a href="chapter/chapter.jsp"
                                                       class="d-flex flex-wrap justify-content-between disabled-link">
                                                        <span>Chapter 4 - Friends and Relatives <i class="bi bi-lock-fill"></i></span><span>07/19/2020 </span>
                                                    </a>  
                                                </li>

                                                <% } else if (u5.getRole().equalsIgnoreCase("Premium") || u5.getRole().equalsIgnoreCase("Author")) {%>
                                                <li>
                                                    <a href="chapter/chapter.jsp"
                                                       class="d-flex flex-wrap justify-content-between">
                                                        <span>Chapter 4 - Friends and Relatives</span><span>07/19/2020 </span>
                                                    </a>  
                                                </li>
                                                <% }%>
                                            </c:if>
                                            <c:if test="${sessionScope.userSession == null}">
                                                <li>
                                                    <a href="chapter/chapter.jsp"
                                                       class="d-flex flex-wrap justify-content-between disabled-link">
                                                        <span>Chapter 4 - Friends and Relatives <i class="bi bi-lock-fill"></i></span><span>07/19/2020 </span>
                                                    </a>  
                                                </li>
                                            </c:if>

                                            <c:if test="${sessionScope.userSession != null}">
                                                <% User u6 = (User) session.getAttribute("userSession");%>
                                                <% if (u6.getRole().equalsIgnoreCase("Free")) {%>
                                                <li>
                                                    <a href="chapter/chapter.jsp"
                                                       class="d-flex flex-wrap justify-content-between disabled-link">
                                                        <span>Chapter 5 - Friends and Relatives <i class="bi bi-lock-fill"></i></span><span>07/19/2020 </span>
                                                    </a>  
                                                </li>

                                                <% } else if (u6.getRole().equalsIgnoreCase("Premium") || u6.getRole().equalsIgnoreCase("Author")) {%>
                                                <li>
                                                    <a href="chapter/chapter.jsp"
                                                       class="d-flex flex-wrap justify-content-between">
                                                        <span>Chapter 5 - Friends and Relatives</span><span>07/19/2020 </span>
                                                    </a>  
                                                </li>
                                                <% }%>
                                            </c:if>
                                            <c:if test="${sessionScope.userSession == null}">
                                                <li>
                                                    <a href="chapter/chapter.jsp"
                                                       class="d-flex flex-wrap justify-content-between disabled-link">
                                                        <span>Chapter 5 - Friends and Relatives <i class="bi bi-lock-fill"></i></span><span>07/19/2020 </span>
                                                    </a>  
                                                </li>
                                            </c:if>

                                            <c:if test="${sessionScope.userSession != null}">
                                                <% User u7 = (User) session.getAttribute("userSession");%>
                                                <% if (u7.getRole().equalsIgnoreCase("Free")) {%>
                                                <li>
                                                    <a href="chapter/chapter.jsp"
                                                       class="d-flex flex-wrap justify-content-between disabled-link">
                                                        <span>Chapter 6 - Friends and Relatives <i class="bi bi-lock-fill"></i></span><span>07/19/2020 </span>
                                                    </a>  
                                                </li>

                                                <% } else if (u7.getRole().equalsIgnoreCase("Premium") || u7.getRole().equalsIgnoreCase("Author")) {%>
                                                <li>
                                                    <a href="chapter/chapter.jsp"
                                                       class="d-flex flex-wrap justify-content-between">
                                                        <span>Chapter 6 - Friends and Relatives</span><span>07/19/2020 </span>
                                                    </a>  
                                                </li>
                                                <% }%>
                                            </c:if>
                                            <c:if test="${sessionScope.userSession == null}">
                                                <li>
                                                    <a href="chapter/chapter.jsp"
                                                       class="d-flex flex-wrap justify-content-between disabled-link">
                                                        <span>Chapter 6 - Friends and Relatives <i class="bi bi-lock-fill"></i></span><span>07/19/2020 </span>
                                                    </a>  
                                                </li>
                                            </c:if>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="section-tittle mb-30 mt-30">
                                        <h3>Related Manga</h3>
                                    </div>
                                    
                                    <a href="#">
                                        <div class="trand-right-single d-flex">
                                            <div class="trand-right-img">
                                                <img class="play" src="assetsMain/img/manga.jpg"
                                                     alt="" style="width: 120px; height: 120px">
                                                <div class="overlay_play2">
                                                    <i class="fa-solid fa-heart"> 61M</i>
                                                </div>
                                            </div>
                                            <div class="trand-right-cap">
                                                <h4>My Aunt </h4>
                                                <ul class="d-flex flex-wrap star">
                                                    <li><i class="fa-solid fa-star"></i></li>
                                                    <li><i class="fa-solid fa-star"></i></li>
                                                    <li><i class="fa-solid fa-star"></i></li>
                                                    <li><i class="fa-regular fa-star"></i></li>
                                                    <li><i class="fa-regular fa-star"></i></li>
                                                </ul>
                                                <div class="tag2 d-flex flex-wrap">
                                                    <h6>Genre:</h6>
                                                    <ul class="d-flex flex-wrap">
                                                        <li>Action,</li>
                                                        <li>Comedy,</li>
                                                        <li>Drama,</li>
                                                        <li>Supernatural</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    
                                    <a href="#">
                                        <div class="trand-right-single d-flex">
                                            <div class="trand-right-img">
                                                <img class="play" src="assetsMain/img/manga.jpg"
                                                     alt="" style="width: 120px; height: 120px">
                                                <div class="overlay_play2">
                                                    <i class="fa-solid fa-heart"> 89M</i>
                                                </div>
                                            </div>
                                            <div class="trand-right-cap">
                                                <h4>Son-in-Law Does Cheap Cultivation </h4>
                                                <ul class="d-flex flex-wrap star">
                                                    <li><i class="fa-solid fa-star"></i></li>
                                                    <li><i class="fa-solid fa-star"></i></li>
                                                    <li><i class="fa-solid fa-star"></i></li>
                                                    <li><i class="fa-solid fa-star"></i></li>
                                                    <li><i class="fa-solid fa-star-half-stroke"></i></li>
                                                </ul>
                                                <div class="tag2 d-flex flex-wrap">
                                                    <h6>Genre:</h6>
                                                    <ul class="d-flex flex-wrap">
                                                        <li>Action,</li>
                                                        <li>Comedy,</li>
                                                        <li>Drama,</li>
                                                        <li>Supernatural</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="#">
                                        <div class="trand-right-single d-flex">
                                            <div class="trand-right-img">
                                                <img class="play"
                                                     src="assetsMain/img/manga.jpg" alt="" style="width: 120px; height: 120px">
                                                <div class="overlay_play2">
                                                    <i class="fa-solid fa-heart"> 99M</i>
                                                </div>
                                            </div>
                                            <div class="trand-right-cap">
                                                <h4>Gedou Tenisha no Harem Dungeon Seisakuki </h4>
                                                <ul class="d-flex flex-wrap star">
                                                    <li><i class="fa-solid fa-star"></i></li>
                                                    <li><i class="fa-solid fa-star"></i></li>
                                                    <li><i class="fa-solid fa-star"></i></li>
                                                    <li><i class="fa-solid fa-star-half-stroke"></i></li>
                                                    <li><i class="fa-regular fa-star"></i></li>
                                                </ul>
                                                <div class="tag2 d-flex flex-wrap">
                                                    <h6>Genre:</h6>
                                                    <ul class="d-flex flex-wrap">
                                                        <li>Action,</li>
                                                        <li>Comedy,</li>
                                                        <li>Drama,</li>
                                                        <li>Supernatural</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="#">
                                        <div class="trand-right-single d-flex">
                                            <div class="trand-right-img">
                                                <img class="play"
                                                     src="assetsMain/img/manga.jpg" alt="" style="width: 120px; height: 120px">
                                                <div class="overlay_play2">
                                                    <i class="fa-solid fa-heart"> 61M</i>
                                                </div>
                                            </div>
                                            <div class="trand-right-cap">
                                                <h4>Kanojo, Okarishimasu </h4>
                                                <ul class="d-flex flex-wrap star">
                                                    <li><i class="fa-solid fa-star"></i></li>
                                                    <li><i class="fa-solid fa-star"></i></li>
                                                    <li><i class="fa-solid fa-star"></i></li>
                                                    <li><i class="fa-solid fa-star"></i></li>
                                                    <li><i class="fa-solid fa-star"></i></li>
                                                </ul>
                                                <div class="tag2 d-flex flex-wrap">
                                                    <h6>Genre:</h6>
                                                    <ul class="d-flex flex-wrap">
                                                        <li>Action,</li>
                                                        <li>Comedy,</li>
                                                        <li>Drama,</li>
                                                        <li>Supernatural</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </section>

                </div>
            </section>
        </main>




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