

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <head>
        <jsp:include page="WEB-INF/web-frag/head-tags.jsp" />
        <title>BArtMint -Login</title>
    </head>
    <body class="a0" x-data="
          {
          scrolledFromTop: false
          }
          " x-init="window.pageYOffset &gt;= 50 ? scrolledFromTop = true : scrolledFromTop = false" @scroll.window="window.pageYOffset &gt;= 50 ? scrolledFromTop = true : scrolledFromTop = false" data-new-gr-c-s-check-loaded="14.1091.0" data-gr-ext-installed="">

        <jsp:include page="WEB-INF/web-frag/header.jsp" />

        <jsp:include page="WEB-INF/web-frag/mobile-menu.jsp" />


        <div class="container-xxl light-bg" style="margin-top: 150px;">
            <div class="authentication-wrapper authentication-basic container-p-y">
                <div class="authentication-inner">
                    <!-- Register Card -->
                    <div class="col col-lg-4 mx-auto my-4 pt-4">
                        <div class="card">
                            <div class="card-body">
                                <c:if test="${param.error ne null}">
                                    <p style="color: red;">Your account couldn't be found. Kindly register an account.</p>
                                </c:if>
                                <form action="user-login" class="mb-4"  method="GET">
                                    <div class="mb-4">
                                        <label for="email" class="form-label">Email or Username</label>
                                        <input type="text" class="form-control" id="email" name="username" value='' placeholder="email" required/>
                                    </div>
                                    <div class="mb-3">
                                        <label for="password" class="form-label">Password</label>
                                        <input type="password" class="form-control" id="password" name="password" placeholder="Password" required/>
                                    </div>

                                    <button type="submit" class="btn btn-primary d-grid w-100">Continue</button>

                                </form>

                                <p>
                                    <span class="uk-text-small" style="color: #ffffff !important;">Don't have an account? <a class="uk-button uk-button-text" href="sign-up">Register</a></span>
                                </p>
                                <p>
                                    <span class="uk-text-small float-end" style="color: #ffffff !important;"><a class="uk-button uk-button-text" id="forgot-password">Forgot password</a></span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <!-- Register Card -->
                </div>
            </div>
        </div>


        <jsp:include page="WEB-INF/web-frag/footer.jsp" />
        <jsp:include page="WEB-INF/web-frag/footer-scripts.jsp" />
    </body>
</html>