

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="assets/" data-template="vertical-menu-template-free" lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <title>BArtMint -Withdraw</title>
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

                            <div class="container">
                                <div class="row">

                                    <div class="col-12 col-lg-6 mx-auto">
                                        <div class="card">
                                            <div class="card-header h3">
                                                Place a Withdrawal
                                            </div>
                                            <div class="card-body">
                                                <form id="withdraw">
                                                    <div class="form-group mb-3">
                                                        <label class="form-label">
                                                            Amount to withdraw( ETH )
                                                        </label>
                                                        <input type="number" step="any" name="amount" required="" class="form-control" placeholder="Enter withdrawal amount">
                                                    </div>

                                                    <div class="form-group mb-3">
                                                        <label class="form-label">
                                                            Enter wallet address(ETH)
                                                        </label>
                                                        <input type="text" name="address" required="" class="form-control" placeholder="0x37bd8w0wnz87w7w2123bxzbcesd">
                                                    </div>

                                                    <div>
                                                        <button class="btn btn-primary" type="submit">
                                                            Place withdrawal
                                                        </button>
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
        <script>
            $(document).ready(function(){
                $('#withdraw').submit(function(e){
                    e.preventDefault();
                    var formData = $(this).serialize();
                    $.ajax({
                        url: 'withdra',
                        method: 'POST',
                        dataType: 'JSON',
                        data: formData,
                        beforeSend: function(xhr){
                            console.log('Submitting form...');
                        },
                        success: function(data, textStatus, jqXHR){
                            if(data.message !== 'success')
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Error',
                                    text: data.message
                                });
                            else{
                                Swal.fire({
                                    icon: 'success',
                                    title: 'Your Wallet will be credited as soon as your transaction has been confirmed',
                                    text: 'Transaction Pending.'
                                });
                                setTimeout(function(){
                                    window.location.href = 'home';
                                }, 5000);
                            }
                        },
                        complete: function(jqXHR, textStatus){

                        },
                        error: function(jqXHR, textStatus, errorThrown){
                            Swal.fire({
                                icon: 'error',
                                title: 'Error',
                                text: "There was an error, please reload this page. " + errorThrown
                            });
                        }
                    });
                });
            });
        </script>
    </body>
</html>