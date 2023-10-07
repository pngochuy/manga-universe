<%@page import="model.UserRegister"%>
<%@page import="model.User"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Users / Profile</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="assetsUser/img/logo.png" rel="icon">
        <link href="assetsUser/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.gstatic.com" rel="preconnect">
        <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
            rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assetsUser/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assetsUser/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assetsUser/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assetsUser/vendor/quill/quill.snow.css" rel="stylesheet">
        <link href="assetsUser/vendor/quill/quill.bubble.css" rel="stylesheet">
        <link href="assetsUser/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="assetsUser/vendor/simple-datatables/style.css" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <!-- Template Main CSS File -->
        <link href="assetsUser/css/style.css" rel="stylesheet">

        <style>
            section {
                width: 100%;
                height: 100vh;
                box-sizing: border-box;
                /*padding: 140px 0;*/
                
            }

            .card {
                position: relative;
                min-width: 300px;
                height: auto;
                overflow: hidden;
                border-radius: 15px;
                margin: 0 auto;
                padding: 40px 20px;
                box-shadow: 0 10px 15px rgba(0, 0, 0, 0.3);
                transition: .5s;
            }

            .card:hover {
                transform: scale(1.1);
            }

            .card_red,
            .card_red .title .fa {
                background: linear-gradient(-45deg, #ffec61, #f321d7);
            }

            .card_violet,
            .card_violet .title .fa {
                background: linear-gradient(-45deg, #f403d1, #64b5f6);
            }

            .card_three,
            .card_three .title .fa {
                background: linear-gradient(-45deg, #24ff72, #9a4eff);
            }

            .card:before {
                content: '';
                position: absolute;
                bottom: 0;
                left: 0;
                width: 100%;
                height: 40%;
                background: rgba(255, 255, 255, .1);
                z-index: 1;
                transform: skewY(-5deg) scale(1.5);
            }

            .title .fa {
                color: #fff;
                font-size: 60px;
                width: 100px;
                height: 100px;
                border-radius: 50%;
                text-align: center;
                line-height: 100px;
                box-shadow: 0 10px 10px rgba(0, 0, 0, .1);
            }

            .title h2 {
                position: relative;
                margin: 20px 0 0;
                padding: 0;
                color: #fff;
                font-size: 28px;
                z-index: 2;
            }

            .price {
                position: relative;
                z-index: 2;
            }

            .price h4 {
                margin: 0;
                padding: 20px 0;
                color: #fff;
                font-size: 60px;
            }

            .option {
                position: relative;
                z-index: 2;
            }

            .option ul {
                margin: 0;
                padding: 0;
            }

            .option ul li {
                margin: 0 0 10px;
                padding: 0;
                list-style: none;
                color: #fff;
                font-size: 16px;
            }

            .card a {
                display: block;
                position: relative;
                z-index: 2;
                background-color: #fff;
                /* color: #262ff; */
                width: 150px;
                height: 40px;
                text-align: center;
                margin: 20px auto 0;
                line-height: 40px;
                border-radius: 40px;
                font-size: 16px;
                cursor: pointer;
                text-decoration: none;
                box-shadow: 0 5px 10px rgba(0, 0, 0, .1);
            }

            .card a:hover {
            }
        </style>

    </head>
    <body>
        <!-- ======= Header ======= -->
        <header id="header" class="header fixed-top d-flex align-items-center">

            <div class="d-flex align-items-center justify-content-between">
                <a href="home.jsp" class="logo d-flex align-items-center">
                    <img src="assetsUser/img/logo.png" alt="" width="100">
                    <span class="d-none d-lg-block">MangaUniverse</span>
                </a>
                <i class="bi bi-list toggle-sidebar-btn"></i>
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
                            <i class="bi bi-search"></i>
                        </a>
                    </li><!-- End Search Icon-->

                    <li class="nav-item dropdown">

                        <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
                            <i class="bi bi-bell"></i>
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

                        <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                            <c:if test="${userSession != null}">
                                <img  src="${userSession.getAvatarUrl() != '' ? userSession.getAvatarUrl() : 'assetsUser/img/user_image_default.png'}"
                                      alt="Profile" class="img-fluid rounded-circle">
                            </c:if>
                            <c:if test="${userSession == null}">
                                <img src="${valueAvatarUrl != null ? valueAvatarUrl : 'assetsUser/img/user_image_default.png'}"
                                     alt="Profile" class="img-fluid rounded-circle">
                            </c:if>

                            <c:if test="${sessionScope.userSession != null}">
                                <span class="d-none d-md-block dropdown-toggle ps-2">${sessionScope.userSession.getUsername()}</span>
                            </c:if>
                            <c:if test="${sessionScope.userSession == null}">
                                <span class="d-none d-md-block dropdown-toggle ps-2">${sessionScope.userRegister.getUsername()}</span>
                            </c:if>

                        </a><!-- End Profile Image Icon -->

                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                            <li class="dropdown-header">
                                <c:if test="${sessionScope.userSession != null}">
                                    <% User user = (User) session.getAttribute("userSession");%>
                                    <h6>${sessionScope.userSession.getUsername()}</h6>
                                    <% if (user.getRole().equalsIgnoreCase("Free")) {%>
                                    <span>${sessionScope.userSession.getRole()}</span>
                                    <% } else if (user.getRole().equalsIgnoreCase("Premium")) {%>
                                    <span>${sessionScope.userSession.getRole()} <i class="bi bi-star-fill" style="color: gold;"></i></span>
                                        <% } else if (user.getRole().equalsIgnoreCase("Author")) {%>   
                                    <span>${sessionScope.userSession.getRole()} <i class="bi bi-star-fill" style="color: greenyellow;"></i></span>
                                        <% }%>
                                    </c:if>
                                    <c:if test="${sessionScope.userSession == null}">
                                    <h6>${sessionScope.userRegister.getUsername()}</h6>
                                    <span>Free</span>
                                </c:if>


                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li>
                                <a class="dropdown-item d-flex align-items-center" href="userProfile.jsp">
                                    <i class="bi bi-person"></i>
                                    <span>My Profile</span>
                                </a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <c:if test="${sessionScope.userSession != null}">
                                <%User u = (User) session.getAttribute("userSession");%>
                                <% if (u.getRole().equalsIgnoreCase("Free")) {%>
                                <li>
                                    <a class="dropdown-item d-flex align-items-center" href="userProfile.jsp">
                                        <i class="bi bi-stars"></i>
                                        <span>Upgrade Premium</span>
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
                                        <span>Upgrade Premium</span>
                                    </a>
                                </li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                            </c:if>

                            <li>
                                <a class="dropdown-item d-flex align-items-center" href="userProfile.jsp">
                                    <i class="bi bi-gear"></i>
                                    <span>Account Settings</span>
                                </a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li>
                                <a class="dropdown-item d-flex align-items-center" href="pages-faq.jsp">
                                    <i class="bi bi-question-circle"></i>
                                    <span>Need Help?</span>
                                </a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li>
                                <a class="dropdown-item d-flex align-items-center" href="LogoutServlet">
                                    <i class="bi bi-box-arrow-right"></i>
                                    <span>Sign Out</span>
                                </a>
                            </li>

                        </ul><!-- End Profile Dropdown Items -->
                    </li><!-- End Profile Nav -->

                </ul>
            </nav><!-- End Icons Navigation -->

        </header><!-- End Header -->

        <!-- ======= Sidebar ======= -->
        <aside id="sidebar" class="sidebar">

            <ul class="sidebar-nav" id="sidebar-nav">
                <li class="nav-item">
                    <a class="nav-link collapsed" href="home.jsp">
                        <i class="bi bi-grid"></i>
                        <span>Homepage</span>
                    </a> 

                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="userProfile.jsp">
                        <i class="bi bi-layout-text-window-reverse"></i><span>My Profile </span><i class="bi"></i>
                    </a>

                </li>

                <li class="nav-item">
                    <a class="nav-link collapsed" href="addManga.jsp">
                        <i class="bi bi-grid"></i>
                        <span>Add Manga</span>
                    </a>

                </li>
                <li class="nav-item">

                    <a class="nav-link collapsed"  href="#">
                        <i class="bi bi-menu-button-wide"></i><span>Manage Chapter</span><i class="bi bi-chevron-down ms-auto"></i>
                    </a>
                    <ul id="components-nav" class="nav-content">

                        <li>
                            <a href="viewMangaList.jsp">
                                <i class="bi bi-circle"></i><span>View Chapter List</span>
                            </a>
                        </li>

                    </ul>

                </li>

                <!-- End Components Nav -->

        </aside><!-- End Sidebar-->

        <main id="main" class="main">

            <!--            <div class="pagetitle">
                            <h1>Profile</h1>
                            <nav>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="home.jsp">Home</a></li>
                                    <li class="breadcrumb-item">User</li>
                                    <li class="breadcrumb-item active">Profile</li>
                                </ol>
                            </nav>
                        </div>-->
            <!-- End Page Title -->

            <section>
                <div class="container-fluid">
                    <div class="container">
                        <div class="row" style="display: flex;
                align-items: center;
                justify-content: center;">
                            <div class="col-sm-4">
                                <div class="card card_red text-center">
                                    <div class="title">
                                        <i class="fa fa-paper-plane" aria-hidden="true"></i>
                                        <h2>Free</h2>
                                    </div>
                                    <div class="price">
                                        <h4><sup>$</sup>0</h4>
                                    </div>
                                    <div class="option">
                                        <ul>
                                            <li><i class="fa fa-check" aria-hidden="true"></i>Browse and search for comic series</li>
                                            <li><i class="fa fa-check" aria-hidden="true"></i>Track reading progress</li>
                                            <li><i class="fa fa-times" aria-hidden="true"></i>Display ads</li>
                                            <li><i class="fa fa-times" aria-hidden="true"></i>Limited image quality</li>
                                            <li><i class="fa fa-times" aria-hidden="true"></i>Limited access to special features</li>
                                        </ul>
                                    </div>
                                    <a href="userProfile.jsp">Continue</a>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="card card_violet text-center">
                                    <div class="title">
                                        <i class="fa fa-plane" aria-hidden="true"></i>
                                        <h2>Premium</h2>
                                    </div>
                                    <div class="price">
                                        <h4><sup>$</sup>25</h4>
                                    </div>
                                    <div class="option">
                                        <ul>
                                            <li><i class="fa fa-check" aria-hidden="true"></i>Ad-free comic reading</li>
                                            <li><i class="fa fa-check" aria-hidden="true"></i>Access to new and popular comic series (exclusive)</li>
                                            <li><i class="fa fa-check" aria-hidden="true"></i>Higher image quality and download options</li>
                                            <li><i class="fa fa-check" aria-hidden="true"></i>24/7 customer support</li>
                                        </ul>
                                    </div>
                                    <a href="#">Subscribe Now</a>
                                </div>
                            </div>
<!--                            <div class="col-sm-4">
                                <div class="card card_three text-center">
                                    <div class="title">
                                        <i class="fa fa-rocket" aria-hidden="true"></i>
                                        <h2>Standart</h2>
                                    </div>
                                    <div class="price">
                                        <h4><sup>$</sup>50</h4>
                                    </div>
                                    <div class="option">
                                        <ul>
                                            <li><i class="fa fa-check" aria-hidden="true"></i>50 GB Space</li>
                                            <li><i class="fa fa-check" aria-hidden="true"></i>5 Domain Names</li>
                                            <li><i class="fa fa-check" aria-hidden="true"></i>20 Emails Addresse</li>
                                            <li><i class="fa fa-times" aria-hidden="true"></i>Live Support</li>
                                        </ul>
                                    </div>
                                    <a href="#">Order Now</a>
                                </div>
                            </div>-->
                        </div>
                    </div>
                </div>
            </section>
        </main>



        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                class="bi bi-arrow-up-short"></i></a>

        <!-- Vendor JS Files -->
        <script src="assetsUser/vendor/apexcharts/apexcharts.min.js"></script>
        <script src="assetsUser/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assetsUser/vendor/chart.js/chart.umd.js"></script>
        <script src="assetsUser/vendor/echarts/echarts.min.js"></script>
        <script src="assetsUser/vendor/quill/quill.min.js"></script>
        <script src="assetsUser/vendor/simple-datatables/simple-datatables.js"></script>
        <script src="assetsUser/vendor/tinymce/tinymce.min.js"></script>
        <script src="assetsUser/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="assetsUser/js/main.js"></script>
    </body>
</html>
