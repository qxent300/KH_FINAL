<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

    
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="대여 현황" name="title"/>
</jsp:include>
<!DOCTYPE html>
<html lang="en">


<script>
	$(document).ready(function(){
		
		$("#allChk").click(function(){
			if($('#allChk').is(':checked')){
				$("input:checkbox[name^='chk']").prop("checked", true);
			}else{
				$("input:checkbox[name^='chk']").prop("checked", false);
			}
		});
		
		
		$("#sideUl li").click(function() {
			   var myClass = $(this).attr("class");
			   $(this).css("background","coral")
		});
		
	});
	
	function deleteValue(){
		var url = "<%=request.getContextPath()%>/myPageBook/delete.do";
		  var valueArr = []; 
		  
		  var list = $("input:checkbox[name^='chk']");
		    for(var i = 0; i < list.length; i++){ 
		        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
		            valueArr.push(list[i].value);
		        }
		    }
		    if (valueArr.length == 0){
		    	alert("선택된 글이 없습니다.");
		    }
		    else{
				var chked = confirm("정말 삭제하시겠습니까?");
	

				  $.ajax({
				      url    : url,
				      type  : "POST",
				      data: {
				    	  valueArr : valueArr        // folder seq 값을 가지고 있음.
				      },
				      success: function(jdata){
			                 if(jdata = 1) {
			                     alert("삭제 성공");
			                     window.location.reload(true);
			                 }
			                 else{
			                     alert("삭제 실패");
			                 }
			             }
				   });
		     }
		}
	
	

	

</script>

<body>
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
                <a class="nav-link mb-2" href="${path}/mypage/rentList">대여현황  </a>
                <a class="nav-link mb-2" href="#">내가 작성한 한줄평 </a>
                <%-- <a class="nav-link mb-2" href="${path}/myPageBook/myPageBookReply.do?nowPage=1&cntPerPage=5&loginMember=${loginMember.UNo}&listReply=${listReply}">내가 작성한 댓글</a> --%>
                <a class="nav-link mb-2" href="${path}/myPageBook/myPageBookReply">내가 작성한 댓글</a>
                <a class="nav-link mb-2 active" href="${path}/myPageBook/MyPageBookBoardList.do?nowPage=1&cntPerPage=5&loginMember=${loginMember}">내가 작성한 독서일지</a>
                <a class="nav-link mb-2" href="#">선호장르</a>
                </nav>
              </div>
              <div class="sidebar-block">
                <h6 class="sidebar-heading ms-3">회원정보</h6>
                <nav class="nav nav-pills flex-column">
                <a class="nav-link mb-2" href="${path}/myPageBook/myPageMemberView.do?loginMember=${loginMember.UId}">회원정보수정</a>
                <a class="nav-link mb-2" href="#">탈퇴하기</a>
                </nav>
              </div>
            </div>
          </div>
        <section class="col-lg-8">

            <!-- Orders list-->
            <div class="table-responsive fs-md">
                <table class="table table-hover">
                    <button onclick="deleteValue()" class="btn btn-primary" style="float: right;" id="delBtn"><i class=></i>삭제하기</button>

            </div>
            <thead>
                <tr>
                    <th><input type="checkbox" value="" id="allChk"></th>
                    <th style= "width: 300px;">제목</th>
                    <th>책 제목</th>
                    <th>작성일</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody>
           <c:forEach items="${list}" var="list">
   				 <tr>
   				 	<td><input type="checkbox" name="chk" value="${list.BBNO}" ></td>
     				<td>${list.BBTITLE}</td>
     				<td>${list.BNAME}</td>
      				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.CREATEDATE}"/></td>
      				<td>${list.BBREADCOUNT}</td>
     			</tr>
			</c:forEach>
			
            </tbody>
            </table>
            
            
      
     <div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="${path}/myPageBook/MyPageBookBoardList.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&loginMember=${loginMember}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="${path}/myPageBook/MyPageBookBoardList.do?nowPage=${p	}&cntPerPage=${paging.cntPerPage}&loginMember=${loginMember}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="${path}/myPageBook/MyPageBookBoardList.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&loginMember=${loginMember}">&gt;</a>
		</c:if>
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