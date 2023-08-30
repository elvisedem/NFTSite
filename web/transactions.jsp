

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="assets/" data-template="vertical-menu-template-free" lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <title>BArtMint -Transactions</title>
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
                                <div class="col-xl-12 ">
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

        <script>
            $(document).ready(function(){
                $('#DashboardTransactionResults').DataTable();
            });
        </script>
</html>