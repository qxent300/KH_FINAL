<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="대여 현황" name="title"/>
</jsp:include>

	<section class="py-5">
      <div class="container" style="padding-top: 100px;">
        <div class="d-flex justify-content-between align-items-end mb-5">
          <h1 class="hero-heading mb-0">대여 현황</h1>
        </div>
        
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">책 제목</th>
		      <th scope="col">저자</th>
		      <th scope="col">대여날짜</th>
		      <th scope="col">반납날짜</th>
		      <th scope="col">상태</th>
		      <th scope="col">한줄평</th>
		    </tr>
		  </thead>
		  <tbody>
		    <c:forEach var="rent" items="${rentList }" varStatus="status">
		    	<tr>
		    		<td>${status.index + 1 }</td>
		    		<td><a href="${path }/book/view?bNo=${rent.BNo}">${rent.BName }</a></td>
		    		<td>${rent.BWriter }</td>
		    		<td>
		    			<fmt:formatDate value="${rent.startDate }" pattern="yyyy-MM-dd"/>
		    		</td>
		    		<td>
		    			<fmt:formatDate value="${rent.endDate }" pattern="yyyy-MM-dd"/>
		    		</td>
					<c:choose>
		    			<c:when test="${rent.RStatus eq '미반납' }">
		    				<td style="color: red;">			
		    			</c:when>
		    			<c:when test="${rent.RStatus eq '반납완료' }">
		    				<td style="color: blue;">			
		    			</c:when>
		    			<c:otherwise>
		    				<td>
		    			</c:otherwise>
		    		</c:choose>
		    		
		    			${rent.RStatus }
		    			
		    			<c:if test="${rent.RStatus eq '대여중' || rent.RStatus eq '미반납' }">
		    				<br><button type="button" class="btn btn-primary btn-sm" onclick="location.href='${path}/mypage/returnBook?rNo=${rent.RNo }'">반납하기</button>
		    			</c:if>
		    		</td>
		    		<c:choose>
		    			<c:when test="${rent.SNo == 0 }">
		    				<td>
				    			<button type="button" class="btn btn-primary btn-sm" onclick="location.href='${path}/book/view?bNo=${rent.BNo}'">작성하기</button>
				    		</td>
		    			</c:when>
		    			<c:otherwise>
		    				<td>작성완료</td>
		    			</c:otherwise>
		    		</c:choose>
		    	</tr>
		    </c:forEach>
		  </tbody>
		</table>
		

         <!-- Pagination -->
         <nav aria-label="Page navigation example">
             <div class="pagination justify-content-center pt-4 pb-7 me-5">
     			<div class="pagination justify-content-center">
			<!-- 맨 처음으로 -->
			<button class="page-link page-item rounded-start" onclick="location.href='${ path }/mypage/rentList?page=1'">&lt;&lt;</button>

			<!-- 이전 페이지로 -->
			<button class="page-link page-item" onclick="location.href='${path}/mypage/rentList?page=${ pageInfo.prvePage }'">&lt;</button>

			<!--  10개 페이지 목록 -->
			<c:forEach begin="${ pageInfo.startPage }"
				end="${ pageInfo.endPage }" step="1" varStatus="status">
				<c:if test="${ pageInfo.currentPage == status.current}">
					<button class="page-link page-item" disabled>
						<c:out value="${ status.current }" />
					</button>
				</c:if>
				<c:if test="${ pageInfo.currentPage != status.current}">
					<button class="page-link page-item"
						onclick="location.href='${ path }/mypage/rentList?page=${ status.current }'">
						<c:out value="${ status.current }" />
					</button>
				</c:if>
			</c:forEach>

			<!-- 다음 페이지로 -->
			<button class="page-link page-item" onclick="location.href='${path}/mypage/rentList?page=${ pageInfo.nextPage }'">&gt;</button>

			<!-- 맨 끝으로 -->
			<button class="page-link page-item rounded-end" onclick="location.href='${path}/mypage/rentList?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
     			</div>
             </div>
         </nav>
         <!-- End Pagination -->

      </div>

	</section>


<script>
	if (${overdueCount > 0}) {
		alert("미반납 도서가 " + ${overdueCount} + "권 있습니다.");
	}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>