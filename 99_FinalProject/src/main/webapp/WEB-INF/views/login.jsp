<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="로그인" name="title"/>
</jsp:include>

<div class="bg-cover" style="background-image: url(${path}/images/card-11.svg);">
	<!-- Form -->
		<div class="flex-grow-1 mx-auto pt-7" style="max-width: 28rem;">
			<!-- Heading -->
				<h1 class="text-center mb-3">로그인</h1>
			<!-- End Heading -->

			<!-- Form -->
			<form class="js-validate needs-validation" method="post" action="${path}/login">
				<!-- Form -->
				<div class="mb-2">
					<input type="text" class="form-control form-control-lg"
						name="userId" id="userId" value="admin" placeholder="아이디" required>
						<span class="invalid-feedback">아이디를 입력해주세요.</span>
				</div>
				<!-- End Form -->

				<!-- Form -->
				<div class="input-group input-group-merge"
					data-hs-validation-validate-class>
					<input type="password"
						class="form-control form-control-lg"
						name="userPwd" id="userPwd" value="1234" placeholder="비밀번호" required>
				</div>
				<span class="invalid-feedback">비밀번호를 입력해주세요.</span>
				<!-- End Form -->

				<div class="d-grid mt-4 mb-2">
					<button type="submit" class="btn btn-primary btn-lg fw-bold">로그인</button>
				</div>

				<div class="text-center">
					<a class="form-label-link fw-bold" href="${path}/member/enroll">회원가입</a>
				</div>
			</form>
			<!-- End Form -->
			<div style="min-height: 10rem;"></div>
		</div>
	</div>
<!-- End Form -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>