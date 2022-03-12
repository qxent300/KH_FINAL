<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="${board.title}" name="title"/>
</jsp:include>

<div class="bg-cover" style="background-image: url(${path}/images/card-11.svg);">
    <!-- Post a Comment -->
    <div class="container py-6">
        <!-- Heading -->
        <div class="text-center mb-4">
            <h2>수정하기</h2>
        </div>
        <!-- End Heading -->

        <div class="container justify-content-center col-7">
                <!-- Card -->
                <div class="row card card-body">
                        <form action="${path}/freeboard/update" method="POST" enctype="multipart/form-data" onsubmit="return check()">
                            <select name="type" id="type" class="mb-2">
                                        <option value="">분류 선택</option>
                                        <option value="질문">질문</option>
                                        <option value="잡담">잡담</option>
										<c:if test="${loginMember.role == 'ROLE_ADMIN'}">
                                	        <option value="공지">공지</option>
										</c:if>
                                    </select>
                            <div class="d-grid gap-3">
                                <!-- Form -->
                                <input type="hidden" name="no" value="${board.no}" />
								<input type="hidden" name="originalFileName" value="${board.originalFileName}" />
								<input type="hidden" name="renamedFileName" value="${board.renamedFileName}" />
                                <input type="hidden" name="writerId" value="${board.writerId}" readonly>
                                <span class="d-block">
                                <input type="text" class="form-control" name="title" value="${board.title}" id="title" placeholder="제목을 입력해주세요...">
                            </span>
                                <!-- End Form -->
                                
                                <textarea name="content" id="content" class="form-control" cols="30" rows="14" placeholder="내용을 입력해주세요...">${board.content}</textarea>
                                <!-- Form -->
                                <span class="d-block">
                  <input type="file" class="form-control" name="reloadFile" id="reloadFile">
                  <c:if test="${ !empty board.originalFileName }">
						현재 업로드한 파일: 
						<a>
							<c:out value="${ board.originalFileName }"></c:out>
						</a>
					</c:if>
                </span>
                                <!-- End Form -->

                                <div class="d-flex justify-content-center gap-2">
                                    <a class="btn btn-muted" href="${path}/freeboard/list">취소</a>
                                    <input type="submit" value="작성완료" class="btn btn-primary">
                                </div>
                            </div>
                        </form>
                </div>
                <!-- End Card -->
            <!-- End Col -->
        </div>
        <!-- End Row -->
    </div>
    <!-- End Post a Comment -->
    </div>
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
document.getElementById('type').value = '${board.type}';
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>