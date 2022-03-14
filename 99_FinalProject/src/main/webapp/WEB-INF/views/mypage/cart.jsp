<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header9.jsp">
	<jsp:param value="장바구니" name="title"/>
</jsp:include>

<div class="col-8 d-grid gap-5 container content-space-2 content-space-lg-3">
        <!-- Card -->
        <h2 class="text-center">장바구니</h2>
        <div class="card">
            <!-- Body -->
            <div class="card-body">
                <!-- Checkbox -->
                <div class="form-check col-sm-12">
                    <input type="checkbox" id="checkall" class="form-check-input" checked>
                    <label class="form-check-label" for="checkall">전체선택</label>
                </div>
                <!-- End Checkbox -->
                <!-- Form -->
                <form>
                    <!-- List Group -->
                    <ul class="list-group list-group-flush list-group-no-gutters border-top mt-2">
                        <!-- Item -->
                        <li class="list-group-item">
                            <div class="d-flex">
                                <!-- Checkbox -->
                                <div class="form-check m-auto">
                                    <input type="checkbox" id="check1" class="form-check-input" checked>
                                    <label class="form-check-label" for="check1"></label>
                                </div>
                                <!-- End Checkbox -->
                                <div class="flex-shrink-0">
                                    <a href="${path}/book/view"><img class="avatar avatar-xl avatar-4x3" src="${path}/images/1.jpg"></a>
                                </div>

                                <div class="flex-grow-1 ms-3">
                                    <div class="row">
                                        <div class="col-sm-7 mb-3 mb-sm-0">
                                            <h5><a class="text-dark" href="${path}/book/view">헤르만 헤세의 독서의 기술</a></h5>

                                            <div class="d-grid gap-1">
                                                <div class="text-body">
                                                    <span class="small">저자:</span>
                                                    <span class="fw-semi-bold small">헤르만 헤세</span>
                                                </div>
                                                <div class="text-body">
                                                    <span class="small">출판사:</span>
                                                    <span class="fw-semi-bold small">뜨인돌</span>
                                                </div>
                                                <div class="text-body">
                                                    <span class="small">출간일:</span>
                                                    <span class="fw-semi-bold small">2006년 10월 28일</span>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Col -->

                                        <div class="col-sm-3"></div>
                                        <!-- End Col -->

                                        <div class="col-4 col-sm-2 d-none d-sm-inline-block text-right">
                                            <a class="link-sm link-secondary small" href="javascript:;">
                                                <i class="bi-trash me-1"></i> 지우기
                                            </a>
                                        </div>
                                        <!-- End Col -->
                                    </div>
                                    <!-- End Row -->
                                </div>
                            </div>
                        </li>
                        <!-- End Item -->

                        <!-- Item -->
                        <li class="list-group-item">
                            <div class="d-flex">
                                <!-- Checkbox -->
                                <div class="form-check m-auto">
                                    <input type="checkbox" id="formCheck11" class="form-check-input" checked>
                                    <label class="form-check-label" for="formCheck11"></label>
                                </div>
                                <!-- End Checkbox -->
                                <div class="flex-shrink-0">
                                    <a href="${path}/book/view"><img class="avatar avatar-xl avatar-4x3" src="${path}/images/2.jpg"></a>
                                </div>

                                <div class="flex-grow-1 ms-3">
                                    <div class="row">
                                        <div class="col-sm-7 mb-3 mb-sm-0">
                                            <h5><a class="text-dark" href="${path}/book/view">귀멸의 칼날 23</a></h5>

                                            <div class="d-grid gap-1">
                                                <div class="text-body">
                                                    <span class="small">저자:</span>
                                                    <span class="fw-semi-bold small">고토게 코요하루 글/그림</span>
                                                </div>
                                                <div class="text-body">
                                                    <span class="small">출판사:</span>
                                                    <span class="fw-semi-bold small">학산문화사</span>
                                                </div>
                                                <div class="text-body">
                                                    <span class="small">출간일:</span>
                                                    <span class="fw-semi-bold small">2021년 04월 23일</span>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Col -->
                                        <div class="col-sm-3"></div>
                                        <!-- End Col -->

                                        <div class="col-4 col-sm-2 d-none d-sm-inline-block text-right">
                                            <a class="link-sm link-secondary small" href="javascript:;">
                                                <i class="bi-trash me-1"></i> 지우기
                                            </a>
                                        </div>
                                        <!-- End Col -->
                                    </div>
                                    <!-- End Row -->
                                </div>
                                <!-- End Col -->
                            </div>
                            <!-- End Row -->
                        </li>
                        <!-- End Item -->
                    </ul>
                    <!-- End List Group -->
                    <div class="border-top d-flex justify-content-center col-auto gap-2">
                        <button type="submit" class="btn btn-sm btn-primary fw-bold mt-3" id="purchase">대여하기</button>
                        <a class="btn btn-sm btn-secondary fw-bold mt-3" href="#">취소하기</a>
                    </div>
                </form>
                <!-- End Form -->
            </div>
            <!-- End Body -->
        </div>
    </div>
    <!-- End Card -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>