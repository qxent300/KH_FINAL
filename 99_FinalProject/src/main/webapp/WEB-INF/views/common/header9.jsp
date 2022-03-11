<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${param.title}</title>
<link rel="stylesheet" href="${path}/css/theme.min.css">
<link rel="stylesheet" href="${path}/css/snippets.min.css">
<link rel="stylesheet" href="${path}/css/hs-mega-menu.min.css">
<link rel="stylesheet" href="${path}/css/bootstrap-icons/font/bootstrap-icons.css">
    <!-- jQuery-->
    <script src="${path}/js/jquery.min.js"></script>
    <%-- <script src="${path}/js/jquery-3.6.0.min.js"></script> --%>
    <!-- Bootstrap JS bundle - Bootstrap + PopperJS-->
    <script src="${path}/js/bootstrap.bundle.min.js"></script>
    <!-- Magnific Popup - Lightbox for the gallery-->
    <script src="${path}/js/jquery.magnific-popup.min.js"></script>
    <!-- Smooth scroll-->
    <script src="${path}/js/smooth-scroll.polyfills.min.js"></script>
    <!-- Bootstrap Select-->
    <script src="${path}/js/bootstrap-select.min.js"></script>
    <!-- Swiper Carousel -->
    <script src="${path}/js/swiper.min.js"></script>
    <!-- Main Theme JS file    -->
    <script src="${path}/js/theme.js"></script>
</head>

<body>
    <header id="header" class="navbar navbar-height navbar-expand-lg navbar-end navbar-sticky-top bg-white navbar-light fw-bold">
        <div class="container">
            <nav class="navbar-nav-wrap">
                <!-- Default Logo -->
                <a class="navbar-brand" href="${path}/">
                    <img class="navbar-brand-logo" src="${path}/images/nav_logo.png">
                </a>
                <!-- End Default Logo -->
                <!-- Toggler -->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-default">
                        <i class="bi-list"></i>
                    </span>
                    <span class="navbar-toggler-toggled">
                        <i class="bi-x"></i>
                    </span>
                </button>
                <!-- End Toggler -->


                <!-- Collapse -->
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                    <ul class="navbar-nav">
                        <!-- Landings -->
                        <li class="nav-item">
                            <a id="MegaMenu1" class="nav-link" aria-current="page" href="${path}/book/search" role="button">도서검색</a>
                        </li>
                        <!-- End Landings -->

                        <!-- Pages -->
                        <li class="hs-has-sub-menu nav-item">
                            <a id="pagesMegaMenu" class="hs-mega-menu-invoker nav-link dropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
                            <!-- Mega Menu -->
                            <div class="dropdown-menu" aria-labelledby="pagesMegaMenu" style="min-width: 5rem;">
                                <a class="dropdown-item" href="#">독서일지</a>
                                <a class="dropdown-item" href="${path}/freeboard/list">자유공간</a>
                            </div>
                            <!-- End Mega Menu -->
                        </li>
                        <!-- End Pages -->

                        <!-- Pages -->
                        <li class="hs-has-sub-menu nav-item">
                            <a id="pagesMegaMenu2" class="hs-mega-menu-invoker nav-link dropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">마이페이지</a>
                            <!-- Mega Menu -->
                            <div class="dropdown-menu" aria-labelledby="pagesMegaMenu" style="min-width: 5rem;">
                                <a class="dropdown-item" href="#">대여현황</a>
                                <a class="dropdown-item" href="#">회원정보</a>
                                <a class="dropdown-item" href="#">내 활동</a>
                            </div>
                            <!-- End Mega Menu -->
                        </li>
                        <!-- End Pages -->

                        <!-- Account -->
                        <li class="nav-item">
                            <a id="MegaMenu2" class="nav-link" href="#" role="button">고객센터</a>
                        </li>
                        <!-- End Account -->

                        <!-- Account -->
                        <li class="nav-item">
                            <a id="MegaMenu3" class="nav-link" href="${path}/book/cart" role="button">장바구니</a>
                        </li>
                        <!-- End Account -->

						<c:if test="${loginMember == null}">
							<li class="nav-item">
								<a class="nav-link" href="${path}/login" role="button">로그인</a>
							</li>
						</c:if>
						<c:if test="${loginMember != null}">
							<li class="nav-item">
								<a class="nav-link" href="${path}/logout" role="button">로그아웃</a>
							</li>
						</c:if>
                    </ul>
                </div>
                <!-- End Collapse -->
            </nav>
        </div>
    </header>