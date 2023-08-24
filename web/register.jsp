<%--
    Document   : register
    Created on : 28-Jun-2023, 13:36:05
    Author     : HULLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!-- saved from url=(0040)https://nft-tailwind.preview.uideck.com/ -->
<html lang="en">
    <!-- Mirrored from algromint.com/register by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 23 Jun 2023 21:42:21 GMT -->
    <!-- Added by HTTrack --><!-- /Added by HTTrack -->
    <head>

        <jsp:include page="WEB-INF/web-frag/head-tags.jsp" />

        <title>BArtMint -Register</title>

        <style>
            .menu-item{
                list-style-type:none;
                font-size:23px;
                margin-bottom:10px;
            }
            .close-btn{
                font-size:36px;
            }
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
    <body class="a0" x-data="
          {
          scrolledFromTop: false
          }
          " x-init="window.pageYOffset &gt;= 50 ? scrolledFromTop = true : scrolledFromTop = false" @scroll.window="window.pageYOffset &gt;= 50 ? scrolledFromTop = true : scrolledFromTop = false" data-new-gr-c-s-check-loaded="14.1091.0" data-gr-ext-installed="">

        <jsp:include page="WEB-INF/web-frag/header.jsp" />

        <jsp:include page="WEB-INF/web-frag/mobile-menu.jsp" />


        <div class="container-xxl light-bg" style="margin-top:150px;">
            <div class="authentication-wrapper authentication-basic container-p-y">
                <div class="authentication-inner">
                    <!-- Register Card -->
                    <div class="col col-lg-4 mx-auto my-4">
                        <div class="card">
                            <div class="card-body">


                                <form id="signup" class="mb-3"  method="POST">
                                    <div class="mb-3">
                                        <label for="email" class="form-label">Email</label>
                                        <input type="email" class="form-control" id="email" name="email" value='' placeholder="email" required />
                                    </div>
                                    <div class="mb-3">
                                        <label for="email" class="form-label">Username</label>
                                        <input type="text" class="form-control" id="username" name="username" value='' placeholder="Username" required />
                                    </div>
                                    <div class="mb-3">
                                        <label for="password" class="form-label">Password</label>
                                        <input type="password" class="form-control" id="password" name="password" placeholder="Password" required/>
                                    </div>

                                    <button id="submitBtn" class="btn btn-primary d-grid w-100">Continue</button>

                                </form>

                                <p>
                                    <span class="uk-text-small float-end" style="color: #ffffff !important;">Have an account?  <a class="uk-button uk-button-text" href="login">Login</a></span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <!-- Register Card -->
                </div>
            </div>
        </div>



        <jsp:include page="WEB-INF/web-frag/footer.jsp" />

        <jsp:include page="WEB-INF/web-frag/footer-scripts.jsp" />
        <script>
            $(document).ready(function(){
                $('#signup').submit(function(e){
                    e.preventDefault();
                    var email = $('#email').val().trim();
                    var username = capitalizeFirstLetter($('#username').val().trim());
                    var password = $('#password').val().trim();
                    if(username.length < 5){
                        Swal.fire({
                            icon: 'error',
                            title: 'Invalid Username',
                            text: 'Username must be at least 5 characters long'
                        });
                        return;
                    }
                    if(password.length < 8 || !isStrongPassword(password)){
                        Swal.fire({
                            icon: 'error',
                            title: 'Invalid Password',
                            text: 'Password must be strong and at least 8 characters long. \n\
                               Consider using uppercase, lowercase, numbers and special characters.'
                        });
                        return;
                    }
                    /*
                     * Use AJAX to submit the information
                     */
                    $.ajax({
                        url: 'register-user',
                        method: 'POST',
                        dataType: 'JSON',
                        data: {email: email, username: username, password: password},
                        beforeSend: function(xhr){
                            console.log('Submitting form...');
                            $('#submitBtn').attr("disabled", true);
                            $('#submitBtn').html('<i class="fa fa-refresh fa-spin"> </i> Registering...');
                        },
                        success: function(data, textStatus, jqXHR){
                            $('#submitBtn').removeAttr("disabled");
                            $('#submitBtn').html('<i class="fa fa-save"> </i> Register Now');
                            if(data.message !== 'success')
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Error',
                                    text: data.message
                                });
                            else{
                                Swal.fire({
                                    icon: 'success',
                                    title: 'Account Created Successfully!',
                                    text: 'Your account has been created successfully!\nYou can now login to continue.'
                                });
                                setTimeout(function(){
                                    window.location.href = 'login';
                                }, 10000);
                            }

                        },
                        complete: function(jqXHR, textStatus){

                        },
                        error: function(jqXHR, textStatus, errorThrown){
                            $('#submitBtn').removeAttr("disabled");
                            $('#submitBtn').html('<i class="fa fa-save"> </i> Register Now');
                            Swal.fire({
                                icon: 'error',
                                title: 'Error',
                                text: "There was an error, please reload this page. " + errorThrown
                            });
                        }
                    });
                });
                function isStrongPassword(password){
                    // Implement your password strength validation logic here
                    // Return true if the password is strong, false otherwise
                    // Example: check if the password contains at least one uppercase letter, one lowercase letter, one digit, and one special character

                    // Example implementation:
                    var uppercaseRegex = new RegExp('[A-Z]');
                    var lowercaseRegex = new RegExp('[a-z]');
                    var digitRegex = new RegExp('[0-9]');
                    var specialCharRegex = new RegExp('[!@#$%^&*(),.?":{}|<>]');

                    return uppercaseRegex.test(password) &&
                            lowercaseRegex.test(password) &&
                            digitRegex.test(password) &&
                            specialCharRegex.test(password);
                }

                // Function to capitalize the first letter
                function capitalizeFirstLetter(string){
                    return string.charAt(0).toUpperCase() + string.slice(1);
                }
            });
        </script>

    </body><grammarly-desktop-integration data-grammarly-shadow-root="true"></grammarly-desktop-integration>
    <!-- Mirrored from algromint.com/register by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 23 Jun 2023 21:42:21 GMT -->
</html>
