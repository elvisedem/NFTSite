

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="offcanvas offcanvas-start bg-dark text-white" id="demo">
    <div class="offcanvas-header mb-4">

        <button type="button" class="float-end close-btn btn-dark text-white" data-bs-dismiss="offcanvas">&times;</button>
    </div>
    <div class="offcanvas-body p-3 mt-4">
        <li class="menu-item"><a href="index.jsp">Home</a></li>

        <c:choose>
            <c:when test="${(user.email ne null) and (user.userId ne null)}">
                <li class="menu-item"><a href="login-explore.jsp">MarketPlace</a></li>
                <li class="menu-item"><a href="/dashboard/home">My Account</a></li>
                <li class="menu-item"><a href="logout">Logout</a></li>
                </c:when>
                <c:otherwise>
                <li class="menu-item"><a href="explore">MarketPlace</a></li>
                <li class="menu-item"><a href="login">Login</a></li>
                <li class="menu-item"><a href="sign-up">Register</a></li>
                </c:otherwise>
            </c:choose>
    </div>
</div>