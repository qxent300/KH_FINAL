<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="독서의 민족" name="title"/>
</jsp:include>

<section class="hero-home">
        <div class="swiper-container hero-slider">
            <div class="swiper-wrapper dark-overlay">
                <div class="swiper-slide" style="background-image:url(${path}/images/book_1.jpg)"></div>
                <div class="swiper-slide" style="background-image:url(${path}/images/read.jpg)"></div>
                <div class="swiper-slide" style="background-image:url(${path}/images/library.jpg)"></div>
                <div class="swiper-slide" style="background-image:url(${path}/images/book_3.jpg)"></div>
            </div>
        </div>
        <div class="container py-6 py-md-7 text-white z-index-20">
            <div class="row">
                <div class="col-xl-11">
                    <div class="text-center text-lg-start">
                        <p class="subtitle letter-spacing-4 mb-2 text-secondary text-shadow">Search for the book you want</p>
                        <h1 class="display-3 fw-bold text-shadow">Book rental service</h1>
                    </div>
                    <div class="search-bar mt-5 p-3 p-lg-1 ps-lg-4">
                        <form action="searchlist" method="get">
                            <div class="row">
                                 <div class="col-lg-2 d-flex align-items-center form-group">
                                <select id="search_option" name="search_option" onchange="handleOnChange(this)" style="width: 180px; border-style: none;">
                                  <option value="title">
                                  <c:if test="${map.search_option == 'title'}"></c:if>
                                  제목</option>
                                  <option value="writer">
                                  <c:if test="${map.search_option == 'writer'}"></c:if>
                                  저자</option>
                                </select>
                            </div>
                                <div class="col-lg-7 d-flex align-items-center ">
                                    <input class="form-control border-0 shadow-0" type="text" name="search" placeholder="검색어를 입력하세요.">
                                </div>
                                <div class="col-lg-1 d-flex align-items-center form-group no-divider">
                                </div>
                                <div class="col-lg-2 d-grid">
                                    <button onclick="location.href='#'" class="btn btn-primary rounded-pill h-100 bi-search" type="submit">&nbsp;검색</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- 
     <c:if test="${list != null}">
                <c:forEach var="book" items="${list}" varStatus="status">
					<c:if test="${status.index % 4 == 0}">
						    <div class="row text-center mb-1">
				 	</c:if>
						<div class="col-lg-3">
                        	<a href="${path}/book/view"><img src="${path}/resources/book/${book.bImage}" class="rounded card-img mb-3"></a>
                        	<h3 class="h5"><c:out value="${book.bName}" /></h3>
                        	<p class="text-muted"><c:out value="${book.bWriter}" /></p>
                    	</div>
					
				</c:forEach>
                </c:if>
      -->
    
    <section class="py-6 bg-gray-100">
        <div class="container d-grid col-sm-9">
            <div class="text-center pb-lg-4">
                <p class="subtitle text-secondary">Book of the day</p>
                <h2 class="mb-5">오늘의 책</h2>
            </div>
            <div class="row">
                <div class="col-lg-3 mb-3 mb-lg-0 text-center">
                    <div>
                        <a href="${path}/book/view"><img src="${path}/resources/book/${book.bImage}" class="rounded w-85 mb-3" height="320px"></a>
                    </div>
                    <h3 class="h5">${book.bName}</h3>
                    <p class="text-muted">${book.bWriter}</p>
                </div>
                <div class="col-lg-3 mb-3 mb-lg-0 text-center">
                    <div>
                        <a href="${path}/book/view"><img src="${path}/resources/book/${book.bImage}" class="rounded w-85 mb-3" height="320px"></a>
                    </div>
                    <h3 class="h5">${book.bName}</h3>
                    <p class="text-muted">${book.bWriter}</p>
                </div>
                <div class="col-lg-3 mb-3 mb-lg-0 text-center">
                    <div>
                        <a href="${path}/book/view"><img src="${path}/resources/book/${book.bImage}" class="rounded w-85 mb-3" height="320px"></a>
                    </div>
                    <h3 class="h5">${book.bName}</h3>
                    <p class="text-muted">${book.bWriter}</p>
                </div>
                <div class="col-lg-3 mb-3 mb-lg-0 text-center">
                    <div>
                        <a href="${path}/book/view"><img src="${path}/resources/book/${book.bImage}" class="rounded w-85 mb-3" height="320px"></a>
                    </div>
                    <h3 class="h5">${book.bName}</h3>
                    <p class="text-muted">${book.bWriter}</p>
                </div>
            </div>
            
        </div>
    </section>

    <section class="py-6">
        <div class="container">
            <div class="row mb-5">
                <div class="col-md-8">
                    <p class="subtitle text-primary">Best seller</p>
                    <h2>베스트셀러</h2>
                </div>
                <div class="col-md-4 d-lg-flex align-items-center justify-content-end"><a class="text-muted text-sm" href="bookSearch2.html">
            View more<i class="fas fa-angle-double-right ms-2"></i></a></div>
            </div>
            <div class="swiper-container guides-slider mx-n2 pt-3">
                <!-- Additional required wrapper-->
                <div class="swiper-wrapper pb-5">
                    <!-- Slides-->
                    <div class="swiper-slide h-auto px-2">
                        <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0">
                            <a class="tile-link" href="${path}/book/view"></a><img class="bg-image" src="${path}/images/new-york.jpg" alt="Card image">
                            <div class="card-body overlay-content">
                                <h6 class="card-title text-shadow text-uppercase">책 사진1</h6>
                            </div>
                        </div><br>
                        <div style="text-align: center;">
                            <h6 class="card-title text-shadow text-uppercase">책 제목</h6>
                            <p class="card-text text-sm">저자</p>
                        </div>
                    </div>


                    <div class="swiper-slide h-auto px-2">
                        <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0">
                            <a class="tile-link" href="${path}/book/view"></a><img class="bg-image" src="${path}/images/new-york.jpg" alt="Card image">
                            <div class="card-body overlay-content">
                                <h6 class="card-title text-shadow text-uppercase">책 사진2</h6>
                            </div>
                        </div><br>
                        <div style="text-align: center;">
                            <h6 class="card-title text-shadow text-uppercase">책 제목</h6>
                            <p class="card-text text-sm">저자</p>
                        </div>
                    </div>


                    <div class="swiper-slide h-auto px-2">
                        <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0">
                            <a class="tile-link" href="${path}/book/view"></a><img class="bg-image" src="${path}/images/new-york.jpg" alt="Card image">
                            <div class="card-body overlay-content">
                                <h6 class="card-title text-shadow text-uppercase">책 사진3</h6>
                            </div>
                        </div><br>
                        <div style="text-align: center;">
                            <h6 class="card-title text-shadow text-uppercase">책 제목</h6>
                            <p class="card-text text-sm">저자</p>
                        </div>
                    </div>


                    <div class="swiper-slide h-auto px-2">
                        <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0">
                            <a class="tile-link" href="${path}/book/view"></a><img class="bg-image" src="${path}/images/new-york.jpg" alt="Card image">
                            <div class="card-body overlay-content">
                                <h6 class="card-title text-shadow text-uppercase">책 사진4</h6>
                            </div>
                        </div><br>
                        <div style="text-align: center;">
                            <h6 class="card-title text-shadow text-uppercase">책 제목</h6>
                            <p class="card-text text-sm">저자</p>
                        </div>
                    </div>

                </div>
                <div class="swiper-pagination d-md-none"> </div>
            </div>
            <div>
                <p style="text-align: center; color: slategrey">(↑ click 해서 옆으로 미세요.)</p>
            </div>
        </div>
    </section>
    <section class="py-5">
        <div class="container">
            <div class="row mb-5">
                <div class="col-md-8">
                    <p class="subtitle text-secondary">New </p>
                    <h2>요즘 뜨는 책</h2>
                </div>
                <div class="col-md-4 d-lg-flex align-items-center justify-content-end"><a class="text-muted text-sm" href="bookSearch2.html">
            View more<i class="fas fa-angle-double-right ms-2"></i></a></div>
            </div>
            <div class="swiper-container guides-slider mx-n2 pt-3">
                <!-- Additional required wrapper-->
                <div class="swiper-wrapper pb-5">
                    <!-- Slides-->
                    <div class="swiper-slide h-auto px-2">
                        <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0">
                            <a class="tile-link" href="${path}/book/view"></a><img class="bg-image" src="${path}/images/new-york.jpg" alt="Card image">
                            <div class="card-body overlay-content">
                                <h6 class="card-title text-shadow text-uppercase">책 사진1</h6>
                            </div>
                        </div><br>
                        <div style="text-align: center;">
                            <h6 class="card-title text-shadow text-uppercase">책 제목</h6>
                            <p class="card-text text-sm">저자</p>
                        </div>
                    </div>


                    <div class="swiper-slide h-auto px-2">
                        <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0">
                            <a class="tile-link" href="${path}/book/view"></a><img class="bg-image" src="${path}/images/new-york.jpg" alt="Card image">
                            <div class="card-body overlay-content">
                                <h6 class="card-title text-shadow text-uppercase">책 사진2</h6>
                            </div>
                        </div><br>
                        <div style="text-align: center;">
                            <h6 class="card-title text-shadow text-uppercase">책 제목</h6>
                            <p class="card-text text-sm">저자</p>
                        </div>
                    </div>

                    <div class="swiper-slide h-auto px-2">
                        <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0">
                            <a class="tile-link" href="${path}/book/view"></a><img class="bg-image" src="${path}/images/new-york.jpg" alt="Card image">
                            <div class="card-body overlay-content">
                                <h6 class="card-title text-shadow text-uppercase">책 사진3</h6>
                            </div>
                        </div><br>
                        <div style="text-align: center;">
                            <h6 class="card-title text-shadow text-uppercase">책 제목</h6>
                            <p class="card-text text-sm">저자</p>
                        </div>
                    </div>

                    <div class="swiper-slide h-auto px-2">
                        <div class="card card-poster gradient-overlay hover-animate mb-4 mb-lg-0">
                            <a class="tile-link" href="${path}/book/view"></a><img class="bg-image" src="${path}/images/new-york.jpg" alt="Card image">
                            <div class="card-body overlay-content">
                                <h6 class="card-title text-shadow text-uppercase">책 사진4</h6>
                            </div>
                        </div><br>
                        <div style="text-align: center;">
                            <h6 class="card-title text-shadow text-uppercase">책 제목</h6>
                            <p class="card-text text-sm">저자</p>
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination d-md-none"> </div>
            </div>
            <div>
                <p style="text-align: center; color: slategrey">(↑ click 해서 옆으로 미세요.)</p>
            </div>
        </div>
    </section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>