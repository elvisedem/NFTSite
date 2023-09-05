

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="assets/" data-template="vertical-menu-template-free" lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <title>BArtMint -My Collection</title>
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
                                <h3>My Collections </h3>
                                <c:choose>
                                    <c:when test="${collections ne null}">
                                        <c:forEach var="collection" items="${collections}">
                                            <div class="col-3">
                                                <div class="card">
                                                    <div class="card-body p-1 pt-3">
                                                        <div class="card border">
                                                            <a href="collection-arts?id=${collection.cId}">
                                                                <div class="card-body text-center ">
                                                                    <h4 class="text-primary">${collection.collectionName}</h4>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <p class="text-warning">Oops, You don't have any Collection, create more at the <a href="collection">Create a Collection Section</a></p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="row p-2">
                                <h3 class="p-2">NFT Artworks</h3>
                                <c:choose>
                                    <c:when test="${nftArts ne null}">
                                        <c:forEach var="nftArt" items="${nftArts}">
                                            <div class="col-12 col-lg-4 my-2">
                                                <div class="card shadow-sm">
                                                    <div class="card-body">
                                                        <span class="badge bg-primary float-end">
                                                            ${nftArt.artName}
                                                        </span>
                                                        <img class="card-img-top" src="/FileUploaderApp/temp/${nftArt.imageName}" alt="Card image" style="width:100%; height:250px;">
                                                        <div class="p-2 border-top-1">
                                                            ${nftArt.artName}                   </div>
                                                        <div class="p-2 border-top-1">
                                                            Price:<p class="text-primary"> ${nftArt.price}</p>
                                                        </div>
                                                        <div class="p-2 border-top-1">

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <p class="text-warning">Oops, You don't have any NFT, create more at the <a href="create-nft">Create an NFT Section</a></p>
                                    </c:otherwise>
                                </c:choose>
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
    </body>
</html>
