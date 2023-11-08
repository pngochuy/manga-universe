<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css' rel='stylesheet'>
        <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <title>New Password</title>
        <link
            href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css'
            rel='stylesheet'>
        <script type='text/javascript'
        src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <style>
            .placeicon {
                font-family: fontawesome
            }

            .custom-control-label::before {
                background-color: #dee2e6;
                border: #dee2e6
            }
        </style>
        <style>
            body {
                background-color: #ffcc00; /* Màu nền màu vàng */
                color: #505050;
                font-family: "Rubik", Helvetica, Arial, sans-serif;
                font-size: 14px;
                font-weight: normal;
                line-height: 1.5;
                text-transform: none;
            }

            .forgot {
                background-color: #fff;
                padding: 12px;
                border: 1px solid #dfdfdf;
                border-radius: 10px; /* Border tròn */
            }

            .forgot h2 {
                font-weight: bold;
            }

            .padding-bottom-3x {
                padding-bottom: 72px !important;
            }

            .card-footer {
                background-color: #fff;
            }

            .btn {
                font-size: 13px;
            }

            .form-control:focus {
                color: #495057;
                background-color: #fff;
                border-color: #76b7e9;
                outline: 0;
                box-shadow: 0 0 0 0px #28a745;
            }
        </style>

    </head>

    <!--
    No Inspect (prevent right mouse menu, oncontextmenu='return false'), 
    No Select Text (onmousedown='return false'), 
    No F12 (onkeydown='return false'),
    ... to security
    -->
    <body oncontextmenu='return false' class='snippet-body bg-info'>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.css">
        <div class="container">
            <!-- Outer Row -->
            <div class="row justify-content-center">
                <div class="col-xl-10 col-lg-12 col-md-9">
                    <div class="card o-hidden border-0 shadow-lg my-5">
                        <div class="card-body p-0">
                            <!-- Nested Row within Card Body -->
                            <div class="row">
                                <div class="col-lg-6 d-none d-lg-block bg-password-image">
                                    <img class="w-100 img-fluid" src="http://res.cloudinary.com/djytvqlon/image/upload/v1696507608/t6plxvqducox94cokk90.jpg" alt="">
                                </div>
                                <div class="col-lg-6">
                                    <!-- White Container -->
                                    <div class="container bg-white rounded mt-2 mb-2 px-0">
                                        <!-- Main Heading -->
                                        <div class="row justify-content-center align-items-center pt-3">
                                            <h1>
                                                <strong>Reset Password</strong>
                                            </h1>
                                        </div>
                                        <div class="pt-3 pb-3">
                                            <form class="form-horizontal" action="NewPasswordServlet" method="POST">
                                                <!-- User Name Input -->
                                                <div class="form-group row justify-content-center px-3">
                                                    <div class="col-9 px-0">
                                                        <input type="text" name="password" placeholder="&#xf084; &nbsp; New Password"
                                                               class="form-control border-info placeicon">
                                                    </div>
                                                </div>
                                                <!-- Password Input -->
                                                <div class="form-group row justify-content-center px-3">
                                                    <div class="col-9 px-0">
                                                        <input type="password" name="confPassword"
                                                               placeholder="&#xf084; &nbsp; Confirm New Password"
                                                               class="form-control border-info placeicon">
                                                    </div>
                                                </div>

                                                <!-- Log in Button -->
                                                <div class="form-group row justify-content-center">
                                                    <div class="col-3 px-3 mt-3">
                                                        <input type="submit" value="Reset"
                                                               class="btn btn-block btn-info">
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <!-- Alternative Login -->
                                        <div class="mx-0 px-0 bg-light">
                                           <!-- Horizontal Line -->
                                            <!-- Register Now -->

                                            <hr>
                                            <div class="text-center">
                                                <a class="small" href="register.html">Create an Account!</a>
                                            </div>
                                            <div class="text-center">
                                                <a class="small" href="login.html">Already have an account? Login!</a>
                                            </div>

                                            <div
                                                class="row justify-content-center align-items-center pt-4 pb-5">
                                                <div class="col-4">

                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>
        <script type='text/javascript'
        src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>

    </body>

</html>