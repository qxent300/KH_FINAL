<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>${param.title}</title>
	<link rel="icon" href="${path}/images/bookfav.png">
    <!-- Google fonts - Playfair Display-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700">
    <!-- Google fonts - Poppins-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,700">
    <!-- swiper-->
    <link rel="stylesheet" href="${path}/css/swiper.min.css">
    <!-- Magnigic Popup-->
    <%-- <link rel="stylesheet" href="${path}/css/magnific-popup.css"> --%>
	<!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/css/bootstrap-icons/font/bootstrap-icons.css">
    <!-- theme stylesheet-->
	<link rel="stylesheet" href="${path}/css/style.default.css">
        <!-- jQuery-->
    <script src="${path}/js/jquery.min.js"></script>
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
    <header class="header">
        <nav class="navbar navbar-expand-lg fixed-top shadow navbar-light bg-white">
            <div class="container col-xl-11 col-lg-10 mx-auto">
				<a href="${path}/"><img class="navbar-brand-logo" src="${path}/images/book_logo.png"></a>
				<ul class="navbar-nav ms-lg-auto">
					<li class="nav-item"><a class="nav-link"
						href="${path}/book/search" style="font-size: medium;">
							도서검색</a></li>
					<div class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" style="font-size: medium;" type="button"
							data-bs-toggle="dropdown" aria-haspopup="true" role="button">커뮤니티</a>
						<div class="dropdown-menu megamenu py-lg-2" style="min-width: 107px;">
							<a class="dropdown-item" href="${path}/bookboard/list"
								style="background-color: rgb(255, 255, 255)">독서일기</a>
								<a class="dropdown-item" href="${path}/freeboard/list" style="background-color: rgb(255, 255, 255)">자유공간</a>
						</div>
					</div>
					<div class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" style="font-size: medium;" type="button"
							data-bs-toggle="dropdown" aria-haspopup="true" role="button">마이페이지</a>
						<div class="dropdown-menu megamenu py-lg-2" style="min-width: 107px;">
							<a class="dropdown-item" href="${path}/mypage/rentList"
								style="background-color: rgb(255, 255, 255)">대여현황</a> 
								<c:if test="${ loginMember == null }">
									<a class="dropdown-item" href="${path}/login"
									style="background-color: rgb(255, 255, 255)">내 활동</a>
								</c:if>
								<c:if test="${ loginMember != null }">
									 <a class="dropdown-item" href="${path}/myPageBook/MyPageBookBoardList.do?nowPage=1&cntPerPage=5&loginMember=${loginMember}"
									style="background-color: rgb(255, 255, 255)">내 활동</a>
								</c:if>
						</div>
					</div>
					<li class="nav-item"><a class="nav-link" href="${path}/faq"
						style="font-size: medium;">고객센터</a></li>
					<li class="nav-item"><a class="nav-link" href="${path}/mypage/cartList"
						style="font-size: medium;">장바구니</a></li>
					<c:if test="${ loginMember == null }">
						<li class="nav-item"><a class="nav-link" href="${path}/login"
							style="font-size: medium;">로그인</a></li>
					</c:if>
					<c:if test="${ loginMember != null }">
						<li class="nav-item"><a class="nav-link"
							href="${path}/logout" style="font-size: medium;">로그아웃</a></li>
					</c:if>
				</ul>
			</div>
		</nav>
	</header>
</body>