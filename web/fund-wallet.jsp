<%--
    Document   : fund-wallet
    Created on : 28-Jun-2023, 15:51:59
    Author     : HULLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="assets/" data-template="vertical-menu-template-free" lang="en"><head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <title>BArtMint -Wallet</title>
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

                        <div class="">
                            <div class="row">

                                <div class="col-xl-8 col-lg-8 col-md-12 mx-auto">
                                    <div class="card">

                                        <div class="card-header">
                                            <h4 class="card-title">Fund wallet</h4>
                                            <span class="float-end">Wallet: ${uw.balance}ETH</span>
                                        </div>

                                        <div class="card-body">

                                            <form action="fund" method="post" class="personal_validate" novalidate="novalidate" onsubmit="">
                                                <div class="form-row">
                                                    <div class="form-group col-12">
                                                        <label class="mr-sm-2 form-label">Amount (ETH)</label>
                                                        <input type="number" step="any" id="amount" class="form-control" placeholder="Enter amount you want to fund" name="amount" required="">
                                                    </div>

                                                    <div class="form-group col-12 my-2">
                                                        <button name="fund" class="btn btn-primary pl-5 pr-5 waves-effect">Fund my Wallet</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
</html>
