<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="도서검색" name="title"/>
</jsp:include>
<div class="pt-5">
    <div style="background-image: url('${path}/images/bsi.jpg');">
        <div class="container py-6 py-md-5 text-white">
            <div class="row">
                <div class="text-center text-lg-start">
                    <h1 class="display-6 fw-bold text-shadow" style="margin-top: 20px; margin-left: 50px;">FIND THE BOOK YOU WANT</h1>
                </div>
                <div class="search-bar mt-4 p-3 p-lg-1 ps-lg-4">
                    <form action="#">
                        <div class="row">
                            <div class="col-lg-2 d-flex align-items-center form-group">
                                <select name="searchType" onchange="handleOnChange(this)" style="width: 180px; border-style: none;">
                                  <option value="bName">제목</option>
                                  <option value="bWriter">저자</option>
                                  <option value="bCategory">장르</option>
                                </select>
                            </div>
                            <div class="col-lg-7 d-flex align-items-center">
                                <input class="form-control border-0 shadow-0" type="text" name="searchValue" placeholder="검색어를 입력하세요.">
                            </div>
                            <div class="col-lg-1 d-flex align-items-center form-group no-divider">
                            </div>
                            <div class="col-lg-2 d-grid">
                                <button class="btn btn-primary rounded-pill h-100 fw-bold bi-search" type="submit">&nbsp;검색</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="bg-gray-100">
        <div class="col-sm-10 container d-grid">
            <div id="aside" class="position-fixed rounded" style="width: 200px; height: 370px; margin-left: -80px;  margin-top: 40px; background-color: rgba(39, 75, 192, 0.808);"><br>
                <h5 class="text-white" style="margin-left: 20px; margin-top: 1px; border-bottom: white 0.5px solid;">CATEGORY</h5><br>
                <ol type="submit" style="font-size: large; color: white; font-weight: bold;"> 소설</ol>
                <ol type="submit" style="font-size: large; color: white; font-weight: bold;">시/에세이</ol>
                <ol type="submit" style="font-size: large; color: white; font-weight: bold;">경제/경영</ol>
                <ol type="submit" style="font-size: large; color: white; font-weight: bold;">자기계발</ol>
                <ol type="submit" style="font-size: large; color: white; font-weight: bold;">인문</ol>
                <ol type="submit" style="font-size: large; color: white; font-weight: bold;">역사/문화</ol>
            </div>
            <div class="col-10 me-5 d-grid gap-3 container bg-gray-100">
                    <div class="container">
						<c:if test="${list == '[]'}">
								<div class="text-center py-7">
									<h3>"<span class="text-primary">${param.searchValue}</span>"<br>에 대한 검색결과가 없습니다.</h3>
								</div>
						</c:if>
						<c:if test="${list != '[]'}">
						<div class="text-center py-3">
									<h4>"<span class="text-primary">${param.searchValue}</span>"에 대한 검색결과</h4>
								</div>
						<ul class="nav justify-content-end">
                            <li class="nav-item">
                                <a class="nav-link text-dark fw-bold active" href="#">출간일순</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-dark fw-bold" href="#">대여순</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-dark fw-bold" href="#">평점순</a>
                            </li>
                        </ul>
                        <div class="border-bottom"></div>
                    </div>
                <div class="row text-center">
					<c:forEach var="book" items="${list}"> 
                    <div class="col-lg-3" style="margin-bottom: 1.7rem;">
                        <a href="${path}/book/view?bNo=${book.BNo}"><img src="${path}/book/${book.BImage}" style="height: 280px;" class="rounded-0 card-img mb-3 border border-1"></a>
                        <span class="h5">${book.BName}</span><br>
                        <span class="text-muted small">${book.BWriter}</span>
                    </div>
					</c:forEach>
                </div>

            <div class="border-top mt-n4">
                <!-- Pagination -->
                
                
                <div class="pagination justify-content-center pt-4 pb-7">
			<!-- 맨 처음으로 -->
			<button class="page-link page-item rounded-start"
				onclick="location.href='${ path }/book/search?page=1'">&lt;&lt;</button>

			<!-- 이전 페이지로 -->
			<button class="page-link page-item"
				onclick="location.href='${path}/book/search?page=${ pageInfo.prvePage }'">&lt;</button>

			<!--  10개 페이지 목록 -->
			<c:forEach begin="${ pageInfo.startPage }"
				end="${ pageInfo.endPage }" step="1" varStatus="status">
				<c:if test="${ pageInfo.currentPage == status.current}">
					<button class="page-link page-item" disabled>
						<c:out value="${ status.current }" />
					</button>
				</c:if>
				<c:if test="${ pageInfo.currentPage != status.current}">
					<button class="page-link page-item"
						onclick="location.href='${ path }/book/search?page=${ status.current }'">
						<c:out value="${ status.current }" />
					</button>
				</c:if>
			</c:forEach>

			<!-- 다음 페이지로 -->
			<button class="page-link page-item"
				onclick="location.href='${path}/book/search?page=${ pageInfo.nextPage }'">&gt;</button>

			<!-- 맨 끝으로 -->
			<button class="page-link page-item rounded-end"
				onclick="location.href='${path}/book/search?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
		</div>
                <!-- End Pagination -->
                </c:if>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>