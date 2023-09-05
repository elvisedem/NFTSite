

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:catch var="xcp">
    <c:set var="dashboardAssets" value="../assets/vendor/libs/" scope="application"/>
    <html class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="assets/" data-template="vertical-menu-template-free" lang="en">
        <head>
            <meta http-equiv="content-type" content="text/html; charset=UTF-8">
            <title>BArtMint - Dashboard</title>
            <jsp:include page="../dashboard/web-frags/head-tags.jsp" />
        </head>
        <body style="background-color: black;" data-new-gr-c-s-check-loaded="8.906.0" data-gr-ext-installed="" data-new-gr-c-s-loaded="8.906.0">
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
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col my-2">
                                            <div class="card bg-primary">
                                                <div class="card-body text-white">
                                                    <strong>
                                                        <small>BALANCE</small>
                                                        <h2 class="py-2 text-white">${uw.balance} ETH</h2>
                                                    </strong>
                                                    <span class="float-end">
                                                        <a href="fund">
                                                            <button class="btn border text-white">Fund Wallet</button>
                                                        </a>
                                                    </span>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-6 col-lg-6 my-2">
                                            <div class="card custom-dark text-white h-100">
                                                <div class="card-body">

                                                    <small>My NFTs</small>
                                                    <h3 class="py-2 text-white text-bold">
                                                        ${nftCount}
                                                    </h3>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-lg-6 my-2 ">
                                            <div class="card custom-dark h-100">
                                                <div class="card-body text-white h-100">

                                                    <small>Current Mint fee</small>
                                                        <h3 class="py-2 text-white text-bold">
                                                            0.1482ETH
                                                        </h3>
                                                </div>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                                <div class="downlines my-4">
                                    <div class="card text-white">
                                        <div class="card-header">
                                            <h3>Transactions</h3>
                                        </div>
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table id="DashboardTransactionResults" class="display cell-border" style="margin-top: 5px; color: black">
                                                    <thead>
                                                        <tr>
                                                            <th>Type</th>
                                                            <th>Status</th>
                                                            <th>Amount</th>
                                                            <th>Date</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="transaction" items="${transactions}">
                                                            <tr>
                                                                <td>${transaction.type}</td>
                                                                <td>${transaction.status}</td>
                                                                <td>${transaction.amount}</td>
                                                                <td>${transaction.date}</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>


                                </div>

                            </div>
                            <!-- / Content -->

                            <!-- Footer -->
                            <footer class="content-footer footer">
                                <div class="container-fluid d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column"></div>
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

            <script>
                $(document).ready(function(){
                    $('#DashboardTransactionResults').DataTable();
                });
            </script>
        </body>
    </html>
</c:catch>
<c:if test="${xcp ne null}">
    <c:out value="${xcp}"/>
</c:if>

