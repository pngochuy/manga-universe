<%@page import="java.time.LocalDateTime"%>
<%@page import="model.UserRegister"%>
<%@page import="model.User"%>
<%@page import="model.Report"%>
<%@page import="dal.UserDAO"%>
<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- Include jQuery library -->

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%

    if (session.getAttribute("userSession") == null) {
        response.sendRedirect("login.jsp");
    }


%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
    </head>

    <body>
        <%@include file="layouts/layoutsAdmin/headerAdmin.jsp" %> 
        <%@include file="layouts/layoutsAdmin/sidebarAdmin.jsp" %> 

        <main id="main" class="main">

            <div class="pagetitle">
                <h1>Dashboard</h1>
                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="home.jsp">Home</a></li>
                        <li class="breadcrumb-item ">Dashboard</li>
                        <li class="breadcrumb-item active">List Report</li>
                    </ol>
                </nav>
            </div><!-- End Page Title -->

            <section class="section dashboard">
                <div class="row">
                    <!-- Report -->
                    <div class="free-account premium-account author-account">
                        <div class="col-12">
                            <section class="section dashboard">
                                <div class="row">
                                    <!-- Report -->
                                    <div class="col-12">
                                        <div class="card top-selling overflow-auto">

                                            <div class="filter">
                                                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                                    <li class="dropdown-header text-start">
                                                        <h6></h6>
                                                    </li>
                                                    
                                                </ul>
                                            </div>

                                            <div class="card-body pb-0">
                                                <h5 class="card-title">List Report <span></span></h5>

                                                <table class="table table-bordered table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">User ID</th>
                                                            <th scope="col">Manga ID</th>
                                                            <th scope="col">Reason</th>
                                                            <th scope="col">Time Report</th>
                                                            <th scope="col">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                                            Connection connection = null; // Thiết lập kết nối cơ sở dữ liệu ở đây
                                                            try {
                                                                UserDAO userDAO = new UserDAO();
                                                                List<Report> userrp = userDAO.getReportData();
                                                                for (Report a : userrp) {
                                                        %>
                                                        <tr class="<%= a.getReportID()%>">
                                                            <td><%= a.getUserID()%></td>
                                                            <td><%= a.getMangaID()%></td>
                                                            <td><%= a.getReason()%></td>
                                                            <td><%= a.getDateofreportFormat()%></td>
                                                            <td>
                                                                <a class="btn btn-success" href="AcceptReport?mangaID=<%= a.getReportID()%>">Approve</a>
                                                                <a class="btn btn-danger" href="RejectReport?reportID=<%= a.getReportID()%>">Reject</a>
                                                            </td>
                                                        </tr>
                                                        <%
                                                                }
                                                            } catch (Exception e) {
                                                                e.printStackTrace();
                                                            } finally {
                                                                // Đảm bảo đóng kết nối sau khi hoàn thành
                                                                try {
                                                                    if (connection != null) {
                                                                        connection.close();
                                                                    }
                                                                } catch (SQLException e) {
                                                                    e.printStackTrace();
                                                                }
                                                            }
                                                        %>
                                                    </tbody>
                                                </table>

                                            </div>

                                        </div>
                                    </div><!-- Report -->
                                </div>
                            </section>
                        </div>
                    </div>                                             

                  


            </section>

        </main><!-- End #main -->

        <!-- ======= Footer ======= -->
        <footer id="footer" class="footer">
            <div class="copyright">
                &copy; Copyright <strong><span>MangaUniverse</span></strong>. All Rights Reserved
            </div>
            <div class="credits">
                <!-- All the links in the footer should remain intact. -->
                <!-- You can delete the links only if you purchased the pro version. -->
                <!-- Licensing information: https://bootstrapmade.com/license/ -->
                <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->

            </div>
        </footer><!-- End Footer -->

        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

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
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>

</html>