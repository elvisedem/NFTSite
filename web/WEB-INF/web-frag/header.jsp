<%--
    Document   : header
    Created on : 27-Jun-2023, 13:14:56
    Author     : HULLO
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<header x-data="
        {
        navbarOpen: false,
        submenuOpen: false
        }
        " class="header a1 a2 a3 a4 a5 a6 a7 a8 a9" :class="scrolledFromTop ? &#39;a9 aa ab ac ad&#39; : &#39; a9&#39; ">
    <div class="ae">
        <div class="af ag[-16px] a3 a5 ah">
            <div class="ai aj ak">
                <a href="index.html" class="header-logo al a4 ao lg:ap" :class="scrolledFromTop ? &#39;am lg:an&#39; : &#39;ao lg:ap&#39; ">
                    <h3 style="color:azure;font-size:23px;font-weight:600">
                        <!--<img src="logo.png" alt="logo" class="aq" style="display:inline !important;">-->
                        BArtMint
                    </h3>
                </a>
            </div>
            <div class="a3 a4 a5 ah ak">
                <div style="margin-left: auto; margin-right: auto;">
                    <button @click="navbarOpen = !navbarOpen " :class="navbarOpen &amp;&amp; &#39;navbarTogglerActive&#39; " id="navbarToggler" name="navbarToggler" aria-label="navbarToggler" class="ar as at/2 al au[-50%] av aw ax[6px] ay focus:az lg:aA" data-bs-toggle="offcanvas" data-bs-target="#demo">
                        <span :class="navbarOpen &amp;&amp; &#39;aB aC aD[7px]&#39; " class="af aE[6px] al aF[2px] aG[30px] aH"></span>
                        <span :class="navbarOpen &amp;&amp; &#39;aI&#39; " class="af aE[6px] al aF[2px] aG[30px] aH"></span>
                        <span :class="navbarOpen &amp;&amp; &#39;aD[-8px] aJ[135deg]&#39; " class="af aE[6px] al aF[2px] aG[30px] aH"></span>
                    </button>
                    <nav :class="!navbarOpen &amp;&amp; &#39;aA&#39; " id="navbarCollapse" class="ar as aK a4 aL[250px] av aM aN lg:aO lg:al lg:a4 lg:aj lg:a6 aP lg:aQ lg:ak lg:aR xl:aS aA">
                        <ul class="aT lg:a3">
                            <li class="aU af">
                                <a href="home" class="aV a3 an aW aX aY[#bababa] group-hover:aZ lg:a_ lg:a13 lg:a10 lg:a11 lg:a12 xl:a14">
                                    Home
                                </a>
                            </li>
                            <li class="aU af">
                                <a href="explore" class="aV a3 an aW aX aY[#bababa] group-hover:aZ lg:a_ lg:a13 lg:a10 lg:a11 lg:a12 xl:a14">
                                    MarketPlace
                                </a>
                            </li>
                            <c:choose>
                                <c:when test="${(user.email ne null) and (user.userId ne null)}">
                                    <li class="aU af">
                                        <a href="/dashboard/home" class="aV a3 an aW aX aY[#bababa] group-hover:aZ lg:a_ lg:a13 lg:a10 lg:a11 lg:a12 xl:a14">
                                            My Account
                                        </a>
                                    </li>
                                    <li class="aU af">
                                        <a href="logout" class="aV a3 an aW aX aY[#bababa] group-hover:aZ lg:a_ lg:a13 lg:a10 lg:a11 lg:a12 xl:a14">
                                            Logout
                                        </a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="aU af">
                                        <a href="login" class="aV a3 an aW aX aY[#bababa] group-hover:aZ lg:a_ lg:a13 lg:a10 lg:a11 lg:a12 xl:a14">
                                            Login
                                        </a>
                                    </li>
                                    <li class="aU af">
                                        <a href="sign-up" class="aV a3 an aW aX aY[#bababa] group-hover:aZ lg:a_ lg:a13 lg:a10 lg:a11 lg:a12 xl:a14">
                                            Register
                                        </a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </nav>
                </div>
                <div class="aA a1p a1q sm:a3 lg:a1r">
                    <c:choose>
                        <c:when  test="${(user.email ne null) and (user.userId ne null)}">

                        </c:when>
                        <c:otherwise>
                            <a href="login" class="a3 a5 a1f a1y a1z aP aS aW aX aZ a7 a1i a1A hover:a1B hover:a1C lg:ak xl:aS">
                                <span class="a1D">
                                    <svg width="23" height="24" viewBox="0 0 23 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M20.125 17.75V18.7083C20.125 19.2167 19.9231 19.7042 19.5636 20.0636C19.2042 20.4231 18.7167 20.625 18.2083 20.625H4.79167C3.72792 20.625 2.875 19.7625 2.875 18.7083V5.29167C2.875 4.78333 3.07693 4.29582 3.43638 3.93638C3.79582 3.57693 4.28334 3.375 4.79167 3.375H18.2083C18.7167 3.375 19.2042 3.57693 19.5636 3.93638C19.9231 4.29582 20.125 4.78333 20.125 5.29167V6.25H11.5C10.4363 6.25 9.58333 7.1125 9.58333 8.16667V15.8333C9.58333 16.3417 9.78527 16.8292 10.1447 17.1886C10.5042 17.5481 10.9917 17.75 11.5 17.75H20.125ZM11.5 15.8333H21.0833V8.16667H11.5V15.8333ZM15.3333 13.4375C14.9521 13.4375 14.5865 13.286 14.3169 13.0165C14.0473 12.7469 13.8958 12.3812 13.8958 12C13.8958 11.6188 14.0473 11.2531 14.3169 10.9835C14.5865 10.714 14.9521 10.5625 15.3333 10.5625C15.7146 10.5625 16.0802 10.714 16.3498 10.9835C16.6194 11.2531 16.7708 11.6188 16.7708 12C16.7708 12.3812 16.6194 12.7469 16.3498 13.0165C16.0802 13.286 15.7146 13.4375 15.3333 13.4375Z" fill="white"></path>
                                    </svg>
                                </span>
                                Wallet Connect
                            </a>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>
        </div>
    </div>
</header>
