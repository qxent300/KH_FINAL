<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="자유공간" name="title"/>
</jsp:include>

<div class="bg-cover" style="background-image: url(${path}/images/card-11.svg);">
    <!-- Post a Comment -->
    <div class="container py-6">
        <!-- Heading -->
        <div class="w-md-75 w-lg-50 text-center mx-md-auto mb-md-5">
            <h2>글쓰기</h2>
        </div>
        <!-- End Heading -->

        <div class="row justify-content-lg-center">
            <div class="col-lg-8">
                <!-- Card -->
                <div class="card card-lg border shadow-none">
                    <div class="card-body">
                        <form action="${path}/freeboard/write" method="POST" enctype="multipart/form-data" onsubmit="return check()">
                            <select name="type" id="type" class="mb-2">
                                        <option value="">분류 선택</option>
                                        <option value="질문">질문</option>
                                        <option value="잡담">잡담</option>
										<c:if test="${loginMember.role == 'ROLE_ADMIN'}">
                                	        <option value="공지">공지</option>
										</c:if>
                                    </select>
                            <div class="d-grid gap-4">
                                <!-- Form -->
                                <input type="hidden" name="writerId" value="${loginMember.id}" readonly>
                                <span class="d-block">
                                <input type="text" class="form-control form-control-lg" name="title" id="title" placeholder="제목을 입력해주세요.">
                            </span>
                                <!-- End Form -->
                                
                                <textarea name="content" id="content" class="form-control" cols="30" rows="12" placeholder="내용을 입력해주세요."></textarea>
                                <!-- Form -->
                                <span class="d-block">
                  <input type="file" class="form-control form-control-lg" name="upfile" id="upfile">
                </span>
                                <!-- End Form -->

                                <div class="d-flex justify-content-center gap-2">
                                    <a class="btn btn-muted" href="${path}/freeboard/list">취소</a>
                                    <input type="submit" value="작성완료" class="btn btn-primary">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- End Card -->
            </div>
            <!-- End Col -->
        </div>
        <!-- End Row -->
    </div>
    <!-- End Post a Comment -->
    </div>
<script>
	function check() {
		if ($('#type').val() == "") {
			alert("분류를 선택해주세요!");
			return false;
		}
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