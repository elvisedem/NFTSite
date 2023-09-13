<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html
    lang="en"
    class="light-style layout-menu-fixed"
    dir="ltr"
    data-theme="theme-default"
    data-assets-path="assets/"
    data-template="vertical-menu-template-free"
    >
    <head>
        <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>

        <title>BArtMint -User Collection</title>
        <jsp:include page="../dashboard/web-frags/head-tags.jsp" />
    </head>

    <body>
        <div class="row">
            <div class="col-12">
                <div class="card profile_card">
                    <div class="card-body">

                        <ul class="">
                            <h3>${nftArt.artName} collection </h3>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="row p-2">
            <c:forEach var="nArts" items="${nArts}">
                <div class="col-12 col-lg-4 my-2">
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <span class="badge bg-primary float-end">
                                ${nftArt.artName}
                            </span>
                            <img class="card-img-top" src="/FileUploaderApp/temp/${nftArt.imageName}" alt="Card image" style="width:100%; height:250px;">
                            <div class="p-2 border-top-1">
                                Price:<p class="text-primary"> ${nftArt.price}</p>
                            </div>
                            <div class="p-2 border-top-1">

                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <!-- / Content -->

        <!-- Footer -->
        <footer class="content-footer footer">
            <div class="container-fluid d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">


            </div>
        </footer>
        <!-- / Footer -->

        <div class="content-backdrop fade"></div>

        <!-- Overlay -->
        <div class="layout-overlay layout-menu-toggle"></div>
        <!-- / Layout wrapper -->


        <jsp:include page="../dashboard/web-frags/footer-scripts.jsp" />
    </body>
</html>

