<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- Favicons -->
    <link href="../assetsMain/img/logo.png" rel="icon">
    <link href="../assetsMain/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="../https://fonts.gstatic.com" rel="preconnect">
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
                © MangaUniverse 2023</p>


    </aside><!-- End Sidebar-->

    <main id="main" class="main">
        <section class="section profile">
            <div class="row">
                <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                    Chapter start
    >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
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
                                        <li class="breadcrumb-item"><a href="../mangaSinglePage.jsp">The Boy in the
                                                All-Girls
                                                School </a></li>
                                        <li class="breadcrumb-item active" aria-current="page">The Boy in the All-Girls
                                            School -
                                            Chapter 1</li>
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
                                    <h2>The Boy in the All-Girls School</h2>
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
                                    <option value="../chapter/chapter">Chapter 00</option>
                                    <option selected="" disabled="">Chapter 1 - The Beginning of Everything </option>
                                    <option value="../chapter/chapter02">Chapter 2 - Friends and Relatives </option>
                                    <option value="../chapter/chapter03">Chapter 3 - First Visit to the All-Girls School
                                    </option>
                                    <option value="../chapter/chapter04">Chapter 4 - A Surprise While Out Strolling
                                    </option>
                                    <option value="../chapter/chapter05">Chapter 5 - Appropriate Countermeasures
                                    </option>
                                    <option value="../chapter/chapter06">Chapter 6 - First Day of School </option>
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
                                            <a class="mr-2" href="../chapter/chapter.jsp"><i
                                                    class="fa-solid fa-arrow-left"></i>
                                                Prev</a><a href="../chapter/chapter02.jsp">Next <i
                                                    class="fa-solid fa-arrow-right"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12"><img class="w-100 img-fluid align-items-center"
                                    src="https://yae.hifive03.com/assets/img/chapter/chapter01/1.jpg" alt=""></div>
                            <div class="col-12"><img class="w-100 img-fluid align-items-center"
                                    src="https://yae.hifive03.com/assets/img/chapter/chapter01/2.jpg" alt=""></div>
                            <div class="col-12"><img class="w-100 img-fluid align-items-center"
                                    src="https://yae.hifive03.com/assets/img/chapter/chapter01/3.jpg" alt=""></div>
                            <div class="col-12"><img class="w-100 img-fluid align-items-center"
                                    src="https://yae.hifive03.com/assets/img/chapter/chapter01/4.jpg" alt=""></div>
                            <div class="col-12"><img class="w-100 img-fluid align-items-center"
                                    src="https://yae.hifive03.com/assets/img/chapter/chapter01/5.jpg" alt=""></div>
                            <div class="col-12"><img class="w-100 img-fluid align-items-center"
                                    src="https://yae.hifive03.com/assets/img/chapter/chapter01/6.jpg" alt=""></div>
                            <div class="col-12"><img class="w-100 img-fluid align-items-center"
                                    src="https://yae.hifive03.com/assets/img/chapter/chapter01/7.jpg" alt=""></div>
                            <div class="col-12"><img class="w-100 img-fluid align-items-center"
                                    src="https://yae.hifive03.com/assets/img/chapter/chapter01/8.jpg" alt=""></div>
                            <div class="col-12"><img class="w-100 img-fluid align-items-center"
                                    src="https://yae.hifive03.com/assets/img/chapter/chapter01/9.jpg" alt=""></div>
                            <div class="col-12"><img class="w-100 img-fluid align-items-center"
                                    src="https://yae.hifive03.com/assets/img/chapter/chapter01/10.jpg" alt=""></div>
                            <div class="col-12"><img class="w-100 img-fluid align-items-center"
                                    src="https://yae.hifive03.com/assets/img/chapter/chapter01/11.jpg" alt=""></div>
                            <div class="col-12"><img class="w-100 img-fluid align-items-center"
                                    src="https://yae.hifive03.com/assets/img/chapter/chapter01/12.jpg" alt=""></div>
                            <div class="col-12"><img class="w-100 img-fluid align-items-center"
                                    src="https://yae.hifive03.com/assets/img/chapter/chapter01/13.jpg" alt=""></div>
                            <div class="col-12"><img class="w-100 img-fluid align-items-center"
                                    src="https://yae.hifive03.com/assets/img/chapter/chapter01/14.jpg" alt=""></div>
                            <div class="col-12"><img class="w-100 img-fluid align-items-center"
                                    src="https://yae.hifive03.com/assets/img/chapter/chapter01/15.jpg" alt=""></div>
                            <div class="col-12"><img class="w-100 img-fluid align-items-center"
                                    src="https://yae.hifive03.com/assets/img/chapter/chapter01/16.jpg" alt=""></div>
                            <div class="col-12"><img class="w-100 img-fluid align-items-center"
                                    src="https://yae.hifive03.com/assets/img/chapter/chapter01/17.jpg" alt=""></div>
                            <div class="col-12"><img class="w-100 img-fluid align-items-center"
                                    src="https://yae.hifive03.com/assets/img/chapter/chapter01/18.jpg" alt=""></div>
                            <div class="col-12"><img class="w-100 img-fluid align-items-center"
                                    src="https://yae.hifive03.com/assets/img/chapter/chapter01/19.jpg" alt=""></div>
                            <div class="col-12"><img class="w-100 img-fluid align-items-center"
                                    src="https://yae.hifive03.com/assets/img/chapter/chapter01/20.jpg" alt=""></div>
                            <div class="col-12"><img class="w-100 img-fluid align-items-center"
                                    src="https://yae.hifive03.com/assets/img/chapter/chapter01/21.jpg" alt=""></div>
                            <div class="col-12"><img class="w-100 img-fluid align-items-center"
                                    src="https://yae.hifive03.com/assets/img/chapter/chapter01/22.jpg" alt=""></div>
                        </div>


                        <div class="row">
                            <div class="col-lg-6 mb-30 mt-30">
                                <select class="form-select form-select-sm" aria-label=".form-select-sm example"
                                    onchange="javascript:handleSelect(this)">
                                    <option value="../chapter/chapter">Chapter 00</option>
                                    <option selected="" disabled="">Chapter 1 - The Beginning of Everything </option>
                                    <option value="../chapter/chapter02">Chapter 2 - Friends and Relatives </option>
                                    <option value="../chapter/chapter03">Chapter 3 - First Visit to the All-Girls School
                                    </option>
                                    <option value="../chapter/chapter04">Chapter 4 - A Surprise While Out Strolling
                                    </option>
                                    <option value="../chapter/chapter05">Chapter 5 - Appropriate Countermeasures
                                    </option>
                                    <option value="../chapter/chapter06">Chapter 6 - First Day of School </option>
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
                                            <a class="mr-2" href="../chapter/chapter.jsp"><i
                                                    class="bi bi-arrow-left"></i>
                                                Prev</a><a href="../chapter/chapter02.jsp">Next <i
                                                    class="bi bi-arrow-right"></i></a>
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
                                            <button type="submit" class="button button-contactForm btn_1 boxed-btn">Send
                                                Message</button>
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