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
        <link href="../assetsMain/img/logo.png" rel="icon">
        <link href="../assetsMain/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.gstatic.com" rel="preconnect">
        <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
            rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="../assetsMain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="../assetsMain/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="../assetsMain/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="../assetsMain/vendor/quill/quill.snow.css" rel="stylesheet">
        <link href="../assetsMain/vendor/quill/quill.bubble.css" rel="stylesheet">
        <link href="../assetsMain/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="../assetsMain/vendor/simple-datatables/style.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="../assetsMain/css/style.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    </head>

    <body>

        <!-- ======= Header ======= -->
        <header id="header" class="header fixed-top d-flex align-items-center" style="background-color: #191a1c;">

            <div class="d-flex align-items-center justify-content-between">
                <a href="../home.jsp" class="logo d-flex align-items-center">
                    <img src="../assetsMain/img/logo.png" alt="" width="100">
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
                    <!-- ======= Filter Area Start ======= -->
                    <section class="filter sec-mar">
                        <div class="container">
                            <div class="heading style-1">
                                <h2>Filter <span> <a class="active"><i class="bi bi-grid"></i></a> <a
                                            href="./list-view.jsp" class="ms-2 me-2"><i
                                                class="fa fa-solid fa-list"></i></a> Showing 6 out of 5000
                                        Manga</span></h2>
                            </div>
                            <ul class="filter-block">
                                <li>
                                    <a href="#" class="anime-btn btn-dark active">All</a>
                                </li>
                                <li>
                                    <a href="#" class="anime-btn btn-dark">0-1</a>
                                </li>
                                <li>
                                    <a href="#" class="anime-btn btn-dark">A</a>
                                </li>
                                <li>
                                    <a href="#" class="anime-btn btn-dark">B</a>
                                </li>
                                <li>
                                    <a href="#" class="anime-btn btn-dark">C</a>
                                </li>
                                <li>
                                    <a href="#" class="anime-btn btn-dark">D</a>
                                </li>
                                <li>
                                    <a href="#" class="anime-btn btn-dark">E</a>
                                </li>
                                <li>
                                    <a href="#" class="anime-btn btn-dark">F</a>
                                </li>
                                <li>
                                    <a href="#" class="anime-btn btn-dark">G</a>
                                </li>
                                <li>
                                    <a href="#" class="anime-btn btn-dark">H</a>
                                </li>
                                <li>
                                    <a href="#" class="anime-btn btn-dark">I</a>
                                </li>
                                <li>
                                    <a href="#" class="anime-btn btn-dark">J</a>
                                </li>
                                <li>
                                    <a href="#" class="anime-btn btn-dark">L</a>
                                </li>
                                <li>
                                    <a href="#" class="anime-btn btn-dark">M</a>
                                </li>
                                <li>
                                    <a href="#" class="anime-btn btn-dark">N</a>
                                </li>
                                <li>
                                    <a href="#" class="anime-btn btn-dark">O</a>
                                </li>
                                <li>
                                    <a href="#" class="anime-btn btn-dark">P</a>
                                </li>
                                <li>
                                    <a href="#" class="anime-btn btn-dark">Q</a>
                                </li>
                                <li>
                                    <a href="#" class="anime-btn btn-dark">R</a>
                                </li>
                                <li>
                                    <a href="#" class="anime-btn btn-dark">S</a>
                                </li>
                                <li>
                                    <a href="#" class="anime-btn btn-dark">T</a>
                                </li>
                                <li>
                                    <a href="#" class="anime-btn btn-dark">U</a>
                                </li>
                                <li>
                                    <a href="#" class="anime-btn btn-dark">V</a>
                                </li>
                                <li>
                                    <a href="#" class="anime-btn btn-dark">W</a>
                                </li>
                                <li>
                                    <a href="#" class="anime-btn btn-dark">X</a>
                                </li>
                                <li>
                                    <a href="#" class="anime-btn btn-dark">Y</a>
                                </li>
                                <li>
                                    <a href="#" class="anime-btn btn-dark">Z</a>
                                </li>
                            </ul>
                            <ul class="filter-block style-2">
                                <li>
                                    <a href="#" class="anime-btn btn-dark dropdown-toggle" id="genre"
                                       data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
                                        Genre <span><i class="fa fa-chevron-down"></i></span>
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="genre">
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre1">
                                                <label class="custom-control-label" for="genre1">Action</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre2">
                                                <label class="custom-control-label" for="genre2">Adventure</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre3">
                                                <label class="custom-control-label" for="genre3">Avant Grade</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre4">
                                                <label class="custom-control-label" for="genre4">Boys Love</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre5">
                                                <label class="custom-control-label" for="genre5">Comedy</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre6">
                                                <label class="custom-control-label" for="genre6">Demons</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre7">
                                                <label class="custom-control-label" for="genre7">Drama</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre8">
                                                <label class="custom-control-label" for="genre8">Ecchi</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre9">
                                                <label class="custom-control-label" for="genre9">Fantasy</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre10">
                                                <label class="custom-control-label" for="genre10">Girls Love</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre11">
                                                <label class="custom-control-label" for="genre11">Gourmet</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre12">
                                                <label class="custom-control-label" for="genre12">Harem</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre13">
                                                <label class="custom-control-label" for="genre13">Horror</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre14">
                                                <label class="custom-control-label" for="genre14">Isekai</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre15">
                                                <label class="custom-control-label" for="genre15">Iyashikei</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre16">
                                                <label class="custom-control-label" for="genre16">Josei</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre17">
                                                <label class="custom-control-label" for="genre17">Kids</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre18">
                                                <label class="custom-control-label" for="genre18">Magic</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre19">
                                                <label class="custom-control-label" for="genre19">Mahou Shoujo</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre20">
                                                <label class="custom-control-label" for="genre20">Martial Arts</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre21">
                                                <label class="custom-control-label" for="genre21">Mecha</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre22">
                                                <label class="custom-control-label" for="genre22">Military</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre23">
                                                <label class="custom-control-label" for="genre23">Music</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre24">
                                                <label class="custom-control-label" for="genre24">Mystery</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre25">
                                                <label class="custom-control-label" for="genre25">Parody</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre26">
                                                <label class="custom-control-label" for="genre26">Psychological</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre27">
                                                <label class="custom-control-label" for="genre27">Reverse Harem</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre28">
                                                <label class="custom-control-label" for="genre28">Romance</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre29">
                                                <label class="custom-control-label" for="genre29">School</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre30">
                                                <label class="custom-control-label" for="genre30">Sci-Fi</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre31">
                                                <label class="custom-control-label" for="genre31">Seinin</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre32">
                                                <label class="custom-control-label" for="genre32">Shoujo</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre41">
                                                <label class="custom-control-label" for="genre41">Shounen</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre33">
                                                <label class="custom-control-label" for="genre33">Slice of Life</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre34">
                                                <label class="custom-control-label" for="genre34">Space</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre35">
                                                <label class="custom-control-label" for="genre35">Sports</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre36">
                                                <label class="custom-control-label" for="genre36">Super Power</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre37">
                                                <label class="custom-control-label" for="genre37">Supernatural</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre38">
                                                <label class="custom-control-label" for="genre38">Suspense</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre39">
                                                <label class="custom-control-label" for="genre39">Thriller</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="genre40">
                                                <label class="custom-control-label" for="genre40">Vampire</label>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#" class="anime-btn btn-dark dropdown-toggle" id="country"
                                       data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
                                        Country <span><i class="fa fa-chevron-down"></i></span>
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="country">
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="country1">
                                                <label class="custom-control-label" for="country1">China</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="country2">
                                                <label class="custom-control-label" for="country2">Japan</label>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#" class="anime-btn btn-dark dropdown-toggle" id="season"
                                       data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
                                        Season <span><i class="fa fa-chevron-down"></i></span>
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="season">
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="season1">
                                                <label class="custom-control-label" for="season1">Fall</label>
                                            </div>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="season2">
                                                <label class="custom-control-label" for="season2">Summer</label>
                                            </div>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="season3">
                                                <label class="custom-control-label" for="season3">Winter</label>
                                            </div>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="season4">
                                                <label class="custom-control-label" for="season4">Spring</label>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#" class="anime-btn btn-dark dropdown-toggle" id="year"
                                       data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
                                        Year <span><i class="fa fa-chevron-down"></i></span>
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="year">
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="yr1">
                                                <label class="custom-control-label" for="yr1">2023</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="yr2">
                                                <label class="custom-control-label" for="yr2">2023</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="yr3">
                                                <label class="custom-control-label" for="yr3">2021</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="yr4">
                                                <label class="custom-control-label" for="yr4">2020</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="yr5">
                                                <label class="custom-control-label" for="yr5">2019</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="yr6">
                                                <label class="custom-control-label" for="yr6">2018</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="yr7">
                                                <label class="custom-control-label" for="yr7">2017</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="yr8">
                                                <label class="custom-control-label" for="yr8">2016</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="yr9">
                                                <label class="custom-control-label" for="yr9">2015</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="yr10">
                                                <label class="custom-control-label" for="yr10">2014</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="yr11">
                                                <label class="custom-control-label" for="yr11">2013</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="yr12">
                                                <label class="custom-control-label" for="yr12">2012</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="yr13">
                                                <label class="custom-control-label" for="yr13">2010</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="yr14">
                                                <label class="custom-control-label" for="yr14">2009</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="yr15">
                                                <label class="custom-control-label" for="yr15">2008</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="yr16">
                                                <label class="custom-control-label" for="yr16">2007</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="yr17">
                                                <label class="custom-control-label" for="yr17">2006</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="yr18">
                                                <label class="custom-control-label" for="yr18">2005</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="yr19">
                                                <label class="custom-control-label" for="yr19">2004</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="yr20">
                                                <label class="custom-control-label" for="yr20">2003</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="yr22">
                                                <label class="custom-control-label" for="yr22">2002</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="yr23">
                                                <label class="custom-control-label" for="yr23">2001</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="yr24">
                                                <label class="custom-control-label" for="yr24">2000</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="yr25">
                                                <label class="custom-control-label" for="yr25">1999</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="yr26">
                                                <label class="custom-control-label" for="yr26">1998</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="yr27">
                                                <label class="custom-control-label" for="yr27">1997</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="yr28">
                                                <label class="custom-control-label" for="yr28">1996</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="yr29">
                                                <label class="custom-control-label" for="yr29">1995</label>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#" class="anime-btn btn-dark dropdown-toggle" id="type"
                                       data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
                                        Type <span><i class="fa fa-chevron-down"></i></span>
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="type">
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="type1">
                                                <label class="custom-control-label" for="type1">Movie</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="type2">
                                                <label class="custom-control-label" for="type2">TV</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="type3">
                                                <label class="custom-control-label" for="type3">OVA</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="type4">
                                                <label class="custom-control-label" for="type4">ONA</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="type5">
                                                <label class="custom-control-label" for="type5">Special</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="type6">
                                                <label class="custom-control-label" for="type6">Music</label>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#" class="anime-btn btn-dark dropdown-toggle" id="status"
                                       data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
                                        Status <span><i class="fa fa-chevron-down"></i></span>
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="status">
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="status1">
                                                <label class="custom-control-label" for="status1">Not Yet Released</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="status2">
                                                <label class="custom-control-label" for="status2">Releasing</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="status3">
                                                <label class="custom-control-label" for="status3">Completed</label>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#" class="anime-btn btn-dark dropdown-toggle" id="language"
                                       data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
                                        Language <span><i class="fa fa-chevron-down"></i></span>
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="language">
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="language1">
                                                <label class="custom-control-label" for="language1">Sub</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="language2">
                                                <label class="custom-control-label" for="language2">Dub</label>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#" class="anime-btn btn-dark dropdown-toggle" id="rating"
                                       data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
                                        Rating <span><i class="fa fa-chevron-down"></i></span>
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="rating">
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="rating1">
                                                <label class="custom-control-label" for="rating1">All Ages</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="rating2">
                                                <label class="custom-control-label" for="rating2">Children</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="rating3">
                                                <label class="custom-control-label" for="rating3">Teen 13 and Older</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="rating4">
                                                <label class="custom-control-label" for="rating4">Teen 17 Violence &amp;
                                                    Profanity</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="rating5">
                                                <label class="custom-control-label" for="rating5">Teen 17 Violence &amp;
                                                    Mild
                                                    Nudity</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="rating6">
                                                <label class="custom-control-label" for="rating6">18+</label>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#" class="anime-btn btn-dark dropdown-toggle" id="sort-by"
                                       data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
                                        Sort by <span><i class="fa fa-chevron-down"></i></span>
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="sort-by">
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="sort1">
                                                <label class="custom-control-label" for="sort1">Recently updated</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="sort2">
                                                <label class="custom-control-label" for="sort2">Release Date</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="sort3">
                                                <label class="custom-control-label" for="sort3">Trending</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="sort4">
                                                <label class="custom-control-label" for="sort4">Rating</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="sort5">
                                                <label class="custom-control-label" for="sort5">Most Watched</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="sort6">
                                                <label class="custom-control-label" for="sort6">Most Popular</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="sort7">
                                                <label class="custom-control-label" for="sort7">Number of Episodes</label>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="filter-block">
                                <li class="mb-0">
                                    <a href="#" class="anime-btn btn-dark border-change">Filter Now</a>
                                </li>
                            </ul>
                        </div>
                    </section>
                    <!-- ======= Filter Area End ======= -->

                    <div class="mb-5">
                        <div class="title">
                            <h2 class="fw-bold"></h2>
                            <div class="row mt-2">
                                <div class="col-lg-2 col-md-4 col-sm-6">
                                    <a href="../mangaSinglePage.jsp">
                                        <div class="product-card grow-box">
                                            <div class="img-con set-bg"
                                                 style="background-image: url('../assetsMain/img/manga.jpg');"
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
                                    <a href="../mangaSinglePage.jsp">
                                        <div class="product-card grow-box">
                                            <div class="img-con set-bg"
                                                 style="background-image: url('../assetsMain/img/manga.jpg');"
                                                 data-setbg="../assetsMain/img/manga.jpg">
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
                                    <a href="../mangaSinglePage.jsp">
                                        <div class="product-card grow-box">
                                            <div class="img-con set-bg"
                                                 style="background-image: url('../assetsMain/img/manga.jpg');"
                                                 data-setbg="../assetsMain/img/manga.jpg">
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
                                    <a href="../mangaSinglePage.jsp">
                                        <div class="product-card grow-box">
                                            <div class="img-con set-bg"
                                                 style="background-image: url('../assetsMain/img/manga.jpg');"
                                                 data-setbg="../assetsMain/img/manga.jpg">
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

                    <div class="pagination-wrape">
                        <ul class="pagination">
                            <li class="page-item">
                                <a href="#" class="page-link arrow" aria-label="Previous">
                                    <i class="bi bi-caret-left-fill"></i>
                                </a>
                            </li>
                            <li class="page-item">
                                <a href="#" class="page-link current">1</a>
                            </li>
                            <li class="page-item">
                                <a href="#" class="page-link">2</a>
                            </li>
                            <li class="page-item">
                                <a href="#" class="page-link">3</a>
                            </li>
                            <li class="page-item">
                                <a href="#" class="page-link">4</a>
                            </li>
                            <li class="page-item">
                                <a href="#" class="page-link arrow" aria-label="next">
                                    <i class="bi bi-caret-right-fill"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </section>
        </main>




        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                class="bi bi-arrow-up-short"></i></a>

        <!-- Vendor JS Files -->
        <script src="../assetsMain/vendor/apexcharts/apexcharts.min.js"></script>
        <script src="../assetsMain/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="../assetsMain/vendor/chart.js/chart.umd.js"></script>
        <script src="../assetsMain/vendor/echarts/echarts.min.js"></script>
        <script src="../assetsMain/vendor/quill/quill.min.js"></script>
        <script src="../assetsMain/vendor/simple-datatables/simple-datatables.js"></script>
        <script src="../assetsMain/vendor/tinymce/tinymce.min.js"></script>
        <script src="../assetsMain/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="../assetsMain/js/main.js"></script>
    </body>

</html>