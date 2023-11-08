<%@page import="java.time.LocalDateTime"%>
<%@page import="model.UserRegister"%>
<%@page import="model.User"%>
<%@page import="dal.UserDAO"%>
<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="dal.DBContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%

    if (session.getAttribute("userSession") == null) {
        response.sendRedirect("login.jsp");
    } else {
        User userSession = (User) session.getAttribute("userSession");
        if (!userSession.getUsername().equals("admin")) {
            response.sendRedirect("login.jsp");
        }
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
        <%!
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
        %>

        <main id="main" class="main">

            <div class="pagetitle">
                <h1>Author Verify</h1>
                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                        <li class="breadcrumb-item">Pages</li>
                        <li class="breadcrumb-item active">Author Verify</li>
                    </ol>
                </nav>
            </div><!-- End Page Title -->

            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Verify Table</h5>
                                <!-- Table with stripped rows -->
                                <table class="table datatable">
                                    <thead>
                                        <tr>
                                            <th scope="col">Time</th>
                                            <th scope="col">Account Name</th>
                                            <th scope="col">View</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            DBContext dbContext = new DBContext();
                                            con = dbContext.connection;
                                            String sql = "select * from VerifyUser";
                                            ps = con.prepareStatement(sql);
                                            rs = ps.executeQuery();
                                            while (rs.next()) {
                                        %>
                                        <tr>
                                            <td><%=rs.getTimestamp(1)%></td>
                                            <td><%=rs.getString(3)%></td>
                                            <td>
                                                
                                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalDialogScrollable<%=rs.getInt(2)%>">
                                                    View
                                                </button>
                                                <div class="modal fade" name="userID" id="modalDialogScrollable<%=rs.getInt(2)%>" tabindex="-1">
                                                    <div class="modal-dialog modal-dialog-scrollable">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title">Author information</h5>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <form>
                                                                    <div class="mb-3">
                                                                        <div class="mb-3">
                                                                            <h5>File</h5>
                                                                            <img src="<%=rs.getString(4)%>" alt="alt"/>

                                                                            <hr>
                                                                            <div class="mb-3">
                                                                                <h5>Author description</h5>
                                                                                <p><%=rs.getString(5)%></p>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div><!-- End Modal Dialog Scrollable-->
                                            </td>

                                            <td>
                                                <form action="UpgradeToAuthorServlet" method="post">
                                                    <input type="hidden" name="userID" value="<%=rs.getInt(2)%>">
                                                    <button type="submit" class="btn btn-success" name="action" value="approve">Approve</button>
                                                    <button type="submit" class="btn btn-danger" name="action" value="reject">Reject</button>
                                                </form>
                                            </td>


                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>

                                <!-- End Table with stripped rows -->

                            </div>
                        </div>

                    </div>
                </div>
            </section>

        </main><!-- End #main -->

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

</body>

</html>