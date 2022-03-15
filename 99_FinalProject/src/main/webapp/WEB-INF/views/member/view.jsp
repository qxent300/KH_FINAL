<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="회원정보 조회" name="title"/>
</jsp:include>
	<style>
	    section #view-container {
	        text-align: center;
	    }
	    
	    section #view-container input {
	        margin: 3px;
	    }
	    
	    section #view-container table {
	        margin: 0 auto;
	    }
	    
	    section #view-container table th {
	        padding: 0 10px;
	        text-align: right;
	    }
	    
	    section #view-container table td {
	        padding: 0 10px;
	        text-align: left;
	    }
	</style>
<br><br><br><br>
<section id="content">
	<h3 align="center">내 정보 수정</h3>
	<div id="view-container">
		<form id="memberFrm" action="${ path }/member/update" method="POST">
			<table>
				<tr>
	                <th>아이디</th>
					<td>
						<input type="text" name="uId" id="newId" 
							value="${ loginMember.UId }" readonly required >
					</td> 	
	            </tr>
	            <tr>
	                <th>닉네임</th>
					<td>
						<input type="text" name="uNickName" id="uNickName" 
							value="${ loginMember.UNickName }" required>				
					</td> 	
	            </tr>
	            <tr>
	                <th>이름</th>
					<td>
						<input type="text" name="uName" id="uName" 
							value="${ loginMember.UName }" required>				
					</td> 	
	            </tr>
      	        <tr>
	                <th>휴대폰</th>
	                <td>
	                    <input type="tel" placeholder="(-없이)01012345678" name="uPhone" id="phone" 
	                    	maxlength="11" value="${ loginMember.UPhone }">
	                </td>
	            </tr>
	            <tr>
	                <th>주소</th>
						<td>
							<input type="text" name="uAddress" id="address" 
								value="${ loginMember.UAddress }">
						</td> 	
	            </tr>
	        </table>
	        <input type="button" id="updatePwd" value="비밀번호변경" />
	        <input type="submit" value="정보수정" />
	        <input type="button" id="deleteMember" value="탈퇴" />
	 	</form>
 	</div>
</section>
 	<script>
	$(document).ready(() => {
		$("#deleteMember").on("click", (e) => {
			if(confirm("정말로 탈퇴하시겠습니까?!")) {
				location.replace('${ path }/member/delete');
			}
		});
		
		$("#updatePwd").on("click", (e) => {
		});
	});
	
	$("#updatePwd").on("click", (e) => {
		const url = "${path}/member/updatePwd";
		const status = "left=500px,top=200px,width=400px,height=210px"
		
		open(url, "", status);
	});
	</script>
<br><br>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>