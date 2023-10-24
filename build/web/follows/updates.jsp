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

        <%@include file="../layouts/layoutsMain/headerMain.jsp" %> 
        <%@include file="../layouts/layoutsMain/sidebarMain.jsp" %> 

        <main id="main" class="main">
            <section class="section profile">
                <div class="row">
                    <div class="mb-5">
                        <div class="title">
                            <h2 class="fw-bold">Updates</h2>
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