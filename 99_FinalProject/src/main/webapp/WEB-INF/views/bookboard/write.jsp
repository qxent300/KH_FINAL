<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="독서일기 작성하기" name="title"/>
</jsp:include>


<section class="position-relative dark-overlay mb-5"><img class="bg-image" src="${path}/images/b_board.jpg">
        <div class="container py-7">
            <div class="overlay-content text-center text-white">
                <h1 class="display-4 fw-bold text-shadow mb-0">독서일기 작성하기</h1>
            </div>
        </div>
    </section>
    <!-- /상단 이미지 -->

    <!-- 글쓰기 -->
<section>
	<div class="card container col-sm-7">
		<div class="row container mx-auto d-grid">
			<div class="input-group mb-3 mt-3">
				<label class="form-label fs-6" for="b_search">독서일기에 넣을 책을
					검색해주세요.</label>
				<div class="input-group">
					<button class="btn btn-primary dropdown-toggle" type="button"
						data-bs-toggle="dropdown" aria-expanded="false">전체</button>
					<ul class="dropdown-menu border" style="min-width: 3.2rem;">
						<li><a class="dropdown-item" href="#">제목</a></li>
						<li><a class="dropdown-item" href="#">저자</a></li>
					</ul>
					<input type="text" id="b_search" class="form-control">
					<button class="btn btn-primary rounded-end bi-search" type="submit">&nbsp;검색</button>
					<div class="col-sm-12 py-3">
						<a
							href="https://book.naver.com/bookdb/book_detail.naver?bid=17583399"><img
							src="${path}/images/Bboardsearch.png" class="border w-100"></a>
					</div>
				</div>
				<div class="col-xl-12 col-lg-10">
					<form class="form" action="${path}/bookboard/write" method="post" onsubmit="return check()">
						<div>
							<div>
								<label class="form-label fs-6" for="title">글 제목</label> <input
									class="form-control" type="text" name="title" id="title"
									placeholder="제목을 입력해주세요.">
							</div>
						</div>
						<div>
							<label class="form-label fs-6 mt-3" for="content">내용</label>
							<textarea class="form-control" rows="8" name="content"
								id="content" placeholder="독서일기를 작성해주세요."></textarea>
						</div>
						<br>
						<div class="text-md-center">
							<button class="btn btn-primary" type="submit">등록하기</button>
							<a href="${path}/bookboard/list" class="btn btn-muted">취소하기</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<br>
<script>
	function check() {
		if ($("#title").val() == "") {
			alert("제목을 입력해주세요!");
			return false;
		}
		if ($('#content').val() == "") {
			alert("내용을 입력해주세요!");
			return false;
		}
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>