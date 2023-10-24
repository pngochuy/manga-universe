<%@page import="model.User"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<%

    if (session.getAttribute("userSession") == null) {
        response.sendRedirect("login.jsp");
    } else {
        User userSession = (User) session.getAttribute("userSession");
        String author = userSession.getUsername();
        request.setAttribute("authorName", author);
    }


%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Add new Manga</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="assetsUser/img/logo.png" rel="icon">
        <link href="assetsUser/img/logo.png" rel="apple-touch-icon">

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

        <!-- Template Main CSS File -->
        <link href="assetsUser/css/style.css" rel="stylesheet">


    </head>

    <body>

        <%@include file="layouts/layoutUser/headerUser.jsp" %> 
        <%@include file="layouts/layoutUser/sidebarUser.jsp" %>

        <main id="main" class="main">

            <div class="pagetitle">

                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="home.jsp">Home</a></li>
                        <li class="breadcrumb-item"><a href="home.jsp">User</a></li>
                        <li class="breadcrumb-item"><a href="addManga.jsp">Add Manga</a></li>
                    </ol>
                </nav>
            </div><!-- End Page Title -->

            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">

                            <div class="card-body card-title">
                                <h5 class="card-title">Your New Manga</h5>

                                <hr>

                                <c:if test="${sessionScope.userSession == null}">   
                                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                        <i class="bi bi-exclamation-octagon me-1"></i>
                                        Please fill in your personal information to access features!
                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                    </div>
                                </c:if> 
                                <c:if test="${sessionScope.userSession != null}">
                                    <% User u2 = (User) session.getAttribute("userSession");%>
                                    <% if (u2.getRole().equalsIgnoreCase("Free") || u2.getRole().equalsIgnoreCase("Premium")) {%>
                                    <div class="alert alert-warning bg-warning border-0 alert-dismissible fade show" role="alert">
                                        You have no permission to Add Manga! If you want to be an Author, please click <a href="registerAuthor.jsp">here</a> to register
                                        an author!
                                        <!--<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>-->
                                    </div>

                                    <% }%>
                                    <% if (u2.getRole().equalsIgnoreCase("Author")) {%>

                                    <form action="AddMangaServlet" method="POST" accept-charset="" enctype="multipart/form-data" accept-charset="UTF-8">
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-3 text-right">
                                                    <label class="control-label" for="Title">Title</label>
                                                    <span class="text-error">(*)</span>
                                                </div>
                                                <div class="col-sm-9">
                                                    <input class="form-control url-create" data-val="true" id="Title" name="title" placeholder="Input text" type="text" value="${titleValue}">
                                                    <c:if test="${titleError != null}">
                                                        <small class="small" style="color: red;">${titleError}</small> 
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-3 text-right">
                                                    <label class="control-label" for="Author">Author</label>
                                                    <span class="text-error">(*)</span>
                                                </div>
                                                <div class="col-sm-9">
                                                    <input class="form-control url-create" data-val="true" id="Author" name="author" type="text" value="${authorName}" readonly="">
                                                    <c:if test="${authorError != null}">
                                                        <small class="small" style="color: red;">${authorError}</small> 
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <label for="postImage" class="col-md-4 col-lg-3 col-form-label">Cover Image <span class="text-error">(*)</span></label>
                                                <div class="col-md-8 col-lg-9" id="divSvgContainer">

                                                    <img id="imagePreview" src="${coverUrlValue != null ? coverUrlValue : 'assetsUser/img/no_image.jpg'}" alt="Post Image">

                                                    <div class="pt-2 d-flex align-center gap-2">
                                                        <input type="file" name="postImage" id="postImage" style="display: none;" accept="image/*">

                                                        <label id="uploadButton" for="postImage" class="btn btn-primary btn-sm" title="Upload new post image"><i
                                                                class="bi bi-upload text-white"></i></label>

                                                        <a href="#" class="btn btn-danger btn-sm" title="Remove my post image" id="removeImage"><i
                                                                class="bi bi-trash"></i></a>
                                                        <div id="spinnerUpload" class="spinner-border text-success" role="status" style="display: none;">
                                                            <span class="visually-hidden">Loading...</span>
                                                        </div>
                                                    </div>
                                                    <c:if test="${coverUrlError != null}">
                                                        <small class="small" style="color: red;">${coverUrlError}</small> 
                                                    </c:if>

                                                </div>
                                                <input type="hidden" name="coverUrl" id="coverUrl" value="${coverUrlValue}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-3 text-right">
                                                    <label class="control-label" for="Category">Category</label>
                                                    <span class="text-error">(*)</span>
                                                </div>
                                                <div class="col-sm-9">
                                                    <input class="form-control url-create" data-val="true" id="Category" name="category" placeholder="Choose Category" type="text" value="${categoryValue}">
                                                    <c:if test="${categoryError != null}">
                                                        <small class="small" style="color: red;">${categoryError}</small> 
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-3 text-right">
                                                    <label class="control-label" for="Summary">Summary</label>
                                                    <span class="text-error">(*)</span>
                                                </div>
                                                <div class="col-sm-9">
                                                    <textarea class="form-control" placeholder="Content" rows="10" name="summary">${summaryValue}</textarea>
                                                    <c:if test="${summaryError != null}">
                                                        <small class="small" style="color: red;">${summaryError}</small> 
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group-update">
                                            <div class="row">
                                                <div class="col-sm-3 text-right">
                                                </div>
                                                
                                                <div class="col-sm-9">
                                                    <button id="submitButton" type="submit" class="btn btn-primary">Add</button>
                                                    <c:if test="${messageAdd != null}">
                                                        <br/>
                                                        <small class="small" style="color: green;">${messageAdd}</small> 
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </form>

                                    <% }%>
                                </c:if>


                            </div>
                        </div>
                    </div>

                </div>


                </div>
            </section>

        </main><!-- End #main -->



        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                class="bi bi-arrow-up-short"></i></a>


        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const fileInput = document.getElementById("postImage");
                const imagePreview = document.getElementById("imagePreview");
                const removeImage = document.getElementById("removeImage");
                const coverUrl = document.getElementById("coverUrl");
                const submitButton = document.getElementById("submitButton");
                const uploadButton = document.getElementById("uploadButton");
                const spinnerUpload = document.getElementById("spinnerUpload");


                let isImageSelected = false;

                uploadButton.addEventListener("click", function () {
                    fileInput.addEventListener("change", function (changeEvent) {
                        updateSubmitButtonState();
                        updateSpinnerUploadState();
                        const file = changeEvent.target.files[0];
                        if (file) {
                            const formData = new FormData();
                            formData.append("file", file);
                            formData.append("upload_preset", "demo_manga");

                            fetch("https://api.cloudinary.com/v1_1/djytvqlon/image/upload", {
                                method: "POST",
                                body: formData,
                            })
                                    .then((response) => response.json())
                                    .then((data) => {

                                        // updateSpinnerUploadState();
                                        imagePreview.src = data.url;
                                        coverUrl.value = data.url;
                                        isImageSelected = true;
                                        updateSpinnerUploadState();
                                        updateSubmitButtonState();
                                    })
                                    .catch((error) => {
                                        console.error("Error:", error);
                                    });
                        }
                    });


                });

                removeImage.addEventListener("click", function () {
                    imagePreview.src = "assetsUser/img/no_image.jpg";
                    coverUrl.value = "";
                    fileInput.value = "";
                    isImageSelected = true;
                    updateSubmitButtonState();

                });

                function updateSubmitButtonState() {
                    if (isImageSelected) {
                        submitButton.removeAttribute("disabled");
                    } else {
                        submitButton.setAttribute("disabled", "disabled");
                    }
                }
                function updateSpinnerUploadState() {
                    if (isImageSelected) {
                        spinnerUpload.style.display = "none";
                    } else {
                        spinnerUpload.style.display = "inline-block";
                    }
                }
            });

        </script>

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