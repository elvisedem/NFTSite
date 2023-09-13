<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html
    lang="en"
    class="light-style layout-menu-fixed"
    dir="ltr"
    data-theme="theme-default"
    data-assets-path="assets/"
    data-template="vertical-menu-template-free"
    >
    <head>
        <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>

        <title>BArtMint -User Collection</title>
        <!-- Favicon -->
        <link rel="icon" type="image/x-icon" href="../logo.png" />

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com/" />
        <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&amp;display=swap"
            rel="stylesheet"
            />
        <!--<link rel="stylesheet" href="../../cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"/>-->

        <!-- Icons. Uncomment required icon fonts -->
        <link rel="stylesheet" href="assets/vendor/fonts/boxicons.css" />

        <!-- Core CSS -->
        <link rel="stylesheet" href="assets/vendor/css/core.css" class="template-customizer-core-css" />
        <link rel="stylesheet" href="assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
        <link rel="stylesheet" href="assets/css/demo.css" />

        <!-- Vendors CSS -->
        <link rel="stylesheet" href="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
        <!--<link rel="stylesheet" href="../../cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />-->
        <!--<link rel="stylesheet" href="../../cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.js" integrity="sha512-CX7sDOp7UTAq+i1FYIlf9Uo27x4os+kGeoT7rgwvY+4dmjqV0IuE/Bl5hVsjnQPQiTOhAX1O2r2j5bjsFBvv/A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.slim.js" integrity="sha512-1cF8XUz5U3BlnRVqNFn+aPNwwSr/FPtrmKvM1g4dJJ9tg8kmqRUzqbSOvRRAMScDnTkOcOnnfwF3+jRA/nE2Ow==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.slim.min.js" integrity="sha512-yBpuflZmP5lwMzZ03hiCLzA94N0K2vgBtJgqQ2E1meJzmIBfjbb7k4Y23k2i2c/rIeSUGc7jojyIY5waK3ZxCQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <!-- Page CSS -->

        <!-- Helpers -->
        <script src="assets/vendor/js/helpers.js"></script>
        <!--<script src="../../unpkg.com/sweetalert%402.1.2/dist/sweetalert.min.js"></script>-->

        <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
        <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
        <script src="assets/js/config.js"></script>
        <!--<script src="../../cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>-->
        <!--        <script src="../../cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
                <script src="../../cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>-->
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>
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
        <div class="row">
            <div class="col-12">
                <div class="card profile_card">
                    <div class="card-body">

                        <ul class="">
                            <h3>${nftArt.artName} NFT</h3>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="row p-2">
            <c:forEach var="nArts" items="${nArts}">
                <div class="col-12 col-lg-4 my-2">
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <span class="badge bg-primary float-end">
                                ${nftArt.artName}
                            </span>
                            <img class="card-img-top" src="/FileUploaderApp/temp/${nftArt.imageName}" alt="Card image" style="width:100%; height:250px;">
                            <div class="p-2 border-top-1">
                                Price:<p class="text-primary"> ${nftArt.price}</p>
                            </div>
                            <div class="p-2 border-top-1">

                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <!-- / Content -->

        <!-- Footer -->
        <footer class="content-footer footer">
            <div class="container-fluid d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">


            </div>
        </footer>
        <!-- / Footer -->

        <div class="content-backdrop fade"></div>

        <!-- Overlay -->
        <div class="layout-overlay layout-menu-toggle"></div>
        <!-- / Layout wrapper -->


        <!--<script src="/assets/vendor/libs/jquery/jquery.js"></script>-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.js" integrity="sha512-8Z5++K1rB3U+USaLKG6oO8uWWBhdYsM3hmdirnOEWp8h2B1aOikj5zBzlXs8QOrvY9OxEnD2QDkbSKKpfqcIWw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <script src="assets/vendor/libs/popper/popper.js"></script>
        <script src="assets/vendor/js/bootstrap.js"></script>
        <!--<script src="/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/perfect-scrollbar/1.5.5/perfect-scrollbar.min.js" integrity="sha512-X41/A5OSxoi5uqtS6Krhqz8QyyD8E/ZbN7B4IaBSgqPLRbWVuXJXr9UwOujstj71SoVxh5vxgy7kmtd17xrJRw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/perfect-scrollbar/1.5.5/perfect-scrollbar.common.js" integrity="sha512-bpuEsYMi7DDpnWyEHQC1jc6EL/9bred2J+VclWZ044GLFhjuARuvE2ACTB3jfB/LgRedi/IVjnxKru3Rs66ehw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/perfect-scrollbar/1.5.5/perfect-scrollbar.common.min.js" integrity="sha512-taVEL0FH5pCZ3C8bCJ1zublHwDQwno1EiHtI+foBiCvjuIZJLeWfel1vObWe4KXjhlPlgzlNID1505UcuaLN6w==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/perfect-scrollbar/1.5.5/perfect-scrollbar.esm.js" integrity="sha512-od9XQZlrbIdobN3KNSziiMnOrptM1w/8q7U6fgm6K5CIlBowXjXEByAmixj//n3g5R8Jz0UmqgpxoabiqB78MA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/perfect-scrollbar/1.5.5/perfect-scrollbar.esm.min.js" integrity="sha512-cI/lh2zxo7ECrUigK+uODirhG1a1NlnT3sEjzvG7n6GXnSeX5VrcIkUyRebgz09FLEcLYfd0VPQRDDLWxjwEng==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/perfect-scrollbar/1.5.5/perfect-scrollbar.js" integrity="sha512-EXRb/1mTZs4VEgPqlabQWHw2hnGn269OM3QvLfLeEeEp7GznVGkbYdu+bU9bb/XLYda6drPfWCyoMm6RYwSZMg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <script src="assets/vendor/js/menu.js"></script>
        <!-- endbuild -->

        <!-- Vendors JS -->

        <!-- Main JS -->
        <script src="assets/js/main.js"></script>

        <!-- Page JS -->

        <!-- Place this tag in your head or just before your close body tag. -->
        <!--    <script async defer src="../../buttons.github.io/buttons.js"></script>
            <script src="../../cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
            <script src="../../cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>-->
    </body>
</html>

