<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="독서일기 ${bookBoard.bbTitle}" name="title"/>
</jsp:include>

    <section class="position-relative dark-overlay mb-5"><img class="bg-image" src="${path}/images/b_board.jpg" alt="">
        <div class="container py-7">
            <div class="overlay-content text-center text-white">
                <h1 class="display-4 fw-bold text-shadow mb-0">${bookBoard.bbTitle}</h1>
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
						<c:if test="${ !empty loginMember && (loginMember.uNickname == bookBoard.uNickname 
									|| loginMember.UGrade == '99') }">
							<button type="button" class="btn btn-primary"
								onclick="location.href='${path}/bookboard/update?no=${bookBoard.bbNo}'">수정</button>
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
                        작성자&nbps;<a class="fw-bold">${bookBoard.uNickName}</a><span class="mx-1">&nbps;|&nbps;</span>작성일&nbps;<a class="fw-bold"><fmt:formatDate pattern="yyyy.MM.dd" value="${bookBoard.createDate}"/></a><span class="mx-1">&nbps;|&nbps;</span>조회수&nbps;<a class="fw-bold">${bookBoard.readCount}</a>
                    </h4>
                    <div class="py-3 mb-5">
                        <a href="${path}/book/view?no=${bookboard.bNo}"><img src="${path}/images/booklink.png" alt="..."></a>
                    </div>
                    <p class="lead mb-5">${bookBoard.bbContent} </p>
                </div>
                <div class="row">
                              <!-- <div class="row"> -->
                <!-- 좋아요 -->
                <c:if test="${loginMember = null}">
                  <div class="mb-5 text-center">
                    <button class="btn" type="button">
                        <img src="images/b_rec.png" alt="?"> 
                      </button>
                    <span class="pt-2 fs-4 text-black" id="rec_count">${bookBoard.bbRecommendCount}</span>
                    <p class="fs-4">추천 기능은 <button class="fw-bold">로그인</button> 후 사용 가능합니다.</p>
                  </div>
                </c:if>
                <c:if test="${loginMember != null}">
                <div class="mb-5 text-center">
                    <button class="btn recimg" type="button" id="recommend">
                        <img src="${path}images/b_rec.png" alt="?" id="recimg"> 
                      </button>
                    <span class="pt-2 fs-4 text-black" id="rec_count">${bookBoard.bbRecommendCount}</span>
                </div>
				</c:if>
                <!-- /좋아요-->
                </div>
            </div>
        </div>
   </section>
   <script>
$(document).ready(() => {
	$("#btnDelete").on("click", (e) => {
		if(confirm("정말 삭제하시겠습니까?")) {
			location.replace("${path}/bookboard/delete?boardNo=${bookBoard.bbNo}");
		}
	});
});

/*좋아요/추천기능*/
$(document).ready(function () {
	let rec_count = document.getElementById('bbRecommendCount')
	const bbNo = '${bookboard.bbNo}';
	const uNo = "${member.uNo}";
	const recimg = document.getElementById("recimg")

	if (likeval > 0) {
		recimg.src = "/resources/images/a_rec.png"; // 추천 후 이미지
	}
	else {
		recimg.src = "/resources/images/b_rec.png"; // 추천 전 이미지
	}
    // 좋아요 버튼을 클릭 시 실행되는 코드
$(".recimg").on("click", function () {
	$.ajax({
      url: '/bookboard/recommend',
      type: 'POST',
      data: { 'bbNo': bbNo, 'uNo': uNo },
      success: function (data) {
          if (data == 1) {
              $("#recimg").attr("src", "/resources/images/a_rec.png");
              location.reload();
          } else {
              $("#recimg").attr("src", "/resources/images/b_rec.png");
              location.reload();
          }
      }, error: function () {
          $("#recimg").attr("src", "/resources/images/a_rec.png");
          console.log('추천 실패 하였습니다! ')
      }

  });

  });
  });
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>