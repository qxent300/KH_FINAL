<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="독서일기 수정하기" name="title"/>
</jsp:include>


<section class="position-relative dark-overlay mb-5"><img class="bg-image" src="${path}/images/b_board.jpg">
        <div class="container py-7">
            <div class="overlay-content text-center text-white">
                <h1 class="display-4 fw-bold text-shadow mb-0">독서일기 수정하기</h1>
            </div>
        </div>
    </section>
    <!-- /상단 이미지 -->

    <!-- 글쓰기 -->
<section>
	<form class="form" action="${path}/bookboard/write" method="post" onsubmit="return check()">
		<div class="card container col-sm-7">
			<div class="row container mx-auto d-grid">
				<div class="input-group mb-3 mt-3">
					<input type="hidden" name="bbWriter"
						value="${loginMember.uNickname}" readonly> <label
						class="form-label fs-6" for="b_search">독서일기에 넣을 책을 검색해주세요.</label>
					<div class="input-group">
						<select class="btn btn-primary" name="division"
							onchange="handleOnChange(this)" style="min-width: 6.4rem;">
							<option value="title"
								style="color: black; background-color: white;">제목</option>
							<option value="writer"
								style="color: black; background-color: white;">저자</option>
						</select> <input type="text" id="b_search" class="form-control">
						<button class="btn btn-primary rounded-end bi-search"
							type="submit">&nbsp;검색</button>
						<div class="col-sm-12 py-3 ">
							<a href="${path}/bookboard/list?page=${book.bNo}"><img
								src="${path}img/photo/Bboardsearch.png "></a>
								<c:if test="${bookboard.bNo != null}">
							<div class="d-grid gap-2 d-md-flex mt-2 justify-content-md-end ">
								<button class="btn btn-primary " type="reset">삭제</button>
							</div>
							</c:if>
						</div>
					</div>
					<div class="col-xl-12 col-lg-10">
						<div>
							<div>
								<label class="form-label fs-6" for="title">글 제목</label> <input
									class="form-control" type="text" name="title" id="title"
									placeholder="제목을 입력해주세요.">${bookBoard.bbTitle}
							</div>
						</div>
						<div>
							<label class="form-label fs-6 mt-3" for="content">내용</label>
							<textarea class="form-control" rows="8" name="content"
								id="content" placeholder="독서일기를 작성해주세요.">${bookBoard.bbContent }</textarea>
						</div>
						<br>
						<div class="text-md-center">
							<button class="btn btn-primary" type="submit">등록하기</button>
							<a href="${path}/bookboard/list" class="btn btn-muted">취소하기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
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