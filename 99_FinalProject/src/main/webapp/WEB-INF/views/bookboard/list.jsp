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
                    <div class="col-md-4 d-md-flex align-items-center justify-content-end">
                    
                    <c:if test="${loginMember != null}">
						<a class="btn-lg btn-primary rounded-2 fw-bold fs-6"
							href="${path}/bookboard/write"> 글쓰기</a>
					</c:if>
                    
                        </div>
                    <div class="col-md-8">
                        <!-- <h2>인기 독서일지</h2> -->
                    </div>
                </div>
                <!--인기-->
                <div class="col-lg-3 col-sm-6 mb-4 hover-animate">
                    <div class="card shadow border-0 h-100">
                        <a href="${path}/bookboard/view"><img class="img-fluid card-img-top" src="${path}/images/book1.jpg" alt="..." />
                            <span class="card-img-overlay-top d-flex justify-content-between align-items-center bad">
                                <div class="icon-rounded bg-warning-light mb-3">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="orange" class="bi bi-star-fill" viewBox="0 0 16 16">
                                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                      </svg>
                                </div>
                            </span>
                        </a>
                        <div class="card-body"><a class="text-uppercase text-muted text-sm letter-spacing-2">나는야독서왕</a>
                            <h5 class="my-2"><a class="text-dark" href="${path}/bookboard/view">메타버스 세상의 주인공들에게를 읽었습니다.        </a></h5>
                            <p class="text-gray-500 text-sm my-3"><i class="far fa-clock me-2"></i>January 16, 2022</p>
                            <p class="text-dark text-sm my-3">[50]</p>
                        </div>
                    </div>
                </div>
                <!--인기-->
                <div class="col-lg-3 col-sm-6 mb-4 hover-animate">
                    <div class="card shadow border-0 h-100">
                        <a href="${path}/bookboard/view"><img class="img-fluid card-img-top" src="${path}/images/book2.jpg" alt="..." />
                            <div class="card-img-overlay-top d-flex justify-content-between align-items-center">
                                <div class="icon-rounded bg-warning-light mb-3">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="orange" class="bi bi-star-fill" viewBox="0 0 16 16">
                                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                      </svg>
                                </div>
                            </div>
                        </a>
                        <div class="card-body"><a class="text-uppercase text-muted text-sm letter-spacing-2">독서의제왕</a>
                            <h5 class="my-2"><a class="text-dark" href="${path}/bookboard/view">나의 청소년기가 떠오르는 책         </a></h5>
                            <p class="text-gray-500 text-sm my-3"><i class="far fa-clock me-2"></i>January 16, 2022</p>
                            <p class="text-dark text-sm my-3">[48]</p>
                        </div>
                    </div>
                </div>
                <!--인기-->
                <div class="col-lg-3 col-sm-6 mb-4 hover-animate">
                    <div class="card shadow border-0 h-100">
                        <a href="${path}/bookboard/view"><img class="img-fluid card-img-top" src="${path}/images/book3.jpg" alt="..." />
                            <div class="card-img-overlay-top d-flex justify-content-between align-items-center">
                                <div class="icon-rounded bg-warning-light mb-3">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="orange" class="bi bi-star-fill" viewBox="0 0 16 16">
                                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                      </svg>
                                </div>
                            </div>
                        </a>
                        <div class="card-body"><a class="text-uppercase text-muted text-sm letter-spacing-2">도서관장</a>
                            <h5 class="my-2"><a class="text-dark" href="${path}/bookboard/view">내 인생의 성장소설         </a></h5>
                            <p class="text-gray-500 text-sm my-3"><i class="far fa-clock me-2"></i>January 16, 2022</p>
                            <p class="text-dark text-sm my-3">[45]</p>
                        </div>
                    </div>
                </div>
                <!--인기-->
                <div class="col-lg-3 col-sm-6 mb-4 hover-animate">
                    <div class="card shadow border-0 h-100">
                        <a href="${path}/bookboard/view"><img class="img-fluid card-img-top" src="${path}/images/book4.jpg" alt="..." />
                            <div class="card-img-overlay-top d-flex justify-content-between align-items-center">
                                <div class="icon-rounded bg-warning-light mb-3">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="orange" class="bi bi-star-fill" viewBox="0 0 16 16">
                                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                      </svg>
                                </div>
                            </div>
                        </a>
                        <div class="card-body"><a class="text-uppercase text-muted text-sm letter-spacing-2">책벌레</a>
                            <h5 class="my-2"><a class="text-dark" href="${path}/bookboard/view">나의 20번째 독서일지         </a></h5>
                            <p class="text-gray-500 text-sm my-3"><i class="far fa-clock me-2"></i>January 16, 2022</p>
                            <p class="text-dark text-sm my-3">[42]</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mb-5">
                <!-- blog item-->
                <div class="col-lg-3 col-sm-6 mb-4 hover-animate">
                    <div class="card shadow border-0 h-100">
                        <a href="${path}/bookboard/view"><img class="img-fluid card-img-top" src="${path}/images/book5.jpg" alt="..." />
                        </a>
                        <div class="card-body"><a class="text-uppercase text-muted text-sm letter-spacing-2">나는야독서왕</a>
                            <h5 class="my-2"><a class="text-dark" href="${path}/bookboard/view">시간을 찾을 수 있을까?         </a></h5>
                            <p class="text-gray-500 text-sm my-3"><i class="far fa-clock me-2"></i>January 16, 2022</p>
                            <p class="text-dark text-sm my-3">[00]</p>
                        </div>
                    </div>
                </div>
                <!-- blog item-->
                <div class="col-lg-3 col-sm-6 mb-4 hover-animate">
                    <div class="card shadow border-0 h-100">
                        <a href="${path}/bookboard/view"><img class="img-fluid card-img-top" src="${path}/images/book6.jpg" alt="..." />
                        </a>
                        <div class="card-body"><a class="text-uppercase text-muted text-sm letter-spacing-2">냠냠굿</a>
                            <h5 class="my-2"><a class="text-dark" href="${path}/bookboard/view">육아 필독도서!!         </a></h5>
                            <p class="text-gray-500 text-sm my-3"><i class="far fa-clock me-2"></i>January 16, 2022</p>
                            <p class="text-dark text-sm my-3">[00]</p>
                        </div>
                    </div>
                </div>
                <!-- blog item-->
                <div class="col-lg-3 col-sm-6 mb-4 hover-animate">
                    <div class="card shadow border-0 h-100">
                        <a href="${path}/bookboard/view"><img class="img-fluid card-img-top" src="${path}/images/book7.jpg" alt="..." />
                        </a>
                        <div class="card-body"><a class="text-uppercase text-muted text-sm letter-spacing-2">마음의양식</a>
                            <h5 class="my-2"><a class="text-dark" href="${path}/bookboard/view">나는 그냥 나대로 살래         </a></h5>
                            <p class="text-gray-500 text-sm my-3"><i class="far fa-clock me-2"></i>January 16, 2022</p>
                            <p class="text-dark text-sm my-3">[05]</p>
                        </div>
                    </div>
                </div>
                <!-- blog item-->
                <div class="col-lg-3 col-sm-6 mb-4 hover-animate">
                    <div class="card shadow border-0 h-100">
                        <a href="${path}/bookboard/view"><img class="img-fluid card-img-top" src="${path}/images/book8.jpg" alt="..." />
                        </a>
                        <div class="card-body"><a class="text-uppercase text-muted text-sm letter-spacing-2">무한독서</a>
                            <h5 class="my-2"><a class="text-dark" href="${path}/bookboard/view">나에게 고맙다를 읽고         </a></h5>
                            <p class="text-gray-500 text-sm my-3"><i class="far fa-clock me-2"></i>January 16, 2022</p>
                            <p class="text-dark text-sm my-3">[08]</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mb-5">
                <!-- blog item-->
                <div class="col-lg-3 col-sm-6 mb-4 hover-animate">
                    <div class="card shadow border-0 h-100">
                        <a href="${path}/bookboard/view"><img class="img-fluid card-img-top" src="${path}/images/book9.jpg" alt="..." />
                        </a>
                        <div class="card-body"><a class="text-uppercase text-muted text-sm letter-spacing-2">독서1등</a>
                            <h5 class="my-2"><a class="text-dark" href="${path}/bookboard/view">제가 한번 읽어보았습니다.         </a></h5>
                            <p class="text-gray-500 text-sm my-3"><i class="far fa-clock me-2"></i>January 16, 2022</p>
                            <p class="text-dark text-sm my-3">[10]</p>
                        </div>
                    </div>
                </div>
                <!-- blog item-->
                <div class="col-lg-3 col-sm-6 mb-4 hover-animate">
                    <div class="card shadow border-0 h-100">
                        <a href="${path}/bookboard/view"><img class="img-fluid card-img-top" src="${path}/images/book10.jpg" alt="..." />
                        </a>
                        <div class="card-body"><a class="text-uppercase text-muted text-sm letter-spacing-2">북북북</a>
                            <h5 class="my-2"><a class="text-dark" href="${path}/bookboard/view">아직도 이 책을 모르는 사람이 있다고?         </a></h5>
                            <p class="text-gray-500 text-sm my-3"><i class="far fa-clock me-2"></i>January 16, 2022</p>
                            <p class="text-dark text-sm my-3">[20]</p>
                        </div>
                    </div>
                </div>
                <!-- blog item-->
                <div class="col-lg-3 col-sm-6 mb-4 hover-animate">
                    <div class="card shadow border-0 h-100">
                        <a href="${path}/bookboard/view"><img class="img-fluid card-img-top" src="${path}/images/book11.jpg" alt="..." />
                        </a>
                        <div class="card-body"><a class="text-uppercase text-muted text-sm letter-spacing-2">췍췍</a>
                            <h5 class="my-2"><a class="text-dark" href="${path}/bookboard/view">이 책 추천합니다.         </a></h5>
                            <p class="text-gray-500 text-sm my-3"><i class="far fa-clock me-2"></i>January 16, 2022</p>
                            <p class="text-dark text-sm my-3">[02]</p>
                        </div>
                    </div>
                </div>
                <!-- blog item-->
                <div class="col-lg-3 col-sm-6 mb-4 hover-animate">
                    <div class="card shadow border-0 h-100">
                        <a href="${path}/bookboard/view"><img class="img-fluid card-img-top" src="${path}/images/book12.jpg" alt="..." />
                        </a>
                        <div class="card-body"><a class="text-uppercase text-muted text-sm letter-spacing-2">책조아</a>
                            <h5 class="my-2"><a class="text-dark" href="${path}/bookboard/view">책조아의 독서일지         </a></h5>
                            <p class="text-gray-500 text-sm my-3"><i class="far fa-clock me-2"></i>January 16, 2022</p>
                            <p class="text-dark text-sm my-3">[11]</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Pagination -->
        <nav aria-label="Page navigation">
            <ul class="pagination justify-content-center">
                <li class="page-item disabled">
                    <a class="page-link" href="${path}/bookboard/view" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                    </a>
                </li>
                <li class="page-item"><a class="page-link" href="${path}/bookboard/view">1</a></li>
                <li class="page-item"><a class="page-link" href="${path}/bookboard/view">2</a></li>
                <li class="page-item"><a class="page-link" href="${path}/bookboard/view">3</a></li>
                <li class="page-item"><a class="page-link" href="${path}/bookboard/view">4</a></li>
                <li class="page-item"><a class="page-link" href="${path}/bookboard/view">5</a></li>
                <li class="page-item">
                    <a class="page-link" href="${path}/bookboard/view" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>
            </ul>
        </nav>
    </section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>