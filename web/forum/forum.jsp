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

                <li class="nav-item dropdown">

                    <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
                        <i class="bi bi-chat-left-text" style="color: white"></i>
                        <span class="badge bg-success badge-number">3</span>
                    </a><!-- End Messages Icon -->

                    <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">
                        <li class="dropdown-header">
                            You have 3 new messages
                            <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
                        </li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>

                        <li class="message-item">
                            <a href="#">
                                <img src="assetsMain/img/messages-1.jpg" alt="" class="rounded-circle">
                                <div>
                                    <h4>Maria Hudson</h4>
                                    <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                                    <p>4 hrs. ago</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>

                        <li class="message-item">
                            <a href="#">
                                <img src="assetsMain/img/messages-2.jpg" alt="" class="rounded-circle">
                                <div>
                                    <h4>Anna Nelson</h4>
                                    <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                                    <p>6 hrs. ago</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>

                        <li class="message-item">
                            <a href="#">
                                <img src="assetsMain/img/messages-3.jpg" alt="" class="rounded-circle">
                                <div>
                                    <h4>David Muldon</h4>
                                    <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                                    <p>8 hrs. ago</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>

                        <li class="dropdown-footer">
                            <a href="#">Show all messages</a>
                        </li>

                    </ul><!-- End Messages Dropdown Items -->

                </li><!-- End Messages Nav -->

                <li class="nav-item dropdown pe-3">

                    <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                        <img src="../assetsMain/img/b91392ef3b4ad7849c8d8cdbe713872a1969caa8r1-496-537v2_uhq.jpg"
                            alt="Profile" class="rounded-circle">
                        <span class="d-none d-md-block dropdown-toggle ps-2" style="color: white">Tinhuynh211</span>
                    </a><!-- End Profile Iamge Icon -->

                    <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                        <li class="dropdown-header">
                            <h6>Tinhuynh211</h6>
                            <span style="color: black;">User Account</span>
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
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <i class="bi bi-question-circle"></i>
                                <span style="color: black;">Need Help?</span>
                            </a>
                        </li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>

                        <li>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <i class="bi bi-box-arrow-right"></i>
                                <span style="color: black;">Sign Out</span>
                            </a>
                        </li>

                    </ul><!-- End Profile Dropdown Items -->
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
                � MangaUniverse 2023</p>


    </aside><!-- End Sidebar-->

    <main id="main" class="main">
        <section class="section profile">
            <div class="row">
                <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                    Blog part start
        >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
                <h2 class="fw-bold">Blogs</h2>
                <section class="blog style-1 sec-mar">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6col-12 mb-4">
                                        <a href="./blog-detail.jsp" class="inner-box">
                                            <div class="image-box">
                                                <img src="https://uiparadox.co.uk/templates/animeloop/demo/assets/media/blog/blog-img-1.png"
                                                    alt="" class="w-100 attachment-full size-full">
                                            </div>
                                            <div class="author-box text-start">
                                                <div class="detail d-flex align-items-center justify-content-between">
                                                    <p>28 NOV 2022</p>
                                                    <p>Anime</p>
                                                </div>
                                                <h4>Why One piece’s 948th Episode </h4>
                                                <div class="d-flex align-items-center">
                                                    <img src="https://uiparadox.co.uk/templates/animeloop/demo/assets/media/comment/comment-img.png"
                                                        class="w-auto" alt="">
                                                    <h5>Author’s Name</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-lg-6 col-md-6col-12 mb-4">
                                        <a href="./blog-detail.jsp" class="inner-box">
                                            <div class="image-box">
                                                <img src="https://uiparadox.co.uk/templates/animeloop/demo/assets/media/blog/blog-img-2.png"
                                                    alt="" class="attachment-full size-full w-100">
                                            </div>
                                            <div class="author-box text-start">
                                                <div class="detail d-flex align-items-center justify-content-between">
                                                    <p>28 NOV 2022</p>
                                                    <p>Manga</p>
                                                </div>
                                                <h4>ANime Community Is Going mad </h4>
                                                <div class="d-flex align-items-center">
                                                    <img src="https://uiparadox.co.uk/templates/animeloop/demo/assets/media/comment/comment-img-6.png"
                                                        class="w-auto" alt="">
                                                    <h5>Author’s Name</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-lg-6 col-md-6col-12 mb-4">
                                        <a href="./blog-detail.jsp" class="inner-box">
                                            <div class="image-box">
                                                <img src="https://uiparadox.co.uk/templates/animeloop/demo/assets/media/blog/blog-img-3.png"
                                                    alt="" class="attachment-full size-full w-100">
                                            </div>
                                            <div class="author-box text-start">
                                                <div class="detail d-flex align-items-center justify-content-between">
                                                    <p>28 NOV 2022</p>
                                                    <p>Light Novel</p>
                                                </div>
                                                <h4>Tokyo Ghoul 2nd Season Review</h4>
                                                <div class="d-flex align-items-center">
                                                    <img src="https://uiparadox.co.uk/templates/animeloop/demo/assets/media/comment/comment-img-2.png"
                                                        class="w-auto" alt="">
                                                    <h5>Author’s Name</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-lg-6 col-md-6col-12 mb-4">
                                        <a href="./blog-detail.jsp" class="inner-box">
                                            <div class="image-box">
                                                <img src="https://uiparadox.co.uk/templates/animeloop/demo/assets/media/blog/blog-img-2.png"
                                                    alt="" class="attachment-full size-full w-100">
                                            </div>
                                            <div class="author-box text-start">
                                                <div class="detail d-flex align-items-center justify-content-between">
                                                    <p>28 NOV 2022</p>
                                                    <p>Manga</p>
                                                </div>
                                                <h4>ANime Community Is Going mad </h4>
                                                <div class="d-flex align-items-center">
                                                    <img src="https://uiparadox.co.uk/templates/animeloop/demo/assets/media/comment/comment-img-3.png"
                                                        class="w-auto" alt="">
                                                    <h5>Author’s Name</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-lg-6 col-md-6col-12 mb-4">
                                        <a href="./blog-detail.jsp" class="inner-box">
                                            <div class="image-box">
                                                <img src="https://uiparadox.co.uk/templates/animeloop/demo/assets/media/blog/blog-img-1.png"
                                                    alt="" class="attachment-full size-full w-100">
                                            </div>
                                            <div class="author-box text-start">
                                                <div class="detail d-flex align-items-center justify-content-between">
                                                    <p>28 NOV 2022</p>
                                                    <p>Community</p>
                                                </div>
                                                <h4>Why One piece’s 948th Episode </h4>
                                                <div class="d-flex align-items-center">
                                                    <img src="https://uiparadox.co.uk/templates/animeloop/demo/assets/media/comment/comment-img-4.png"
                                                        class="w-auto" alt="">
                                                    <h5>Author’s Name</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>

                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="blog-search bg-color-black">
                                    <form action="blog.jsp">
                                        <div class="input-group form-group">
                                            <input class="form-control" type="text" name="query" placeholder="Search">
                                            <button class="input-group-text anime-btn" type="submit"><i
                                                    class="bi bi-search" style="color: white;"></i></button>
                                        </div>
                                    </form>
                                    <h5 class="mb-3 mt-4">Tags</h5>
                                    <ul class="tags">
                                        <li><a href="">Anime</a></li>
                                        <li><a href="">Shounen</a></li>
                                        <li><a href="">Super Hero</a></li>
                                        <li><a href="">Fantasy</a></li>
                                    </ul>
                                    <h5 class="mb-3 mt-4">Categories</h5>
                                    <ul class="categories list-style">
                                        <li><a href="">Anime</a></li>
                                        <li><a href="">Manga</a></li>
                                        <li><a href="">Cosplay</a></li>
                                        <li><a href="">Light Novel</a></li>
                                    </ul>
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