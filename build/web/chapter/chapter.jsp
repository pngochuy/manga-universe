<%@page import="model.User"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%


%>


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

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
                integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    </head>

    <body>

        <%@include file="../layouts/layoutsMain/headerMain.jsp" %> 
        <%@include file="../layouts/layoutsMain/sidebarMain.jsp" %>

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
                                            <li class="breadcrumb-item"><a href="../follows/readingHistory.jsp">All Manga</a></li>
                                            <li class="breadcrumb-item"><a href="../mangaSinglePage.jsp">${mangaDetail.getTitle()} </a></li>
                                            <li class="breadcrumb-item active" aria-current="page">${chapterToView.getTitle()} - ${chapterToView.getDescription()}</li>
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
                                        <h2>${mangaDetail.getTitle()}</h2>
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
                                        <c:forEach items="${chapterListByMangaIDToView}" var="chapter">

                                            <c:if test="${chapterToView.getChapterID() == chapter.getChapterID()}">
                                                <option value="/MangaUniverse/ViewChapterDetail?action=read-chapter&mangaID=${mangaDetail.getMangaID()}&chapterID=${chapter.getChapterID()}" selected="" disabled="">${chapter.getTitle()} - ${chapter.getDescription()}</option>
                                            </c:if>

                                            <c:if test="${chapterToView.getChapterID() != chapter.getChapterID()}">
                                                <option value="/MangaUniverse/ViewChapterDetail?action=read-chapter&mangaID=${mangaDetail.getMangaID()}&chapterID=${chapter.getChapterID()}">${chapter.getTitle()} - ${chapter.getDescription()}</option>
                                            </c:if>
                                        </c:forEach>

                                    </select>

                                </div>
                                <div class="col-lg-6 mb-30 mt-30">
                                    <div class="manga_info">
                                        <ul>
                                            <li class="d-flex flex-wrap watch justify-content-end">
                                                <a class="mr-2" href="javascript:navigateChapters(-1)"><i class="fa-solid fa-arrow-left"></i> Prev</a>
                                                <a href="javascript:navigateChapters(1)">Next <i class="fa-solid fa-arrow-right"></i></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <c:forEach items="${imageSourcelistToView}" var="imageSource">
                                    <div class="col-12">
                                        <img class="w-100 img-fluid align-items-center watermark_image"
                                             src="${imageSource.getImageURL()}" alt="" >
                                    </div>
                                </c:forEach>


                            </div>


                            <div class="row">
                                <div class="col-lg-6 mb-30 mt-30">
                                    <select class="form-select form-select-sm" aria-label=".form-select-sm example"
                                            onchange="javascript:handleSelect(this)">
                                        <c:forEach items="${chapterListByMangaIDToView}" var="chapter">

                                            <c:if test="${chapterToView.getChapterID() == chapter.getChapterID()}">
                                                <option value="/MangaUniverse/ViewChapterDetail?action=read-chapter&mangaID=${mangaDetail.getMangaID()}&chapterID=${chapter.getChapterID()}" selected="" disabled="">${chapter.getTitle()} - ${chapter.getDescription()}</option>
                                            </c:if>

                                            <c:if test="${chapterToView.getChapterID() != chapter.getChapterID()}">
                                                <option value="/MangaUniverse/ViewChapterDetail?action=read-chapter&mangaID=${mangaDetail.getMangaID()}&chapterID=${chapter.getChapterID()}">${chapter.getTitle()} - ${chapter.getDescription()}</option>
                                            </c:if>
                                        </c:forEach>

                                    </select>

                                </div>
                                <div class="col-lg-6 mb-30 mt-30">
                                    <div class="manga_info">
                                        <ul>
                                            <li class="d-flex flex-wrap watch justify-content-end">
                                                <a class="mr-2" href="javascript:navigateChapters(-1)"><i class="fa-solid fa-arrow-left"></i> Prev</a>
                                                <a href="javascript:navigateChapters(1)">Next <i class="fa-solid fa-arrow-right"></i></a>
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
                                    <div class="comment_area mb-50 clearfix">

                                        <!--                                        <div class="fb-comments" data-href="chapter.jsp" 
                                                                                 data-width="856" data-numposts="5"></div>-->

                                        <!--                                        <div class="fb-comments" data-href="https://developers.facebook.com/docs/plugins/comments#configurator" 
                                                                                     data-width="700" data-numposts="5"></div>-->

                                        <div class="fb-comments" data-href="chapter.jsp?mangaID=${mangaDetail.getMangaID()}&chapterID=${chapterToView.getChapterID()}" 
                                             data-width="700" data-numposts="5"></div>
