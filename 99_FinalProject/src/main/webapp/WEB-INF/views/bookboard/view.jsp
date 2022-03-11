<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="독서일기 글 제목" name="title"/>
</jsp:include>

    <section class="position-relative dark-overlay mb-5"><img class="bg-image" src="${path}/images/b_board.jpg" alt="">
        <div class="container py-7">
            <div class="overlay-content text-center text-white">
                <h1 class="display-4 fw-bold text-shadow mb-0">괜찮아, 꿈이 있으면 길을 잃지 않아</h1>
            </div>
        </div>
    </section>

    <!-- /상단 이미지 -->
    <!-- 게시글 -->
    <section>
        <div class="container">
            <div class="row">
                <div class="row mb-5">
                    <div class="col-md-7"></div>
                    <div class="col-md-4 d-md-flex align-items-center justify-content-end">
                        <div class="btn-group-lg" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-primary">목록</button>
                            <button type="button" class="btn btn-primary">수정</button>
                            <button type="button" class="btn btn-primary">삭제</button>
                        </div>
                    </div>
                </div>
                <div class="col-xl-8 col-lg-10 mx-auto">
                    <h4 class="py-3 mb-5 text-muted text-center fw-light">
                        작성자 <a class="fw-bold">독서의제왕</a><span class="mx-1"> | </span>작성일 <a class="fw-bold"> 2022.01.11</a>
                    </h4>
                    <div class="py-3 mb-5">
                        <a href="https://book.naver.com/bookdb/book_detail.naver?bid=17583399"><img src="${path}/images/booklink.png" alt="..."></a>
                    </div>
                    <p class="lead mb-5">As am hastily invited settled at limited civilly fortune me. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante.
                        Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. </p>
                </div>
                <div class="col-xl-8 col-lg-10 mx-auto">
                    <div class="text-black fs-5">
                        <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies
                            mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. </p>
                        <hr>
                    </div>

                </div>
                <div class="row">
                    <!-- 좋아요 -->
                    <div class="mb-5 text-center">
                        <button class="btn btn-primary-light" type="button" data-bs-toggle="collapse" data-bs-target="#like" aria-expanded="false" aria-controls="like">
                        <div class="like-container">
                            <div class="like-cnt unchecked" id="like-cnt">
                                <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
                                    <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
                                </svg>
                              <span class="badge bg-primary fs-5">48</span>
                            </div>
                      </div>
                    </button>
                    </div>
                    <!-- /좋아요-->
                </div>
            </div>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>