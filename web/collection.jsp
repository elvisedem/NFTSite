

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="assets/" data-template="vertical-menu-template-free" lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <title>BArtMint -Create Collection</title>
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
                                                <img src="../nfts/kunno01_abstract_one-stroke_painting_of_a_ford_mustang_painted__d495e053-2f33-4a0f-9ebb-02fd37f91b0f.jpg" style="width:100%">

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-8 col-lg-8 col-md-12">
                                        <div class="card">
                                            <div class="card-header">
                                                <h4 class="card-title">Create your Collection</h4>
                                                <span class="float-end">Balance: ${uw.balance} ETH</span>
                                            </div>
                                            <div class="card-body">

                                                <form id="collection-form">
                                                    <div class="">
                                                        <div class="form-group col-xl-12 my-2">
                                                            <label class="mr-sm-2 form-label">Collection Name </label>
                                                            <input type="text" id="collection_name" class="form-control" placeholder="Name your collection" name="collectionName" required="">
                                                        </div>
                                                        <div class="form-group col-xl-12 my-2">
                                                            <label class="mr-sm-2 form-label">Price (ETH)</label>
                                                            <input type="number" id="price" class="form-control" placeholder="Set pricing for your NFT" name="price" step="any">
                                                        </div>
                                                        <div class="form-group col-xl-12 my-2">
                                                            <div id="picture-box1" class="photo-holder" style="margin-top: 28px;">
                                                                <img alt="photo" src="../nfts/00 20170305_080040.jpg" style="width: 60%"/>
                                                            </div>
                                                            <button id="picture-btn1" type="button" class="btn btn-info" style="width: 60%; margin-top: 20px;">
                                                                <i class="fa fa-upload"></i> Upload ArtWork
                                                            </button>
                                                            <div id="progress-outer1" class="progress progress-striped active" style="display:none;">
                                                                <div id="progress-bar1" class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                                                                </div>
                                                            </div>
                                                            <div id="message-box1">
                                                            </div>
                                                            <input type="hidden" name="image1" id="fileName1" value=""/>
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-xl-12 my-2">
                                                        <div id="picture-box2" class="photo-holder" style="margin-top: 28px;">
                                                            <img alt="photo" src="../nfts/00 20170305_080040.jpg" style="width: 60%"/>
                                                        </div>
                                                        <button id="picture-btn2" type="button" class="btn btn-info" style="width: 60%; margin-top: 20px;">
                                                            <i class="fa fa-upload"></i> Upload ArtWork
                                                        </button>
                                                        <div id="progress-outer2" class="progress progress-striped active" style="display:none;">
                                                            <div id="progress-bar2" class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                                                            </div>
                                                        </div>
                                                        <div id="message-box2">
                                                        </div>
                                                        <input type="hidden" name="image2" id="fileName2" value=""/>
                                                    </div>
                                                    <div class="form-group col-xl-12 my-2">
                                                        <div id="picture-box3" class="photo-holder" style="margin-top: 28px;">
                                                            <img alt="photo" src="../nfts/00 20170305_080040.jpg" style="width: 60%"/>
                                                        </div>
                                                        <button id="picture-btn3" type="button" class="btn btn-info" style="width: 60%; margin-top: 20px;">
                                                            <i class="fa fa-upload"></i> Upload ArtWork
                                                        </button>
                                                        <div id="progress-outer3" class="progress progress-striped active" style="display:none;">
                                                            <div id="progress-bar3" class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                                                            </div>
                                                        </div>
                                                        <div id="message-box3">
                                                        </div>
                                                        <input type="hidden" name="image3" id="fileName3" value=""/>
                                                    </div>
                                                    <div class="form-group col-xl-12 my-2">
                                                        <div id="picture-box4" class="photo-holder" style="margin-top: 28px;">
                                                            <img alt="photo" src="../nfts/00 20170305_080040.jpg" style="width: 60%"/>
                                                        </div>
                                                        <button id="picture-btn4" type="button" class="btn btn-info" style="width: 60%; margin-top: 20px;">
                                                            <i class="fa fa-upload"></i> Upload ArtWork
                                                        </button>
                                                        <div id="progress-outer4" class="progress progress-striped active" style="display:none;">
                                                            <div id="progress-bar4" class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                                                            </div>
                                                        </div>
                                                        <div id="message-box4">
                                                        </div>
                                                        <input type="hidden" name="image4" id="fileName4" value=""/>
                                                    </div>
                                                    <div class="form-group col-xl-12 my-2">
                                                        <div id="picture-box5" class="photo-holder" style="margin-top: 28px;">
                                                            <img alt="photo" src="../nfts/00 20170305_080040.jpg" style="width: 60%"/>
                                                        </div>
                                                        <button id="picture-btn5" type="button" class="btn btn-info" style="width: 60%; margin-top: 20px;">
                                                            <i class="fa fa-upload"></i> Upload ArtWork
                                                        </button>
                                                        <div id="progress-outer5" class="progress progress-striped active" style="display:none;">
                                                            <div id="progress-bar5" class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                                                            </div>
                                                        </div>
                                                        <div id="message-box5">
                                                        </div>
                                                        <input type="hidden" name="image5" id="fileName5" value=""/>
                                                    </div>
                                                    <div class="form-group col-xl-6 my-2">
                                                        <label class="mr-sm-2 form-label">Mint fee: 0.1592 ETH</label>
                                                    </div>
                                                    <div class="form-group col-12">
                                                        <button id="create-collection" class="btn btn-primary pl-5 pr-5 waves-effect" type="submit"><i class="fa fa-upload"></i> Create Collection</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
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
                $('#collection-form').submit(function(event){
                    event.preventDefault();
                    var formData = $(this).serialize();
                    var $btn = $('#create-nft');
                    $.ajax({
                        url: 'upload-collection',
                        method: 'POST',
                        data: formData,
                        dataType: 'JSON',
                        beforeSend: function(xhr){
                            $btn.find('i').removeClass('fa-upload').addClass('fa-refresh').addClass('fa-spin');
                        },
                        success: function(data, textStatus, jqXHR){
                            if(data.message === 'success'){
                                swal.fire("Success!", "Your Collection was created successfully!", "success");
                                ajaxPageLoad('view-arts', 'ART ROOM');
                            }else
                                swal.fire("Error!", data.message, "error");
                        },
                        complete: function(jqXHR, textStatus){
                            $btn.find('i').addClass('fa-upload').removeClass('fa-refresh').removeClass('fa-spin');
                        },
                        error: function(jqXHR, textStatus, errorThrown){
                            swal("Error!", "There was an error!", "error");
                        }
                    });
                });
            });
        </script>
        <script>
            $(document).ready(function(){

                var prop1 = {
                    btn: document.getElementById('picture-btn1'),
                    pictureBox: document.getElementById('picture-box1'),
                    progressBar: document.getElementById('progress-bar1'),
                    progressOuter: document.getElementById('progress-outer1'),
                    messageBox: document.getElementById('message-box1'),
                    fileName: document.getElementById('fileName1'),
                    imageType: 'collection'
                };
                initiateUpload3(prop1);
                var prop2 = {
                    btn: document.getElementById('picture-btn2'),
                    pictureBox: document.getElementById('picture-box2'),
                    progressBar: document.getElementById('progress-bar2'),
                    progressOuter: document.getElementById('progress-outer2'),
                    messageBox: document.getElementById('message-box2'),
                    fileName: document.getElementById('fileName2'),
                    imageType: 'collection'
                };
                initiateUpload3(prop2);
                var prop3 = {
                    btn: document.getElementById('picture-btn3'),
                    pictureBox: document.getElementById('picture-box3'),
                    progressBar: document.getElementById('progress-bar3'),
                    progressOuter: document.getElementById('progress-outer3'),
                    messageBox: document.getElementById('message-box3'),
                    fileName: document.getElementById('fileName3'),
                    imageType: 'collection'
                };
                initiateUpload3(prop3);
                var prop4 = {
                    btn: document.getElementById('picture-btn4'),
                    pictureBox: document.getElementById('picture-box4'),
                    progressBar: document.getElementById('progress-bar4'),
                    progressOuter: document.getElementById('progress-outer4'),
                    messageBox: document.getElementById('message-box4'),
                    fileName: document.getElementById('fileName4'),
                    imageType: 'collection'
                };
                initiateUpload3(prop4);
                var prop5 = {
                    btn: document.getElementById('picture-btn5'),
                    pictureBox: document.getElementById('picture-box5'),
                    progressBar: document.getElementById('progress-bar5'),
                    progressOuter: document.getElementById('progress-outer5'),
                    messageBox: document.getElementById('message-box5'),
                    fileName: document.getElementById('fileName5'),
                    imageType: 'collection'
                };
                initiateUpload3(prop5);
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
</html>
