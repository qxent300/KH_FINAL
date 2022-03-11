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
                                <select name="division" onchange="handleOnChange(this)" style="width: 180px; border-style: none;">
                                  <option value="title">제목</option>
                                  <option value="writer">저자</option>
                                  <option value="genre">장르</option>
                                </select>
                            </div>
                            <div class="col-lg-7 d-flex align-items-center">
                                <input class="form-control border-0 shadow-0" type="text" name="search" placeholder="검색어를 입력하세요.">
                            </div>
                            <div class="col-lg-1 d-flex align-items-center form-group no-divider">
                            </div>
                            <div class="col-lg-2 d-grid">
                                <button onclick="location.href='#'" class="btn btn-primary rounded-pill h-100 fw-bold" type="submit">검색</button>
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
            <div class="col-9 d-grid gap-3 container bg-gray-100">
                <div class="pt-6">
                    <div class="container">
                        <h4 class="mb-3 text-center" style="color: rgba(175, 170, 170, 0.918);">검색 결과</h4>

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
                </div>
                <div class="row text-center mb-3">
                    <div class="col-lg-3">
                        <a href="${path}/book/view"><img src="${path}/images/1.jpg" class="rounded card-img mb-3"></a>
                        <h3 class="h5">책 제목</h3>
                        <p class="text-muted">저자</p>
                    </div>
                    <div class="col-lg-3">
                        <a href="${path}/book/view"><img src="${path}/images/2.jpg" class="rounded card-img mb-3"></a>
                        <h3 class="h5">책 제목</h3>
                        <p class="text-muted">저자</p>
                    </div>
                    <div class="col-lg-3">
                        <a href="${path}/book/view"><img src="${path}/images/3.jpg" class="rounded card-img mb-3"></a>
                        <h3 class="h5">책 제목</h3>
                        <p class="text-muted">저자</p>
                    </div>
                    <div class="col-lg-3">
                        <a href="${path}/book/view"><img src="${path}/images/4.jpg" class="rounded card-img mb-3"></a>
                        <h3 class="h5">책 제목</h3>
                        <p class="text-muted">저자</p>
                    </div>
                </div>

                <div class="row text-center mb-3">
                    <div class="col-lg-3">
                        <a href="${path}/book/view"><img src="${path}/images/1.jpg" class="rounded card-img mb-3"></a>
                        <h3 class="h5">책 제목</h3>
                        <p class="text-muted">저자</p>
                    </div>
                    <div class="col-lg-3">
                        <a href="${path}/book/view"><img src="${path}/images/2.jpg" class="rounded card-img mb-3"></a>
                        <h3 class="h5">책 제목</h3>
                        <p class="text-muted">저자</p>
                    </div>
                    <div class="col-lg-3">
                        <a href="${path}/book/view"><img src="${path}/images/3.jpg" class="rounded card-img mb-3"></a>
                        <h3 class="h5">책 제목</h3>
                        <p class="text-muted">저자</p>
                    </div>
                    <div class="col-lg-3">
                        <a href="${path}/book/view"><img src="${path}/images/4.jpg" class="rounded card-img mb-3"></a>
                        <h3 class="h5">책 제목</h3>
                        <p class="text-muted">저자</p>
                    </div>
                </div>


                <div class="row text-center mb-3">
                    <div class="col-lg-3">
                        <a href="${path}/book/view"><img src="${path}/images/1.jpg" class="rounded card-img mb-3"></a>
                        <h3 class="h5">책 제목</h3>
                        <p class="text-muted">저자</p>
                    </div>
                    <div class="col-lg-3">
                        <a href="${path}/book/view"><img src="${path}/images/2.jpg" class="rounded card-img mb-3"></a>
                        <h3 class="h5">책 제목</h3>
                        <p class="text-muted">저자</p>
                    </div>
                    <div class="col-lg-3">
                        <a href="${path}/book/view"><img src="${path}/images/3.jpg" class="rounded card-img mb-3"></a>
                        <h3 class="h5">책 제목</h3>
                        <p class="text-muted">저자</p>
                    </div>
                    <div class="col-lg-3">
                        <a href="${path}/book/view"><img src="${path}/images/4.jpg" class="rounded card-img mb-3"></a>
                        <h3 class="h5">책 제목</h3>
                        <p class="text-muted">저자</p>
                    </div>
                </div>

                <div class="row text-center mb-3">
                    <div class="col-lg-3">
                        <a href="${path}/book/view"><img src="${path}/images/1.jpg" class="rounded card-img mb-3"></a>
                        <h3 class="h5">책 제목</h3>
                        <p class="text-muted">저자</p>
                    </div>
                    <div class="col-lg-3">
                        <a href="${path}/book/view"><img src="${path}/images/2.jpg" class="rounded card-img mb-3"></a>
                        <h3 class="h5">책 제목</h3>
                        <p class="text-muted">저자</p>
                    </div>
                    <div class="col-lg-3">
                        <a href="${path}/book/view"><img src="${path}/images/3.jpg" class="rounded card-img mb-3"></a>
                        <h3 class="h5">책 제목</h3>
                        <p class="text-muted">저자</p>
                    </div>
                    <div class="col-lg-3">
                        <a href="${path}/book/view"><img src="${path}/images/4.jpg" class="rounded card-img mb-3"></a>
                        <h3 class="h5">책 제목</h3>
                        <p class="text-muted">저자</p>
                    </div>
                </div>
            </div>

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