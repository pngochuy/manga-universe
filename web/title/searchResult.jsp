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
        <link href="${pageContext.request.contextPath}/assetsMain/img/logo.png" rel="icon">
        <link href="${pageContext.request.contextPath}/assetsMain/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.gstatic.com" rel="preconnect">
        <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
            rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="${pageContext.request.contextPath}/assetsMain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assetsMain/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assetsMain/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assetsMain/vendor/quill/quill.snow.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assetsMain/vendor/quill/quill.bubble.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assetsMain/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assetsMain/vendor/simple-datatables/style.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="${pageContext.request.contextPath}/assetsMain/css/style.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <style>
            .form-control-borderless {
                border: none;
            }

            .form-control-borderless:hover, .form-control-borderless:active, .form-control-borderless:focus {
                border: none;
                outline: none;
                box-shadow: none;
            }
            .custom-control-label-container {
                width: 100%;
                padding: 5px;
                border-radius: 10px;
                cursor: pointer;
            }
            .custom-control-label-container span {
                font-size: 18px;
            }
            .custom-control-label-container:hover {
                background-color: #aab7cf;
            }

        </style>

    </head>

    <body>

<!--        <%@include file="../layouts/layoutsMain/headerMain.jsp" %> 
        <%@include file="../layouts/layoutsMain/sidebarMain.jsp" %> -->

        <main id="main" class="main">
            <section class="section profile">
                <div class="row">
                    <!-- ======= Filter Area Start ======= -->
                    <section class="filter sec-mar">
                        <div class="container">
                            <div class="heading style-1">
                                <h2>Search Manga <span> <a class="active"><i class="bi bi-grid"></i></a> <a
                                            href="./list-view.jsp" class="ms-2 me-2"><i
                                                class="fa fa-solid fa-list"></i></a> Showing 3 out of 5000
                                        Manga</span></h2>
                            </div>
                            
                            <div class="container">
                                <div class="row justify-content-center">
                                    <div class="col-12 col-md-10 col-lg-8">
                                        <form class="card card-sm" action="../SearchController?index=1" method="post">
                                            
                                            <div class="card-body row no-gutters align-items-center" style="padding: 20px;">
                                                <div class="col-auto">
                                                    <i class="bi bi-search-heart" style="font-size: 30px"></i>
                                                </div>
                                                <!--end of col-->
                                                <div class="col">
                                                    <input value="${save}" name="txtSearch" class="form-control form-control-lg form-control-borderless" type="search" placeholder="Search topics or keywords">
                                                </div>
                                                <!--end of col-->
                                                <div class="col-auto">
                                                    <button class="btn btn-lg btn-success" type="submit">Search</button>
                                                </div>
                                                <!--end of col-->
                                            </div>
                                        </form>
                                    </div>
                                    <!--end of col-->
                                </div>
                            </div>

                            <ul class="filter-block style-2">
                                <li>
                                    <a href="#" class="anime-btn btn-dark dropdown-toggle" id="genre"
                                       data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
                                        Category <span><i class="fa fa-chevron-down"></i></span>
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="genre">
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <div class="custom-control-label-container">
                                                    <span class="custom-control-label" >Action</span>
                                                </div>

                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <div class="custom-control-label-container">
                                                    <span class="custom-control-label" >Action</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <div class="custom-control-label-container">
                                                    <span class="custom-control-label" >Action</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <div class="custom-control-label-container">
                                                    <span class="custom-control-label" >Action</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <div class="custom-control-label-container">
                                                    <span class="custom-control-label" >Action</span>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </li>

                                <!--dùng JS de du doan mua trong nam theo thang-->
                                <li>
                                    <a href="#" class="anime-btn btn-dark dropdown-toggle" id="season"
                                       data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
                                        Season <span><i class="fa fa-chevron-down"></i></span>
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="season">
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <div class="custom-control-label-container">
                                                    <span class="custom-control-label" >Fall</span>
                                                </div>
                                            </div>
                                            <div class="custom-control custom-checkbox">
                                                <div class="custom-control-label-container">
                                                    <span class="custom-control-label" >Summer</span>
                                                </div>
                                            </div>
                                            <div class="custom-control custom-checkbox">
                                                <div class="custom-control-label-container">
                                                    <span class="custom-control-label" >Winter</span>
                                                </div>
                                            </div>
                                            <div class="custom-control custom-checkbox">
                                                <div class="custom-control-label-container">
                                                    <span class="custom-control-label" >Spring</span>
                                                </div>
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
                                                <div class="custom-control-label-container">
                                                    <span class="custom-control-label" >2023</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <div class="custom-control-label-container">
                                                    <span class="custom-control-label" >2022</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <div class="custom-control-label-container">
                                                    <span class="custom-control-label" >2021</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <div class="custom-control-label-container">
                                                    <span class="custom-control-label" >2020</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <div class="custom-control-label-container">
                                                    <span class="custom-control-label" >2019</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <div class="custom-control-label-container">
                                                    <span class="custom-control-label" >< 2019</span>
                                                </div>
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
                                                <div class="custom-control-label-container">
                                                    <span class="custom-control-label" >Not Yet Released</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <div class="custom-control-label-container">
                                                    <span class="custom-control-label" >Releasing</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <div class="custom-control-label-container">
                                                    <span class="custom-control-label" >Completed</span>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#" class="anime-btn btn-dark dropdown-toggle" id="user"
                                       data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
                                        Users <span><i class="fa fa-chevron-down"></i></span>
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="user">
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <div class="custom-control-label-container">
                                                    <span class="custom-control-label" >Free</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <div class="custom-control-label-container">
                                                    <span class="custom-control-label" >Premium <i class="bi bi-star-fill" style="color: gold;"></i></span>
                                                </div>
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
                                                <div class="custom-control-label-container">
                                                    <span class="custom-control-label" >Title Ascending</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <div class="custom-control-label-container">
                                                    <span class="custom-control-label" >Title Descending</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <div class="custom-control-label-container">
                                                    <span class="custom-control-label" >Recently Added</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-checkbox">
                                                <div class="custom-control-label-container">
                                                    <span class="custom-control-label" >Oldest Added</span>
                                                </div>
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
                            <h2 class="fw-bold">Manga Found</h2>
                            <div class="row mt-2">

                             <c:forEach var="s" items="${listSM}" varStatus="loop"> 
                                 
                                    <div class="col-lg-2 col-md-4 col-sm-6">
                                        <a href="mangaSPServlet?id=${s.mangaID}">
                                            <div class="product-card grow-box">
                                                <div class="img-con set-bg"
                                                     style="background-image: url('${s.coverImage}');"
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
                                                    <h5>${s.title}</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                  </c:forEach> 
                                

                            </div>
                        </div>
                    </div>

                    <div class="pagination-wrape">
                        <ul class="pagination">
                            <c:if test ="${tag > 1}">
                            <li class="page-item">
                                <a href="SearchController?index=${tag-1}&txtSearch=${save}" class="page-link arrow" aria-label="Previous">
                                    <i class="bi bi-caret-left-fill"></i>
                                </a>
                            </li>
                            </c:if>
                            <c:forEach var="j" begin="1" step="1" end="${endS}">  
                            <li class="page-item">
                                <a href="SearchController?index=${j}&txtSearch=${save}" class="${tag == j?"active":""} page-link current">${j}</a>
                            </li>
                            </c:forEach>
                            <c:if test ="${tag < endS}">
                            <li class="page-item">
                                <a href="SearchController?index=${tag+1}&txtSearch=${save}" class=" page-link arrow" aria-label="next">
                                    <i class="bi bi-caret-right-fill"></i>
                                </a>
                            </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </section>
        </main>




        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                class="bi bi-arrow-up-short"></i></a>

        <!-- Vendor JS Files -->
        <script src="${pageContext.request.contextPath}/assetsMain/vendor/apexcharts/apexcharts.min.js"></script>
        <script src="${pageContext.request.contextPath}/assetsMain/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/assetsMain/vendor/chart.js/chart.umd.js"></script>
        <script src="${pageContext.request.contextPath}/assetsMain/vendor/echarts/echarts.min.js"></script>
        <script src="${pageContext.request.contextPath}/assetsMain/vendor/quill/quill.min.js"></script>
        <script src="${pageContext.request.contextPath}/assetsMain/vendor/simple-datatables/simple-datatables.js"></script>
        <script src="${pageContext.request.contextPath}/assetsMain/vendor/tinymce/tinymce.min.js"></script>
        <script src="${pageContext.request.contextPath}/assetsMain/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="${pageContext.request.contextPath}/assetsMain/js/main.js"></script>
    </body>

</html>