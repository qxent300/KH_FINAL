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
                        <form action="book/searchlist" method="get">
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
                                    <input value="${map.keyword}" class="form-control border-0 shadow-0" type="text" name="keyword" placeholder="검색어를 입력하세요.">
                                </div>
                                <div class="col-lg-1 d-flex align-items-center form-group no-divider">
                                </div>
                                <div class="col-lg-2 d-grid">
                                    <button onclick="location.href='book/searchlist'" class="btn btn-primary rounded-pill h-100 bi-search" type="submit">&nbsp;검색</button>
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
                        	<a href="${path}/book/view"><img src="${path}/resources/book/${book.BImage}" class="rounded card-img mb-3"></a>
                        	<h3 class="h5"><c:out value="${book.BName}" /></h3>
                        	<p class="text-muted"><c:out value="${book.BWriter}" /></p>
                    	</div>
					
				</c:forEach>
                </c:if>
      -->
    
    <section class="py-5 bg-gray-100">
        <div class="container d-grid col-sm-9" style="max-width: 1000px;">
            <div class="text-center">
                <p class="subtitle text-secondary">Book of the day</p>
                <h2 class="mb-5">오늘의 책</h2>
            </div>
            <div class="row">
            <c:if test="${todayBookList != null }">
         		<c:forEach var="book" items="${todayBookList}" varStatus="status">
                <div class="container col-lg-3 mb-3 mb-lg-0 text-center">
                        <a href="${path}/book/view?bNo=${book.BNo}"><img src="${path}/book/${book.BImage}" style="height: 320px;" class="rounded-0 card-img mb-3 border border-1"></a>
                    <span class="h5">${book.BName}</span><br>
                    <span class="text-muted small">${book.BWriter}</span>
                </div>
            	</c:forEach>  
            </c:if>
            </div>
            
        </div>
    </section>

    <section class="py-5">
        <div class="container">
            <div class="row mb-3">
                <div class="text-center">
                    <p class="subtitle text-primary">Best seller</p>
                    <h2>베스트셀러</h2>
                </div>
                <div class="d-lg-flex align-items-center justify-content-end"><a class="text-muted text-sm fw-bold" href="book/search">
            더 보기<i class="fas fa-angle-right ms-2"></i></a></div>
            </div>
            <div class="swiper-container guides-slider mx-n2">
                <!-- Additional required wrapper-->
                <div class="swiper-wrapper pb-3">
                    <!-- Slides-->
                    <c:if test="${bestsellerList != null }">
				<c:forEach var="book" items="${bestsellerList}" varStatus="status">
					<div class="swiper-slide h-auto px-2">
                            <a class="tile-link" href="${path}/book/view?bNo=${book.BNo}"></a>
                            <a href="${path}/book/view?bNo=${book.BNo}"><img src="${path}/book/${book.BImage}" style="height: 280px;" class="rounded-0 card-img mb-3 border border-1"></a>
                        <div style="text-align: center;">
                            <span class="h5">${book.BName}</span><br>
                            <span class="text-muted small">${book.BWriter}</span>
                        </div>
                    </div>
				</c:forEach>
				</c:if>
                </div>
            </div>
            <div>
                <p style="text-align: center; color: slategrey">(↑ click 해서 옆으로 미세요.)</p>
            </div>
        </div>
    </section>
   <section class="py-5">
        <div class="container">
            <div class="row mb-3">
                <div class="text-center">
                    <p class="subtitle text-danger">New</p>
                    <h2>요즘 뜨는 책</h2>
                </div>
                <div class="d-lg-flex align-items-center justify-content-end"><a class="text-muted text-sm fw-bold" href="book/search">
            더 보기<i class="fas fa-angle-right ms-2"></i></a></div>
            </div>
            <div class="swiper-container guides-slider mx-n2">
                <!-- Additional required wrapper-->
                <div class="swiper-wrapper pb-3">
                    <!-- Slides-->
                    <c:if test="${newBookList != null }">
				<c:forEach var="book" items="${newBookList}" varStatus="status">
					<div class="swiper-slide h-auto px-2">
                            <a href="${path}/book/view?bNo=${book.BNo}"><img src="${path}/book/${book.BImage}" style="height: 280px;" class="rounded-0 card-img mb-3 border border-1"></a>
                        <div style="text-align: center;">
                            <span class="h5">${book.BName}</span><br>
                            <span class="text-muted small">${book.BWriter}</span>
                        </div>
                    </div>
				</c:forEach>
				</c:if>
                </div>
            </div>
            <div>
                <p style="text-align: center; color: slategrey;">(↑ click 해서 옆으로 미세요.)</p>
            </div><!--  -->
        </div>
    </section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>