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
						<c:if test="${ !empty loginMember && (loginMember.UNickName == bookBoard.UNickName 
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
                        작성자&nbsp;<a class="fw-bold">${bookBoard.UNickName}</a><span class="mx-1">&nbsp;|&nbsp;</span>작성일&nbsp;<a class="fw-bold"><fmt:formatDate pattern="yyyy.MM.dd" value="${bookBoard.createDate}"/></a><span class="mx-1">&nbsp;|&nbsp;</span>조회수&nbsp;<a class="fw-bold">${bookBoard.bbReadCount}</a>
                    </h4>
                    <div class="list-group-item" style="cursor: pointer;" onclick="location.href='${path}/book/view?bNo=${bookBoard.BNo}'">
                    	<div class="row">
                    		<div class="col-lg-3 align-self-center">
                    			<img src="${path}/book/${bookBoard.BImage}" alt="..." class="rounded-0 card-img mb-3 border border-1">	
                    			<input type="hidden" id="bbNo" value="${bookBoard.bbNo }">	
                    		</div>
                    		<div class="col-lg-9 py-3 mb-3">
			                    <h6 class="label-heading">도서 제목</h6>
			                    <p class="text-sm fw-bold">${bookBoard.BName}</p>
			                    <h6 class="label-heading">저자</h6>
			                    <p class="text-sm fw-bold">${bookBoard.BWriter}</p>
			                    <h6 class="label-heading">출간일</h6>
			                    <p class="text-sm fw-bold">
			                    	<fmt:formatDate value="${bookBoard.publishDate}" pattern="yyyy-MM-dd"/>
			                    </p>
                    		</div>
                    	</div>
                        
                    </div>
                    <p class="lead mb-5">${bookBoard.bbContent} </p>
                </div>
                <div class="row">
	                <!-- 좋아요 -->
	                <c:if test="${loginMember == null}">
	                  <div class="mb-5 text-center">
	                    <button class="btn" type="button">
	                        <img src="${path}/images/b_rec.png" alt="?"> 
	                      </button>
	                    <span class="pt-2 fs-4 text-black" id="rec_count">${bookBoard.bbRecommendCount}</span>
	                    <p class="fs-4">추천 기능은 <button class="btn btn-info fw-bold" onclick="location.href='${path}/login'"">로그인</button> 후 사용 가능합니다.</p>
	                  </div>
	                </c:if>
	                <c:if test="${loginMember != null}">
	                <div class="mb-5 text-center">
	                    <button class="btn recimg" type="button" id="recommend" onclick="recommend()" value="0">
	                        <img src="${path}/images/b_rec.png" alt="?" id="recimg"> 
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

function recommend() {
	var value = document.getElementById("recommend").value;
	var bbNo = document.getElementById("bbNo").value;
	var count = $('#rec_count').text();
	
	if (value == 0) {
		$.ajax({												
	        type: "post",
	        url: "<%=request.getContextPath() %>/bookboard/recommendPlus",
	        async: false,
	        data: {
				bbNo: bbNo
	        },
	        success : function(data){
	        	count++;
	        	$('#rec_count').text(count);
	        	$("#recimg").attr("src", "${path}/images/a_rec.png");
	        	document.getElementById("recommend").value = 1;
			},
			error :function(){
				alert("request error!");
			}
	    });
	} else {
		$.ajax({												
	        type: "post",
	        url: "<%=request.getContextPath() %>/bookboard/recommendMinus",
	        async: false,
	        data: {
				bbNo: bbNo
	        },
	        success : function(data){
	        	count--;
	        	$('#rec_count').text(count);
	        	$("#recimg").attr("src", "${path}/images/b_rec.png");
	        	document.getElementById("recommend").value = 0;
			},
			error :function(){
				alert("request error!");
			}
	    });
	}
	
	
};
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>