<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header9.jsp">
	<jsp:param value="헤르만 헤세의 독서의 기술" name="title"/>
</jsp:include>

<div class="d-grid gap-5 container content-space-2 content-space-lg-3">
        <!-- Card -->
        <h2 class="text-center">도서 상세정보</h2>
        <div class="row align-items-md-center justify-content-end">
            <div class="col-sm-3 mb-3 mb-sm-0">
                <!-- Card Pinned -->
                <div class="card-pinned">
                    <img style="max-width: 250px;" src="${path}/images/1.jpg">
                    <!-- <img class="card-alert" src="${path}/images/1.jpg" style="max-height: 350px; max-width: 300px; margin-left: 130px;"> -->

                    <div class="card-pinned-top-start">
                        <small class="badge bg-success">인기</small>
                    </div>
                </div>
                <!-- End Card Pinned -->
            </div>
            <!-- End Col -->

            <div class="col-sm-7">
                <h3 class="card-title text-inherit">헤르만 헤세의 독서의 기술</h3>
                <small class="card-subtitle text-body">헤르만 헤세 저 / 뜨인돌 / 2006년 10월 28일</small>
                <!-- End Col -->
                <!-- End Row -->

                <a class="gap-1" href="#reviewSection">
                    <img src="${path}/images/star.svg" width="18">
                    <img src="${path}/images/star.svg" width="18">
                    <img src="${path}/images/star.svg" width="18">
                    <img src="${path}/images/star.svg" width="18">
                    <img src="${path}/images/star.svg" width="18">
                    <span class="ms-1 small">10.0점</span>
                </a> /
                <a href="#featuresTwo">
                    <span class="small">한줄평(21건)</span>
                </a>

                <div class="row align-items-center mb-3">
                </div>
                <!-- End Row -->
                <a class="btn btn-primary"><em class="bi-cart fw-bold"> 카트에 넣기</em></a>
                <a class="btn btn-info"><em class="bi-book fw-bold"> 대여하기</em></a>
            </div>
            <!-- End Col -->
        </div>
        <!-- End Row -->
        <!-- End Card -->

        <!-- Nav Scroller -->
        <div class="row col-10 m-auto">
            <div class="js-nav-scroller hs-nav-scroller-horizontal">
                <span class="hs-nav-scroller-arrow-prev" style="display: none;">
              <a class="hs-nav-scroller-arrow-link" href="javascript:;">
                <i class="bi-chevron-left"></i>
              </a>
            </span>

                <span class="hs-nav-scroller-arrow-next" style="display: none;">
              <a class="hs-nav-scroller-arrow-link" href="javascript:;">
                <i class="bi-chevron-right"></i>
              </a>
            </span>

                <!-- Nav -->
                <ul class="nav nav-segment nav-fill mb-7 fw-bold" id="featuresTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <a class="nav-link active" href="#featuresOne" id="featuresOne-tab" data-bs-toggle="tab" data-bs-target="#featuresOne" role="tab" aria-controls="featuresOne" aria-selected="true" style="min-width: 7rem;">책 소개</a>
                    </li>

                    <li class="nav-item" role="presentation">
                        <a class="nav-link" href="#featuresTwo" id="featuresTwo-tab" data-bs-toggle="tab" data-bs-target="#featuresTwo" role="tab" aria-controls="featuresTwo" aria-selected="false" style="min-width: 7rem;">한줄평(21건)</a>
                    </li>

                    <li class="nav-item" role="presentation">
                        <a class="nav-link" href="#featuresThree" id="featuresThree-tab" data-bs-toggle="tab" data-bs-target="#featuresThree" role="tab" aria-controls="featuresThree" aria-selected="false" style="min-width: 7rem;">대여 안내</a>
                    </li>
                </ul>
                <!-- End Nav -->
            </div>
            <!-- End Nav Scroller -->

            <!-- Tab Content -->
            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="featuresOne" role="tabpanel" aria-labelledby="featuresOne-tab">
                    <h2>책 소개</h2>

                    <ul class="list-unstyled list-pointer mb-5">
                        <p>『싯다르타』로 유명한 소설가 헤르만 헤세가 청소년들에게 전하는 독서의 기술에 관한 책인 『헤르만 헤세의 독서의 기술』은 문학에 대한 그에 저술들을 모아 엮은 책으로 독서에 대한 헤세의 생각들을 읽을 수 있으며 읽다보면 헤세가 얼마만큼 글을 쓰고 그리고 책을 읽는 것에 애정을 가졌는지 알 수 있다,
                        </p>
                    </ul>

                </div>

                <div class="tab-pane fade" id="featuresTwo" role="tabpanel" aria-labelledby="featuresTwo-tab">
                    <div class="row justify-content-sm-between align-items-sm-center border-bottom pb-3 mb-4">
                        <div class="col-sm-9 mb-2 mb-sm-0">
                            <h4 class="mb-0">한줄평<small class="text-muted ms-1">(21건)</small></h4>
                            <label class="form-label" for="commentarea">한줄평을 남겨주세요!</label>
                            <div class="flex-grow-1 mb-2">
                                <span class="fw-bold" style="margin-top: -350px;">평점</span>
                                <img src="${path}/images/star.svg" width="18" style="margin-bottom: 5px;">
                                <img src="${path}/images/star.svg" width="18" style="margin-bottom: 5px;">
                                <img src="${path}/images/star.svg" width="18" style="margin-bottom: 5px;">
                                <img src="${path}/images/star-half.svg" width="18" style="margin-bottom: 5px;">
                                <img src="${path}/images/star-muted.svg" width="18" style="margin-bottom: 5px;">
                            </div>
                            <textarea id="commentarea" class="form-control" placeholder="한글 기준 50자까지 작성 가능합니다." style="width: 770px" rows="2"></textarea>
                        </div>
                        <div class="col-sm-2">
                            <button type="submit" id="btnSubmit" class="btn btn-sm btn-primary rounded-1 fw-bold" style="width: 120px; height: 65px; margin-top: 85px;">등록</button>
                        </div>
                        <!-- End Col -->

                        <!-- Media -->
                        <div class="align-items-center text-center">
                            <div class="flex-grow-1 ms-4 mt-3">
                                <!-- Rating -->
                                <h3><span class="text-primary fw-bold">21</span>명의 회원이 평가한 평균별점</h3>
                                <img src="${path}/images/star.svg" width="50">
                                <img src="${path}/images/star.svg" width="50">
                                <img src="${path}/images/star.svg" width="50">
                                <img src="${path}/images/star.svg" width="50">
                                <img src="${path}/images/star.svg" width="50">
                                <div class="flex-shrink-0">
                                    <span class="display-4 text-dark">10.0</span>
                                </div>
                                <!-- End Rating -->
                            </div>
                        </div>
                        <!-- End Media -->
                        <!-- End Col -->

                    </div>
                    <!-- End Row -->
                    <!-- Comment -->
                    <ul class="list-comment mb-7 mt-1">
                        <!-- Item -->
                        <li class="list-comment-item">
                            <!-- Media -->
                            <div class="d-flex mb-3">
                                <div class="flex-shrink-0">
                                    <img class="avatar avatar-circle" src="${path}/images/user.jpg">
                                </div>

                                <div class="flex-grow-1 ms-3">
                                    <h5>인물1</h5>
                                    <p>한줄평1입니다.</p>
                                </div>
                            </div>
                            <!-- End Media -->
                        </li>
                        <!-- End Item -->

                        <!-- Item -->
                        <li class="list-comment-item">
                            <!-- Media -->
                            <div class="d-flex mb-3">
                                <div class="flex-shrink-0">
                                    <img class="avatar avatar-circle" src="${path}/images/user.jpg">
                                </div>

                                <div class="flex-grow-1 ms-3">
                                    <h5>인물2</h5>
                                    <p>한줄평2입니다.</p>
                                </div>
                            </div>
                            <!-- End Media -->
                        </li>
                        <!-- End Item -->

                        <!-- Item -->
                        <li class="list-comment-item">
                            <!-- Media -->
                            <div class="d-flex mb-3">
                                <div class="flex-shrink-0">
                                    <img class="avatar avatar-circle" src="${path}/images/user.jpg">
                                </div>

                                <div class="flex-grow-1 ms-3">
                                    <h5>인물3</h5>
                                    <p>한줄평3입니다.</p>
                                </div>
                            </div>
                            <!-- End Media -->
                        </li>
                        <!-- End Item -->
                    </ul>
                    <!-- End Comment -->

                    <!-- Pagination -->
                    <nav aria-label="Page navigation">
                        <ul class="pagination justify-content-center">
                            <li class="page-item disabled">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">
                        <i class="bi-chevron-double-left small"></i>
                      </span>
                                </a>
                            </li>
                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item disabled"><a class="page-link" href="#">...</a></li>
                            <li class="page-item"><a class="page-link" href="#">5</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
                                    <span aria-hidden="true">
                        <i class="bi-chevron-double-right small"></i>
                      </span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                    <!-- End Pagination -->
                </div>

                <div class="tab-pane fade" id="featuresThree" role="tabpanel" aria-labelledby="featuresThree-tab">
                    <h4 class="mb-3">대여 안내

                    </h4>

                    <!-- Form -->
                    <form>
                        <div class="d-grid gap-2 mb-5">
                            <!-- Card -->
                            <div class="card card-sm card-bordered shadow-none">
                                <div class="card-body">
                                    <div class="row align-items-sm-center">
                                        <div class="col">
                                            <div class="d-flex align-items-center">
                                                <div class="flex-shrink-0">
                                                    <span class="svg-icon svg-icon-sm text-center text-primary" style="min-width: 3rem;">
                                            </span>
                                                </div>

                                                <div class="flex-grow-1 ms-4">
                                                    <h4 class="card-title mb-0">Launch</h4>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Col -->

                                        <div class="col-sm-7 col-md-6">
                                            <p class="card-text small">99GB storage in launch accounts</p>
                                        </div>
                                        <!-- End Col -->

                                        <div class="col-12 col-lg-2 mt-3 mt-lg-0">
                                            <div class="d-grid">
                                                <a class="btn btn-outline-primary" href="https://themes.getbootstrap.com/product/front-multipurpose-responsive-template/" target="_blank">$49</a>
                                            </div>
                                        </div>
                                        <!-- End Col -->
                                    </div>
                                    <!-- End Row -->
                                </div>
                            </div>
                            <!-- End Card -->

                            <!-- Card -->
                            <div class="card card-sm card-bordered shadow-none">
                                <div class="card-body">
                                    <div class="row align-items-sm-center">
                                        <div class="col">
                                            <div class="d-flex align-items-center">
                                                <div class="flex-shrink-0">
                                                    <span class="svg-icon text-center text-primary" style="min-width: 3rem;">
                                            </span>
                                                </div>

                                                <div class="flex-grow-1 ms-4">
                                                    <h4 class="card-title mb-0">Growth</h4>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Col -->

                                        <div class="col-sm-7 col-md-6">
                                            <p class="card-text small">500GB storage in growth accounts</p>
                                        </div>
                                        <!-- End Col -->

                                        <div class="col-12 col-lg-2 mt-3 mt-lg-0">
                                            <div class="d-grid">
                                                <a class="btn btn-outline-primary" href="https://themes.getbootstrap.com/product/front-multipurpose-responsive-template/" target="_blank">$149</a>
                                            </div>
                                        </div>
                                        <!-- End Col -->
                                    </div>
                                    <!-- End Row -->
                                </div>
                            </div>
                            <!-- End Card -->

                            <!-- Card -->
                            <div class="card card-sm card-bordered shadow-none">
                                <div class="card-body">
                                    <div class="row align-items-sm-center">
                                        <div class="col">
                                            <div class="d-flex align-items-center">
                                                <div class="flex-shrink-0">
                                                    <span class="svg-icon text-center text-primary" style="min-width: 3rem;">
  
  
  
  
                              </span>
                                                </div>

                                                <div class="flex-grow-1 ms-4">
                                                    <h4 class="card-title mb-0">Enterprise</h4>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Col -->

                                        <div class="col-sm-7 col-md-6">
                                            <p class="card-text small">100TB storage in enterprise accounts</p>
                                        </div>
                                        <!-- End Col -->

                                        <div class="col-12 col-lg-2 mt-3 mt-lg-0">
                                            <div class="d-grid">
                                                <a class="btn btn-outline-primary" href="https://themes.getbootstrap.com/product/front-multipurpose-responsive-template/" target="_blank">$599</a>
                                            </div>
                                        </div>
                                        <!-- End Col -->
                                    </div>
                                    <!-- End Row -->
                                </div>
                            </div>
                            <!-- End Card -->
                        </div>

                        <!-- Card Info -->
                        <div class="text-center">
                            <div class="card card-info-link card-sm">
                                <div class="card-body">
                                    Need 100TB+ storage? <a class="card-link ms-2" href="#">Contact us <span class="bi-chevron-right small ms-1"></span></a>
                                </div>
                            </div>
                        </div>
                        <!-- End Card Info -->
                    </form>
                    <!-- End Form -->
                </div>
            </div>
            <!-- End Tab Content -->
        </div>
    </div>
    <!-- End Content -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>