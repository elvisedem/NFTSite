<%--
    Document   : create
    Created on : 28-Jun-2023, 14:58:45
    Author     : HULLO, NFT SITE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="assets/" data-template="vertical-menu-template-free" lang="en"><head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"><style type="text/css">.swal-icon--error{
                border-color:#f27474;
                -webkit-animation:animateErrorIcon .5s;
                animation:animateErrorIcon .5s
            }
            .swal-icon--error__x-mark{
                position:relative;
                display:block;
                -webkit-animation:animateXMark .5s;
                animation:animateXMark .5s
            }
            .swal-icon--error__line{
                position:absolute;
                height:5px;
                width:47px;
                background-color:#f27474;
                display:block;
                top:37px;
                border-radius:2px
            }
            .swal-icon--error__line--left{
                -webkit-transform:rotate(45deg);
                transform:rotate(45deg);
                left:17px
            }
            .swal-icon--error__line--right{
                -webkit-transform:rotate(-45deg);
                transform:rotate(-45deg);
                right:16px
            }
            @-webkit-keyframes animateErrorIcon{
                0%{
                    -webkit-transform:rotateX(100deg);
                    transform:rotateX(100deg);
                    opacity:0
                }
                to{
                    -webkit-transform:rotateX(0deg);
                    transform:rotateX(0deg);
                    opacity:1
                }
            }
            @keyframes animateErrorIcon{
                0%{
                    -webkit-transform:rotateX(100deg);
                    transform:rotateX(100deg);
                    opacity:0
                }
                to{
                    -webkit-transform:rotateX(0deg);
                    transform:rotateX(0deg);
                    opacity:1
                }
            }
            @-webkit-keyframes animateXMark{
                0%{
                    -webkit-transform:scale(.4);
                    transform:scale(.4);
                    margin-top:26px;
                    opacity:0
                }
                50%{
                    -webkit-transform:scale(.4);
                    transform:scale(.4);
                    margin-top:26px;
                    opacity:0
                }
                80%{
                    -webkit-transform:scale(1.15);
                    transform:scale(1.15);
                    margin-top:-6px
                }
                to{
                    -webkit-transform:scale(1);
                    transform:scale(1);
                    margin-top:0;
                    opacity:1
                }
            }
            @keyframes animateXMark{
                0%{
                    -webkit-transform:scale(.4);
                    transform:scale(.4);
                    margin-top:26px;
                    opacity:0
                }
                50%{
                    -webkit-transform:scale(.4);
                    transform:scale(.4);
                    margin-top:26px;
                    opacity:0
                }
                80%{
                    -webkit-transform:scale(1.15);
                    transform:scale(1.15);
                    margin-top:-6px
                }
                to{
                    -webkit-transform:scale(1);
                    transform:scale(1);
                    margin-top:0;
                    opacity:1
                }
            }
            .swal-icon--warning{
                border-color:#f8bb86;
                -webkit-animation:pulseWarning .75s infinite alternate;
                animation:pulseWarning .75s infinite alternate
            }
            .swal-icon--warning__body{
                width:5px;
                height:47px;
                top:10px;
                border-radius:2px;
                margin-left:-2px
            }
            .swal-icon--warning__body,.swal-icon--warning__dot{
                position:absolute;
                left:50%;
                background-color:#f8bb86
            }
            .swal-icon--warning__dot{
                width:7px;
                height:7px;
                border-radius:50%;
                margin-left:-4px;
                bottom:-11px
            }
            @-webkit-keyframes pulseWarning{
                0%{
                    border-color:#f8d486
                }
                to{
                    border-color:#f8bb86
                }
            }
            @keyframes pulseWarning{
                0%{
                    border-color:#f8d486
                }
                to{
                    border-color:#f8bb86
                }
            }
            .swal-icon--success{
                border-color:#a5dc86
            }
            .swal-icon--success:after,.swal-icon--success:before{
                content:"";
                border-radius:50%;
                position:absolute;
                width:60px;
                height:120px;
                background:#fff;
                -webkit-transform:rotate(45deg);
                transform:rotate(45deg)
            }
            .swal-icon--success:before{
                border-radius:120px 0 0 120px;
                top:-7px;
                left:-33px;
                -webkit-transform:rotate(-45deg);
                transform:rotate(-45deg);
                -webkit-transform-origin:60px 60px;
                transform-origin:60px 60px
            }
            .swal-icon--success:after{
                border-radius:0 120px 120px 0;
                top:-11px;
                left:30px;
                -webkit-transform:rotate(-45deg);
                transform:rotate(-45deg);
                -webkit-transform-origin:0 60px;
                transform-origin:0 60px;
                -webkit-animation:rotatePlaceholder 4.25s ease-in;
                animation:rotatePlaceholder 4.25s ease-in
            }
            .swal-icon--success__ring{
                width:80px;
                height:80px;
                border:4px solid hsla(98,55%,69%,.2);
                border-radius:50%;
                box-sizing:content-box;
                position:absolute;
                left:-4px;
                top:-4px;
                z-index:2
            }
            .swal-icon--success__hide-corners{
                width:5px;
                height:90px;
                background-color:#fff;
                padding:1px;
                position:absolute;
                left:28px;
                top:8px;
                z-index:1;
                -webkit-transform:rotate(-45deg);
                transform:rotate(-45deg)
            }
            .swal-icon--success__line{
                height:5px;
                background-color:#a5dc86;
                display:block;
                border-radius:2px;
                position:absolute;
                z-index:2
            }
            .swal-icon--success__line--tip{
                width:25px;
                left:14px;
                top:46px;
                -webkit-transform:rotate(45deg);
                transform:rotate(45deg);
                -webkit-animation:animateSuccessTip .75s;
                animation:animateSuccessTip .75s
            }
            .swal-icon--success__line--long{
                width:47px;
                right:8px;
                top:38px;
                -webkit-transform:rotate(-45deg);
                transform:rotate(-45deg);
                -webkit-animation:animateSuccessLong .75s;
                animation:animateSuccessLong .75s
            }
            @-webkit-keyframes rotatePlaceholder{
                0%{
                    -webkit-transform:rotate(-45deg);
                    transform:rotate(-45deg)
                }
                5%{
                    -webkit-transform:rotate(-45deg);
                    transform:rotate(-45deg)
                }
                12%{
                    -webkit-transform:rotate(-405deg);
                    transform:rotate(-405deg)
                }
                to{
                    -webkit-transform:rotate(-405deg);
                    transform:rotate(-405deg)
                }
            }
            @keyframes rotatePlaceholder{
                0%{
                    -webkit-transform:rotate(-45deg);
                    transform:rotate(-45deg)
                }
                5%{
                    -webkit-transform:rotate(-45deg);
                    transform:rotate(-45deg)
                }
                12%{
                    -webkit-transform:rotate(-405deg);
                    transform:rotate(-405deg)
                }
                to{
                    -webkit-transform:rotate(-405deg);
                    transform:rotate(-405deg)
                }
            }
            @-webkit-keyframes animateSuccessTip{
                0%{
                    width:0;
                    left:1px;
                    top:19px
                }
                54%{
                    width:0;
                    left:1px;
                    top:19px
                }
                70%{
                    width:50px;
                    left:-8px;
                    top:37px
                }
                84%{
                    width:17px;
                    left:21px;
                    top:48px
                }
                to{
                    width:25px;
                    left:14px;
                    top:45px
                }
            }
            @keyframes animateSuccessTip{
                0%{
                    width:0;
                    left:1px;
                    top:19px
                }
                54%{
                    width:0;
                    left:1px;
                    top:19px
                }
                70%{
                    width:50px;
                    left:-8px;
                    top:37px
                }
                84%{
                    width:17px;
                    left:21px;
                    top:48px
                }
                to{
                    width:25px;
                    left:14px;
                    top:45px
                }
            }
            @-webkit-keyframes animateSuccessLong{
                0%{
                    width:0;
                    right:46px;
                    top:54px
                }
                65%{
                    width:0;
                    right:46px;
                    top:54px
                }
                84%{
                    width:55px;
                    right:0;
                    top:35px
                }
                to{
                    width:47px;
                    right:8px;
                    top:38px
                }
            }
            @keyframes animateSuccessLong{
                0%{
                    width:0;
                    right:46px;
                    top:54px
                }
                65%{
                    width:0;
                    right:46px;
                    top:54px
                }
                84%{
                    width:55px;
                    right:0;
                    top:35px
                }
                to{
                    width:47px;
                    right:8px;
                    top:38px
                }
            }
            .swal-icon--info{
                border-color:#c9dae1
            }
            .swal-icon--info:before{
                width:5px;
                height:29px;
                bottom:17px;
                border-radius:2px;
                margin-left:-2px
            }
            .swal-icon--info:after,.swal-icon--info:before{
                content:"";
                position:absolute;
                left:50%;
                background-color:#c9dae1
            }
            .swal-icon--info:after{
                width:7px;
                height:7px;
                border-radius:50%;
                margin-left:-3px;
                top:19px
            }
            .swal-icon{
                width:80px;
                height:80px;
                border-width:4px;
                border-style:solid;
                border-radius:50%;
                padding:0;
                position:relative;
                box-sizing:content-box;
                margin:20px auto
            }
            .swal-icon:first-child{
                margin-top:32px
            }
            .swal-icon--custom{
                width:auto;
                height:auto;
                max-width:100%;
                border:none;
                border-radius:0
            }
            .swal-icon img{
                max-width:100%;
                max-height:100%
            }
            .swal-title{
                color:rgba(0,0,0,.65);
                font-weight:600;
                text-transform:none;
                position:relative;
                display:block;
                padding:13px 16px;
                font-size:27px;
                line-height:normal;
                text-align:center;
                margin-bottom:0
            }
            .swal-title:first-child{
                margin-top:26px
            }
            .swal-title:not(:first-child){
                padding-bottom:0
            }
            .swal-title:not(:last-child){
                margin-bottom:13px
            }
            .swal-text{
                font-size:16px;
                position:relative;
                float:none;
                line-height:normal;
                vertical-align:top;
                text-align:left;
                display:inline-block;
                margin:0;
                padding:0 10px;
                font-weight:400;
                color:rgba(0,0,0,.64);
                max-width:calc(100% - 20px);
                overflow-wrap:break-word;
                box-sizing:border-box
            }
            .swal-text:first-child{
                margin-top:45px
            }
            .swal-text:last-child{
                margin-bottom:45px
            }
            .swal-footer{
                text-align:right;
                padding-top:13px;
                margin-top:13px;
                padding:13px 16px;
                border-radius:inherit;
                border-top-left-radius:0;
                border-top-right-radius:0
            }
            .swal-button-container{
                margin:5px;
                display:inline-block;
                position:relative
            }
            .swal-button{
                background-color:#7cd1f9;
                color:#fff;
                border:none;
                box-shadow:none;
                border-radius:5px;
                font-weight:600;
                font-size:14px;
                padding:10px 24px;
                margin:0;
                cursor:pointer
            }
            .swal-button:not([disabled]):hover{
                background-color:#78cbf2
            }
            .swal-button:active{
                background-color:#70bce0
            }
            .swal-button:focus{
                outline:none;
                box-shadow:0 0 0 1px #fff,0 0 0 3px rgba(43,114,165,.29)
            }
            .swal-button[disabled]{
                opacity:.5;
                cursor:default
            }
            .swal-button::-moz-focus-inner{
                border:0
            }
            .swal-button--cancel{
                color:#555;
                background-color:#efefef
            }
            .swal-button--cancel:not([disabled]):hover{
                background-color:#e8e8e8
            }
            .swal-button--cancel:active{
                background-color:#d7d7d7
            }
            .swal-button--cancel:focus{
                box-shadow:0 0 0 1px #fff,0 0 0 3px rgba(116,136,150,.29)
            }
            .swal-button--danger{
                background-color:#e64942
            }
            .swal-button--danger:not([disabled]):hover{
                background-color:#df4740
            }
            .swal-button--danger:active{
                background-color:#cf423b
            }
            .swal-button--danger:focus{
                box-shadow:0 0 0 1px #fff,0 0 0 3px rgba(165,43,43,.29)
            }
            .swal-content{
                padding:0 20px;
                margin-top:20px;
                font-size:medium
            }
            .swal-content:last-child{
                margin-bottom:20px
            }
            .swal-content__input,.swal-content__textarea{
                -webkit-appearance:none;
                background-color:#fff;
                border:none;
                font-size:14px;
                display:block;
                box-sizing:border-box;
                width:100%;
                border:1px solid rgba(0,0,0,.14);
                padding:10px 13px;
                border-radius:2px;
                transition:border-color .2s
            }
            .swal-content__input:focus,.swal-content__textarea:focus{
                outline:none;
                border-color:#6db8ff
            }
            .swal-content__textarea{
                resize:vertical
            }
            .swal-button--loading{
                color:transparent
            }
            .swal-button--loading~.swal-button__loader{
                opacity:1
            }
            .swal-button__loader{
                position:absolute;
                height:auto;
                width:43px;
                z-index:2;
                left:50%;
                top:50%;
                -webkit-transform:translateX(-50%) translateY(-50%);
                transform:translateX(-50%) translateY(-50%);
                text-align:center;
                pointer-events:none;
                opacity:0
            }
            .swal-button__loader div{
                display:inline-block;
                float:none;
                vertical-align:baseline;
                width:9px;
                height:9px;
                padding:0;
                border:none;
                margin:2px;
                opacity:.4;
                border-radius:7px;
                background-color:hsla(0,0%,100%,.9);
                transition:background .2s;
                -webkit-animation:swal-loading-anim 1s infinite;
                animation:swal-loading-anim 1s infinite
            }
            .swal-button__loader div:nth-child(3n+2){
                -webkit-animation-delay:.15s;
                animation-delay:.15s
            }
            .swal-button__loader div:nth-child(3n+3){
                -webkit-animation-delay:.3s;
                animation-delay:.3s
            }
            @-webkit-keyframes swal-loading-anim{
                0%{
                    opacity:.4
                }
                20%{
                    opacity:.4
                }
                50%{
                    opacity:1
                }
                to{
                    opacity:.4
                }
            }
            @keyframes swal-loading-anim{
                0%{
                    opacity:.4
                }
                20%{
                    opacity:.4
                }
                50%{
                    opacity:1
                }
                to{
                    opacity:.4
                }
            }
            .swal-overlay{
                position:fixed;
                top:0;
                bottom:0;
                left:0;
                right:0;
                text-align:center;
                font-size:0;
                overflow-y:auto;
                background-color:rgba(0,0,0,.4);
                z-index:10000;
                pointer-events:none;
                opacity:0;
                transition:opacity .3s
            }
            .swal-overlay:before{
                content:" ";
                display:inline-block;
                vertical-align:middle;
                height:100%
            }
            .swal-overlay--show-modal{
                opacity:1;
                pointer-events:auto
            }
            .swal-overlay--show-modal .swal-modal{
                opacity:1;
                pointer-events:auto;
                box-sizing:border-box;
                -webkit-animation:showSweetAlert .3s;
                animation:showSweetAlert .3s;
                will-change:transform
            }
            .swal-modal{
                width:478px;
                opacity:0;
                pointer-events:none;
                background-color:#fff;
                text-align:center;
                border-radius:5px;
                position:static;
                margin:20px auto;
                display:inline-block;
                vertical-align:middle;
                -webkit-transform:scale(1);
                transform:scale(1);
                -webkit-transform-origin:50% 50%;
                transform-origin:50% 50%;
                z-index:10001;
                transition:opacity .2s,-webkit-transform .3s;
                transition:transform .3s,opacity .2s;
                transition:transform .3s,opacity .2s,-webkit-transform .3s
            }
            @media (max-width:500px){
                .swal-modal{
                    width:calc(100% - 20px)
                }
            }
            @-webkit-keyframes showSweetAlert{
                0%{
                    -webkit-transform:scale(1);
                    transform:scale(1)
                }
                1%{
                    -webkit-transform:scale(.5);
                    transform:scale(.5)
                }
                45%{
                    -webkit-transform:scale(1.05);
                    transform:scale(1.05)
                }
                80%{
                    -webkit-transform:scale(.95);
                    transform:scale(.95)
                }
                to{
                    -webkit-transform:scale(1);
                    transform:scale(1)
                }
            }
            @keyframes showSweetAlert{
                0%{
                    -webkit-transform:scale(1);
                    transform:scale(1)
                }
                1%{
                    -webkit-transform:scale(.5);
                    transform:scale(.5)
                }
                45%{
                    -webkit-transform:scale(1.05);
                    transform:scale(1.05)
                }
                80%{
                    -webkit-transform:scale(.95);
                    transform:scale(.95)
                }
                to{
                    -webkit-transform:scale(1);
                    transform:scale(1)
                }
            }</style>

        <title>BArtMint -Create NFT</title>

        <jsp:include page="../dashboard/web-frags/head-tags.jsp" />

        <style type="text/css">
            .layout-menu-fixed .layout-navbar-full .layout-menu,
            .layout-page {
                padding-top: 0px !important;
            }
            .content-wrapper {
                padding-bottom: 0px !important;
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
            .form-control,.form-select{
                border-radius: 1px;
                background-color: #191919;
                color: #fff;
            }

            .form-control:active,.form-select:active{
                border-radius: 1px;
                background-color: #191919;
                color: #fff;
            }
            .btn{
                border-radius:2px;
            }
        </style>

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
                                                            <label class="mr-sm-2 form-label">Price (USD)</label>
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
                              ajaxPageLoad('view-arts', 'ART ROOM');
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