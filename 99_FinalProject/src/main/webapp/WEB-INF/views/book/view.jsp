<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% pageContext.setAttribute("BR", "\n"); %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="${book.BName}" name="title"/>
</jsp:include>
<link rel="stylesheet" href="${path}/css/star.css">
<div class="d-grid gap-4 container py-7">
	<!-- Card -->
	<!-- <h2 class="text-center">도서 상세정보</h2> -->
	<div class="row align-items-md-center justify-content-end">
		<div class="col-sm-3 mb-3 mb-sm-0">
			<!-- Card Pinned -->
			<div class="card-pinned">
				<img style="max-width: 250px; width: 100%;" class="border border-1"
					src="${path}/book/${book.BImage}">
				<!-- <img class="card-alert" src="${path}/images/1.jpg" style="max-height: 350px; max-width: 300px; margin-left: 130px;"> -->

				<!-- <div class="card-pinned-top-start">
                        <small class="badge bg-success">인기</small>
                    </div> -->
			</div>
			<!-- End Card Pinned -->
		</div>
		<!-- End Col -->

		<div class="col-sm-7">
			<p class="h3">${book.BName}</p>
			<small class="card-subtitle text-body">${book.BWriter} / <fmt:formatDate
					pattern="20dd년 MM월 yy일" value="${book.publishDate}" /></small><br>
			<!-- End Col -->
			<!-- End Row -->
				<c:if test="${scoreAvg ne 'NaN'}">
					<div class="starpoint_box starpoint_wrap me-6">
				<c:forEach var="star" begin="1" end="${scoreAvgs*2}" step="1">
        				<label style="opacity:0;width:0;height:0;position:absolute;"></label>
        				<label class="starpoint_bg" style="display:inline-block;width:100px;top:-36px;height:40px;background-position:0 20px;box-sizing:border-box;"></label>
        				<label class="starpoint_bg" style="top:-16px; width: ${star}0px;height:40px;"></label>
				</c:forEach>
    				</div>
    			</c:if>
				<c:if test="${scoreAvg ne 'NaN'}">
					<span class="ms-1 small">${scoreAvg}점</span>
				</c:if> <c:if test="${scoreAvg eq 'NaN'}">
					<span class="small">(평가 없음)</span>
				</c:if> / <span class="small">한줄평(${scoreCount}건)</span> <!-- or 재고 있음 -->

			<div class="row align-items-center mb-3"></div>
			<!-- End Row -->
			<input type="hidden" name="bNo" id="bNo" value="${book.BNo}">
			<input type="hidden" name="uNo" id="uNo" value="1">
			<button type="submit" id="addCart" class="btn btn-primary">
			<em class="bi-cart fw-bold"> 장바구니에 담기</em></button>
			<button type="submit" id="addRent" class="btn btn-info"><em class="bi-book fw-bold"> 대여하기</em></button>
		</div>
		<!-- End Col -->
	</div>
	<!-- End Row -->
	<!-- End Card -->

	<!-- Nav Scroller -->
	<div class="row col-10 m-auto mt-2">
		<!-- Nav -->
		<ul class="nav nav-segment nav-fill mb-4 fw-bold" id="featuresTab"
			role="tablist">
			<li class="nav-item" role="presentation"><a
				class="nav-link active" href="#featuresOne" id="featuresOne-tab"
				data-bs-toggle="tab" data-bs-target="#featuresOne" role="tab"
				aria-controls="featuresOne" aria-selected="true"
				style="min-width: 7rem;">책 소개</a></li>

			<li class="nav-item" role="presentation"><a class="nav-link"
				href="#featuresTwo" id="featuresTwo-tab" data-bs-toggle="tab"
				data-bs-target="#featuresTwo" role="tab" aria-controls="featuresTwo"
				aria-selected="false" style="min-width: 7rem;">한줄평(${scoreCount}건)</a>
			</li>

			<li class="nav-item" role="presentation"><a class="nav-link"
				href="#featuresThree" id="featuresThree-tab" data-bs-toggle="tab"
				data-bs-target="#featuresThree" role="tab"
				aria-controls="featuresThree" aria-selected="false"
				style="min-width: 7rem;">대여 안내</a></li>
		</ul>
		<!-- End Nav -->
		<!-- End Nav Scroller -->

		<!-- Tab Content -->
		<div class="tab-content" id="pills-tabContent">
			<div class="tab-pane fade show active" id="featuresOne"
				role="tabpanel" aria-labelledby="featuresOne-tab">
				<h2>책 소개</h2>
				<div class="list-unstyled list-pointer pt-2">
					<p>${fn:replace(book.BContent, BR, "<br/>")}</p>
				</div>
			</div>
			<div class="tab-pane fade" id="featuresTwo" role="tabpanel"
				aria-labelledby="featuresTwo-tab">
				<form action="${path}/book/score" method="post" onsubmit="return check()">
					<div
						class="row justify-content-sm-between align-items-sm-center border-bottom pb-3 mb-4">
						<div class="col-sm-9 mb-2 mb-sm-0">
							<h4 class="mb-0">
								한줄평<small class="text-muted fw-normal">(${scoreCount}건)</small>
							</h4>
							<label class="form-label" for="commentarea">한줄평을 남겨주세요!</label>
							<div class="flex-grow-1 mb-2 pt-2">
        <span class="fw-bold" style="margin-top: -350px;">평점</span>
								<div class="starpoint_wrap">
        <div class="starpoint_box" style="top:2px;">
            <label for="starpoint_1" class="label_star" title="1"><span class="blind">1점</span></label>
            <label for="starpoint_2" class="label_star" title="1"><span class="blind">1점</span></label>
            <label for="starpoint_3" class="label_star" title="2"><span class="blind">2점</span></label>
            <label for="starpoint_4" class="label_star" title="2"><span class="blind">2점</span></label>
            <label for="starpoint_5" class="label_star" title="3"><span class="blind">3점</span></label>
            <label for="starpoint_6" class="label_star" title="3"><span class="blind">3점</span></label>
            <label for="starpoint_7" class="label_star" title="4"><span class="blind">4점</span></label>
            <label for="starpoint_8" class="label_star" title="4"><span class="blind">4점</span></label>
            <label for="starpoint_9" class="label_star" title="5"><span class="blind">5점</span></label>
            <label for="starpoint_10" class="label_star" title="5"><span class="blind">5점</span></label>
            <input type="radio" name="score" value="1" id="starpoint_1" class="star_radio">
            <input type="radio" name="score" value="1" id="starpoint_2" class="star_radio">
            <input type="radio" name="score" value="2" id="starpoint_3" class="star_radio">
            <input type="radio" name="score" value="2" id="starpoint_4" class="star_radio">
            <input type="radio" name="score" value="3" id="starpoint_5" class="star_radio">
            <input type="radio" name="score" value="3" id="starpoint_6" class="star_radio">
            <input type="radio" name="score" value="4" id="starpoint_7" class="star_radio">
            <input type="radio" name="score" value="4" id="starpoint_8" class="star_radio">
            <input type="radio" name="score" value="5" id="starpoint_9" class="star_radio">
            <input type="radio" name="score" value="5" id="starpoint_10" class="star_radio">
            <span class="starpoint_bg"></span>
        </div>
    </div></div>
							<input type="hidden" name="bNo" value="${book.BNo}" />
							<textarea id="sContent" name="sContent" class="form-control"
								placeholder="한글 기준 50자까지 작성 가능합니다." style="width: 770px"
								rows="2"></textarea>
						</div>
						<div class="col-sm-2">
							<button type="submit" id="btnSubmit"
								class="btn btn-lg btn-primary rounded-1 fw-bold"
								style="width: 100%; height: 65px; margin-top: 106px;">등록</button>
						</div>
						<!-- End Col -->

						<!-- Media -->
						<div class="align-items-center text-center">
							<div class="flex-grow-1 mt-3 pb-1">
								<!-- Rating -->

								<c:if test="${scoreAvg ne 'NaN'}">
									<h4>
										<span class="text-primary fw-bold">${scoreCount}</span>명의 회원이
										평가한 평균별점
									</h4>
									<c:if test="${scoreAvg ne 'NaN'}">
										<div class="starpoint_box starpoint_wrap" style="margin-right: 9rem">
											<c:forEach var="star" begin="1" end="${scoreAvgs*3}" step="1">
        										<label style="opacity:0;width:0;height:0;position:absolute;"></label>
        										<label class="starpoint_bg" style="display:inline-block;width:150px;height:30px;top:-27px;background-position:0 0px;background-size: 150px;box-sizing:border-box;"></label>
        										<label class="starpoint_bg" style="top:-27px; width: ${star}0px;height:30px;background-position:0 -30px;background-size: 150px;"></label>
											</c:forEach>
    											</div>
    											</c:if>
								<span class="h2 text-dark fw-bold ms-2">${scoreAvg}<span class="text-muted h5">/5.0</span></span>
								</c:if>
								<!-- End Rating -->
							</div>
						</div>
						<!-- End Media -->
						<!-- End Col -->
					</div>
				</form>
				<!-- End Row -->
				<!-- Comment -->
				<c:if test="${empty scoreList}">
                            ${reviews.SNo}
							<div class="text-center mb-3 h3">등록된 한줄평이 없습니다.</div>
					<div class="text-center mb-3">첫 번째 한줄평을 남겨주세요!</div>
				</c:if>
				<!-- Item -->
				<!-- Media -->

				<c:if test="${!empty scoreList}">
					<div class="container justify-content-center" style="width: 97%;">
						<div class="card card-body row">
							<c:forEach var="score" items="${scoreList}">

								<span class="text-dark">${score.UNickName}&nbsp;
								<div class="starpoint_box starpoint_wrap me-6">
									<c:forEach var="star" begin="1" end="${score.score*2}" step="1">
        								<label style="opacity:0;width:0;height:0;position:absolute;"></label>
        								<label class="starpoint_bg" style="display:inline-block;width:100px;top:-36px;height:40px;background-position:0 20px;box-sizing:border-box;"></label>
        								<label class="starpoint_bg" style="top:-16px; width: ${star}0px;height:40px;"></label>
									</c:forEach>
    							</div>
								 <sub class="text-dark float-end"><fmt:formatDate
											pattern="yy-MM-dd hh:mm:ss" value="${score.createDate}" /></sub>
								</span>
								<span class="text-dark">${fn:replace(score.SContent, BR, "<br/>")}</span>
								<div class="border-top pt-2 pb-2"></div>
							</c:forEach>
						</div>
					</div>
				</c:if>
				<!-- End Comment -->
			</div>

			<div class="tab-pane fade" id="featuresThree" role="tabpanel"
				aria-labelledby="featuresThree-tab">
				<h4 class="mb-3">대여 안내</h4>
				<div class="d-grid gap-2 mb-5">
					<!-- Card -->
					<div class="card card-sm card-bordered shadow-none">
						<div class="card-body">
							<div class="row align-items-sm-center">
								<div class="col">
									<div class="d-flex align-items-center">
										<div class="flex-shrink-0">
											<span class="svg-icon svg-icon-sm text-center text-primary"
												style="min-width: 3rem;"> </span>
										</div>
										<div>
                   						<p class="fw-bold">도서 대여 기간</p>
                    					<p>도서 대여는 최대 2주까지 가능합니다.</p><br>
                  						<p class="fw-bold">도서 연체 시</p>
                   						<p>도서를 반납기한을 초과한 경우, 반납일로부터 연체일수 만큼 대출이 일시 정지되며, 연체도서 중 연체일수가 가장 긴 도서의 연체일수 만큼 대출할 수 없습니다. 반납한 자료의 당일 재대출은 불가하며, 다음날부터 대출이 가능합니다.</p><br>
                    					<p class="fw-bold">도서 분실 / 훼손</p>
                    					<p>도서를 분실, 훼손 하였을 경우에는 해당 도서와 동일한 자료로 변상하는 것을 원칙으로 합니다. 다만, 변상당시 구하기 어렵다고 여겨지는 도서는 유사한 도서로 변상할 수 있습니다.</p>
                    					<p>분실한 도서를 같은 도서로 변상하지 못할 경우에는 현금으로 변상해야 합니다.</p>
                    					<p>1. 그 도서의 출간년이 변상당시를 기준으로 5년 전 이내일 경우, 변상대금은 시가의 1.5배.</p>
                    					<p>2. 그 도서의 발행년이 변상당시를 기준으로 5년 전 이상일 경우, 변상대금은 시가의 매년 10%를 가산한 금액.</p>
                    					<p>3. 악보의 변상대금은 발행년에 관계 없이 시가의 5배</p>
                    					<p>4. 귀중하다고 여겨지는 자료 (문학작품의 초판본, 연속간행물 등), 고서 및 특정 집서의 자료의 변상대금은 별도로 산정한 금액.</p>
                    
                				</div>
										
							<!-- End Row -->
						</div>
					</div>
					<!-- End Card -->
				</div>
			</div>
		</div>
		<!-- End Tab Content -->
	</div>
