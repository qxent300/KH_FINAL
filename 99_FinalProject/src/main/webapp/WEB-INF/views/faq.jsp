<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="고객센터" name="title"/>
</jsp:include>

<section>
<!-- 상단이미지 -->
    <div class="position-relative dark-overlay mb-5"><img class="bg-image" src="${path}/img/FAQ.jpg" alt="">
        <div class="container py-7">
            <div class="overlay-content text-center text-white">
                <h1 class="display-4 fw-bold text-shadow mb-0">고객센터</h1>
                <div class="col-xl-8 mx-auto">
                    <p class="text-white fs-4">고객님께서 가장 많이 궁금해하시는 내역을 빠르게 해결하실 수 있습니다.
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="container content-space-2 content-space-b-lg-3">
        <div class="w-lg-75 mx-lg-auto">
            <div class="d-grid gap-10">
                <div class="d-grid gap-3">
                    <h2 class="mb-5 text-primary">자주 묻는 질문</h2>
                    <!-- Accordion -->
                    <div class="accordion accordion-flush accordion-lg fs-4" id="accordionFAQBasics">
                        <!-- Accordion Item -->
                        <div class="accordion-item">
                            <div class="accordion-header" id="headingBasicsOne">
                                <a class="accordion-button collapsed fs-3" role="button" data-bs-toggle="collapse" data-bs-target="#collapseBasicsOne" aria-expanded="true" aria-controls="collapseBasicsOne">
                                    <a class="fw-bold">Q</a> 회원가입을 하면 편리한 점이 무엇인가요?
                                </a>
                            </div>
                            <div id="collapseBasicsOne" class="accordion-collapse collapse" aria-labelledby="headingBasicsOne" data-bs-parent="#accordionFAQBasics">
                                <div class="accordion-body">
                                    <a class="fw-bold">A</a> 저희 독서의민족과 연계되어 있는 도서관의 도서를 책 배달 형식으로 대여할 수 있습니다. (최대 5권까지 대여 가능) 독서습관을 기를 수 있도록 독서일지 작성이 가능합니다.
                                </div>
                            </div>
                        </div>
                        <!-- End Accordion Item -->

                        <!-- Accordion Item -->
                        <div class="accordion-item">
                            <div class="accordion-header" id="headingBasicsTwo">
                                <a class="accordion-button collapsed fs-3" role="button" data-bs-toggle="collapse" data-bs-target="#collapseBasicsTwo" aria-expanded="false" aria-controls="collapseBasicsTwo">
                                    <a class="fw-bold">Q</a> 연체 반납하거나 도서 재대출을 하려고 할 때는 어떻게 해야하나요?
                                </a>
                            </div>
                            <div id="collapseBasicsTwo" class="accordion-collapse collapse" aria-labelledby="headingBasicsTwo" data-bs-parent="#accordionFAQBasics">
                                <div class="accordion-body">
                                    <a class="fw-bold">A</a> 도서를 반납기한을 초과한 경우, 반납일로부터 연체일수 만큼 대출이 일시 정지되며, 연체도서 중 연체일수가 가장 긴 도서의 연체일수 만큼 대출할 수 없습니다. 반납한 자료의 당일 재대출은 불가하며, 다음날부터 대출이 가능합니다.
                                </div>
                            </div>
                        </div>
                        <!-- End Accordion Item -->

                        <!-- Accordion Item -->
                        <div class="accordion-item">
                            <div class="accordion-header" id="headingBasicsThree">
                                <a class="accordion-button collapsed fs-3" role="button" data-bs-toggle="collapse" data-bs-target="#collapseBasicsThree" aria-expanded="false" aria-controls="collapseBasicsThree">
                                    <a class="fw-bold">Q</a> 도서를 분실하거나 훼손 했을 경우에는 어떻게 해야하나요?
                                </a>
                            </div>
                            <div id="collapseBasicsThree" class="accordion-collapse collapse" aria-labelledby="headingBasicsThree" data-bs-parent="#accordionFAQBasics">
                                <div class="accordion-body">
                                    <a class="fw-bold">A</a> 도서를 훼손하거나 분실하였을 때에는 동일도서로 변상하여야 합니다. 동일도서로 변상할 수 없는 경우에는 대체자료를 구입하여 제출하여야 합니다. 기타 자세한 사항은 1:1 문의 바랍니다.
                                </div>
                            </div>
                        </div>
                        <!-- End Accordion Item -->

                        <!-- Accordion Item -->
                        <div class="accordion-item">
                            <div class="accordion-header" id="headingBasicsFour">
                                <a class="accordion-button collapsed fs-3" role="button" data-bs-toggle="collapse" data-bs-target="#collapseBasicsFour" aria-expanded="false" aria-controls="collapseBasicsFour">
                                    <a class="fw-bold">Q</a> 희망도서 신청은 어떻게 하나요?
                                </a>
                            </div>
                            <div id="collapseBasicsFour" class="accordion-collapse collapse" aria-labelledby="headingBasicsFour" data-bs-parent="#accordionFAQBasics">
                                <div class="accordion-body">
                                    <a class="fw-bold">A</a> 도서관에 소장되어 있지 않은 도서에 한하여 홈페이지 및 각 자료실 이용자 희망도서 신청서를 통해 신청할 수 있습니다.<br> 희망도서 신청 가능 권수 : 1인 월 2권이내(대출정지 기간동안은 신청 제한)<br> 도서를 구입하면 자료실 비치 전에 신청자에게 문자 알림 서비스를 제공하며, 자료 비치일로부터 3일간 해당 자료 신청자가 먼저 이용할
                                    수 있습니다.<br> 구입시기 : 매달 구입(신청월 다음달 중순경 희망도서 비치 예정) <br>
                                </div>
                            </div>
                        </div>
                        <!-- End Accordion Item -->

                        <!-- Accordion Item -->
                        <div class="accordion-item">
                            <div class="accordion-header" id="headingBasicsFive">
                                <a class="accordion-button collapsed fs-3" role="button" data-bs-toggle="collapse" data-bs-target="#collapseBasicsFive" aria-expanded="false" aria-controls="collapseBasicsFive">
                                    <a class="fw-bold">Q</a> 주문한 도서를 언제 받을 수 있을까요?
                                </a>
                            </div>
                            <div id="collapseBasicsFive" class="accordion-collapse collapse" aria-labelledby="headingBasicsFive" data-bs-parent="#accordionFAQBasics">
                                <div class="accordion-body">
                                    <a class="fw-bold">A</a> [마이페이지] > [대여현황]에서 배송상태와 대여현황 확인이 가능합니다.
                                </div>
                            </div>
                        </div>
                        <!-- End Accordion Item -->
                        <!-- Accordion Item -->
                        <div class="accordion-item">
                            <div class="accordion-header" id="headingBasicsSix">
                                <a class="accordion-button collapsed fs-3" role="button" data-bs-toggle="collapse" data-bs-target="#collapseBasicsSix" aria-expanded="false" aria-controls="collapseBasicsSix">
                                    <a class="fw-bold">Q</a> 회원 탈되하고 싶습니다.
                                </a>
                            </div>
                            <div id="collapseBasicsSix" class="accordion-collapse collapse" aria-labelledby="headingBasicsSix" data-bs-parent="#accordionFAQBasics">
                                <div class="accordion-body">
                                    <a class="fw-bold">A</a> [마이페이지] > [회원정보]에서 탈퇴하기를 누르면 회원 탈퇴가 진행됩니다. <br>탈퇴 과정을 처리하기 위해서는 대출한 자료가 반납 완료되고 대출 정지 기간이 만료된 상태여야 합니다.
                                </div>
                            </div>
                        </div>
                        <!-- End Accordion Item -->
                    </div>
                    <br>

                    <div class="d-grid gap-3">
                        <h2 class="mb-5 text-primary">1:1 문의</h2>
                        <div class="container bg-gray-100 py-5 px-3 px-lg-5 rounded-3 shadow-sm">
                            <div class="row">
                                <h2 class="text-center">준비중 입니다.</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
 </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>