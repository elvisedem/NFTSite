

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="assets/" data-template="vertical-menu-template-free">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BArtMint -Invoice</title>
        <jsp:include page="../dashboard/web-frags/head-tags.jsp" />
    </head>

    <body data-new-gr-c-s-check-loaded="14.1113.0" data-gr-ext-installed="">
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
                                <div class="col-xl-7 col-lg-7 col-md-12">
                                    <div class="card custom-dark" style="">
                                        <div class="card-body">
                                            <div class="buyer-seller">
                                                <div class="d-flex justify-content-between mb-3">
                                                    <div class="seller-info text-right">
                                                        <span id="folioName"></span> <h4 class="card-title" style="font-weight:200;">INVOICE PAYMENT DETAILS</h4>
                                                    </div>
                                                </div>
                                                <div class="table-responsive">
                                                    <table class="table">
                                                        <tbody>
                                                            <tr id="invDetails1">
                                                                <td>
                                                                    <p style="font-weight:200;"> PAY TO:<span id="address" style="font-weight:200;"> 0xf100fB536b7Bf757Fc4b24d92D3bddb0Fc5283c0</span></p>
                                                                    <!--<br>-->
                                                                    <a class="my-2" href="#" onclick="copyFn();">
                                                                        <h6><i class="la la-copy"></i><span id="copyText"> Copy</span></h6>
                                                                    </a>
                                                                    <input type="hidden" id="hiddenInput" value="0xf100fB536b7Bf757Fc4b24d92D3bddb0Fc5283c0">
                                                                </td>
                                                            </tr>
                                                            <tr id="invDetails2">
                                                                <td><span>QR CODE :</span><br><br>
                                                                    <img src="../images/QR.jpg" alt="" class="img-fluid" style="height: auto; max-width: 50% !important;">
                                                                    <br><h5 style="color:grey;"><small>If the QR code doesn't work with your wallet, simply copy and paste the address displayed above.</small></h5>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td><span></span><br>
                                                                    <form id="ffund">
                                                                        <input name="amount" id="amount" value="${amount}" hidden=""/>
                                                                        <button type="submit" class="btn btn-primary">
                                                                            I have made this transfer
                                                                        </button>
                                                                    </form>
                                                                    <br><h5 style="color:grey;"></h5>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-5 col-lg-5">
                                    <div class="card custom-dark">
                                        <div class="card-body">
                                            <div class="buyer-seller">
                                                <div class="d-flex justify-content-between mb-3">
                                                    <div class="seller-info text-right">
                                                        <span id="folioName"></span> <h4 class="card-title" style="font-weight:200;">PAYMENT(S) HISTORY</h4>
                                                    </div>
                                                </div>
                                                <span id="address" style="font-weight:200;">Real-time historical records of your incoming invoice payments</span>
                                                <div class="table-responsive">

                                                    <table id="DashboardTransactionResults" class="display cell-border" style="margin-top: 5px; color: black">
                                                        <thead>
                                                            <tr>
                                                                <th>Status</th>
                                                                <th>Amount</th>
                                                                <th>Date</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach var="transaction" items="${transactions}">
                                                                <tr>
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
            function copyFn(){
                var address = document.getElementById("address");

                // Get the actual text content from the span element
                var textToCopy = address.textContent;

                // Create a textarea element to hold the text
                var textarea = document.createElement("textarea");
                textarea.value = textToCopy;

                // Append the textarea to the document
                document.body.appendChild(textarea);

                // Select the text in the textarea
                textarea.select();
                document.execCommand("copy");

                // Remove the textarea from the document
                document.body.removeChild(textarea);

                alert("Copied the text: " + textToCopy);
            }

            $(document).ready(function(){
                $('#DashboardTransactionResults').DataTable();
            });
        </script>
        <script>

            $(document).ready(function(){

                //invoice btn
                $('#ffund').submit(function(e){
                    e.preventDefault();
                    var amount = $('#amount').val();
                    var deposit = "deposit";
                    /*
                     * Use AJAX to submit the information
                     */
                    $.ajax({
                        url: 'deposi',
                        method: 'POST',
                        dataType: 'JSON',
                        data: {amount: amount, deposit: deposit},
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
                                    title: 'Your balance will be added as soon as your transaction has been confirmed',
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
</html>