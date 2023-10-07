<%@page import="model.User"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    // session.removeAttribute("tokenVerify");
    String tokenVerify = (String) session.getAttribute("tokenVerify");
    out.println(tokenVerify); // 'null' or 'tokenVerify'

%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Users / Profile</title>
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

        <!-- Ajax -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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

                    <!-- -------------------- -->
                    <main>

                        <div class="mb-5">
                            <h2 class="fw-bold fs-1">Popular New Feed</h2>
                            <c:if test="${sessionScope.user != null}">

                                <c:out value="${user.getExpiredTime()}"></c:out>
                            </c:if>
                            <div id="carousel">

                                <div class="hideLeft">
                                    <a href="#"><img src="assetsMain/img/mangaIntro/mangaIntro-1.PNG"></a>
                                </div>

                                <div class="prevLeftSecond">
                                    <a href="#"><img src="assetsMain/img/mangaIntro/mangaIntro-2.PNG"></a>
                                </div>

                                <div class="prev">
                                    <a href="#"><img src="assetsMain/img/mangaIntro/mangaIntro-3.PNG"></a>
                                </div>

                                <div class="selected">
                                    <a href="#"><img src="assetsMain/img/mangaIntro/mangaIntro-4.jpg"></a>
                                </div>

                                <div class="next">
                                    <a href="#"><img src="assetsMain/img/mangaIntro/mangaIntro-5.jpg"></a>
                                </div>

                                <div class="nextRightSecond">
                                    <a href="#"><img src="assetsMain/img/mangaIntro/mangaIntro-6.jpg"></a>
                                </div>

                                <div class="hideRight">
                                    <a href="#"><img src="assetsMain/img/mangaIntro/mangaIntro-7.png"></a>
                                </div>

                            </div>
                        </div>
                        <div class="mb-5">
                            <div class="title">
                                <h2 class="fw-bold">Latest Updates <a href="#"><i class="bi bi-arrow-right"
                                                                                  style="display: block; float: right;"></i></a></h2>
                                <div class="row mt-2">
                                    <div class="col-lg-2 col-md-4 col-sm-6">
                                        <a href="mangaSinglePage.jsp">
                                            <div class="product-card grow-box">
                                                <div class="img-con set-bg"
                                                     style="background-image: url('https://res.cloudinary.com/djytvqlon/image/upload/v1695319321/igzzfbqeajlmm4os2vpv.jpg');"
                                                     data-setbg="assetsMain/img/manga.jpg">
                                                    <div class="ep">18/20</div>
                                                    <div class="comment"><i class="bi bi-chat"></i> 21</div>
                                                    <div class="view"><i class="bi bi-eye"></i> 7141</div>
                                                </div>
                                                <div class="product-card-con">
                                                    <ul>
                                                        <li>Active</li>
                                                        <li>Movie</li>
                                                    </ul>
                                                    <h5>Kaguya-sama wa Kokurasetai: First Kiss wa Owaranai</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-lg-2 col-md-4 col-sm-6">
                                        <a href="mangaSinglePage.jsp">
                                            <div class="product-card grow-box">
                                                <div class="img-con set-bg"
                                                     style="background-image: url('assetsMain/img/manga.jpg');"
                                                     data-setbg="assetsMain/img/manga.jpg">
                                                    <div class="ep">18/20</div>
                                                    <div class="comment"><i class="bi bi-chat"></i> 21</div>
                                                    <div class="view"><i class="bi bi-eye"></i> 7141</div>
                                                </div>
                                                <div class="product-card-con">
                                                    <ul>
                                                        <li>Active</li>
                                                        <li>Movie</li>
                                                    </ul>
                                                    <h5>Kaguya-sama wa Kokurasetai: First Kiss wa Owaranai</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-lg-2 col-md-4 col-sm-6">
                                        <a href="mangaSinglePage.jsp">
                                            <div class="product-card grow-box">
                                                <div class="img-con set-bg"
                                                     style="background-image: url('assetsMain/img/manga.jpg');"
                                                     data-setbg="assetsMain/img/manga.jpg">
                                                    <div class="ep">18/20</div>
                                                    <div class="comment"><i class="bi bi-chat"></i> 21</div>
                                                    <div class="view"><i class="bi bi-eye"></i> 7141</div>
                                                </div>
                                                <div class="product-card-con">
                                                    <ul>
                                                        <li>Active</li>
                                                        <li>Movie</li>
                                                    </ul>
                                                    <h5>Kaguya-sama wa Kokurasetai: First Kiss wa Owaranai</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-lg-2 col-md-4 col-sm-6">
                                        <a href="mangaSinglePage.jsp">
                                            <div class="product-card grow-box">
                                                <div class="img-con set-bg"
                                                     style="background-image: url('assetsMain/img/manga.jpg');"
                                                     data-setbg="assetsMain/img/manga.jpg">
                                                    <div class="ep">18/20</div>
                                                    <div class="comment"><i class="bi bi-chat"></i> 21</div>
                                                    <div class="view"><i class="bi bi-eye"></i> 7141</div>
                                                </div>
                                                <div class="product-card-con">
                                                    <ul>
                                                        <li>Active</li>
                                                        <li>Movie</li>
                                                    </ul>
                                                    <h5>Kaguya-sama wa Kokurasetai: First Kiss wa Owaranai</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-lg-2 col-md-4 col-sm-6">
                                        <a href="mangaSinglePage.jsp">
                                            <div class="product-card grow-box">
                                                <div class="img-con set-bg"
                                                     style="background-image: url('assetsMain/img/manga.jpg');"
                                                     data-setbg="assetsMain/img/manga.jpg">
                                                    <div class="ep">18/20</div>
                                                    <div class="comment"><i class="bi bi-chat"></i> 21</div>
                                                    <div class="view"><i class="bi bi-eye"></i> 7141</div>
                                                </div>
                                                <div class="product-card-con">
                                                    <ul>
                                                        <li>Active</li>
                                                        <li>Movie</li>
                                                    </ul>
                                                    <h5>Kaguya-sama wa Kokurasetai: First Kiss wa Owaranai</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-lg-2 col-md-4 col-sm-6">
                                        <a href="mangaSinglePage.jsp">
                                            <div class="product-card grow-box">
                                                <div class="img-con set-bg"
                                                     style="background-image: url('assetsMain/img/manga.jpg');"
                                                     data-setbg="assetsMain/img/manga.jpg">
                                                    <div class="ep">18/20</div>
                                                    <div class="comment"><i class="bi bi-chat"></i> 21</div>
                                                    <div class="view"><i class="bi bi-eye"></i> 7141</div>
                                                </div>
                                                <div class="product-card-con">
                                                    <ul>
                                                        <li>Active</li>
                                                        <li>Movie</li>
                                                    </ul>
                                                    <h5>Kaguya-sama wa Kokurasetai: First Kiss wa Owaranai</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>


                                </div>
                            </div>
                        </div>
                        <div class="mb-5">
                            <div class="title">
                                <h2 class="fw-bold">Recently Added <a href="#"><i class="bi bi-arrow-right"
                                                                                  style="display: block; float: right;"></i></a></h2>
                                <div class="row mt-2">
                                    <div class="col-lg-2 col-md-4 col-sm-6">
                                        <a href="mangaSinglePage.jsp">
                                            <div class="product-card grow-box">
                                                <div class="img-con set-bg"
                                                     style="background-image: url('assetsMain/img/manga.jpg');"
                                                     data-setbg="assetsMain/img/manga.jpg">
                                                    <div class="ep">18/20</div>
                                                    <div class="comment"><i class="bi bi-chat"></i> 21</div>
                                                    <div class="view"><i class="bi bi-eye"></i> 7141</div>
                                                </div>
                                                <div class="product-card-con">
                                                    <ul>
                                                        <li>Active</li>
                                                        <li>Movie</li>
                                                    </ul>
                                                    <h5>Kaguya-sama wa Kokurasetai: First Kiss wa Owaranai</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-lg-2 col-md-4 col-sm-6">
                                        <a href="mangaSinglePage.jsp">
                                            <div class="product-card grow-box">
                                                <div class="img-con set-bg"
                                                     style="background-image: url('assetsMain/img/manga.jpg');"
                                                     data-setbg="assetsMain/img/manga.jpg">
                                                    <div class="ep">18/20</div>
                                                    <div class="comment"><i class="bi bi-chat"></i> 21</div>
                                                    <div class="view"><i class="bi bi-eye"></i> 7141</div>
                                                </div>
                                                <div class="product-card-con">
                                                    <ul>
                                                        <li>Active</li>
                                                        <li>Movie</li>
                                                    </ul>
                                                    <h5>Kaguya-sama wa Kokurasetai: First Kiss wa Owaranai</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-lg-2 col-md-4 col-sm-6">
                                        <a href="mangaSinglePage.jsp">
                                            <div class="product-card grow-box">
                                                <div class="img-con set-bg"
                                                     style="background-image: url('assetsMain/img/manga.jpg');"
                                                     data-setbg="assetsMain/img/manga.jpg">
                                                    <div class="ep">18/20</div>
                                                    <div class="comment"><i class="bi bi-chat"></i> 21</div>
                                                    <div class="view"><i class="bi bi-eye"></i> 7141</div>
                                                </div>
                                                <div class="product-card-con">
                                                    <ul>
                                                        <li>Active</li>
                                                        <li>Movie</li>
                                                    </ul>
                                                    <h5>Kaguya-sama wa Kokurasetai: First Kiss wa Owaranai</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-lg-2 col-md-4 col-sm-6">
                                        <a href="mangaSinglePage.jsp">
                                            <div class="product-card grow-box">
                                                <div class="img-con set-bg"
                                                     style="background-image: url('assetsMain/img/manga.jpg');"
                                                     data-setbg="assetsMain/img/manga.jpg">
                                                    <div class="ep">18/20</div>
                                                    <div class="comment"><i class="bi bi-chat"></i> 21</div>
                                                    <div class="view"><i class="bi bi-eye"></i> 7141</div>
                                                </div>
                                                <div class="product-card-con">
                                                    <ul>
                                                        <li>Active</li>
                                                        <li>Movie</li>
                                                    </ul>
                                                    <h5>Kaguya-sama wa Kokurasetai: First Kiss wa Owaranai</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-lg-2 col-md-4 col-sm-6">
                                        <a href="mangaSinglePage.jsp">
                                            <div class="product-card grow-box">
                                                <div class="img-con set-bg"
                                                     style="background-image: url('assetsMain/img/manga.jpg');"
                                                     data-setbg="assetsMain/img/manga.jpg">
                                                    <div class="ep">18/20</div>
                                                    <div class="comment"><i class="bi bi-chat"></i> 21</div>
                                                    <div class="view"><i class="bi bi-eye"></i> 7141</div>
                                                </div>
                                                <div class="product-card-con">
                                                    <ul>
                                                        <li>Active</li>
                                                        <li>Movie</li>
                                                    </ul>
                                                    <h5>Kaguya-sama wa Kokurasetai: First Kiss wa Owaranai</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-lg-2 col-md-4 col-sm-6">
                                        <a href="mangaSinglePage.jsp">
                                            <div class="product-card grow-box">
                                                <div class="img-con set-bg"
                                                     style="background-image: url('assetsMain/img/manga.jpg');"
                                                     data-setbg="assetsMain/img/manga.jpg">
                                                    <div class="ep">18/20</div>
                                                    <div class="comment"><i class="bi bi-chat"></i> 21</div>
                                                    <div class="view"><i class="bi bi-eye"></i> 7141</div>
                                                </div>
                                                <div class="product-card-con">
                                                    <ul>
                                                        <li>Active</li>
                                                        <li>Movie</li>
                                                    </ul>
                                                    <h5>Kaguya-sama wa Kokurasetai: First Kiss wa Owaranai</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </main>
                    <!-- subscribe section -->
                    <section class="subscribe py-5 theme-transparent-bg">
                        <div class="container">
                            <div class="row">
                                <div class="col-12">
                                    <div class="mb-0 mb-lg-5">
                                        <div class="row">
                                            <div class="col-12 col-lg-7 align-self-center">
                                                <div class="p-4 p-lg-5">
                                                    <p class="fw-bold mb-4 font-small">Subscribe to our newsletter and be
                                                        the first to
                                                        receive news</p>
                                                    <h4 class="fs-2 font-black mb-0">Don't miss out on Fantastic Anime &amp;
                                                        Manga</h4>
                                                    <div class="mt-5">
                                                        <form class="form">
                                                            <div class="row justify-content-center">
                                                                <div class="col-12">
                                                                    <div
                                                                        class="d-flex p-2 rounded-pill theme-border-white theme-transparent-bg">
                                                                        <input type="text" class="form-control"
                                                                               placeholder="Enter your email address">
                                                                        <button type="button"
                                                                                class="btn custom-btn-subscribe"><i
                                                                                class="bi bi-envelope-fill"></i></button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-lg-5 pt-5 pt-lg-0">
                                                <img src="https://designmilitary.com/preview/html-websites/Anime-Manga-Hub/ver2.0/assets/images/section/subscribe-img.png"
                                                     class="img-fluid theme-border-radius" alt="subscribe pic">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section> <!-- End subscribe section -->

                    <div class="offer-section-div w-100 py-4"> <!-- Ads section -->
                        <div class="container-fluid px-lg-5">
                            <div class="row row-cols-1 row-cols-md-2 align-items-center">
                                <div class="col">
                                    <figure class="letf-pic1">
                                        <img class="ads-img"
                                             src="https://oxentictemplates.in/templatemonster/tendex/images/sub-img1.png"
                                             alt="sb">
                                    </figure>
                                </div>
                                <div class="col">
                                    <div class="content-details-div">
                                        <h2 class="text-white mt-0"> 1 Year Free Subscription
                                            <span class="d-block"> Cashback Upto 50%</span>
                                        </h2>
                                        <h4 class="text-white">*25<sup>th</sup>May 2023 </h4>
                                        <p class="text-white col-lg-9"> Lorem Ipsum is simply dummy text of the printing and
                                            typesetting industry. Lorem Ipsum has been the industry's standard dummy text
                                            ever since the 1500s, when an unknown printer</p>
                                        <a href="#" class="btn comon-btn mt-4"> Subcribe Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
