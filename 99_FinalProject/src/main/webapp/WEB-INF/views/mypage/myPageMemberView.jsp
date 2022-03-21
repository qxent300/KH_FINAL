<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- jsp:include 어쩌구저쩌구.jsp -> 해당 jsp에서 가져오는 loginMember, path등 변수 및 session 값들을 다 가져오므로 따로 선언할 필요가 없다. -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="대여 현황" name="title"/>
</jsp:include>
<!DOCTYPE html>
<html lang="en">


<script>
	$(document).ready(function(){
		$("#btnPwUpdate").click(function(){
			$("#uId").val();
			$("#uPwd").val();
			$("#uPwdChk").val();
			
			 if($("#uPwd").val() == $("#uPwdChk").val()){
				 
				 var url = "<%=request.getContextPath()%>/myPageBook/pwdUpdate.do";
				 var str = $("#uId").val()+","+$("#uPwd").val();
				 
				 $.ajax({
				      url    : url,
				      type  : "POST",
				      data: {
				    	   str : str  // folder seq 값을 가지고 있음.
				      },
				      success: function(data){
			                 if(data == $("#uPwdChk").val()) {
			                     alert("수정하였습니다");
			                     $("#uPwd").val(data);
			                     $("#uPwdChk").val('');
			                 }
			                 else{
			                     alert("수정 실패");
			                     return;
			                 }
			             }
				   });
			 }else if($("#uPwd").val() != $("#uPwdChk").val()){
				 alert("다시 입력해주세요");
				 return;
			 }
			
		});
	});
	
</script>

<body >
	<div class="row m-5" style="margin-top:100px;">
        <!-- Sidebar-->
       <section class="py-6" style="margin-left:7%;">
      <div class="container-fluid">
        <div class="row px-xl-5">
          <div class="col-lg-2">
            <div class="sticky-top mb-5" style="top: 120px;">
              <div class="sidebar-block">
                <h6 class="sidebar-heading ms-3">내활동</h6>
                <nav class="nav nav-pills flex-column">
                <a class="nav-link mb-2" href="${path}/mypage/rentList">대여현황</a>
                <a class="nav-link mb-2" href="#">내가 작성한 한줄평 </a>
                <a class="nav-link mb-2" href="${path}/myPageBook/myPageBookReply">내가 작성한 댓글</a>
                <a class="nav-link mb-2" href="${path}/myPageBook/MyPageBookBoardList.do?nowPage=1&cntPerPage=5&loginMember=${loginMember}">내가 작성한 독서일지</a>
                <a class="nav-link mb-2" href="#">선호장르</a>
                </nav>
              </div>
              <div class="sidebar-block">
                <h6 class="sidebar-heading ms-3">회원정보</h6>
                <nav class="nav nav-pills flex-column">
                <a class="nav-link mb-2 active" href="${path}/myPageBook/myPageMemberView">회원정보수정</a>
                <a class="nav-link mb-2" href="#">탈퇴하기</a>
                </nav>
              </div>
            </div>
          </div>
          
     <section class="col-lg-8" >
      <div class="container" style="margin-left : 13%;">
       <!--  <h1 class="hero-heading mb-0"></h1>
        <p class="text-muted mb-5"></p> -->
        <div class="row">
          <div class="col-lg-7 mb-3 mb-lg-0">
            <div class="text-block"> 
              <div class="row mb-3">
                <div class="col-sm-9">
                  <h5>회원정보수정</h5>
                </div>
               <div class="col-sm-3 text-end">
                  <button class="btn btn-link ps-0 text-primary collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#personalDetails" aria-expanded="false" aria-controls="personalDetails">수정하기</button>
                </div>
              </div>
              <div class="" id="">
                <form name="form1" action="${path}/myPageBook/myPageMemberUpdate.do?" method="POST">
                	<input type="hidden" name="uNo" id="uNo" value="${loginMember.UNo }"/>
                  <div class="row pt-4">
                  <div class="mb-4 col-md-6">
                      <label class="form-label" for="name">아이디</label>
                      <input class="form-control" type="text" name="uId" id="uId" value="${ loginMember.UId}">
                    </div>
                    <div class="mb-4 col-md-6">
                      <label class="form-label" for="name">이름</label>
                      <input class="form-control" type="text" name="uName" id="uName" value="${ loginMember.UName }">
                    </div>
                    <div class="mb-4 col-md-6">
                      <label class="form-label" for="date">닉네임</label>
                      <input class="form-control" type="text" name="uNickName" id="uNickName" value="${ loginMember.UNickName }">
                    </div>
                    <div class="mb-4 col-md-6">
                      <label class="form-label" for="address">주소</label>
                      <input class="form-control" type="text" name="uAddress" id="uAddress" value="${ loginMember.UAddress }">
                    </div>
                    <div class="mb-4 col-md-6">
                      <label class="form-label" for="phone">연락처</label>
                      <input class="form-control" type="text" name="uPhone" id="uPhone" value="${ loginMember.UPhone }">
                    </div>
                  </div>
                 <button id="myPageMemberUpdate" class="btn btn-outline-primary mb-4" type="submit" >수정 완료</button>
                </form>
              </div>
            </div>
            <div class="text-block"> 
              <div class="row mb-3">
                <div class="col-sm-9">
                  <h5>비밀번호수정</h5>
                </div>
                <div class="col-sm-3 text-end">
                  <button class="btn btn-link ps-0 text-primary collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#memberpwd" aria-expanded="false" aria-controls="memberpwd">수정하기</button>
                </div>
              </div>
              <div class="collapse" id="memberpwd">
                  <div class="row pt-4">
                    <div class="mb-4 col-md-6">
                      <label class="form-label" for="street">비밀번호</label>
                      <input class="form-control" type="password" name="uPwd" id="uPwd" value="${ loginMember.UPwd }">
                    </div>
                    <div class="mb-4 col-md-6">
                      <label class="form-label" for="apt">비밀번호확인</label>
                      <input class="form-control" type="password" name="uPwd" id="uPwdChk" value="">
                    </div>
                  </div>
                  <button class="btn btn-outline-primary" id="btnPwUpdate">수정 완료</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    
    </section>
    
    
    
        <!-- Content  -->
        

	<!-- jQuery-->
    <script src="${path}/resources/vendor/jquery/jquery.min.js"></script>
    <!-- Bootstrap JS bundle - Bootstrap + PopperJS-->
    <script src="${path}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Magnific Popup - Lightbox for the gallery-->
    <script src="${path}/resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
    <!-- Smooth scroll-->
    <script src="${path}/resources/vendor/smooth-scroll/smooth-scroll.polyfills.min.js"></script>
    <!-- Bootstrap Select-->
    <script src="${path}/resources/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
    <!-- Object Fit Images - Fallback for browsers that don't support object-fit-->
    <script src="${path}/resources/vendor/object-fit-images/ofi.min.js"></script>
    <!-- Swiper Carousel                       -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>
    <script>
        var basePath = ''
    </script>
    <!-- Main Theme JS file    -->
    <script src="js/theme.js"></script>
    
    
</body>


</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>