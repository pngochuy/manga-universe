<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                        <img src="assetsMain/img/b91392ef3b4ad7849c8d8cdbe713872a1969caa8r1-496-537v2_uhq.jpg"
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
                            <a class="dropdown-item d-flex align-items-center" href="userProfile.jsp">
                                <i class="bi bi-person"></i>
                                <span style="color: black;">My Profile</span>
                            </a>
                        </li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>

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
                        <a href="follows/updates.jsp">
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
                © MangaUniverse 2023</p>


    </aside><!-- End Sidebar-->

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
                                        <li class="breadcrumb-item"><a href="../manga_all.jsp">All Mangas</a></li>
                                        <li class="breadcrumb-item"><a href="mangaSinglePage.jsp">The Boy in the
                                                All-Girls
                                                School </a>
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
                                    <h2>The Boy in the All-Girls School</h2>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <img class="w-100 img-fluid" src="assetsMain/img/manga.jpg" alt="">
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
                                            <p>女子学院的男生 ; Boy in A Girls' School ; Nuzi Xueyuan de Nansheng</p>
                                        </li>
                                        <li class="d-flex flex-wrap">
                                            <h6>Genre(s) </h6>
                                            <p>
                                                <a href="genres.jsp">Comedy</a>,
                                                <a href="genres.jsp">Harem</a>,
                                                <a href="genres.jsp">Romance</a>,
                                                <a href="genres.jsp">School life</a>,
                                                <a href="genres.jsp">Shounen</a>,
                                                <a href="genres.jsp">Slice of life</a>
                                            </p>
                                        </li>
                                        <li class="d-flex flex-wrap">
                                            <h6>Type </h6>
                                            <p>Author(s) Huy Handsome </p>
                                        </li>
                                        <li class="d-flex flex-wrap watch">
                                            <a class="mr-2" href="chapter/chapter.jsp">Read First</a><a
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
                                    <p>In an all-girls school full of jaw-dropping beauties, a male student suddenly
                                        transfers in!!!
                                        Perhaps in the eyes of others, this would be a dream-like paradise, but in
                                        reality, the
                                        future is completely unimaginable <span id="dots"
                                            style="display: inline;">...</span><span id="more"
                                            style="display: none;">erisque enim
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
                                        <li>
                                            <a href="chapter/chapter.jsp"
                                                class="d-flex flex-wrap justify-content-between">
                                                <span>Chapter 00</span><span>07/19/2020 </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="chapter/chapter.jsp"
                                                class="d-flex flex-wrap justify-content-between">
                                                <span>Chapter 1 - The Beginning of Everything </span><span>07/19/2020
                                                </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="chapter/chapter.jsp"
                                                class="d-flex flex-wrap justify-content-between">
                                                <span>Chapter 2 - Friends and Relatives </span><span>07/19/2020 </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="chapter/chapter.jsp"
                                                class="d-flex flex-wrap justify-content-between">
                                                <span>Chapter 3 - First Visit to the All-Girls School
                                                </span><span>07/19/2020
                                                </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="chapter/chapter.jsp"
                                                class="d-flex flex-wrap justify-content-between">
                                                <span>Chapter 4 - A Surprise While Out Strolling </span><span>07/19/2020
                                                </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="chapter/chapter.jsp"
                                                class="d-flex flex-wrap justify-content-between">
                                                <span>Chapter 5 - Appropriate Countermeasures </span><span>07/19/2020
                                                </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="chapter/chapter.jsp"
                                                class="d-flex flex-wrap justify-content-between">
                                                <span>Chapter 6 - First Day of School </span><span>07/19/2020 </span>
                                            </a>
                                        </li>
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
                                            <img class="play" src="https://yae.hifive03.com/assets/img/manga/small8.jpg"
                                                alt="">
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
                                            <img class="play" src="https://yae.hifive03.com/assets/img/manga/small9.jpg"
                                                alt="">
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
                                                src="https://yae.hifive03.com/assets/img/manga/small10.jpg" alt="">
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
                                                src="https://yae.hifive03.com/assets/img/manga/small11.jpg" alt="">
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