</div>
<!-- End Content -->
<!-- <script>
        $(function() {
            $("#addTest").on("click", function(event) {
                $(this).attr("href", function(i, val) {
                    return $("#bNo").val();
                });
            });
        })
</script> -->
<script>
	$(function() {
		$("#addCart").on("click", function() {
			$.ajax({
				url : "${path}/mypage/cart",
				data : {
					bNo : "${book.BNo}"
				},
				type : "post",
				success : function(data) {
					if (${login} == 0) {
                        alert("로그인 후 이용 가능합니다.")
                    } else {
                        alert("도서를 카트에 담았습니다.")
				}}
			});
		});
		$("#addRent").on("click", function() {
			$.ajax({
				url : "${path}/mypage/rent",
				data : {
					bNo : "${book.BNo}"
				},
				type : "post",
				
				success: function(data) {
                    if (${login} == 0) {
                    	alert("로그인 후 이용 가능합니다.")
                    } else {
                        alert("도서를 대여하였습니다.")
				}}
			});
		});
	});
</script>
<script>
	function check() {
		if ($('input[name=score]:radio:checked').length < 1) {
			alert("평점을 선택해주세요!");
			return false;
		}
		if ($('#sContent').val() == "") {
			alert("내용을 입력해주세요!");
			return false;
		}
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>