<!--                                        <div class="fb-comments" data-href="http://localhost:8080/MangaUniverse/chapter/chapter.jsp?mangaID=${mangaDetail.getMangaID()}&chapterID=${chapterToView.getChapterID()}" 
                                             data-width="700" data-numposts="5"></div>-->
                                    </div>

                                    <!-- Comments Area -->
                                    <!--                                    <div class="comment_area mb-50 clearfix">
                                                                            <h5 class="title">12 Comments</h5>
                                    
                                                                            <ol>
                                                                                 Single Comment Area 
                                                                                <li class="single_comment_area">
                                                                                     Comment Content 
                                                                                    <div class="comment-content d-flex">
                                                                                         Comment Author 
                                                                                        <div class="comment-author">
                                                                                            <img class="w-100 img-fluid"
                                                                                                 src="https://yae.hifive03.com/assets/img/comment/comment_1.png"
                                                                                                 alt="author">
                                                                                        </div>
                                                                                         Comment Meta 
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
                                                                                             Comment Content 
                                                                                            <div class="comment-content d-flex">
                                                                                                 Comment Author 
                                                                                                <div class="comment-author">
                                                                                                    <img class="w-100 img-fluid"
                                                                                                         src="https://yae.hifive03.com/assets/img/comment/comment_2.png"
                                                                                                         alt="author">
                                                                                                </div>
                                                                                                 Comment Meta 
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
                                    
                                                                                 Single Comment Area 
                                                                                <li class="single_comment_area">
                                                                                     Comment Content 
                                                                                    <div class="comment-content d-flex">
                                                                                         Comment Author 
                                                                                        <div class="comment-author">
                                                                                            <img class="w-100 img-fluid"
                                                                                                 src="https://yae.hifive03.com/assets/img/comment/comment_4.png"
                                                                                                 alt="author">
                                                                                        </div>
                                                                                         Comment Meta 
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
                                                                                 Single Comment Area 
                                                                                <li class="single_comment_area">
                                                                                     Comment Content 
                                                                                    <div class="comment-content d-flex">
                                                                                         Comment Author 
                                                                                        <div class="comment-author">
                                                                                            <img class="w-100 img-fluid"
                                                                                                 src="https://yae.hifive03.com/assets/img/comment/comment_3.png"
                                                                                                 alt="author">
                                                                                        </div>
                                                                                         Comment Meta 
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
                                                                        </div>-->

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

                            <!--                            <div class="row">
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
                                                        </div>-->
                        </div>
                    </section>
                    <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                        commentbox End
        >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
                </div>
            </section>
        </main> 

        <script src="../assetsMain/js/jquery.watermark.min.js"></script>
        <script>
                                                $(function () {
                                                    $('img.watermark_image').watermark({
                                                        path: '../assetsMain/img/logo.png',
                                                        textWidth: 300,
                                                        gravity: 'se',
                                                        opacity: 0.6,
                                                        margin: 12,
                                                        textSize: 20
                                                    });
                                                });

                                                function handleSelect(elm) {
                                                    window.location = elm.value; // Redirect to the selected URL
                                                }

                                                // Get a list of all options in the select element
                                                var options = document.querySelectorAll('select option');

                                                // Get the index of the currently selected option (the current chapter)
                                                var currentIndex = 0;
                                                for (var i = 0; i < options.length; i++) {
                                                    if (options[i].selected) {
                                                        currentIndex = i;
                                                        break;
                                                    }
                                                }

                                                // Starting from the current option, update the index and navigate
                                                function navigateChapters(direction) {
                                                    currentIndex += direction;
                                                    if (currentIndex < 0) {
                                                        currentIndex = 0; // Ensure it cannot go back before the first chapter
                                                    }
                                                    if (currentIndex >= options.length) {
                                                        currentIndex = options.length - 1; // Ensure it cannot go forward beyond the last chapter
                                                    }

                                                    var nextOption = options[currentIndex];
                                                    if (nextOption) {
                                                        window.location = nextOption.value;
                                                    }
                                                }
        </script>



        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                class="bi bi-arrow-up-short"></i></a>

        <div id="fb-root"></div>
        <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v18.0&appId=658565436099843" 
        nonce="deUfXOoO"></script>

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