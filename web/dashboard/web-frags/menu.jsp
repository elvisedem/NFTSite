<%--
    Document   : menu
    Created on : 28-Jun-2023, 14:35:16
    Author     : HULLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<aside id="layout-menu" class="layout-menu menu-vertical menu custom-dark" data-bg-class="null">
    <div class="app-brand demo ">
        <h3 style="color:azure;font-size:23px;font-weight:600">
            BArtMint
        </h3>
        <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
            <i class="bx bx-chevron-left bx-sm align-middle"></i>
        </a>
    </div>

    <div class="menu-inner-shadow"></div>

    <ul class="menu-inner py-3 ps">
        <!-- Dashboard -->
        <li class="menu-item">
            <a href="d/dashboard" class="menu-link">
                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                <div>Overview</div>
            </a>
        </li>
        <li class="menu-item">
            <a href="d/collection" class="menu-link">
                <i class="menu-icon tf-icons bx bx-photo-album"></i>
                <div>Create collection</div>
            </a>
        </li>

        <li class="menu-item">
            <a href="d/create" class="menu-link">
                <i class="menu-icon tf-icons bx bxl-sketch"></i>
                <div>Create an NFT</div>
            </a>
        </li>

        <li class="menu-item">
            <a href="d/explore" class="menu-link">
                <i class="menu-icon tf-icons bx bx-money"></i>
                <div>Explore</div>
            </a>
        </li>

        <li class="menu-item">
            <a href="d/withdraw" class="menu-link">
                <i class="menu-icon tf-icons bx bx-download"></i>
                <div>Withdraw</div>
            </a>
        </li>

        <!-- Layouts -->


        <li class="menu-item">
            <a href="d/transactions" class="menu-link">
                <i class="menu-icon tf-icons bx bx-bell"></i>
                <div>Transactions</div>
            </a>
        </li>


        <li class="menu-header small text-uppercase">
            <span class="menu-header-text">User</span>
        </li>
        <li class="menu-item">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-dock-top"></i>
                <div data-i18n="Account Settings">Profile</div>
            </a>
            <ul class="menu-sub">
                <li class="menu-item">
                    <a href="d/profile" class="menu-link">
                        <div data-i18n="Account">Account settings</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="d/view-arts" class="menu-link">
                        <div data-i18n="Account">My NFT's</div>
                    </a>
                </li>


            </ul>
        </li>
</aside>