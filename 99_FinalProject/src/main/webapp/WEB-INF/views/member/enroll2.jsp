<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="회원가입" name="title"/>
</jsp:include>
	<style>
	    section #enroll-container {
	        text-align: center;
	    }
	    
	    section #enroll-container input {
	        margin: 3px;
	    }
	    
	    section #enroll-container table {
	        margin: 0 auto;
	    }
	    
	    section #enroll-container table th {
	        padding: 0 10px;
	        text-align: right;
	    }
	    
	    section #enroll-container table td {
	        padding: 0 10px;
	        text-align: left;
	    }
	</style>

<div class="flex-grow-1 mx-auto pt-7" style="max-width: 28rem;">
<section id="content">
	<h3 align="center">회원가입</h3>
	<div id="enroll-container">
		<form name="memberEnrollFrm" action="${ path }/member/enroll" method="POST">
			<table>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="id" id="newId" placeholder="아이디(4글자이상)" required />
						<input type="button" id="checkDuplicate" value="중복검사" />
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="password" id="pass1" required /> 
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td>
						<input type="password" id="pass2"/> 
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="name" required />
					</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>
						<input type="text" name="nickname" id="nickname" placeholder="닉네임" required />
						<input type="button" id="checkDuplicate2" value="중복검사" />
					</td>
				</tr>
				<tr>
					<th>휴대폰</th>
					<td>
						<input type="tel" name="phone" maxlength="11" placeholder="(-없이)01012345678">
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" name="address" />
					</td>
				</tr>
			</table>
			
			<input type="submit" id="enrollSubmit" value="가입"/>
			<input type="reset" value="취소"/>
		</form>
	</div>
	</section>
	</div>
	
	<script>
		$(document).ready(() => {
			$("#pass2").blur((event) => {
				let pass1 = $("#pass1").val();			
				let pass2 = $(event.target).val();
				
				if(pass1.trim() != pass2.trim()) {
					alert("비밀번호가 일치하지 않습니다.");
					
					$("#pass1").val("");
					$(event.target).val("");
					$("#pass1").focus();
				}
			});
	    	
		    $("#enrollSubmit").on("click", () => {
		    	// TODO 전송하기 전에 각 영역에 유효성 검사로직을 추가하는 부분!
		    	//return false;
		    });
		    
		 	// 아이디 중복을 확인 처리 콜백함수
			$("#checkDuplicate").on("click", () => {
				let id = $("#newId").val().trim();
				if (id.length < 4 || id.length > 12) {
					alert("아이디는 최소 4자, 최대 12자 사이로 입력해주세요.")
					return;
				}
				
				$.ajax({
					type: "get",
					url: "${path}/member/idCheck",
					dataType: "json",
					data: {
						id // 속성의 키값과 변수명이 동일할 경우
					},
					success: 
					function(data) {
						if(data.validate === true) {
							alert("이미 사용 중인 아이디입니다.");
						} else {
							alert("사용 가능한 아이디입니다.");							
						}
					},
				});
			});
		 	// 닉네임 중복을 확인 처리 콜백함수
			$("#checkDuplicate2").on("click", () => {
				let nickname = $("#nickname").val().trim();
				
				if (nickname.length < 2 || nickname.length > 12) {
					alert("닉네임은 최소 2자, 최대 12자 사이로 입력해주세요.")
					return;
				}
				
				$.ajax({
					type: "get",
					url: "${path}/member/nicknameCheck",
					dataType: "json",
					data: {
						nickname // 속성의 키값과 변수명이 동일할 경우
					},
					success: 
					function(data) {
						if(data.validate === true) {
							alert("이미 사용 중인 닉네임입니다.");
						} else {
							alert("사용 가능한 닉네임입니다.");							
						}
					},
				});
			});
		});
	
	</script>	
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
