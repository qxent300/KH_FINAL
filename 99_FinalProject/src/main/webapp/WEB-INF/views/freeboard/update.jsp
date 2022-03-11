<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header9.jsp">
	<jsp:param value="${board.title}" name="title"/>
</jsp:include>

<div class="bg-img-start" style="background-image: url(${path}/images/card-11.svg);">
    <!-- Post a Comment -->
    <div class="container content-space-2">
        <!-- Heading -->
        <div class="w-md-75 w-lg-50 text-center mx-md-auto mb-md-5">
            <h2>수정하기</h2>
        </div>
        <!-- End Heading -->

        <div class="row justify-content-lg-center">
            <div class="col-lg-8">
                <!-- Card -->
                <div class="card card-lg border shadow-none">
                    <div class="card-body">
                        <form action="${path}/freeboard/update" method="POST" enctype="multipart/form-data" onsubmit="return check()">
                            <div class="d-grid gap-4">
                                <!-- Form -->
                                <input type="hidden" name="no" value="${ board.no }" />
								<input type="hidden" name="originalFileName" value="${ board.originalFileName }" />
								<input type="hidden" name="renamedFileName" value="${board.renamedFileName}" />
                                <input type="hidden" name="writerId" value="${ board.writerId }" readonly>
                                <span class="d-block">
                                <input type="text" class="form-control form-control-lg" name="title" value="${board.title}" id="title" placeholder="제목을 입력해주세요...">
                            </span>
                                <!-- End Form -->
                                
                                <textarea name="content" id="content" class="form-control" cols="30" rows="12" placeholder="내용을 입력해주세요...">${board.content}</textarea>
                                <!-- Form -->
                                <span class="d-block">
                  <input type="file" class="form-control form-control-lg" name="reloadFile" id="reloadFile">
                  <c:if test="${ !empty board.originalFileName }">
						현재 업로드한 파일 : 
						<a>
							<c:out value="${ board.originalFileName }"></c:out>
						</a>
					</c:if>
                </span>
                                <!-- End Form -->

                                <div class="d-flex justify-content-center gap-2">
                                    <a class="btn btn-sm btn-white" href="${path}/freeboard/list">취소</a>
                                    <input type="submit" value="작성완료" class="btn btn-sm btn-primary">
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
    function check()
    {
    	if($("#title").val() == "") {
    		alert("제목을 입력해주세요!");
    		return false;
    	}
    	
        if($('#content').val() == "") {
    		alert("내용을 입력해주세요!");
    		return false;
        }
    }
    </script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	