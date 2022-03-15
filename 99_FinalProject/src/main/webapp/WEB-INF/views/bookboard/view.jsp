<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="독서일기 글 제목" name="title"/>
</jsp:include>

    <section class="position-relative dark-overlay mb-5"><img class="bg-image" src="${path}/images/b_board.jpg" alt="">
        <div class="container py-7">
            <div class="overlay-content text-center text-white">
                <h1 class="display-4 fw-bold text-shadow mb-0">괜찮아, 꿈이 있으면 길을 잃지 않아</h1>
            </div>
        </div>
    </section>

    <!-- /상단 이미지 -->
    <!-- 게시글 -->
    <section>
        <div class="container">
            <div class="row">
                <div class="row mb-5">
                    <div class="col-md-7"></div>
                    <div class="col-md-4 d-md-flex align-items-center justify-content-end">
                        <div class="btn-group-lg" role="group" aria-label="Basic example">
						<c:if
							test="${ !empty loginMember && (loginMember.nickname == board.writerId 
									|| loginMember.UGrade == '99') }">
							<button type="button" class="btn btn-primary"
								onclick="location.href='${path}/bookboard/update?no=${board.no}'">수정</button>
							<button type="button" class="btn btn-primary"
								id="btnDelete">삭제</button>
						</c:if>
						<button type="button" class="btn btn-primary"
							onclick="location.href='${path}/bookboard/list'">목록</button>
                        </div>
                    </div>
                </div>
                <div class="col-xl-8 col-lg-10 mx-auto">
                    <h4 class="py-3 mb-5 text-muted text-center fw-light">
                        작성자&nbps;<a class="fw-bold">${bookBoard.uNickName}</a><span class="mx-1">&nbps;|&nbps;</span>작성일&nbps;<a class="fw-bold"> ${bookBoard.bbReadCount}</a><span class="mx-1">&nbps;|&nbps;</span>조회수&nbps;<a class="fw-bold">${bookBoard.readCount}</a>
                    </h4>
                    <div class="py-3 mb-5">
                        <a href="https://book.naver.com/bookdb/book_detail.naver?bid=17583399"><img src="${path}/images/booklink.png" alt="..."></a>
                    </div>
                    <p class="lead mb-5">${bookBoard.bbContent} </p>
                </div>
                <div class="row">
                              <!-- <div class="row"> -->
                <!-- 좋아요 -->
                <div class="mb-5 text-center">
                    <button class="btn" type="button">
                            <div id="like-cnt">
                                <img src="img/b_like.png" alt="?"> 
                            </div>
                        </button>
                    <span class="pt-2 fs-4 text-black">48</span>
                </div>

                <!-- /좋아요-->
                </div>
            </div>
        </div>
   </section>
   <script>
$(document).ready(() => {
	$("#btnDelete").on("click", (e) => {
		if(confirm("정말 삭제하시겠습니까?")) {
			location.replace("${path}/bookboard/delete?boardNo=${board.no}");
		}
	});
});
/*좋아요/추천기능*/
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>