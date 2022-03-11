<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="게시판" name="title"/>
</jsp:include>
	<style>
		section#board-list-container{width:600px; margin:0 auto; text-align:center;}
		section#board-list-container h2{margin:10px 0;}
		table#tbl-board{width:100%; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
		table#tbl-board th, table#tbl-board td {border:1px solid; padding: 5px 0; text-align:center;} 
		/*글쓰기버튼*/
		input#btn-add{float:right; margin: 0 0 15px;}
		/*페이지바*/
		div#pageBar{margin-top:10px; text-align:center; background-color:rgba(0, 188, 212, 0.3);}
		  .blue_window {
            display: inline-block;
            width: 366px;
            border: 3px solid #6ccaf5;
        }
        
        .input_text {
            width: calc( 100% - 14px);
            margin: 6px 7px;
            border: 0;
            font-weight: bold;
            font-size: 16px;
            outline: none;
        }
        
        .sch_smit {
            width: 54px;
            height: 40px;
            margin: 0;
            border: 0;
            vertical-align: top;
            background: #007dd1;
            color: white;
            font-weight: bold;
            border-radius: 1px;
            cursor: pointer;
        }
        
        .sch_smit:hover {
            background: #007dd1;
        }
	</style>

<section id="content">
	<div id="board-list-container">
	<h2 align="center">게시판</h2>
		<c:if test="${ loginMember != null }">
			<button type="button" id="btn-add"
				onclick="location.href='${ path }/board/test'">글쓰기</button>
		</c:if>
		<form action="${ path }/board/list" method="get">
            <div style="text-align: center;">
                <label><input type="radio" name="searchType" value="title" checked="checked">제목</label>
                <label><input type="radio" name="searchType" value="content" >내용</label>
                <label style="margin-right: 30px;"><input type="radio" name="searchType" value="writer">작성자</label>
                <span class="blue_window">
                    <input name="searchValue" type="text" class="input_text" />
                </span>
                <button type="submit" class="sch_smit">검색</button>
            </div>
        </form>
		<table id="tbl-board">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>첨부파일</th>
				<th>조회수</th>
			</tr>
			<c:if test="${ list == null }">
				<tr>
					<td colspan="6">
						조회된 게시글이 없습니다.
					</td>
				</tr>
			</c:if>
			<c:if test="${ list != null }">
				<c:forEach var="board" items="${ list }">
					<tr>
						<td><c:out value="${ board.no }"/></td>
						<td>
							<a href="${ path }/board/view?no=${board.no}">							
								<c:out value="${ board.title }"/>
							</a>
						</td>
						<td><c:out value="${ board.writerId }"/></td>
						<td><fmt:formatDate type="date" value="${ board.createDate }"/></td>
						<td>
							<c:if test="${ board.originalFileName != null }">
								<img src="${ path }/images/file.png" width="20" height="20"/>
							</c:if>
							<c:if test="${ board.originalFileName == null }">
								<span> - </span>
							</c:if>
						</td>
						<td><c:out value="${ board.readCount }"/></td>
					</tr>				
				</c:forEach>
			</c:if>
		</table>
		<div id="pageBar">
			<!-- 맨 처음으로 -->
			<button onclick="location.href='${ path }/board/list?page=1'">&lt;&lt;</button>
			
			<!-- 이전 페이지로 -->
			<button onclick="location.href='${ path }/board/list?page=${ pageInfo.prvePage }'">&lt;</button>

			<!--  10개 페이지 목록 -->
			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1" varStatus="status">
				<c:if test="${ pageInfo.currentPage == status.current}">
					<button disabled><c:out value="${ status.current }"/></button>
				</c:if>
				<c:if test="${ pageInfo.currentPage != status.current}">
					<button onclick="location.href='${ path }/board/list?page=${ status.current }'">
						<c:out value="${ status.current }"/>
					</button>
				</c:if>
			</c:forEach>
			
			<!-- 다음 페이지로 -->
			<button onclick="location.href='${ path }/board/list?page=${ pageInfo.nextPage }'">&gt;</button>
			
			<!-- 맨 끝으로 -->
			<button onclick="location.href='${ path }/board/list?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
		</div>
	</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
	