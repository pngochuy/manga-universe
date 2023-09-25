<%-- 
    Document   : homepage
    Created on : Sep 23, 2023, 2:09:51 AM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Manga Reader</title>

    <!-- css files -->
    <link rel="stylesheet" href="homepage-css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.10.2/css/all.css">
    <link rel="stylesheet" href="homepage-css/main.css">
</head>

<body>
    <!-- start navbar -->
    <nav class="navbar navbar-expand-lg navbar-light shadow py-2 py-sm-0">
        <a class="navbar-brand" href="#">
            <!-- <h5>Manga Universe</h5> -->
            <img src="homepage-img/CompressJPEG.online_512x512_image-removebg-preview.png" alt="" height="100" width="100
            ">
        </a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="container-fluid">
                <div class="row py-3">
                    <div class="col-lg-6 col-sm-12 mb-3 mb-sm-0">
                        <ul class="navbar-nav mr-auto">
                            <!-- always use single word for li -->
                            <li class="nav-item active">
                                <a class="nav-link" href="homepage.jsp">Home<span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">New</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Populer</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Browse
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="forums.jsp">Forum</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col">
                        <form class="form-inline search">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Type Title, auther or genre"
                                    aria-label="Type Title, auther or genre">
                                <div class="input-group-append">
                                    <button class="btn btn-outline-secondary" type="button"><i
                                            class="fa fa-search"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="profile float-right">
            <div class="saved">
                <button class="btn" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
                    aria-expanded="false">
                    <i class="fa fa-bookmark fa-2x"></i>
                </button>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                    <a class="dropdown-item" href="#">
                        <div class="row">
                            <div class="col"><img src="homepage-img/cover1.jpg" width="50"></div>
                            <div class="col">
                                <h5>One piece 1</h5>
                                <small>Lastest <span>VOL. 11</span></small>
                            </div>
                        </div>
                    </a>
                    <a class="dropdown-item" href="#">
                        <div class="row">
                            <div class="col"><img src="homepage-img/cover1.jpg" width="50"></div>
                            <div class="col">
                                <h5>One piece 1</h5>
                                <small>Lastest <span>VOL. 11</span></small>
                            </div>
                        </div>
                    </a>
                    <hr>
                    <a class="dropdown-item" href="#">View all saved mangas (14)</a>
                </div>
            </div>
            <div class="account">
                <button class="btn" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
                    aria-expanded="false">
                    <i class="fa fa-user-circle fa-2x"></i><i class="fa fa-angle-down"></i>
                </button>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                    <a class="dropdown-item" href="#">My account</a>
                    <a class="dropdown-item" href="#">logout</a>
                </div>
            </div>
        </div>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    </nav>
    <!-- end navbar-->

    <!-- start slider -->
    <div class="mangaslider">
        <input type="radio" id="s-1" name="slider-control" checked="checked">
        <input type="radio" id="s-2" name="slider-control">
        <input type="radio" id="s-3" name="slider-control">
        <div class="js-slider">
            <figure class="js-slider_item img-1">
                <div class="js-slider_img">
                    <img class="c-img-w-full"
                        src="https://wallpapers.com/images/high/one-piece-pictures-sttm4i3gccsq45ca.webp" alt="">
                </div>
                <figcaption class="wo-caption">
                    <h3 class="wo-h3">
                        <div class="c-label">NEW</div>
                        <br class="view-sm mb-s">One piece
                    </h3>
                    <ul class="wo-credit">
                        <li><span class="tag">Action</span><span class="tag">Comedy</span></li>
                        <li>After her aptitude for healing magic was discovered, she decided to volunteer in the army as
                            a second-class medic, all to raise money for the orphanage where she was born and raised.
                            However, without even getting magic training, she was attached to an assault squad,
                            repeatedly fighting on the most cruel battlefields of the "Western Front."</li>
                        <li>Author:
                            <span class="c-txt-s">Shibano Nanao</span>
                        </li>
                    </ul>
                </figcaption>
            </figure>
            <figure class="js-slider_item img-2">
                <div class="js-slider_img">
                    <img class="c-img-h-full"
                        src="https://i.pinimg.com/564x/e2/0e/c8/e20ec8e1def9d80f9f227efca4e4065c.jpg" alt="">
                </div>
                <figcaption class="wo-caption">
                    <h3 class="wo-h3">Kimetsu no Yaiba</h3>
                    <ul class="wo-credit">
                        <li><span class="tag">Action</span><span class="tag">Comedy</span></li>
                        <li>After her aptitude for healing magic was discovered, she decided to volunteer in the army as
                            a second-class medic, all to raise money for the orphanage where she was born and raised.
                            However, without even getting magic training, she was attached to an assault squad,
                            repeatedly fighting on the most cruel battlefields of the "Western Front."</li>
                        <li>Author:
                            <span class="c-txt-s">Shibano Nanao</span>
                        </li>
                    </ul>
                </figcaption>
            </figure>
            <figure class="js-slider_item img-3">
                <div class="js-slider_img">
                    <img class="c-img-h-full"
                        src="https://i.pinimg.com/564x/e2/0e/c8/e20ec8e1def9d80f9f227efca4e4065c.jpg" alt="">
                </div>
                <figcaption class="wo-caption">
                    <h3 class="wo-h3">Kimetsu no Yaiba</h3>
                    <ul class="wo-credit">
                        <li><span class="tag">Action</span><span class="tag">Comedy</span></li>
                        <li>After her aptitude for healing magic was discovered, she decided to volunteer in the army as
                            a second-class medic, all to raise money for the orphanage where she was born and raised.
                            However, without even getting magic training, she was attached to an assault squad,
                            repeatedly fighting on the most cruel battlefields of the "Western Front."</li>
                        <li>Author:
                            <span class="c-txt-s">Shibano Nanao</span>
                        </li>
                    </ul>
                </figcaption>
            </figure>
            <div class="js-slider_nav">
                <label class="js-slider_nav_item s-nav-1 prev" for="s-3"></label>
                <label class="js-slider_nav_item s-nav-1 next" for="s-2"></label>
                <label class="js-slider_nav_item s-nav-2 prev" for="s-1"></label>
                <label class="js-slider_nav_item s-nav-2 next" for="s-3"></label>
                <label class="js-slider_nav_item s-nav-3 prev" for="s-2"></label>
                <label class="js-slider_nav_item s-nav-3 next" for="s-1"></label>
            </div>
            <div class="js-slider_indicator">
                <div class="js-slider-indi indi-1"></div>
                <div class="js-slider-indi indi-2"></div>
                <div class="js-slider-indi indi-3"></div>
            </div>
        </div>
    </div>
    <!-- end slider -->

    <!-- start lastest -->
    <div class="lastest container mt-4 mt-sm-5">
        <div class="row">
            <div class="col-lg-6">
                <h2 class="font-weight-bolder float-left">Lastest Manga Updates</h2>
            </div>
            <div class="col-lg-6">
                <ul class="calendar list-unstyled list-inline float-right font-weight-bold mt-3 mt-sm-0">
                    <li class="list-inline-item active">Today</li>
                    <li class="list-inline-item">Yesterday</li>
                    <li class="list-inline-item">Sun</li>
                    <li class="list-inline-item">Fri</li>
                    <li class="list-inline-item">Thur</li>
                    <li class="list-inline-item">Wed</li>
                </ul>
            </div>
        </div>

        <div class="posts row">
            <div class="col-lg-2 col-md-3 col-sm-4">
                <div class="card mb-3">
                    <a href="mangaDetails.jsp"><img src="homepage-img/cover1.jpg" class="card-img-top" alt=""></a>
                    <div class="over text-center">
                        <div class="head text-left">
                            <h6>One Piece</h6>
                        </div>
                        <div class="about-list">
                            <table class="table table-borderless">
                                <tbody>
                                    <tr>
                                        <th scope="row">Genre:</th>
                                        <td>Sport</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Artist:</th>
                                        <td>Jacob ZFCon</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Update:</th>
                                        <td>VOL. 125</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <p class="about text-muted">
                            efficitur eu tortor. Nam et odio aliquet.
                        </p>
                        <a class="reading btn" href="mangaDetails.jsp">Start reading VOL. 1</a>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title"><a href="mangaDetails.jsp">One Piece</a></h5>
                        <p class="card-text">CH. 2</p>
                        <p class="card-text"><small class="text-muted text-uppercase">Update 1 Hour ago</small></p>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-3 col-sm-4">
                <div class="card mb-3">
                    <a href="mangaDetails.jsp"><img src="homepage-img/cover1.jpg" class="card-img-top" alt=""></a>
                    <div class="over text-center">
                        <div class="head text-left">
                            <h6>One Piece</h6>
                        </div>
                        <div class="about-list">
                            <table class="table table-borderless">
                                <tbody>
                                    <tr>
                                        <th scope="row">Genre:</th>
                                        <td>Sport</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Artist:</th>
                                        <td>Jacob ZFCon</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Update:</th>
                                        <td>VOL. 125</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <p class="about text-muted">
                            efficitur eu tortor. Nam et odio aliquet.
                        </p>
                        <a class="reading btn" href="mangaDetails.jsp">Start reading VOL. 1</a>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title"><a href="mangaDetails.jsp">One Piece</a></h5>
                        <p class="card-text">CH. 2</p>
                        <p class="card-text"><small class="text-muted text-uppercase">Update 1 Hour ago</small></p>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-3 col-sm-4">
                <div class="card mb-3">
                    <a href="mangaDetails.jsp"><img src="homepage-img/cover1.jpg" class="card-img-top" alt=""></a>
                    <div class="over text-center">
                        <div class="head text-left">
                            <h6>One Piece</h6>
                        </div>
                        <div class="about-list">
                            <table class="table table-borderless">
                                <tbody>
                                    <tr>
                                        <th scope="row">Genre:</th>
                                        <td>Sport</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Artist:</th>
                                        <td>Jacob ZFCon</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Update:</th>
                                        <td>VOL. 125</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <p class="about text-muted">
                            efficitur eu tortor. Nam et odio aliquet.
                        </p>
                        <a class="reading btn" href="mangaDetails.jsp">Start reading VOL. 1</a>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title"><a href="mangaDetails.jsp">One Piece</a></h5>
                        <p class="card-text">CH. 2</p>
                        <p class="card-text"><small class="text-muted text-uppercase">Update 1 Hour ago</small></p>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-3 col-sm-4">
                <div class="card mb-3">
                    <a href="mangaDetails.jsp"><img src="homepage-img/cover1.jpg" class="card-img-top" alt=""></a>
                    <div class="over text-center">
                        <div class="head text-left">
                            <h6>One Piece</h6>
                        </div>
                        <div class="about-list">
                            <table class="table table-borderless">
                                <tbody>
                                    <tr>
                                        <th scope="row">Genre:</th>
                                        <td>Sport</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Artist:</th>
                                        <td>Jacob ZFCon</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Update:</th>
                                        <td>VOL. 125</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <p class="about text-muted">
                            efficitur eu tortor. Nam et odio aliquet.
                        </p>
                        <a class="reading btn" href="mangaDetails.jsp">Start reading VOL. 1</a>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title"><a href="mangaDetails.jsp">One Piece</a></h5>
                        <p class="card-text">CH. 2</p>
                        <p class="card-text"><small class="text-muted text-uppercase">Update 1 Hour ago</small></p>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-3 col-sm-4">
                <div class="card mb-3">
                    <a href="mangaDetails.jsp"><img src="homepage-img/cover1.jpg" class="card-img-top" alt=""></a>
                    <div class="over text-center">
                        <div class="head text-left">
                            <h6>One Piece</h6>
                        </div>
                        <div class="about-list">
                            <table class="table table-borderless">
                                <tbody>
                                    <tr>
                                        <th scope="row">Genre:</th>
                                        <td>Sport</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Artist:</th>
                                        <td>Jacob ZFCon</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Update:</th>
                                        <td>VOL. 125</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <p class="about text-muted">
                            efficitur eu tortor. Nam et odio aliquet.
                        </p>
                        <a class="reading btn" href="mangaDetails.jsp">Start reading VOL. 1</a>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title"><a href="mangaDetails.jsp">One Piece</a></h5>
                        <p class="card-text">CH. 2</p>
                        <p class="card-text"><small class="text-muted text-uppercase">Update 1 Hour ago</small></p>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-3 col-sm-4">
                <div class="card mb-3">
                    <a href="mangaDetails.jsp"><img src="homepage-img/cover1.jpg" class="card-img-top" alt=""></a>
                    <div class="over text-center">
                        <div class="head text-left">
                            <h6>One Piece</h6>
                        </div>
                        <div class="about-list">
                            <table class="table table-borderless">
                                <tbody>
                                    <tr>
                                        <th scope="row">Genre:</th>
                                        <td>Sport</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Artist:</th>
                                        <td>Jacob ZFCon</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Update:</th>
                                        <td>VOL. 125</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <p class="about text-muted">
                            efficitur eu tortor. Nam et odio aliquet.
                        </p>
                        <a class="reading btn" href="mangaDetails.jsp">Start reading VOL. 1</a>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title"><a href="mangaDetails.jsp">One Piece</a></h5>
                        <p class="card-text">CH. 2</p>
                        <p class="card-text"><small class="text-muted text-uppercase">Update 1 Hour ago</small></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end lastest -->

    <!-- start footer -->
    <c:import url="footer.jsp"></c:import>
    <footer>
        <div class="container py-4">
            <span class="copyright">&copy; 2023 Manga Universe</span>
            <span class="design float-right">Designed by Group 3</span>
        </div>
    </footer>
    <!-- end footer -->

    <!-- js files -->
    <script src="homepage-js/jquery-3.4.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="homepage-js/bootstrap.min.js"></script>
    <script src="homepage-js/main.js"></script>
</body>

</html>
