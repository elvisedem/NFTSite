

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="assets/" data-template="vertical-menu-template-free" lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <title>BArtMint -Create NFT</title>
        <jsp:include page="../dashboard/web-frags/head-tags.jsp" />
    </head>

    <body data-new-gr-c-s-check-loaded="8.906.0" data-gr-ext-installed="">
        <!-- Layout wrapper -->
        <div class="row d-md-none">
            <div class="mx-auto">

            </div>

        </div>
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
                                    <div class="col-xl-4 col-lg-4 col-md-12">
                                        <div class="card profile_card">
                                            <div class="card-body p-0">


                                                <img src="../nfts/03_Imperialismo.jpg" style="width:100%">

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-8 col-lg-8 col-md-12">
                                        <div class="card">
                                            <div class="card-header">
                                                <h4 class="card-title">Create your NFT</h4>
                                                <span class="float-end">Balance: ${uw.balance} ETH</span>
                                            </div>
                                            <div class="card-body">
                                                <form id="nft-upload">
                                                    <div class="">
                                                        <div class="form-group col-xl-12 my-2">
                                                            <label class="mr-sm-2 form-label">NFT Name </label>
                                                            <input type="text" id="nftName" class="form-control" placeholder="Name your NFT" name="nftName" required>
                                                        </div>
                                                        <div class="form-group col-xl-12 my-2">
                                                            <label class="mr-sm-2 form-label">Price (ETH)</label>
                                                            <input type="number" id="price" step="any" class="form-control" placeholder="Set pricing for your NFT" name="price">
                                                        </div>
                                                        <style type="text/css" scoped="">
                                                            /* Progress Bar for Upload Photo */
                                                            .progress {
                                                                height: 14px;
                                                                margin-top: 10px;
                                                            }

                                                            .progress-bar {
                                                                height: 100%;
                                                            }

                                                            #error-message {
                                                                color: #660000;
                                                            }
                                                        </style>
                                                        <div class="col-12">
                                                            <div id="picture-box" class="photo-holder" style="margin-top: 28px;">
                                                                <img alt="photo" src="../nfts/03_Imperialismo.jpg" style="width: 100%"/>
                                                            </div>
                                                            <button id="picture-btn" type="button" class="btn btn-info" style="width: 100%; margin-top: 20px;">
                                                                <i class="fa fa-upload"></i> Upload NFT
                                                            </button>
                                                            <div id="progress-outer" class="progress progress-striped active" style="display:none;">
                                                                <div id="progress-bar" class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                                                                </div>
                                                            </div>
                                                            <div id="message-box">
                                                            </div>
                                                            <input type="hidden" name="imageName" id="imageName" value=""/>
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-xl-6 my-2">
                                                        <label class="mr-sm-2 form-label">Mint fee: 0.1492 ETH</label>
                                                    </div>

                                                    <div class="form-group col-12 my-2">
                                                        <button  type="submit" class="btn btn-primary pl-5 pr-5 waves-effect"><i class="fa fa-upload"></i> Create NFT</button>
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

        <!-- Initialize Swiper -->
        <script>
            $(document).ready(function(){
                var prop = {
                    btn: document.getElementById('picture-btn'),
                    pictureBox: document.getElementById('picture-box'),
                    progressBar: document.getElementById('progress-bar'),
                    progressOuter: document.getElementById('progress-outer'),
                    messageBox: document.getElementById('message-box'),
                    fileName: document.getElementById('imageName'),
                    imageType: 'nft-photo'
                };
                initiateUpload3(prop);

                function initiateUpload3(uploadProp){
                    var uploader = new ss.SimpleUpload({
                        button: uploadProp.btn,
                        url: '/FileUploaderApp/image-uploader',
                        name: 'uploadfile',
                        data: {imageType: uploadProp.imageType},
                        multipart: true,
                        maxSize: 6114,
                        hoverClass: 'hover',
                        focusClass: 'focus',
                        responseType: 'json',
                        progressUrl: 'upload-progress',
                        sessionProgressName: 'fileUploadProgressListener',
                        onSizeError: function(filename, fileSize){
                            alert(filename + ' is too big. (6MB max file size)');
                        },
                        startXHR: function(){
                        },
                        onSubmit: function(){
                            uploadProp.messageBox.innerHTML = ''; // empty the message box
                            uploadProp.btn.innerHTML = 'Uploading...'; // change button text to "Uploading..."
                        },
                        onComplete: function(filename, response){
                            uploadProp.btn.innerHTML = '<i class="fa fa-upload"></i> Upload Photo';
                            uploadProp.btn.style.display = 'none';
                            uploadProp.fileName.setAttribute('value', response[0].newfilename);
                            uploadProp.progressOuter.style.display = 'none'; // hide progress bar when upload is completed
                            if(!response){
                                uploadProp.messageBox.innerHTML = 'An error occurred and the upload failed.';
                                return;
                            }else{
                                uploadProp.messageBox.innerHTML = '<strong>' + escapeTags(filename) + '</strong>' + ' successfully uploaded.';
                                uploadProp.pictureBox.innerHTML = '<img alt="photo" src="/FileUploaderApp/temp/' + response[0].newfilename + '"/>';
                                return;
                            }
                        },
                        onError: function(){
                            uploadProp.progressOuter.style.display = 'none';
                            uploadProp.messageBox.innerHTML = 'Unable to upload file';
                        }
                    });
                }

                function escapeTags(str){
                    return String(str)
                            .replace(/&/g, '&amp;')
                            .replace(/"/g, '&quot;')
                            .replace(/'/g, '&#39;')
                            .replace(/</g, '&lt;')
                            .replace(/>/g, '&gt;');
                }
            });
        </script>
        <script>
            $(document).ready(function(){
                $('#nft-upload').submit(function(event){
                    event.preventDefault();
                    var formData = $(this).serialize();
                    var $btn = $('#create-nft');
                    $.ajax({
                        url: 'upload-nft',
                        method: 'POST',
                        data: formData,
                        dataType: 'JSON',
                        beforeSend: function(xhr){
                            $btn.find('i').removeClass('fa-upload').addClass('fa-refresh').addClass('fa-spin');
                        },
                        success: function(data, textStatus, jqXHR){
                            if(data.message === 'success'){
                                swal.fire("Success!", "Your NFT was created successfully!", "success");
                                setTimeout(function(){
                                    window.location.href = 'home';
                                }, 10000);
                            }else
                                swal.fire("Error!", data.message, "error");
                        },
                        complete: function(jqXHR, textStatus){
                            $btn.find('i').addClass('fa-save').removeClass('fa-refresh').removeClass('fa-spin');
                        },
                        error: function(jqXHR, textStatus, errorThrown){
                            swal("Error!", "There was an error!", "error");
                        }
                    });
                });
            });
        </script>
</html>