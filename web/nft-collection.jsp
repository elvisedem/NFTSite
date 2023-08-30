

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="assets/" data-template="vertical-menu-template-free" lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <title>BArtMint -My Collection</title>
        <jsp:include page="../dashboard/web-frags/head-tags.jsp" />

    </head>
    <body data-new-gr-c-s-check-loaded="8.906.0" data-gr-ext-installed="">
        <!-- Layout wrapper -->
        <div class="layout-wrapper layout-content-navbar">

            <div class="layout-container">
                <!-- Menu -->
                <jsp:include page="../dashboard/web-frags/menu.jsp" />
                <!-- / Menu -->

                <!-- Layout container -->
                <div class="layout-page">
                    <!-- Navbar -->

                    <jsp:include page="../dashboard/web-frags/navbar.jsp" />

                    <!-- / Navbar -->

                    <!-- Content wrapper -->
                    <div class="content-wrapper">
                        <!-- Content -->

                        <div class="container-fluid flex-grow-1 container-p-y">
                            <div class="row">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-body p-1 pt-3">
                                            <ul class="">
                                                <h3>My Collections </h3>

                                                <p class="text-warning">Oops, You don't have any Collection, create more at the <a href="collection">Create a Collection Section</a></p>

                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row p-2">
                                <h3 class="p-2">NFT Artworks</h3>
                                <p class="text-warning">Oops, You don't have any NFT, create more at the <a href="create-nft">Create an NFT Section</a></p>


                            </div>


                        </div>
                        <!-- / Content -->

                        <!-- Footer -->
                        <footer class="content-footer footer">
                            <div class="container-fluid d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">


                            </div>
                        </footer>
                        <!-- / Footer -->

                        <div class="content-backdrop fade"></div>
                    </div>
                    <!-- Content wrapper -->
                </div>
                <!-- / Layout page -->
            </div>

            <!-- Overlay -->
            <div class="layout-overlay layout-menu-toggle"></div>
        </div>
        <!-- / Layout wrapper -->

        <jsp:include page="../dashboard/web-frags/footer-scripts.jsp" />
    </body>
</html>
