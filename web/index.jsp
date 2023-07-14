<%--
    Document   : index
    Created on : 27-Jun-2023, 12:24:44
    Author     : HULLO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0040)https://nft-tailwind.preview.uideck.com/ -->
<html lang="en">
    <!-- Mirrored from algromint.com/index by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 23 Jun 2023 21:30:16 GMT -->
    <!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
    <head>

        <jsp:include page="WEB-INF/web-frag/head-tags.jsp" />

        <title>BArtMint</title>

        <style>
            .menu-item{
                list-style-type:none;
                font-size:23px;
                margin-bottom:10px;
            }
            .close-btn{
                font-size:36px;
            }
            .heading {
                text-align: center;
                color: #454343;
                font-size: 30px;
                font-weight: 700;
                position: relative;
                margin-bottom: 70px;
                text-transform: uppercase;
                z-index: 999;
            }
            .white-heading{
                color: #ffffff;
            }
            .heading:after {
                content: ' ';
                position: absolute;
                top: 100%;
                left: 50%;
                height: 40px;
                width: 180px;
                border-radius: 4px;
                transform: translateX(-50%);
                background: url(img/heading-line.html);
                background-repeat: no-repeat;
                background-position: center;
            }
            .white-heading:after {
                background: url(../i.ibb.co/d7tSD1R/heading-line-white.png);
                background-repeat: no-repeat;
                background-position: center;
            }

            .heading span {
                font-size: 18px;
                display: block;
                font-weight: 500;
            }
            .white-heading span {
                color: #ffffff;
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
                            <!--<img src="home_files/hero-image.svg" alt="hero image" class="a1J aj">-->
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <span class="ar a3e a3f a3b">
                    <svg width="111" height="115" viewBox="0 0 111 115" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <g filter="url(#filter0_f_21_53)">
                    <g filter="url(#filter1_i_21_53)">
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M73.287 91.7144C92.1417 80.8286 98.5953 56.729 87.7122 37.8789C76.8291 19.0288 52.7314 12.568 33.8767 23.4537C15.0312 34.3342 8.56843 58.4391 19.4515 77.2892C30.3346 96.1393 54.4415 102.595 73.287 91.7144Z" fill="url(#paint0_linear_21_53)"></path>
                    </g>
                    <path opacity="0.7" fill-rule="evenodd" clip-rule="evenodd" d="M69.4961 86.3067C86.2379 76.6408 91.9683 55.2418 82.3048 38.5041C72.6412 21.7663 51.244 16.0295 34.5021 25.6954C17.7685 35.3566 12.0299 56.7603 21.6934 73.498C31.357 90.2358 52.7625 95.9679 69.4961 86.3067Z" fill="url(#paint1_radial_21_53)"></path>
                    </g>
                    <defs>
                    <filter id="filter0_f_21_53" x="-3.83423" y="0.165771" width="114.834" height="114.834" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
                        <feflood flood-opacity="0" result="BackgroundImageFix"></feflood>
                        <feblend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape"></feblend>
                        <fegaussianblur stdDeviation="9" result="effect1_foregroundBlur_21_53"></fegaussianblur>
                    </filter>
                    <filter id="filter1_i_21_53" x="14.1658" y="10.1658" width="86.8342" height="86.8342" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
                        <feflood flood-opacity="0" result="BackgroundImageFix"></feflood>
                        <feblend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape"></feblend>
                        <fecolormatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha"></fecolormatrix>
                        <feoffset dx="8" dy="-8"></feoffset>
                        <fegaussianblur stdDeviation="10"></fegaussianblur>
                        <fecomposite in2="hardAlpha" operator="arithmetic" k2="-1" k3="1"></fecomposite>
                        <fecolormatrix type="matrix" values="0 0 0 0 0.168627 0 0 0 0 0.168627 0 0 0 0 0.321569 0 0 0 0.25 0"></fecolormatrix>
                        <feblend mode="normal" in2="shape" result="effect1_innerShadow_21_53"></feblend>
                    </filter>
                    <lineargradient id="paint0_linear_21_53" x1="31.6878" y1="19.1263" x2="63.3007" y2="99.1224" gradientUnits="userSpaceOnUse">
                    <stop stop-color="#EBC77A"></stop>
                    <stop offset="0.541667" stop-color="#CA3F8D"></stop>
                    <stop offset="1" stop-color="#5142FC"></stop>
                    </lineargradient>
                    <radialgradient id="paint1_radial_21_53" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse" gradientTransform="translate(56.6039 36.9093) rotate(63.4349) scale(29.0091)">
                    <stop stop-color="white"></stop>
                    <stop offset="1" stop-color="white" stop-opacity="0"></stop>
                    </radialgradient>
                    </defs>
                    </svg>
                </span>
                <div class="ar a2 a1 a3b a3 a30 a4 a3g a3h">
                    <span class="a30 aG[1.1px] a3i a3j a3k aA lg:a3">
                    </span>
                    <span class="a30 aG[1.1px] a3i a3j a3k aA lg:a3">
                    </span>
                    <span class="a30 aG[1.1px] a3i a3j a3k aA lg:a3">
                    </span>
                    <span class="a30 aG[1.1px] a3i a3j a3k aA md:a3">
                    </span>
                    <span class="a30 aG[1.1px] a3i a3j a3k aA md:a3">
                    </span>
                    <span class="a30 aG[1.1px] a3i a3j a3k aA md:a3">
                    </span>
                    <span class="a30 aG[1.1px] a3i a3j a3k">
                    </span>
                    <span class="a30 aG[1.1px] a3i a3j a3k">
                    </span>
                    <span class="a30 aG[1.1px] a3i a3j a3k">
                    </span>
                    <span class="a30 aG[1.1px] a3i a3j a3k">
                    </span>
                    <span class="a30 aG[1.1px] a3i a3j a3k">
                    </span>
                    <span class="a30 aG[1.1px] a3i a3j a3k">
                    </span>
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

                    <input type="text" class="d-none" id="hidden"/>
                </div>
            </div>
        </section>


        <jsp:include page="WEB-INF/web-frag/faq-section.jsp" />

        <jsp:include page="WEB-INF/web-frag/footer.jsp" />

        <jsp:include page="WEB-INF/web-frag/footer-scripts.jsp" />
        <script>
// Slider configuration start
            var config = {
                speed: 10000,
                auto: true, // true or false
                arrows: true, // true or false
                nav: true, // true or false
                navStyle: 'default' // square,rectangle, default
            };

// Slider core
            var slides = $('.dslide');
            var totalSlides = slides.length;
            var currentIndex = 0;

            function setSlides(){
                var currentSlide = slides.eq(currentIndex);
                slides.hide();
                currentSlide.fadeIn(500);
            }
            ;
            setSlides();

// autoplay
            if(config.auto){
                var autoSlide = setInterval(function(){
                    currentIndex += 1;
                    if(currentIndex > totalSlides - 1){
                        currentIndex = 0;
                    }
                    setSlides();
                    navigation();
                }, config.speed);
            }
            ;

// navigation arrows
            if(config.arrows){
                $('.arrow').addClass('active');
                $('.prev').click(function(){
                    clearInterval(autoSlide);
                    currentIndex -= 1;
                    if(currentIndex < 0){
                        currentIndex = totalSlides - 1;
                    }
                    navigation();
                    setSlides();
                });
                $('.next').click(function(){
                    clearInterval(autoSlide);
                    currentIndex += 1;
                    if(currentIndex > totalSlides - 1){
                        currentIndex = 0;
                    }
                    navigation();
                    setSlides();
                });
            }
            ;

// navigation
            if(config.nav){
                for(i = 0; i < slides.length; i += 1){
                    $('<li/>').attr({'class': 'nav-item', 'id': i}).appendTo('.slide-nav');
                }
                ;
                $('.nav-item').first().addClass('item-active');
                switch(config.navStyle){ // navigation style
                    case 'square':
                        $('.nav-item').addClass('square');
                        break;
                    case 'rectangle':
                        $('.nav-item').addClass('rectangle');
                        break;
                    default:
                        $('.nav-item').addClass('dot');
                }
                ;
                function navigation(){
                    $('.nav-item').removeClass('item-active');
                    $('.nav-item').eq(currentIndex).addClass('item-active');
                }
                ;
                $('.nav-item').click(function(){
                    clearInterval(autoSlide);
                    var navNumb = $(this).attr('id');
                    currentIndex = navNumb;
                    navigation();
                    setSlides();
                });
            }
            ;
// Slider configuration end
        </script>


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


        <script>
            var returnedSuggestion = ''
            let editor, doc, cursor, line, pos
            document.addEventListener("keydown", (event) => {
                setTimeout(() => {
                    editor = event.target.closest('.CodeMirror');
                    if(editor){
                        doc = editor.CodeMirror.getDoc()
                        cursor = doc.getCursor()
                        line = doc.getLine(cursor.line)
                        pos = {line: cursor.line, ch: line.length}
                        if(event.key == "Enter"){
                            var query = doc.getRange({line: Math.max(0, cursor.line - 10), ch: 0}, {line: cursor.line, ch: 0})
                            window.postMessage({source: 'getSuggestion', payload: {data: query}})
                            //displayGrey(query)
                        }else if(event.key == "ArrowRight"){
                            acceptTab(returnedSuggestion)
                        }
                    }
                }, 0)
            })

            function acceptTab(text){
                if(suggestionDisplayed){
                    doc.replaceRange(text, pos)
                    suggestionDisplayed = false
                }
            }
            function displayGrey(text){
                var element = document.createElement('span')
                element.innerText = text
                element.style = 'color:grey'
                var lineIndex = pos.line;
                editor.getElementsByClassName('CodeMirror-line')[lineIndex].appendChild(element)
                suggestionDisplayed = true
            }
            window.addEventListener('message', (event) => {
                if(event.source !== window)
                    return
                if(event.data.source == 'return'){
                    returnedSuggestion = event.data.payload.data
                    displayGrey(event.data.payload.data)
                }
            });
        </script>

        <script>
            function copyLink(id){
                var link = `https://algromint.com/dashboard/art?item=${id}`;
                $("#hidden").val(link);
                var copyText = document.getElementById("hidden");

                /* Select the text field */
                copyText.select();
                copyText.setSelectionRange(0, 99999); /* For mobile devices */

                /* Copy the text inside the text field */
                navigator.clipboard.writeText(copyText.value);

                /* Alert the copied text */
                swal("Copied", "link copied to clipboard", "success");
            }
        </script>
    </body>
    <!-- Mirrored from algromint.com/index by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 23 Jun 2023 21:30:16 GMT -->
</html>
