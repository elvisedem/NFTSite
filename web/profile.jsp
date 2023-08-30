

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="assets/" data-template="vertical-menu-template-free">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <title>BArtMint -Profile</title>

        <jsp:include page="../dashboard/web-frags/head-tags.jsp" />
    </head>

    <body>
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

                            <div class="container-xxl flex-grow-1 container-p-y">
                                <div class="row">
                                    <div class="col-md-12">

                                        <div class="card mb-4 custom-dark">
                                            <h5 class="card-header">Profile Details</h5>
                                            <!-- Account -->

                                            <hr class="my-0" />
                                            <div class="card-body">
                                                <form id="updateform" method="POST">

                                                    <div class="d-flex align-items-start align-items-sm-center gap-4">
                                                        <img src="../assets/images/avatar/default-profile-picture.jpg" alt="user-avatar" class="d-block rounded" height="100" width="100" id="uploadedAvatar"/>

                                                        <div class="button-wrapper">
                                                            <label for="upload" class="btn btn-primary me-2 mb-4" tabindex="0">
                                                                <span class="d-none d-sm-block">Upload new photo</span>
                                                                <i class="bx bx-upload d-block d-sm-none"></i>
                                                                <input type="file" id="upload" class="account-file-input" hidden accept="image/*" name="fileToUpload" />
                                                            </label>


                                                            <p class="text-muted mb-0">Allowed JPG, GIF or PNG. Max size of 800K</p>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="mb-3 col-md-6">
                                                            <label for="userName" class="form-label">Username</label>
                                                            <input class="form-control" placeholder="${user.userName}" type="text" id="username" name="username" value="" readonly/>
                                                        </div>

                                                        <div class="mb-3 col-md-6">
                                                            <label for="fullName" class="form-label">Full Name</label>
                                                            <input class="form-control" placeholder="${user.fullName}" type="text" name="name" id="fullname" />
                                                        </div>

                                                        <div class="mb-3 col-md-6">
                                                            <label for="address" class="form-label">Address</label>
                                                            <input class="form-control" placeholder="${user.address}" type="text" name="address" id="address" value='' />
                                                        </div>

                                                        <div class="mb-3 col-md-6">
                                                            <label for="email" class="form-label">E-mail</label>
                                                            <input class="form-control" type="text" id="email" name="email" value=''
                                                                   placeholder="${user.email}" readonly />
                                                        </div>

                                                        <div class="mb-3 col-12">
                                                            <label class="form-label" for="phoneNumber">Phone Number</label>
                                                            <div class="input-group input-group-merge">

                                                                <input
                                                                    type="text"
                                                                    id="phonenumber"
                                                                    name="phonenumber"
                                                                    class="form-control"
                                                                    placeholder="${user.phoneNumber}"
                                                                    />
                                                            </div>
                                                        </div>


                                                    </div>

                                                    <div class="mt-2">
                                                        <button id="submitBtn" type="submit" name="update" class="btn btn-primary me-2">Save changes</button>
                                                        <button type="reset" class="btn btn-outline-secondary">Cancel</button>
                                                    </div>
                                                </form>
                                            </div>
                                            <!-- /Account -->
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <!-- / Content -->


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
//update a user
                $('#updateform').submit(function(e){
                    e.preventDefault();
                    var fullname = $('#fullname').val().trim();
                    var address = $('#address').val().trim();
                    var phonenumber = $('#phonenumber').val().trim();

                    // Validate address: allow numbers and letters, capitalize each new word
                    if(!/^[a-zA-Z0-9 ]+$/.test(address)){
                        Swal.fire({
                            icon: 'error',
                            title: 'Invalid address',
                            text: 'Update your correct address (allowing only numbers and letters)'
                        });
                        return;
                    }
                    address = address.toLowerCase().replace(/(^|\s)\S/g, function(letter){
                        return letter.toUpperCase();
                    });

                    // Validate phone: allow numbers only
                    if(!/^[0-9]+$/.test(phonenumber)){
                        Swal.fire({
                            icon: 'error',
                            title: 'Invalid phone number',
                            text: 'Please enter a valid phone number (numbers only)'
                        });
                        return;
                    }

                    // Capitalize fullname
                    fullname = fullname.toLowerCase().replace(/(^|\s)\S/g, function(letter){
                        return letter.toUpperCase();
                    });

                    /*
                     * Use AJAX to submit the information
                     */
                    $.ajax({
                        url: 'update-user',
                        method: 'POST',
                        dataType: 'JSON',
                        data: {fullname: fullname, address: address, phonenumber: phonenumber},
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
                                    title: 'User updated',
                                    text: 'Reloading.'
                                });
//                                setTimeout(function(){
//                                    window.location.href = 'profile';
//                                }, 5000);
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

