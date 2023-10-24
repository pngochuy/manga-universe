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

        <%@include file="layouts/layoustOthers/headerOthers.jsp" %> 
        <%@include file="layouts/layoustOthers/sidebarOthers.jsp" %>

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
                                                <p>Boy in A Girls' School ; Nuzi Xueyuan de Nansheng</p>
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
                                                    <span>Chapter 0 - Introduction</span><span>07/19/2020 </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="chapter/chapter.jsp"
                                                   class="d-flex flex-wrap justify-content-between">
                                                    <span>Chapter 1 - The Beginning of Everything </span><span>07/19/2020
                                                    </span>
                                                </a>
                                            </li>

                                            <!--<i class="bi bi-lock-fill"></i>-->
                                            <c:if test="${sessionScope.userSession != null}">
                                                <% User u4 = (User) session.getAttribute("userSession");%>
                                                <% if (u4.getRole().equalsIgnoreCase("Free")) {%>
                                                <li>
                                                    <a href="chapter/chapter.jsp"
                                                       class="d-flex flex-wrap justify-content-between disabled-link">
                                                        <span>Chapter 2 - Friends and Relatives <i class="bi bi-lock-fill"></i></span><span>07/19/2020 </span>
                                                    </a>  
                                                </li>

                                                <% } else if (u4.getRole().equalsIgnoreCase("Premium") || u4.getRole().equalsIgnoreCase("Author")) {%>
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