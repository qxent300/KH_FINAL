<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="자유공간" name="title"/>
</jsp:include>
	<style>
	#tdWidth1 {width: 10%;}#tdWidth2 {max-width: 10px;}#tdWidth3 {width: 20%;}#tdWidth4 {width: 15%;}#tdWidth5 {width: 10%;}
	.thead-light {background-color: #f8fafd;}
	</style>
    <!-- Hero -->
<div class="bg-cover"
	style="background-image: url(${path}/images/card-11.svg);">
	<div class="container pt-7 pb-5 text-center">
		<h1>자유공간</h1>
		<!-- Table -->
		<table class="table mt-3" style="border-top: .0625rem solid rgba(33, 50, 91, .1)">
			<thead class="table-light">
				<tr>
					<th id="tdWidth1">분류</th>
					<th>제목</th>
					<th id="tdWidth3">글쓴이</th>
					<th id="tdWidth4">날짜</th>
					<th id="tdWidth5">조회</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${list == null}">
					<tr>
						<td colspan="6">등록된 게시글이 없습니다.</td>
					</tr>
				</c:if>

				<c:if test="${list != null}">
					<c:forEach var="board" items="${list}">
						<tr>
							<td><c:out value="${board.type}"/></td>
							<td class="text-start" id="tdWidth2"><a
								href="${path}/freeboard/view?no=${board.no}"> <c:out
										value="${board.title}" />
							</a></td>
							<td><c:out value="${board.writerId}" /></td>
							<td><fmt:formatDate pattern="yy.MM.dd" value="${board.createDate}"/></td>
							<td><c:out value="${board.readCount}" /></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
			<tr></tr>
		</table>
		<c:if test="${loginMember != null}">
			<div class="mb-2 text-end">
				<button type="button" class="btn btn-primary fw-bold bi-pencil-fill"
					onclick="location.href='${path}/freeboard/write'">&nbsp;글쓰기</button>
			</div>
		</c:if>
		<div class="pagination justify-content-center">
			<!-- 맨 처음으로 -->
			<button class="page-link page-item"
				onclick="location.href='${ path }/freeboard/list?page=1'">&lt;&lt;</button>

			<!-- 이전 페이지로 -->
			<button class="page-link page-item"
				onclick="location.href='${path}/freeboard/list?page=${ pageInfo.prvePage }'">&lt;</button>

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
						onclick="location.href='${ path }/freeboard/list?page=${ status.current }'">
						<c:out value="${ status.current }" />
					</button>
				</c:if>
			</c:forEach>

			<!-- 다음 페이지로 -->
			<button class="page-link page-item"
				onclick="location.href='${path}/freeboard/list?page=${ pageInfo.nextPage }'">&gt;</button>

			<!-- 맨 끝으로 -->
			<button class="page-link page-item"
				onclick="location.href='${path}/freeboard/list?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
		</div>

		<form action="${path}/freeboard/list" method="get">
			<div class="text-center mt-5">
				<div class="input-group justify-content-center">
					<select name="searchType" class="rounded-start">
                        <option value="tc">제목+내용</option>
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                        <option value="writer">글쓴이</option>
					</select>
                    <input name="searchValue" type="text" class="form-control-sm">
                    <button class="btn btn-primary fw-bold rounded-end bi-search" type="submit">&nbsp;검색</button>
                </div>
			</div>
		</form>
	</div>
</div>
<!-- End Hero -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
	