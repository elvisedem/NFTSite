

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <head>
        <jsp:include page="WEB-INF/web-frag/head-tags.jsp" />
        <title>BArtMint</title>
    </head>
    <body class="a0" x-data="
          {
          scrolledFromTop: false
          }
          " x-init="window.pageYOffset &gt;= 50 ? scrolledFromTop = true : scrolledFromTop = false" @scroll.window="window.pageYOffset &gt;= 50 ? scrolledFromTop = true : scrolledFromTop = false" data-new-gr-c-s-check-loaded="14.1091.0" data-gr-ext-installed="">

        <jsp:include page="WEB-INF/web-frag/header.jsp" />

        <jsp:include page="WEB-INF/web-frag/mobile-menu.jsp" />


        <section id="home" class="af a2o a2p a38 a39 a3a a1E[150px] a1F" style="background-image: url(assets/images/hero/common-bg.html)">
            <div class="ar a2 a1 a3b a30 a4" style="background: linear-gradient(180deg,rgba(20, 20, 32, 0.65) 0%, #141420 100%);">

            </div>
            <div class="ae">
                <div class="a1R a3 a1S a5">
                    <div class="a4 ak lg:a1T/2">
                        <div class="a2w aL[570px] lg:a2x">
                            <h1 class="a1M aY[40px] a1O a1P aZ md:aY[50px] lg:aY[40px] xl:aY[46px] 2xl:aY[50px] sm:text-[46px]">
                                Where Digital Art Comes to Life! Web 3.0
                                <p class="a2e a1Q a1o a3c a1t md:a3d">
                                    Create, Mint, and Monetize your Unique Creations with BArtMint. Our platform empowers artists, creators, and visionaries to transform their digital art into valuable NFTs that can be bought, sold, and cherished by collectors around the world.
                                </p>
                                <div class="flex flex-wrap items-center">
                                    <a href="explore" class="a2c a1Y a10 a5 a1Z a1f a1y a1B a1C aP a1s aW aX aZ a1w hover:a36">
                                        MarketPlace
                                    </a>
                                    <a href="login" class="a1Y a10 a5 a1Z a1f a1y a1z aP a1s aW aX aZ a1w hover:a1B hover:a1C">
                                        Upload Your Art
                                    </a>
                                </div>
                        </div>
                    </div>
                    <div class="a4 ak lg:a1T/2">
                        <div class="a1L">
                            <img src="assets/home_files/hero3.png" alt="hero image" class="a1J aj">
                        </div>
                    </div>
                </div>
            </div>

        </section>

        <jsp:include page="WEB-INF/web-frag/topsellers.jsp" />

        <section class="a2L">
            <div class="ae">

                <div class="a2w a3l a1z a3m">
                    <div class="ah sm:a3">
                        <h2 class="a1M a3n a1O a3r aZ">
                            Trending NFT
                        </h2>
                        <a href="explore" class="a1Y a10 a5 a1Z a1f a1C ax[10px] aS aW aX aZ a1w hover:a36">
                            View All
                        </a>
                    </div>
                </div>

                <div class="a1R a3 a1S">


                    <div class="a4 ak md:a1T/2 lg:a1T/3 2xl:a1T/4">
                        <div class="a1U a1V a1W a1G aM a2T[18px]">
                            <div class="af a1Y a2p av">
                                <img src="nfts/76559298-91AA-4AD8-9BAC-EBA19F71BD67.jpg" alt="auctions" class="a4" style="height:250px;">

                            </div>
                            <div>
                                <h3>
                                    <a href="dashboard/art46a9.html?id=2018" class="a2D a2a a1Q aX aZ hover:a1u">Saint Zayn</a>
                                </h3>
                                <div class="a2b a3 a5 ah">
                                    <div class="a4">
                                        <div class="a3 a5">

                                            <div class="a4">
                                                <h4 class="a2Y aX aZ">
                                                    <a href="dashboard/user-collection3c59.html?user=1047">Saint Zayn</a>
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
                                <img src="nfts/art4.jpg" alt="auctions" class="a4" style="height:250px;">

                            </div>
                            <div>
                                <h3>
                                    <a href="dashboard/art2d22.html?id=2015" class="a2D a2a a1Q aX aZ hover:a1u">Zack Russel</a>
                                </h3>
                                <div class="a2b a3 a5 ah">
                                    <div class="a4">
                                        <div class="a3 a5">

                                            <div class="a4">
                                                <h4 class="a2Y aX aZ">
                                                    <a href="dashboard/user-collection688d.html?user=1501">Zack Russel</a>
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
                                <img src="nfts/art3.jpg" alt="auctions" class="a4" style="height:250px;">

                            </div>
                            <div>
                                <h3>
                                    <a href="dashboard/art571f.html?id=2014" class="a2D a2a a1Q aX aZ hover:a1u">DC Boy</a>
                                </h3>
                                <div class="a2b a3 a5 ah">
                                    <div class="a4">
                                        <div class="a3 a5">

                                            <div class="a4">
                                                <h4 class="a2Y aX aZ">
                                                    <a href="dashboard/user-collection688d.html?user=1501">DC Boy</a>
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
                                <img src="nfts/WhatsApp%20Image%202023-06-16%20at%2009.39.54.jpg" alt="auctions" class="a4" style="height:250px;">
                            </div>
                            <div>
                                <h3>
                                    <a href="dashboard/artb2a2.html?id=2013" class="a2D a2a a1Q aX aZ hover:a1u">Rachet</a>
                                </h3>
                                <div class="a2b a3 a5 ah">
                                    <div class="a4">
                                        <div class="a3 a5">

                                            <div class="a4">
                                                <h4 class="a2Y aX aZ">
                                                    <a href="dashboard/user-collection688d.html?user=1501">Rachet</a>
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
                                    <a href="login.html" class="a3 a5 a1Z a1f a1C aP ak a1n aX aZ a1w hover:a36 sm:a2u">
                                        Place Bid
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <jsp:include page="WEB-INF/web-frag/faq-section.jsp" />

        <jsp:include page="WEB-INF/web-frag/footer.jsp" />

        <jsp:include page="WEB-INF/web-frag/footer-scripts.jsp" />

        <!--Start of Tawk.to Script-->
        <script type="text/javascript">
            var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
            (function(){
                var s1 = document.createElement("script"), s0 = document.getElementsByTagName("script")[0];
                s1.async = true;
                s1.src = 'https://embed.tawk.to/6512ba290f2b18434fdaa961/1hb8iedbn';
                s1.charset = 'UTF-8';
                s1.setAttribute('crossorigin', '*');
                s0.parentNode.insertBefore(s1, s0);
            })();
        </script>
        <!--End of Tawk.to Script-->

        <script>
//======== tiny slider for clients start
            tns({
                container: ".artists-slider",
                autoplay: true,
                autoplayTimeout: 5000,
                autoplayButtonOutput: false,
                mouseDrag: true,
                gutter: 1,
                nav: true,
                navPosition: "bottom",
                controls: false,
                controlsText: [
                    '<svg width="14" height="11" viewBox="0 0 14 11" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M5.00001 0.0600594L5.00001 4.06006L13.92 4.06006L13.95 6.07006L5.00001 6.07006L5.00001 10.0601L1.19607e-05 5.06006L5.00001 0.0600594Z" fill="white"/></svg>',
                    '<svg width="14" height="11" viewBox="0 0 14 11" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M8.99999 10.9399V6.93994H0.0799875L0.0499878 4.92994H8.99999V0.939941L14 5.93994L8.99999 10.9399Z" fill="white"/> </svg>'
                ],
                items: 1,
                responsive: {
                    540: {
                        controls: true,
                        nav: false
                    },
                    768: {
                        items: 2
                    },
                    992: {
                        items: 3
                    },
                    1140: {
                        items: 4
                    }
                }
            });
//======== tiny slider for clients end
        </script>

    </body>
</html>
