<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% pageContext.setAttribute("BR", "\n"); %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="${board.title}" name="title"/>
</jsp:include>

<style>
	.line {border-left: 1px solid #21325b;}
	#bg{background:rgba(113, 134, 157, .1);}
	#font{color:navy;}
    /*댓글테이블*/
    /* table#tbl-comment{width:100%; margin:0 auto; border-collapse:collapse; clear:both; } 
    table#tbl-comment tr td{border-bottom:1px solid; border-top:1px solid; padding:5px; text-align:left; line-height:120%;}
    table#tbl-comment tr td:first-of-type{padding: 5px 5px 5px 50px;}
    table#tbl-comment tr td:last-of-type {text-align:right; width: 100px;}
    table#tbl-comment button.btn-delete{display:none;} */
    /* #replyContent{border-radius: .3125rem!important;overflow-y: scroll;} */
    /* #replyContent{overflow-y: scroll;}
    table#tbl-comment tr:hover {background:rgba(113, 134, 157, .1);}
    table#tbl-comment tr:hover button.btn-delete{display:inline;}
    table#tbl-comment sub.comment-writer {color:navy; font-size:16px}
    table#tbl-comment sub.comment-date {color:tomato; font-size:12px} */
</style>


<section>
    <!-- Content -->
	<div class="bg-cover"
		style="background-image: url(${path}/images/card-11.svg);">
		<div class="container py-6">
			<h1 class="text-center mb-4">자유공간</h1>
			<!-- Card -->
			<!-- Title -->
			<div class="container justify-content-center col-9">
				<div class="row card card-body">
						<h2>${board.type}) ${board.title}</h2>
						<div id="bg" class="border border-dark border-1 border-start-0 border-end-0 text-dark">
							글쓴이&nbsp;<span id="font">${board.writerId}</span>&nbsp;&nbsp;<span
								class="line"></span>&nbsp;&nbsp;조회&nbsp;<span id="font">${board.readCount}</span>&nbsp;&nbsp;<span
								class="line"></span>&nbsp;&nbsp;날짜&nbsp;<span id="font"><fmt:formatDate
									pattern="yy-MM-dd hh:mm" value="${board.createDate}" /></span>
						</div>
					<!-- End Title -->
					<div class="text-end mt-2 mb-2">
						<c:if
							test="${ !empty loginMember && (loginMember.UNickName == board.writerId 
									|| loginMember.UGrade == '99') }">
							<button type="button" class="btn btn-sm btn-primary"
								onclick="location.href='${path}/freeboard/update?no=${board.no}'">수정</button>
							<button type="button" class="btn btn-sm btn-primary"
								id="btnDelete">삭제</button>
						</c:if>
						<button type="button" class="btn btn-sm btn-primary"
							onclick="location.href='${path}/freeboard/list'">목록</button>
					</div>
					<div class="mb-5 text-dark">${fn:replace(board.content, BR, "<br/>")}
					</div>
					<c:if test="${!empty board.originalFileName}">
						<a
							href="javascript:fileDownload('${board.originalFileName}', '${board.renamedFileName}')">
							<img src="${path}/images/file.png" width="20" height="20" /> <c:out
								value="${board.originalFileName}"></c:out>
						</a>
						<script>
						function fileDownload(oriname, rename) {
							const url = "${path}/freeboard/fileDown";
							
							let oName = encodeURIComponent(oriname);
							let rName = encodeURIComponent(rename);
							
							location.assign(url + "?oriname=" + oName + "&rename=" + rName);
						}
					</script>
					</c:if>
					<c:if test="${ empty board.originalFileName }">
					</c:if>
					<div class="mb-2"></div>
					<!-- 리플리스트 출력 시작-->
						<c:if test="${ empty replyList}">
							<div class="text-center mb-3">등록된 댓글이 없습니다.</div>
						</c:if>
						<c:if test="${ !empty replyList }">
							    <div class="container justify-content-center" style="width: 97%;">
                            	<div class="card card-body row">
							<c:forEach var="reply" items="${ replyList }">
							
									<span class="text-dark">${reply.writerId}<sub class="text-dark float-end"><fmt:formatDate pattern="yy-MM-dd hh:mm:ss" value="${reply.createDate}" /></sub></span>
									<span class="text-dark">${fn:replace(reply.content, BR, "<br/>")}</span>
									<c:if
											test="${!empty loginMember && (loginMember.UNickName == reply.writerId || loginMember.UGrade == '99') }">
											<div class="text-end pb-2">
											<button class="btn btn-sm btn-primary"
												onclick="deleteReply('${reply.no}');">삭제</button></div>
										</c:if>
									<div class="border-top pt-2 pb-2"></div>
							</c:forEach>
										</div></div>
						</c:if>
					<!-- 리플리스트 출력 종료 -->
					<!-- 리플 등록 form 시작 -->
					<div id="comment-container" class="mt-3">
						<div class="comment-editor text-center">
							<form action="${path}/freeboard/reply" method="post"
								onsubmit="return check()">
								<input type="hidden" name="boardNo" value="${board.no}" /> <input
									type="hidden" name="writerId" value="${loginMember.UId }" />
								<textarea name="content" class="rounded-2 card-bordered"
									id="replyContent" cols="95" rows="3" style="width: 100%;"
									placeholder="댓글 내용을 입력해주세요."></textarea>
								<button type="submit" id="btnSubmit"
									class="btn btn-primary mx-auto col-5">댓글등록</button>
							</form>
						</div>
					</div>
					<!-- 리플 등록 form 종료 -->
					<!-- End Card -->
				</div>
			</div>
		</div>
	</div>
	<!-- End Content -->
</section>
<script>
	$(document).ready(() => {
		$("#btnDelete").on("click", (e) => {
			if(confirm("정말 삭제하시겠습니까?")) {
				location.replace("${path}/freeboard/delete?boardNo=${board.no}");
			}
		});
	});
	
	function deleteReply(replyNo){
		var url = "<%=request.getContextPath()%>/freeboard/replydel?replyNo=";
		var requestURL = url + replyNo;
		location.replace(requestURL);
	}
    function check(){
        if($('#replyContent').val() == "") {
    		alert("내용을 입력해주세요!");
    		return false;
        }
    }
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	