<!--                    <div id="content">
                        <div class="container">
                            <div class="click-me"><a href="#">Click Me</a></div>
                        </div>
                    </div>-->
                    <!-- Start popup code -->

                    <div id="ad_position_box">
                        <div class="card">
                            <div class="top-row flex-row">
                                <div class="colmun">
                                    <span>Ad</span>
                                </div>
                                <div class="colmun">
                                    <button class="report"><i class="bi bi-three-dots-vertical ads-icon"></i></button>
                                    <button class="skip"><i class="bi bi-x-lg ads-icon"></i></button>
                                </div>
                            </div>
                            <div class="ad-content">
                                <div>
                                    <img class="img-fluid" width="200" height="200" src="assetsMain/img/ads-img.jpg"
                                         alt="ad">
                                </div>
                            </div>
                        </div>
                    </div>
                    <script src="main.js"></script>
                </div>
            </section>

        </main><!-- End #main -->



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

        <!-- Slider -->
        <script>
            function moveToSelected(element) {

                if (element == "next") {
                    var selected = $(".selected").next();
                } else if (element == "prev") {
                    var selected = $(".selected").prev();
                } else {
                    var selected = element;
                }

                var next = $(selected).next();
                var prev = $(selected).prev();
                var prevSecond = $(prev).prev();
                var nextSecond = $(next).next();

                $(selected).removeClass().addClass("selected");

                $(prev).removeClass().addClass("prev");
                $(next).removeClass().addClass("next");

                $(nextSecond).removeClass().addClass("nextRightSecond");
                $(prevSecond).removeClass().addClass("prevLeftSecond");

                $(nextSecond).nextAll().removeClass().addClass('hideRight');
                $(prevSecond).prevAll().removeClass().addClass('hideLeft');

            }

            // Eventos teclado
            $(document).keydown(function (e) {
                switch (e.which) {
                    case 37: // left
                        moveToSelected('prev');
                        break;

                    case 39: // right
                        moveToSelected('next');
                        break;

                    default:
                        return;
                }
                e.preventDefault();
            });

            $('#carousel div').click(function () {
                moveToSelected($(this));
            });

            $('#prev').click(function () {
                moveToSelected('prev');
            });

            $('#next').click(function () {
                moveToSelected('next');
            });


//            document.addEventListener("DOMContentLoaded", function () {
//                var adPositionBox = document.getElementById("ad_position_box");
//
//                adPositionBox.classList.add("active");
//
//                setTimeout(function () {
//                    adPositionBox.classList.remove("active");
//                }, 5000);
//            });

            $("#ad_position_box").addClass("active");
            $("#carousel div").attr("style", "z-index: 0;");
//            $(".click-me a").click(function () {
//                $("#ad_position_box").addClass("active");
//                $("#carousel div").attr("style", "z-index: 0;");
//            });
            $(".skip").click(function () {
                $("#ad_position_box").removeClass("active");
                $("#carousel div").removeAttr("style");
            });
        </script>

    </body>

</html>