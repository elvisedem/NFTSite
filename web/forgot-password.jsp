<%--
    Document   : forgot-password
    Created on : 28-Jun-2023, 15:58:55
    Author     : HULLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html
    lang="en"
    class="light-style customizer-hide"
    dir="ltr"
    data-theme="theme-default"
    data-assets-path="assets"
    data-template="vertical-menu-template-free"
    >

    <!-- Mirrored from algromint.com/dashboard/forgot-password by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 23 Jun 2023 21:45:33 GMT -->
    <!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
    <head>
        <meta name="robots" content="noindex, nofollow" />
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
            />

        <title>Forgot Password</title>

        <meta name="description" content="" />

        <!-- Favicon -->
        <link rel="icon" type="image/x-icon" href="assets/Algromint-icon.html" />

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com/" />
        <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&amp;display=swap"
            rel="stylesheet"
            />

        <!-- Icons. Uncomment required icon fonts -->
        <link rel="stylesheet" href="assets/vendor/fonts/boxicons.css" />

        <!-- Core CSS -->
        <link rel="stylesheet" href="assets/vendor/css/core.css" class="template-customizer-core-css" />
        <link rel="stylesheet" href="assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
        <link rel="stylesheet" href="assets/css/demo.css" />

        <!-- Vendors CSS -->
        <link rel="stylesheet" href="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

        <!-- Page CSS -->
        <!-- Page -->
        <link rel="stylesheet" href="assets/vendor/css/pages/page-auth.css" />
        <!-- Helpers -->
        <script src="assets/vendor/js/helpers.js"></script>
        <!--sweet alerts -->
        <script src="assets/vendor/libs/sweetalert@2.1.2/dist/sweetalert.min.js"></script>

        <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
        <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
        <script src="assets/js/config.js"></script>
        
        <style>
            .card{
                background:  #191919;
            }
            .btn-primary{
                background-color: #696cff !important;
                border-color: #696cff !important;
            }
            .bg-primary,.app-brand .layout-menu-toggle{
                background: #696cff !important;
            }
            .btn{
                box-shadow :none !important;
            }
            html,body{
                overflow-x: hidden;
                background-color:#050505;
            }
            h6, .h6, h5, .h5, h4, .h4, h3, .h3, h2, .h2, h1, .h1{
                color:#fff;
            }
            .table:not(.table-dark) th {
                color: #fff;
            }
            .custom-dark{
                background:#191919 !important;
                color:#fff !important;
            }
            .menu-link{
                color:azure !important;
            }
            .form-label{
                color:#fff;
            }
            input:-webkit-autofill, input:-webkit-autofill:hover, input:-webkit-autofill:focus, textarea:-webkit-autofill, textarea:-webkit-autofill:hover, textarea:-webkit-autofill:focus, select:-webkit-autofill, select:-webkit-autofill:hover, select:-webkit-autofill:focus, input:-internal-autofill-selected {
                background-clip: text !important;
                -webkit-background-clip: border-box !important;
            }
        </style>
    </head>

    <body>
        <!-- Content -->

        <div class="container-xxl light-bg">
            <div class="authentication-wrapper authentication-basic container-p-y">
                <div class="authentication-inner">
                    <!-- Register Card -->
                    <div class="card">
                        <div class="card-body">
                            <!-- Logo -->
                            <div class="app-brand justify-content-center">
                                <a href="index.html" class="app-brand-link gap-2">
                                    <span class="app-brand-logo demo">

                                    </span>
                                    <span class="app-brand-text demo text-body fw-bolder">BArtMint</span>
                                </a>
                            </div>
                            <!-- /Logo -->
                            <h4 class="mb-2">Forgot your password?</h4>
                            <p class="mb-4">Enter the email linked to your account</p>

                            <form id="formAuthentication" class="mb-3"  method="POST">
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email</label>
                                    <input
                                        type="text"
                                        class="form-control"
                                        id="email"
                                        name="email"
                                        value=''
                                        placeholder="Email address"
                                        required
                                        />
                                </div>

                                <button class="btn btn-primary d-grid w-100">Continue</button>
                            </form>


                        </div>
                    </div>
                    <!-- Register Card -->
                </div>
            </div>
        </div>

        <!-- / Content -->



        <!-- Core JS -->
        <!-- build:js assets/vendor/js/core.js -->
        <script src="assets/vendor/libs/jquery/jquery.js"></script>
        <script src="assets/vendor/libs/popper/popper.js"></script>
        <script src="assets/vendor/js/bootstrap.js"></script>
        <script src="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

        <script src="assets/vendor/js/menu.js"></script>
        <!-- endbuild -->

        <!-- Vendors JS -->

        <!-- Main JS -->
        <script src="assets/js/main.js"></script>

        <!-- Page JS -->

<!--         Place this tag in your head or just before your close body tag.
        <script async defer src="../../buttons.github.io/buttons.js"></script>-->
    </body>

    <!-- Mirrored from algromint.com/dashboard/forgot-password by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 23 Jun 2023 21:45:35 GMT -->
</html>

