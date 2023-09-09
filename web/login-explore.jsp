

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <head>
        <jsp:include page="WEB-INF/web-frag/head-tags.jsp" />
        <title>BArtMint -NFT MarketPlace</title>
        <style>
            .menu-item{
                list-style-type:none;
                font-size:23px;
                margin-bottom:10px;
            }
            .close-btn{
                font-size:36px;
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
        <div class="ae"  style="margin-top: 150px;">


            <div class="a2w a3l a1z a3m">
                <div class="a1R a3">
                    <div class="a4 ak">
                        <h2 class="a1Y a3n a1O aZ text-center">
                            NFT MarketPlace
                        </h2>
                    </div>
                </div>
            </div>


            <div class="a1R a3 a1S">

                <c:forEach var="nftArt" items="${nftArts}">
                    <div class="a4 ak md:a1T/2 lg:a1T/3 2xl:a1T/4">
                        <div class="a1U a1V a1W a1G aM a2T[18px]">
                            <div class="af a1Y a2p av">
                                <img src="/FileUploaderApp/temp/${nftArt.imageName}" alt="auctions" class="a4" style="height:250px;">
                            </div>
                            <div>
                                <h3>
                                    <a href="javascript:void(0)" class="a2D a2a a1Q aX aZ hover:a1u">
                                        ${nftArt.artName}</a>
                                </h3>
                                <div class="a2b a3 a5 ah">
                                    <div class="a4">
                                        <div class="a3 a5">
                                            <div class="a4">
                                                <h4 class="a2Y aX aZ">
                                                    <a href="javascript:void(0)">@${nftArt.userId}</a>
                                                    <span class="al a2Y a1o a1t">
                                                        creator
                                                    </span>
                                                </h4>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="a4">
                                        <h5 class="a33 a2Y aX aZ">
                                            ${nftArt.price} ETH
                                            <span class="al a2Y a1o a1t">
                                                Current Bid
                                            </span>
                                        </h5>
                                    </div>
                                </div>
                                <div class="a3 a5 ah a34 a1G a35">
                                    <c:choose>
                                        <c:when test="${user.userId ne nftArt.userId}">
                                            <form class="buy-art">
                                                <input name="id" hidden="" value="${nftArt.artId}"/>
                                                <input id="userId"  hidden="" value="${user.userId}"/>
                                                <button type="submit" class="a3 a5 a1Z a1f a1C aP ak a1n aX aZ a1w hover:a36 sm:a2u">
                                                    Place Bid
                                                </button>
                                            </form>
                                        </c:when>
                                        <c:otherwise>

                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>



            <div class="row">
                <form method="GET" action="previous-art-page" class="float-left">
                    <input hidden="" value="${page -1}" name="page"/>
                    <c:if test="${page > 1}">
                        <div class="col-7">
                            <button class="btn btn-secondary"><i class="icon-arrow-left"></i> Previous</button>
                        </div>
                    </c:if>
                </form>
                <form method="GET" action="next-art-page" class="float-right">
                    <input hidden="" value="${page}" name="page"/>
                    <c:if test="${page < totalPages}">
                        <div class="col-7">
                            <button id="loadMore" class="btn btn-secondary" type="submit">Next <i class="icon-arrow-right"></i></button>
                        </div>
                    </c:if>
                </form>
            </div>

        </div>
        <jsp:include page="WEB-INF/web-frag/footer.jsp" />
        <script src="assets/js/jquery-1.12.4.min.js"></script>
        <script src="assets/js/jquery-3.3.1.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.7.27/sweetalert2.min.js" integrity="sha512-mJQ9oQHzLM2zXe1cwiHmnMddNrmjv1YlaKZe1rM4J7q8JTnNn9UgeJVBV9jyV/lVGdXymVx6odhgwNZjQD8AqA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.7.27/sweetalert2.all.js" integrity="sha512-AqI7WBZEjM+wOnNSxgOafzB2xKgQpxsNmTVzPINEu9CDiFgrisyJOrqCHarauciq+82uHWgGjfPBzidkuykxBA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.7.27/sweetalert2.all.min.js" integrity="sha512-UfSxwRR8LlT3e4VLW1fx76+guLBWBALrK5mo7aJ92ZGiqGiR2Cu2AWgQ1FMLthwh2MbBVR0PqUCNiG6/QzsQNA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.7.27/sweetalert2.css" integrity="sha512-eRBMRR/qeSlGYAb6a7UVwNFgXHRXa62u20w4veTi9suM2AkgkJpjcU5J8UVcoRCw0MS096e3n716Qe9Bf14EyQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.7.27/sweetalert2.js" integrity="sha512-Whljenc7loGh6sTkk1U+U35A65fFVs4tvIoZSQbFvvtauc+uL7US3tdHXzal7sYVgKaMD/vwcYSMgeEK9hslrg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.7.27/sweetalert2.min.css" integrity="sha512-IScV5kvJo+TIPbxENerxZcEpu9VrLUGh1qYWv6Z9aylhxWE4k4Fch3CHl0IYYmN+jrnWQBPlpoTVoWfSMakoKA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <script>
            $(document).ready(function(){
                $('.buy-art').submit(function(e){
                    e.preventDefault();
                    var userId = $('#userId').val();
                    if(userId === null){
                        swal.fire("Error!", "You Have To have an account and login to get this art!", "error");
                    }else{
                        var formData = $(this).serialize();
                        $.ajax({
                            url: 'dashboard/buy-nft',
                            method: 'POST',
                            data: formData,
                            dataType: 'JSON',
                            beforeSend: function(xhr){
                            },
                            success: function(data, textStatus, jqXHR){
                                if(data.message === 'success'){
                                    swal.fire("Success!", "You Have Purchase this Art Successfully!", "success");

                                }else
                                    swal.fire("Error!", data.message, "error");
                            },
                            complete: function(jqXHR, textStatus){
                            },
                            error: function(jqXHR, textStatus, errorThrown){
                                swal("Error!", "There was an error!", "error");
                            }
                        });
                    }
                });
            });
        </script>

    </body>
</html>
