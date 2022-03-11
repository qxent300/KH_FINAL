<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<%@include file="../common/header.jsp"%>

    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>독서의 민족</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <link rel="stylesheet" href="${path}/resources/vendor/nouislider/nouislider.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,700">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css">
    <link rel="stylesheet" href="${path}/resources/vendor/magnific-popup/magnific-popup.css">
    <link rel="stylesheet" href="${path}/resources/css/style.default.css" id="theme-stylesheet">
    <link rel="stylesheet" href="${path}/resources/css/custom.css">
    <link rel="shortcut icon" href="${path}/resources/img/favicon.png">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
</head>


<!-- col-md-8 col-lg-6 col-xl-5 d-flex  -->

<body style="padding-top: 72px;">
    <div class="row min-vh-100">
        <div class="w-75 container">
            <div class="w-50 container px-0 align-items-center">
                <div class="w-100 py-5 px-md-5 px-xxl-6 position-relative ">
                    <div class="container  d-flex justify-content-between " style="text-align: center; align-items: center;"><img class="img-fluid mb-3 float-left" src="${path}/resources/img/logo-square.svg " alt="... " style="max-width: 4rem; ">
                        <h2>로그인 페이지</h2>
                        <div class="col-auto">
                            <a class="form-text text-primary " href="${path}/home "><img src="${path}/resources/img/x.PNG" alt="" style="max-width: 3rem;"></a>
                        </div>
                    </div>
                    <form class="form-validate " action="${path}/member/login" method="post">
                        <div class="mb-4 ">
                            <label class="form-label " for="loginUsername "> 아이디</label>
                            <input class="form-control " name="loginUsername " id="loginUsername " type="userId " placeholder="아이디 " autocomplete="off " required data-msg="아이디를 입력해주세요. ">
                        </div>
                        <div class="mb-4 ">
                            <div class="row ">
                                <div class="col ">
                                    <label class="form-label " for="loginPassword "> 비밀번호</label>
                                </div>
                                <div class="col-auto "><a class="form-text small text-primary " href="" data-bs-toggle="modal" data-bs-target="#findPwdModal">비밀번호 찾기</a></div>
                            </div>
                            <input class="form-control " name="loginPassword " id="loginPassword " placeholder="비밀번호 " type="password " required data-msg="비밀번호를 입력해주세요. ">
                        </div>
                        <!-- Submit-->
                        <div class="d-grid ">
                            <button class="btn btn-lg btn-primary ">로그인</button>
                        </div>
                        <hr class="my-3 hr-text letter-spacing-2 " data-content="OR ">
                        <div class="d-flex ">
                            <div class="w-100 float-left mb-2">
  	                          <%
   								 String clientId = "SS0SUd6aSKQ6wcwaqtzm";//애플리케이션 클라이언트 아이디값";
    							String redirectURI = URLEncoder.encode("http://localhost/finalproject/callback", "UTF-8");
								SecureRandom random = new SecureRandom();
    							String state = new BigInteger(130, random).toString();
    							String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    							apiURL += "&client_id=" + clientId;
    							apiURL += "&redirect_uri=" + redirectURI;
    							apiURL += "&state=" + state;
    							session.setAttribute("state", state);
 							%>
                                <a href="<%=apiURL%>" class="w-100"><img src="${path}/resources/img/btnG_완성형.png" height="50px" class="w-100" alt="">
                                </a>
                            </div>
                        </div>
                        <a href=""><img src="${path}/resources/img/kakao_login_medium_wide.png" height="50px" class="w-100" alt="">
                        </a>
                        <hr class="my-4 ">
                        <!-- <p class="text-center "><small class="text-muted text-center "> <a href=" ">회원가입              </a></small></p> -->
                    </form>
                    <form class=" " action="${path}/member/enrollPage">
                        <div class="d-grid ">
                            <button class="btn btn-lg btn-primary ">회원가입
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    </div>
    <!-- Modal -->
    <div id="findPwdModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <div>비밀번호 찾기</div>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="findPwd" action="${path}/member/findUserPwd" method="post">
                    <div class="modal-body"><br>
                        <div class="mb-4">
                            <label class="form-label" for="U_ID"> 아이디</label>
                            <input class="form-control" name="U_ID" id="U_ID" placeholder="아이디" type="text" autocomplete="off" required data-msg="아이디를 입력해주세요">
                        </div>
                        <div class="mb-4">
                            <label class="form-label" for="U_NAME"> 이름</label>
                            <input class="form-control" name="U_NAME" id="U_NAME" placeholder="이름" type="text" required data-msg="Please enter your password">
                        </div>
                    </div><br>
                    <div class="modal-footer ">
                        <button type="button" class="btn btn-lg btn-primary" style="width: 200px;">비밀번호 찾기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- End Modal -->
    <!-- JavaScript files-->
    <script type="text/javascript">
        // ------------------------------------------------------- //
        //   Inject SVG Sprite - 
        //   see more here 
        //   https://css-tricks.com/ajaxing-svg-sprite/
        // ------------------------------------------------------ //
        function injectSvgSprite(path) {

            var ajax = new XMLHttpRequest();
            ajax.open("GET ", path, true);
            ajax.send();
            ajax.onload = function(e) {
                var div = document.createElement("div ");
                div.className = 'd-none';
                div.innerHTML = ajax.responseText;
                document.body.insertBefore(div, document.body.childNodes[0]);
            }
        }
        // to avoid CORS issues when viewing using file:// protocol, using the demo URL for the SVG sprite
        // use your own URL in production, please :)
        // https://demo.bootstrapious.com/directory/1-0/icons/orion-svg-sprite.svg
        //- injectSvgSprite('${path}icons/orion-svg-sprite.svg'); 
        injectSvgSprite('https://demo.bootstrapious.com/directory/1-4/icons/orion-svg-sprite.svg');
    </script>
    <!-- jQuery-->
    <script src="${path}/resources/vendor/jquery/jquery.min.js "></script>
    <!-- Bootstrap JS bundle - Bootstrap + PopperJS-->
    <script src="${path}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js "></script>
    <!-- Magnific Popup - Lightbox for the gallery-->
    <script src="${path}/resources/vendor/magnific-popup/jquery.magnific-popup.min.js "></script>
    <!-- Smooth scroll-->
    <script src="${path}/resources/vendor/smooth-scroll/smooth-scroll.polyfills.min.js "></script>
    <!-- Bootstrap Select-->
    <script src="${path}/resources/vendor/bootstrap-select/js/bootstrap-select.min.js "></script>
    <!-- Object Fit Images - Fallback for browsers that don't support object-fit-->
    <script src="${path}/resources/vendor/object-fit-images/ofi.min.js "></script>
    <!-- Swiper Carousel                       -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js "></script>
    <script>
        var basePath = ''
    </script>
    <!-- Main Theme JS file    -->
    <script src="js/theme.js "></script>
</body>

</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>