<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="독서일기" name="title"/>
</jsp:include>

    <section class="position-relative py-7"><img class="bg-image" src="${path}/images/b_board.jpg" alt="">
        <div class="container">
            <div class="card-img-overlay-bottom text-center text-white">
                <h1 class="display-4 fw-bold text-shadow mb-0">독서일기</h1>
                <p class="text-white"> 독서일기를 쓰면서 독서 습관을 만들어보세요.</p>
            </div>
        </div>
    </section>
    <section class="py-5">
        <div class="container">
            <div class="row mb-5">
                <div class="row mb-5">
                    <div class="col-md-8"></div>
                    	<div class="col-md-4 pt-3 d-md-flex align-items-center justify-content-end">
                    	<c:if test="${loginMember != null}">
                    		<button type="button" class="btn btn-primary fw-bold bi-pencil-fill"
							onclick="location.href='${path}/bookboard/write'">&nbsp;글쓰기</button>
						</c:if>
                <c:if test="${list == null}">
                	<div class="col-lg-3 col-sm-6 mb-4 hover-animate">
                		<h3 class="text-lg-center">등록된 게시글이 없습니다.</h3>
                	</div>
                </c:if>
                       </div>
                    <div class="col-md-8">
                        <!-- <h2>인기 독서일지</h2> -->
                    </div>
                </div>
        		<c:if test="${list != null }">
        		<c:forEach var="bookBoard" items="${list1}">
                <!--인기-->
                <div class="col-lg-3 col-sm-6 mb-4 hover-animate">
                    <div class="card shadow border-0 h-100">
                        <a href="${path}/bookboard/view?no=${bookBoard.bbNo}"><img class="img-fluid card-img-top" src="${path}/images/${list1.bImage}" alt="..." />
                            <span class="card-img-overlay-top d-flex justify-content-between align-items-center">
                                <div class="icon-rounded bg-warning-light mb-3">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="orange" class="bi bi-star-fill" viewBox="0 0 16 16">
                                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                      </svg>
                                </div>
                            </span>
                        </a>
                        <div class="card-body"><a class="text-uppercase text-muted text-sm letter-spacing-2"><c:out value="${bookBoard.uNickName}"/></a>
                            <h5 class="my-2"><a class="text-dark" href="${path}/bookboard/view"><c:out value="${bookBoard.bbTitle}"/></a></h5>
                            <p class="text-gray-500 fs-5 my-3"><i class="far fa-clock me-2"></i><fmt:formatDate pattern="yyyy.MM.dd" value="${bookBoard.createDate}"/></p>
                            <p class="text-dark fs-4 my-3">[<c:out value="${bookBoard.bbRecommendCount}"/>]</p>
                        </div>
                    </div>
                </div>
                </c:forEach>
                </c:if>
                <!-- 일반 -->
        <c:if test="${list2 != null }">
          <c:forEach var="bookBoard" items="${list2}">
            <div class="row mb-5">
                <div class="col-lg-3 col-sm-6 mb-4 hover-animate">
                    <div class="card shadow border-0 h-100">
                        <a href="${path}/bookboard/view?no=${bookBoard.bbNo}"><img class="img-fluid card-img-top" src="${path}/images/${list2.bImage}" alt="..." />
                        </a>
                        <div class="card-body"><a class="text-uppercase text-muted text-sm letter-spacing-2"><c:out value="${bookBoard.uNickName}"/></a>
                            <h5 class="my-2"><a class="text-dark" href="${path}/bookboard/view"><c:out value="${bookBoard.bbTitle}"/></a></h5>
                            <p class="text-gray-500 text-sm my-3"><i class="far fa-clock me-2"></i><fmt:formatDate pattern="yyyy.MM.dd" value="${bookBoard.createDate}"/></p>
                            <p class="text-dark text-sm my-3">[<c:out value="${bookBoard.bbRecommendCount}"/>]</p>
                        </div>
                    </div>
                </div>
              </div>
            </c:forEach>
         </c:if>
       </div>
     </div>
        <!-- Pagination -->
        <nav aria-label="Page navigation">
            		<div class="pagination justify-content-center">
			<!-- 맨 처음으로 -->
			<button class="page-link page-item rounded-start"
				onclick="location.href='${ path }/bookboard/list?page=1'">&lt;&lt;</button>

			<!-- 이전 페이지로 -->
			<button class="page-link page-item"
				onclick="location.href='${path}/bookboard/list?page=${ pageInfo.prvePage }'">&lt;</button>

			<!--  10개 페이지 목록 -->
			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1" varStatus="status">
				<c:if test="${ pageInfo.currentPage == status.current}">
					<button class="page-link page-item" disabled>
						<c:out value="${ status.current }" />
					</button>
				</c:if>
				<c:if test="${ pageInfo.currentPage != status.current}">
					<button class="page-link page-item"
						onclick="location.href='${ path }/bookboard/list?page=${ status.current }'">
						<c:out value="${ status.current }" />
					</button>
				</c:if>
			</c:forEach>

			<!-- 다음 페이지로 -->
			<button class="page-link page-item"
				onclick="location.href='${path}/bookboard/list?page=${ pageInfo.nextPage }'">&gt;</button>

			<!-- 맨 끝으로 -->
			<button class="page-link page-item rounded-end"
				onclick="location.href='${path}/bookboard/list?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
		</div>
        </nav>
   </section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>