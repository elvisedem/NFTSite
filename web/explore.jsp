

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
                <c:choose>
                    <c:when test="${(user.email ne null) and (user.userId ne null) }">
                        <c:forEach var="nftArt" items="${nftArts}">
                            <div class="a4 ak md:a1T/2 lg:a1T/3 2xl:a1T/4">
                                <div class="a1U a1V a1W a1G aM a2T[18px]">
                                    <a href="explore-art?id=${nftArt.artId}" >
                                        <h3 class="a2D a2a a1Q aX aZ hover:a1u">
                                            ${nftArt.artName}
                                        </h3>
                                    </a>
                                    <div class="a2b a3 a5 ah">
                                        <h5 class=" a2Y aX aZ">
                                            ${nftArt.price} ETH
                                            <span class="al a2Y a1o a1t">
                                                Current Bid
                                            </span>
                                        </h5>
                                    </div>
                                    <input class="id" hidden="" value=""/>
                                    <input id="userId" name="userId"  hidden="" value="${user.userId}"/>
                                    <c:if test="${user.userId ne nftArt.userId and nftArt.status ne 'sold'}">
                                        <button data-bind="${nftArt.artId}" type="button" class="buy-art a3 a5 a1Z a1f a1C aP ak a1n aX aZ a1w hover:a36 sm:a2u">
                                            Buy NFT
                                        </button>
                                    </c:if>
                                    <c:if test="${ nftArt.status eq 'sold'}">
                                        <button type="button" style="background-color: red !important" class="sold a3 a5 a1Z a1f a1C aP ak a1n aX aZ a1w hover:a36 sm:a2u">
                                            SOLD
                                        </button>
                                    </c:if>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>

                        <div class="a4 ak md:a1T/2 lg:a1T/3 2xl:a1T/4">
                            <div class="a1U a1V a1W a1G aM a2T[18px]">
                                <div class="af a1Y a2p av">
                                    <img src="nfts/76559298-91AA-4AD8-9BAC-EBA19F71BD67.jpg" alt="auctions" class="a4" style="height:250px;">

                                </div>
                                <div>
                                    <h3>
                                        <a href="javascript:void(0)" class="a2D a2a a1Q aX aZ hover:a1u">
                                            Saint Zayn</a>
                                    </h3>
                                    <div class="a2b a3 a5 ah">
                                        <div class="a4">
                                            <div class="a3 a5">

                                                <div class="a4">
                                                    <h4 class="a2Y aX aZ">
                                                        <a href="javascript:void(0)">@Saint Zayn</a>
                                                        <span class="al a2Y a1o a1t">
                                                            creator
                                                        </span>
                                                    </h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="a4">
                                            <h5 class="a33 a2Y aX aZ">
                                                0.9489 ETH
                                                <span class="al a2Y a1o a1t">
                                                    Current Bid
                                                </span>
                                            </h5>
                                        </div>
                                    </div>
                                    <div class="a3 a5 ah a34 a1G a35">
                                        <a href="" class="a3 a5 a1Z a1f a1C aP ak a1n aX aZ a1w hover:a36 sm:a2u">
                                            Place Bid
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="a4 ak md:a1T/2 lg:a1T/3 2xl:a1T/4">
                            <div class="a1U a1V a1W a1G aM a2T[18px]">
                                <div class="af a1Y a2p av">
                                    <img src="nfts/art4.jpg" alt="auctions" class="a4" style="height:250px;">

                                </div>
                                <div>
                                    <h3>
                                        <a href="javascript:void(0)" class="a2D a2a a1Q aX aZ hover:a1u">
                                            Zack Russel</a>
                                    </h3>
                                    <div class="a2b a3 a5 ah">
                                        <div class="a4">
                                            <div class="a3 a5">

                                                <div class="a4">
                                                    <h4 class="a2Y aX aZ">
                                                        <a href="javascript:void(0)">@Zack Russel</a>
                                                        <span class="al a2Y a1o a1t">
                                                            creator
                                                        </span>
                                                    </h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="a4">
                                            <h5 class="a33 a2Y aX aZ">
                                                2.2931 ETH
                                                <span class="al a2Y a1o a1t">
                                                    Current Bid
                                                </span>
                                            </h5>
                                        </div>
                                    </div>
                                    <div class="a3 a5 ah a34 a1G a35">
                                        <a href="" class="a3 a5 a1Z a1f a1C aP ak a1n aX aZ a1w hover:a36 sm:a2u">
                                            Place Bid
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="a4 ak md:a1T/2 lg:a1T/3 2xl:a1T/4">
                            <div class="a1U a1V a1W a1G aM a2T[18px]">
                                <div class="af a1Y a2p av">
                                    <img src="nfts/art3.jpg" alt="auctions" class="a4" style="height:250px;">

                                </div>
                                <div>
                                    <h3>
                                        <a href="javascript:void(0)" class="a2D a2a a1Q aX aZ hover:a1u">
                                            DC Boy</a>
                                    </h3>
                                    <div class="a2b a3 a5 ah">
                                        <div class="a4">
                                            <div class="a3 a5">

                                                <div class="a4">
                                                    <h4 class="a2Y aX aZ">
                                                        <a href="javascript:void(0)">DC Boy</a>
                                                        <span class="al a2Y a1o a1t">
                                                            creator
                                                        </span>
                                                    </h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="a4">
                                            <h5 class="a33 a2Y aX aZ">
                                                2.2931 ETH
                                                <span class="al a2Y a1o a1t">
                                                    Current Bid
                                                </span>
                                            </h5>
                                        </div>
                                    </div>
                                    <div class="a3 a5 ah a34 a1G a35">
                                        <a href="" class="a3 a5 a1Z a1f a1C aP ak a1n aX aZ a1w hover:a36 sm:a2u">
                                            Place Bid
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="a4 ak md:a1T/2 lg:a1T/3 2xl:a1T/4">
                            <div class="a1U a1V a1W a1G aM a2T[18px]">
                                <div class="af a1Y a2p av">
                                    <img src="nfts/WhatsApp%20Image%202023-06-16%20at%2009.39.54.jpg" alt="auctions" class="a4" style="height:250px;">

                                </div>
                                <div>
                                    <h3>
                                        <a href="javascript:void(0)" class="a2D a2a a1Q aX aZ hover:a1u">
                                            Rachet</a>
                                    </h3>
                                    <div class="a2b a3 a5 ah">
                                        <div class="a4">
                                            <div class="a3 a5">

                                                <div class="a4">
                                                    <h4 class="a2Y aX aZ">
                                                        <a href="javascript:void(0)">@Rachet</a>
                                                        <span class="al a2Y a1o a1t">
                                                            creator
                                                        </span>
                                                    </h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="a4">
                                            <h5 class="a33 a2Y aX aZ">
                                                2.2894 ETH
                                                <span class="al a2Y a1o a1t">
                                                    Current Bid
                                                </span>
                                            </h5>
                                        </div>
                                    </div>
                                    <div class="a3 a5 ah a34 a1G a35">
                                        <a href="" class="a3 a5 a1Z a1f a1C aP ak a1n aX aZ a1w hover:a36 sm:a2u">
                                            Place Bid
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="a4 ak md:a1T/2 lg:a1T/3 2xl:a1T/4">
                            <div class="a1U a1V a1W a1G aM a2T[18px]">
                                <div class="af a1Y a2p av">
                                    <img src="nfts/20230216_131702.png" alt="auctions" class="a4" style="height:250px;">

                                </div>
                                <div>
                                    <h3>
                                        <a href="javascript:void(0)" class="a2D a2a a1Q aX aZ hover:a1u">
                                            Micha</a>
                                    </h3>
                                    <div class="a2b a3 a5 ah">
                                        <div class="a4">
                                            <div class="a3 a5">

                                                <div class="a4">
                                                    <h4 class="a2Y aX aZ">
                                                        <a href="javascript:void(0)">@Micha</a>
                                                        <span class="al a2Y a1o a1t">
                                                            creator
                                                        </span>
                                                    </h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="a4">
                                            <h5 class="a33 a2Y aX aZ">
                                                2.2931 ETH
                                                <span class="al a2Y a1o a1t">
                                                    Current Bid
                                                </span>
                                            </h5>
                                        </div>
                                    </div>
                                    <div class="a3 a5 ah a34 a1G a35">
                                        <a href="" class="a3 a5 a1Z a1f a1C aP ak a1n aX aZ a1w hover:a36 sm:a2u">
                                            Place Bid
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="a4 ak md:a1T/2 lg:a1T/3 2xl:a1T/4">
                            <div class="a1U a1V a1W a1G aM a2T[18px]">
                                <div class="af a1Y a2p av">
                                    <img src="nfts/3A6D57A2-0B3A-4815-A65F-4A704A6414F1.jpg" alt="auctions" class="a4" style="height:250px;">

                                </div>
                                <div>
                                    <h3>
                                        <a href="javascript:void(0)" class="a2D a2a a1Q aX aZ hover:a1u">
                                            Jack Blake</a>
                                    </h3>
                                    <div class="a2b a3 a5 ah">
                                        <div class="a4">
                                            <div class="a3 a5">

                                                <div class="a4">
                                                    <h4 class="a2Y aX aZ">
                                                        <a href="javascript:void(0)">@Jack Blake</a>
                                                        <span class="al a2Y a1o a1t">
                                                            creator
                                                        </span>
                                                    </h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="a4">
                                            <h5 class="a33 a2Y aX aZ">
                                                2.7676 ETH
                                                <span class="al a2Y a1o a1t">
                                                    Current Bid
                                                </span>
                                            </h5>
                                        </div>
                                    </div>
                                    <div class="a3 a5 ah a34 a1G a35">
                                        <a href="" class="a3 a5 a1Z a1f a1C aP ak a1n aX aZ a1w hover:a36 sm:a2u">
                                            Place Bid
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="a4 ak md:a1T/2 lg:a1T/3 2xl:a1T/4">
                            <div class="a1U a1V a1W a1G aM a2T[18px]">
                                <div class="af a1Y a2p av">
                                    <img src="nfts/03_Imperialismo.jpg" alt="auctions" class="a4" style="height:250px;">

                                </div>
                                <div>
                                    <h3>
                                        <a href="javascript:void(0)" class="a2D a2a a1Q aX aZ hover:a1u">
                                            Пионы белые</a>
                                    </h3>
                                    <div class="a2b a3 a5 ah">
                                        <div class="a4">
                                            <div class="a3 a5">

                                                <div class="a4">
                                                    <h4 class="a2Y aX aZ">
                                                        <a href="javascript:void(0)">@Aguirrezperez</a>
                                                        <span class="al a2Y a1o a1t">
                                                            creator
                                                        </span>
                                                    </h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="a4">
                                            <h5 class="a33 a2Y aX aZ">
                                                1.1861 ETH
                                                <span class="al a2Y a1o a1t">
                                                    Current Bid
                                                </span>
                                            </h5>
                                        </div>
                                    </div>
                                    <div class="a3 a5 ah a34 a1G a35">
                                        <a href="" class="a3 a5 a1Z a1f a1C aP ak a1n aX aZ a1w hover:a36 sm:a2u">
                                            Place Bid
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="a4 ak md:a1T/2 lg:a1T/3 2xl:a1T/4">
                            <div class="a1U a1V a1W a1G aM a2T[18px]">
                                <div class="af a1Y a2p av">
                                    <img src="nfts/1-Exploring My Inner Fish.jpg" alt="auctions" class="a4" style="height:250px;">

                                </div>
                                <div>
                                    <h3>
                                        <a href="javascript:void(0)" class="a2D a2a a1Q aX aZ hover:a1u">
                                            自然</a>
                                    </h3>
                                    <div class="a2b a3 a5 ah">
                                        <div class="a4">
                                            <div class="a3 a5">

                                                <div class="a4">
                                                    <h4 class="a2Y aX aZ">
                                                        <a href="javascript:void(0)">@Markalvarez125</a>
                                                        <span class="al a2Y a1o a1t">
                                                            creator
                                                        </span>
                                                    </h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="a4">
                                            <h5 class="a33 a2Y aX aZ">
                                                0.9489 ETH
                                                <span class="al a2Y a1o a1t">
                                                    Current Bid
                                                </span>
                                            </h5>
                                        </div>
                                    </div>
                                    <div class="a3 a5 ah a34 a1G a35">
                                        <a href="" class="a3 a5 a1Z a1f a1C aP ak a1n aX aZ a1w hover:a36 sm:a2u">
                                            Place Bid
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="a4 ak md:a1T/2 lg:a1T/3 2xl:a1T/4">
                            <div class="a1U a1V a1W a1G aM a2T[18px]">
                                <div class="af a1Y a2p av">
                                    <img src="nfts/20_ConceptArt_ProcessoEstruturado_NathiellyAndrades_v01.png" alt="auctions" class="a4" style="height:250px;">

                                </div>
                                <div>
                                    <h3>
                                        <a href="javascript:void(0)" class="a2D a2a a1Q aX aZ hover:a1u">
                                            Concept_Magician</a>
                                    </h3>
                                    <div class="a2b a3 a5 ah">
                                        <div class="a4">
                                            <div class="a3 a5">

                                                <div class="a4">
                                                    <h4 class="a2Y aX aZ">
                                                        <a href="javascript:void(0)">@Nathielly_Andrades</a>
                                                        <span class="al a2Y a1o a1t">
                                                            creator
                                                        </span>
                                                    </h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="a4">
                                            <h5 class="a33 a2Y aX aZ">
                                                0.6326 ETH
                                                <span class="al a2Y a1o a1t">
                                                    Current Bid
                                                </span>
                                            </h5>
                                        </div>
                                    </div>
                                    <div class="a3 a5 ah a34 a1G a35">
                                        <a href="login.html" class="a3 a5 a1Z a1f a1C aP ak a1n aX aZ a1w hover:a36 sm:a2u">
                                            Place Bid
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="a4 ak md:a1T/2 lg:a1T/3 2xl:a1T/4">
                            <div class="a1U a1V a1W a1G aM a2T[18px]">
                                <div class="af a1Y a2p av">
                                    <img src="nfts/kunno01_abstract_one-stroke_painting_of_a_ford_mustang_painted__d495e053-2f33-4a0f-9ebb-02fd37f91b0f.jpg" alt="auctions" class="a4" style="height:250px;">

                                </div>
                                <div>
                                    <h3>
                                        <a href="#" class="a2D a2a a1Q aX aZ hover:a1u">
                                            Daaam</a>
                                    </h3>
                                    <div class="a2b a3 a5 ah">
                                        <div class="a4">
                                            <div class="a3 a5">
                                                <div class="a2Z a2_ a4 aL[32px] a1f">
                                                    <img src="dashboard/assets/images/avatar/default-profile-picture.jpg" alt="creator" class="a30 a4 a31 a32">
                                                </div>
                                                <div class="a4">
                                                    <h4 class="a2Y aX aZ">
                                                        <a href="#">@Anna </a>
                                                        <span class="al a2Y a1o a1t">
                                                            creator
                                                        </span>
                                                    </h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="a4">
                                            <h5 class="a33 a2Y aX aZ">
                                                0.7907 ETH
                                                <span class="al a2Y a1o a1t">
                                                    Current Bid
                                                </span>
                                            </h5>
                                        </div>
                                    </div>
                                    <div class="a3 a5 ah a34 a1G a35">
                                        <a href="" class="a3 a5 a1Z a1f a1C aP ak a1n aX aZ a1w hover:a36 sm:a2u">
                                            Place Bid
                                        </a>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="a4 ak md:a1T/2 lg:a1T/3 2xl:a1T/4">
                            <div class="a1U a1V a1W a1G aM a2T[18px]">
                                <div class="af a1Y a2p av">
                                    <img src="nfts/0579606A-234A-4CDF-822B-8A5357C1B47E.jpg" alt="auctions" class="a4" style="height:250px;">

                                </div>
                                <div>
                                    <h3>
                                        <a href="#" class="a2D a2a a1Q aX aZ hover:a1u">
                                            Imperialismo by Isa Marcello</a>
                                    </h3>
                                    <div class="a2b a3 a5 ah">
                                        <div class="a4">
                                            <div class="a3 a5">
                                                <div class="a2Z a2_ a4 aL[32px] a1f">
                                                    <img src="dashboard/assets/images/avatar/default-profile-picture.jpg" alt="creator" class="a30 a4 a31 a32">
                                                </div>
                                                <div class="a4">
                                                    <h4 class="a2Y aX aZ">
                                                        <a href="#">@Wisleyparker</a>
                                                        <span class="al a2Y a1o a1t">
                                                            creator
                                                        </span>
                                                    </h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="a4">
                                            <h5 class="a33 a2Y aX aZ">
                                                2.9521 ETH
                                                <span class="al a2Y a1o a1t">
                                                    Current Bid
                                                </span>
                                            </h5>
                                        </div>
                                    </div>
                                    <div class="a3 a5 ah a34 a1G a35">
                                        <a href="" class="a3 a5 a1Z a1f a1C aP ak a1n aX aZ a1w hover:a36 sm:a2u">
                                            Place Bid
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="a4 ak md:a1T/2 lg:a1T/3 2xl:a1T/4">
                            <div class="a1U a1V a1W a1G aM a2T[18px]">
                                <div class="af a1Y a2p av">
                                    <img src="nfts/1 (2).jpg" alt="auctions" class="a4" style="height:250px;">

                                </div>
                                <div>
                                    <h3>
                                        <a href="#" class="a2D a2a a1Q aX aZ hover:a1u">
                                            Grief (And Light)</a>
                                    </h3>
                                    <div class="a2b a3 a5 ah">
                                        <div class="a4">
                                            <div class="a3 a5">
                                                <div class="a2Z a2_ a4 aL[32px] a1f">
                                                    <img src="dashboard/assets/images/avatar/default-profile-picture.jpg" alt="creator" class="a30 a4 a31 a32">
                                                </div>
                                                <div class="a4">
                                                    <h4 class="a2Y aX aZ">
                                                        <a href="#">@Wisleyparker</a>
                                                        <span class="al a2Y a1o a1t">
                                                            creator
                                                        </span>
                                                    </h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="a4">
                                            <h5 class="a33 a2Y aX aZ">
                                                1.999 ETH
                                                <span class="al a2Y a1o a1t">
                                                    Current Bid
                                                </span>
                                            </h5>
                                        </div>
                                    </div>
                                    <div class="a3 a5 ah a34 a1G a35">
                                        <a href="login.html" class="a3 a5 a1Z a1f a1C aP ak a1n aX aZ a1w hover:a36 sm:a2u">
                                            Place Bid
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="a4 ak md:a1T/2 lg:a1T/3 2xl:a1T/4">
                            <div class="a1U a1V a1W a1G aM a2T[18px]">
                                <div class="af a1Y a2p av">
                                    <img src="nfts/168BA1EC-F758-4AA4-A00F-9A38F5F8607C (1).jpg" alt="auctions" class="a4" style="height:250px;">

                                </div>
                                <div>
                                    <h3>
                                        <a href="#" class="a2D a2a a1Q aX aZ hover:a1u">
                                            Exploring My Inner Fish</a>
                                    </h3>
                                    <div class="a2b a3 a5 ah">
                                        <div class="a4">
                                            <div class="a3 a5">
                                                <div class="a2Z a2_ a4 aL[32px] a1f">
                                                    <img src="dashboard/assets/images/avatar/default-profile-picture.jpg" alt="creator" class="a30 a4 a31 a32">
                                                </div>
                                                <div class="a4">
                                                    <h4 class="a2Y aX aZ">
                                                        <a href="#">@Anna </a>
                                                        <span class="al a2Y a1o a1t">
                                                            creator
                                                        </span>
                                                    </h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="a4">
                                            <h5 class="a33 a2Y aX aZ">
                                                1.0016 ETH
                                                <span class="al a2Y a1o a1t">
                                                    Current Bid
                                                </span>
                                            </h5>
                                        </div>
                                    </div>
                                    <div class="a3 a5 ah a34 a1G a35">
                                        <a href="" class="a3 a5 a1Z a1f a1C aP ak a1n aX aZ a1w hover:a36 sm:a2u">
                                            Place Bid
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="a4 ak md:a1T/2 lg:a1T/3 2xl:a1T/4">
                            <div class="a1U a1V a1W a1G aM a2T[18px]">
                                <div class="af a1Y a2p av">
                                    <img src="nfts/1 IMG_2892.jpg" alt="auctions" class="a4" style="height:250px;">

                                </div>
                                <div>
                                    <h3>
                                        <a href="#" class="a2D a2a a1Q aX aZ hover:a1u">
                                            Euphoria 1 </a>
                                    </h3>
                                    <div class="a2b a3 a5 ah">
                                        <div class="a4">
                                            <div class="a3 a5">
                                                <div class="a2Z a2_ a4 aL[32px] a1f">
                                                    <img src="dashboard/assets/images/avatar/default-profile-picture.jpg" alt="creator" class="a30 a4 a31 a32">
                                                </div>
                                                <div class="a4">
                                                    <h4 class="a2Y aX aZ">
                                                        <a href="#">@Anna </a>
                                                        <span class="al a2Y a1o a1t">
                                                            creator
                                                        </span>
                                                    </h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="a4">
                                            <h5 class="a33 a2Y aX aZ">
                                                0.9911 ETH
                                                <span class="al a2Y a1o a1t">
                                                    Current Bid
                                                </span>
                                            </h5>
                                        </div>
                                    </div>
                                    <div class="a3 a5 ah a34 a1G a35">
                                        <a href="" class="a3 a5 a1Z a1f a1C aP ak a1n aX aZ a1w hover:a36 sm:a2u">
                                            Place Bid
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="a4 ak md:a1T/2 lg:a1T/3 2xl:a1T/4">
                            <div class="a1U a1V a1W a1G aM a2T[18px]">
                                <div class="af a1Y a2p av">
                                    <img src="nfts/8FD5BAC3-1960-4475-9C71-937E933E9BEE.jpg" alt="auctions" class="a4" style="height:250px;">

                                </div>
                                <div>
                                    <h3>
                                        <a href="#" class="a2D a2a a1Q aX aZ hover:a1u">
                                            Shree Krishna</a>
                                    </h3>
                                    <div class="a2b a3 a5 ah">
                                        <div class="a4">
                                            <div class="a3 a5">
                                                <div class="a2Z a2_ a4 aL[32px] a1f">
                                                    <img src="dashboard/assets/images/avatar/default-profile-picture.jpg" alt="creator" class="a30 a4 a31 a32">
                                                </div>
                                                <div class="a4">
                                                    <h4 class="a2Y aX aZ">
                                                        <a href="#">@Alvaro_Lucia</a>
                                                        <span class="al a2Y a1o a1t">
                                                            creator
                                                        </span>
                                                    </h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="a4">
                                            <h5 class="a33 a2Y aX aZ">
                                                0.5272 ETH
                                                <span class="al a2Y a1o a1t">
                                                    Current Bid
                                                </span>
                                            </h5>
                                        </div>
                                    </div>
                                    <div class="a3 a5 ah a34 a1G a35">
                                        <a href="" class="a3 a5 a1Z a1f a1C aP ak a1n aX aZ a1w hover:a36 sm:a2u">
                                            Place Bid
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="a4 ak md:a1T/2 lg:a1T/3 2xl:a1T/4">
                            <div class="a1U a1V a1W a1G aM a2T[18px]">
                                <div class="af a1Y a2p av">
                                    <img src="nfts/IMG_20230225_144235.jpg" alt="auctions" class="a4" style="height:250px;">

                                </div>
                                <div>
                                    <h3>
                                        <a href="#" class="a2D a2a a1Q aX aZ hover:a1u">
                                            Shahrukh Khan Potrait</a>
                                    </h3>
                                    <div class="a2b a3 a5 ah">
                                        <div class="a4">
                                            <div class="a3 a5">
                                                <div class="a2Z a2_ a4 aL[32px] a1f">
                                                    <img src="dashboard/assets/images/avatar/default-profile-picture.jpg" alt="creator" class="a30 a4 a31 a32">
                                                </div>
                                                <div class="a4">
                                                    <h4 class="a2Y aX aZ">
                                                        <a href="#">@Alvaro_Lucia</a>
                                                        <span class="al a2Y a1o a1t">
                                                            creator
                                                        </span>
                                                    </h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="a4">
                                            <h5 class="a33 a2Y aX aZ">
                                                0.5272 ETH
                                                <span class="al a2Y a1o a1t">
                                                    Current Bid
                                                </span>
                                            </h5>
                                        </div>
                                    </div>
                                    <div class="a3 a5 ah a34 a1G a35">
                                        <a href="" class="a3 a5 a1Z a1f a1C aP ak a1n aX aZ a1w hover:a36 sm:a2u">
                                            Place Bid
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="a4 ak md:a1T/2 lg:a1T/3 2xl:a1T/4">
                            <div class="a1U a1V a1W a1G aM a2T[18px]">
                                <div class="af a1Y a2p av">
                                    <img src="nfts/IMG_20230121_164459_917.jpg" alt="auctions" class="a4" style="height:250px;">

                                </div>
                                <div>
                                    <h3>
                                        <a href="#" class="a2D a2a a1Q aX aZ hover:a1u">
                                            Nowhere31</a>
                                    </h3>
                                    <div class="a2b a3 a5 ah">
                                        <div class="a4">
                                            <div class="a3 a5">
                                                <div class="a2Z a2_ a4 aL[32px] a1f">
                                                    <img src="dashboard/assets/images/avatar/default-profile-picture.jpg" alt="creator" class="a30 a4 a31 a32">
                                                </div>
                                                <div class="a4">
                                                    <h4 class="a2Y aX aZ">
                                                        <a href="#">@Anna02</a>
                                                        <span class="al a2Y a1o a1t">
                                                            creator
                                                        </span>
                                                    </h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="a4">
                                            <h5 class="a33 a2Y aX aZ">
                                                0.5272 ETH
                                                <span class="al a2Y a1o a1t">
                                                    Current Bid
                                                </span>
                                            </h5>
                                        </div>
                                    </div>
                                    <div class="a3 a5 ah a34 a1G a35">
                                        <a href="" class="a3 a5 a1Z a1f a1C aP ak a1n aX aZ a1w hover:a36 sm:a2u">
                                            Place Bid
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="a4 ak md:a1T/2 lg:a1T/3 2xl:a1T/4">
                            <div class="a1U a1V a1W a1G aM a2T[18px]">
                                <div class="af a1Y a2p av">
                                    <img src="nfts/kunno01_abstract_one-stroke_painting_of_a_ford_mustang_painted__d495e053-2f33-4a0f-9ebb-02fd37f91b0f.jpg" alt="auctions" class="a4" style="height:250px;">

                                </div>
                                <div>
                                    <h3>
                                        <a href="#" class="a2D a2a a1Q aX aZ hover:a1u">
                                            Mustang One</a>
                                    </h3>
                                    <div class="a2b a3 a5 ah">
                                        <div class="a4">
                                            <div class="a3 a5">
                                                <div class="a2Z a2_ a4 aL[32px] a1f">
                                                    <img src="dashboard/assets/images/avatar/default-profile-picture.jpg" alt="creator" class="a30 a4 a31 a32">
                                                </div>
                                                <div class="a4">
                                                    <h4 class="a2Y aX aZ">
                                                        <a href="#">@Wei haw</a>
                                                        <span class="al a2Y a1o a1t">
                                                            creator
                                                        </span>
                                                    </h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="a4">
                                            <h5 class="a33 a2Y aX aZ">
                                                1.3179 ETH
                                                <span class="al a2Y a1o a1t">
                                                    Current Bid
                                                </span>
                                            </h5>
                                        </div>
                                    </div>
                                    <div class="a3 a5 ah a34 a1G a35">
                                        <a href="" class="a3 a5 a1Z a1f a1C aP ak a1n aX aZ a1w hover:a36 sm:a2u">
                                            Place Bid
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="a4 ak md:a1T/2 lg:a1T/3 2xl:a1T/4">
                            <div class="a1U a1V a1W a1G aM a2T[18px]">
                                <div class="af a1Y a2p av">
                                    <img src="nfts/IMG_20230222_222904.jpg" alt="auctions" class="a4" style="height:250px;">

                                </div>
                                <div>
                                    <h3>
                                        <a href="#" class="a2D a2a a1Q aX aZ hover:a1u">
                                            Nowhere37</a>
                                    </h3>
                                    <div class="a2b a3 a5 ah">
                                        <div class="a4">
                                            <div class="a3 a5">
                                                <div class="a2Z a2_ a4 aL[32px] a1f">
                                                    <img src="dashboard/assets/images/avatar/default-profile-picture.jpg" alt="creator" class="a30 a4 a31 a32">
                                                </div>
                                                <div class="a4">
                                                    <h4 class="a2Y aX aZ">
                                                        <a href="#">@Anna02</a>
                                                        <span class="al a2Y a1o a1t">
                                                            creator
                                                        </span>
                                                    </h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="a4">
                                            <h5 class="a33 a2Y aX aZ">
                                                0.5272 ETH
                                                <span class="al a2Y a1o a1t">
                                                    Current Bid
                                                </span>
                                            </h5>
                                        </div>
                                    </div>
                                    <div class="a3 a5 ah a34 a1G a35">
                                        <a href="" class="a3 a5 a1Z a1f a1C aP ak a1n aX aZ a1w hover:a36 sm:a2u">
                                            Place Bid
                                        </a>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="a4 ak md:a1T/2 lg:a1T/3 2xl:a1T/4">
                            <div class="a1U a1V a1W a1G aM a2T[18px]">
                                <div class="af a1Y a2p av">
                                    <img src="nfts/IMG20230520210953-01.jpg" alt="auctions" class="a4" style="height:250px;">

                                </div>
                                <div>
                                    <h3>
                                        <a href="javascript:void(0)" class="a2D a2a a1Q aX aZ hover:a1u">
                                            Abstract Art</a>
                                    </h3>
                                    <div class="a2b a3 a5 ah">
                                        <div class="a4">
                                            <div class="a3 a5">

                                                <div class="a4">
                                                    <h4 class="a2Y aX aZ">
                                                        <a href="javascript:void(0)">@Alvaro_Lucia</a>
                                                        <span class="al a2Y a1o a1t">
                                                            creator
                                                        </span>
                                                    </h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="a4">
                                            <h5 class="a33 a2Y aX aZ">
                                                5.2716 ETH
                                                <span class="al a2Y a1o a1t">
                                                    Current Bid
                                                </span>
                                            </h5>
                                        </div>
                                    </div>
                                    <div class="a3 a5 ah a34 a1G a35">
                                        <a href="" class="a3 a5 a1Z a1f a1C aP ak a1n aX aZ a1w hover:a36 sm:a2u">
                                            Place Bid
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="a4 ak md:a1T/2 lg:a1T/3 2xl:a1T/4">
                            <div class="a1U a1V a1W a1G aM a2T[18px]">
                                <div class="af a1Y a2p av">
                                    <img src="nfts/Screenshot_20230307-224646_2.png" alt="auctions" class="a4" style="height:250px;">

                                </div>
                                <div>
                                    <h3>
                                        <a href="javascript:void(0)" class="a2D a2a a1Q aX aZ hover:a1u">
                                            Hicso!</a>
                                    </h3>
                                    <div class="a2b a3 a5 ah">
                                        <div class="a4">
                                            <div class="a3 a5">

                                                <div class="a4">
                                                    <h4 class="a2Y aX aZ">
                                                        <a href="javascript:void(0)">@Anna </a>
                                                        <span class="al a2Y a1o a1t">
                                                            creator
                                                        </span>
                                                    </h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="a4">
                                            <h5 class="a33 a2Y aX aZ">
                                                1.3179 ETH
                                                <span class="al a2Y a1o a1t">
                                                    Current Bid
                                                </span>
                                            </h5>
                                        </div>
                                    </div>
                                    <div class="a3 a5 ah a34 a1G a35">
                                        <a href="" class="a3 a5 a1Z a1f a1C aP ak a1n aX aZ a1w hover:a36 sm:a2u">
                                            Place Bid
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>

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
                swal.fire("Warning", "If the buy button is not available on an art, it means that you are the owner", "warning");
                $('.buy-art').click(function(e){
                    e.preventDefault();
                    var nftId = $(this).attr('data-bind');
                    var userId = $('#userId').val();
                    if(userId === null){
                        swal.fire("Error!", "You Have To have an account and login to get this art!", "error");
                    }else{
                        $.ajax({
                            url: 'dashboard/buy-nft',
                            method: 'POST',
                            data: {id: nftId},
                            dataType: 'JSON',
                            beforeSend: function(xhr){
                            },
                            success: function(data, textStatus, jqXHR){
                                if(data.message === 'success'){
                                    swal.fire("Success!", "You Have Purchase this Art Successfully!", "success");
                                    window.location.href = "explore";

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
                $('#sold').click(function(){
                    swal.fire("Warning", "This Nft has already been sold to a user!", "warning");
                });
            });
        </script>

    </body>
</html>
