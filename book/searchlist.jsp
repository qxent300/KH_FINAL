<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="독서의 민족" name="title"/>
</jsp:include>

<div class="pt-5">
    <div style="background-image: url('${path}/images/bsi.jpg');">
        <div class="container py-6 py-md-5 text-white">
            <div class="row">
                <div class="text-center text-lg-start">
                    <h1 class="display-6 fw-bold text-shadow" style="margin-top: 20px; margin-left: 50px;">FIND THE BOOK YOU WANT</h1>
                </div>
                <div class="search-bar mt-4 p-3 p-lg-1 ps-lg-4">
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
                            <div class="col-lg-7 d-flex align-items-center">
                                <input id="keyword" name="keyword" value="${map.keyword}" class="form-control border-0 shadow-0" type="text" placeholder="검색어를 입력하세요.">
                            </div>
                            <div class="col-lg-1 d-flex align-items-center form-group no-divider">
                            </div>
                            <div class="col-lg-2 d-grid">
                                <button onclick="location.href='search'" class="btn btn-primary rounded-pill h-100 fw-bold bi-search" type="submit">&nbsp;검색</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="bg-gray-100">
        <div class="col-sm-10 container d-grid">
            <div id="aside" class="position-fixed rounded" style="width: 200px; height: 370px; margin-left: -90px;  margin-top: 40px; background-color: rgba(104, 157, 218, 0.808);"><br>
                <h5 class="text-white" style="margin-left: 20px; margin-top: 1px; border-bottom: white 0.5px solid;">CATEGORY</h5><br>
                <ol type="submit" onclick="location.href='novel'" style="font-size: large; color: white; font-weight: bold;">소설</ol>
                <ol type="submit" onclick="location.href='poem'" style="font-size: large; color: white; font-weight: bold;">시/에세이</ol>
                <ol type="submit" onclick="location.href='economy'" style="font-size: large; color: white; font-weight: bold;">경제/경영</ol>
                <ol type="submit" onclick="location.href='selfDevelopment'" style="font-size: large; color: white; font-weight: bold;">자기계발</ol>
                <ol type="submit" onclick="location.href='humanities'" style="font-size: large; color: white; font-weight: bold;">인문</ol>
                <ol type="submit" onclick="location.href='historyCulture'" style="font-size: large; color: white; font-weight: bold;">역사/문화</ol>
            </div>
            <div class="col-9 d-grid gap-3 container bg-gray-100" style="padding-right: 0px;">
                <div class="pt-6">
                    <div class="container">
                        <h4 class="mb-3 text-center" style="color: rgba(175, 170, 170, 0.918);">전체보기</h4>

                        <ul class="nav justify-content-end">
                           <li class="nav-item">
                                <a class="nav-link text-dark fw-bold active" href="searchsort?sort=publish_date">
                                출간일순
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-dark fw-bold" href="searchsort?sort=rentcount">대여순</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-dark fw-bold" href="searchsort?sort=avgscore">평점순</a>
                            </li>
                        </ul>
                        <div class="border-bottom"></div>
                    </div>
                </div>
                
                
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
					<c:if test="${status.index % 4 == 3 }">
						  </div>
				 	</c:if>
				</c:forEach>
                </c:if>
               
                

            <div class="border-top">
                <!-- Pagination -->
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center mt-4 mb-5">
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">«</span>
                                <span class="visually-hidden">Previous</span>
                            </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                        <li class="page-item"><a class="page-link" href="#">5</a></li>
                        <li class="page-item"><a class="page-link" href="#">6</a></li>
                        <li class="page-item"><a class="page-link" href="#">7</a></li>
                        <li class="page-item"><a class="page-link" href="#">8</a></li>
                        <li class="page-item"><a class="page-link" href="#">9</a></li>
                        <li class="page-item"><a class="page-link" href="#">10</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">»</span>
                                <span class="visually-hidden">Next</span>
                            </a>
                        </li>
                    </ul>
                </nav>
                <!-- End Pagination -->
            </div>
            
            
            
            
        </div>
    </div>
</div>




<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>