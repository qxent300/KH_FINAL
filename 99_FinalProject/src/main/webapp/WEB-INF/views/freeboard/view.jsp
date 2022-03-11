<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% pageContext.setAttribute("BR", "\n"); %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header9.jsp">
	<jsp:param value="${board.title}" name="title"/>
</jsp:include>

<style>
	.line {border-left: 1px solid #21325b;}
	#bg{background:rgba(113, 134, 157, .1);}
	#font{color:navy;}
    /*댓글테이블*/
    table#tbl-comment{width:100%; margin:0 auto; border-collapse:collapse; clear:both; } 
    table#tbl-comment tr td{border-bottom:1px solid; border-top:1px solid; padding:5px; text-align:left; line-height:120%;}
    table#tbl-comment tr td:first-of-type{padding: 5px 5px 5px 50px;}
    table#tbl-comment tr td:last-of-type {text-align:right; width: 100px;}
    table#tbl-comment button.btn-delete{display:none;}
    #btnSubmit{height: 78px; margin-left:-5.7px; margin-bottom: 70px;}
    /* #replyContent{border-radius: .3125rem!important;overflow-y: scroll;} */
    #replyContent{overflow-y: scroll;}
    table#tbl-comment tr:hover {background:rgba(113, 134, 157, .1);}
    table#tbl-comment tr:hover button.btn-delete{display:inline;}
    table#tbl-comment sub.comment-writer {color:navy; font-size:16px}
    table#tbl-comment sub.comment-date {color:tomato; font-size:12px}
</style>


<section>
    <!-- Content -->
    <div class="bg-img-start" style="background-image: url(${path}/images/card-11.svg);">
        <div class="container content-space-t-3 content-space-t-lg-3 content-space-b-2 w-lg-65 mx-auto min-vh-md-100">
        <h1 class="text-center mb-5">공지사항</h1>
            <!-- Card -->
            <div class="card card-lg">
                <div class="card-body">
                    <!-- Title -->
                    <div class="row justify-content-sm-between align-items-sm-center mb-3">
                                       <div class="col-sm mb-3 mb-sm-0">
                        <h1>${board.title}</h1>
                        <div id="bg" class="border border-dark border-1 border-start-0 border-end-0 text-dark">
                      　글쓴이&nbsp;<span id="font">${board.writerId}</span>&nbsp;&nbsp;<span class="line"></span>&nbsp;&nbsp;조회&nbsp;<span id="font">${board.readCount}</span>&nbsp;&nbsp;<span class="line"></span>&nbsp;&nbsp;날짜&nbsp;<span id="font"><fmt:formatDate pattern="yy-MM-dd hh:mm" value="${board.createDate}"/></span>
                        </div>
                        </div>
                    </div>
                    <!-- End Title -->
					<div class="text-end">
					<c:if test="${ !empty loginMember && (loginMember.id == board.writerId 
									|| loginMember.role == 'ROLE_ADMIN') }">
						<button type="button" class="btn btn-sm btn-primary" onclick="location.href='${path}/freeboard/update?no=${board.no}'">수정</button>
						<button type="button" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>
					</c:if>
						<button type="button" class="btn btn-sm btn-primary" onclick="location.href='${path}/freeboard/list'">목록</button>
            </div>
                    <div class="mb-5 ms-3 text-dark">
					${fn:replace(board.content, BR, "<br/>")}
                    </div>
							<c:if test="${ !empty board.originalFileName }">
					<a href="javascript:fileDownload('${ board.originalFileName }', '${ board.renamedFileName }')">
						<img src="${ path }/images/file.png" width="20" height="20"/>
						<c:out value="${ board.originalFileName }"></c:out>						
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
	<table id="tbl-comment">
	<c:if test="${ replyList != null }">
		<c:forEach var="reply" items="${ replyList }">
			<tr>
				<td>
					<sub class="comment-writer">${reply.writerId}</sub>
					<sub class="comment-date">
					<fmt:formatDate pattern="yy-MM-dd hh:mm" value="${reply.createDate}"/>
					<%-- <%if (!reply.getModifyTime().equals(reply.getCreateTime())){out.append("(수정됨)");}%> --%></sub>
					<br>
					<span class="text-dark">${fn:replace(reply.content, BR, "<br/>")}</span>
				</td>
				<td>
					<c:if test="${ !empty loginMember && (loginMember.id == reply.writerId 	|| loginMember.role == 'ROLE_ADMIN') }">
							<button class="btn btn-sm btn-primary" onclick="deleteReply('${reply.no}');" >삭제</button>
					</c:if>
				</td>
			</tr>
			</c:forEach>
			</c:if>
	</table>
	<!-- 리플리스트 출력 종료 -->
                </div>
            <!-- 리플 등록 form 시작 -->
		<div id="comment-container">
	    	<div class="comment-editor text-center">
	 			<form action="${path}/freeboard/reply" method="post" onsubmit="return check()">
	 				<input type="hidden" name="boardNo" value="${board.no}" />
					<input type="hidden" name="writerId" value="${loginMember.id }" />
					<textarea name="content" id="replyContent" cols="95" rows="3" style="width:82%;"></textarea>
                    <button type="submit" id="btnSubmit" class="btn btn-primary btn-lg rounded-0">댓글등록</button>
	 			</form>
	    	</div>
	   	</div>
	<!-- 리플 등록 form 종료 -->
            </div>
            <!-- End Card -->
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
	