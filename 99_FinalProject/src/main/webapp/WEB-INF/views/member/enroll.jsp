<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
    <link rel="stylesheet" href="${path}/resourcesvendor/nouislider/nouislider.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,700">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css">
    <link rel="stylesheet" href="${path}/resources/vendor/magnific-popup/magnific-popup.css">
    <link rel="stylesheet" href="${path}/resources/css/style.default.css" id="theme-stylesheet">
    <link rel="stylesheet" href="${path}/resources/css/custom.css">
    <link rel="shortcut icon" href="${path}/resources/img/favicon.png">
    <!-- Tweaks for older IEs-->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <script src="${path}/resources/js/jquery-3.6.0.min.js"></script>
</head>

<body style="padding-top: 130px;">
    <form class="form-validate" action="${path}/member/enroll">
        <div class="container-fluid px-10 w-75 min-vh-100 ">
            <div class="container col-md-4 col-lg-4 col-xl-4 d-flex justify-content-between" style="text-align: center; align-items: center;"><img class="img-fluid mb-4" src="${path}/images/booklogo.jpg" alt="..." style="max-width: 5rem;">
                <h2>회원 가입 페이지</h2>
                <div class="col-auto "><a class="form-text small text-primary " href="${path}/"><img src="${path}/resources/img/x.PNG" alt="" style="max-width: 3rem;"></a></div>
            </div>
            <div class="container w-50">
                <div class="row min-vh-80 w-100 ">
                    <div class="col-md-6 col-lg-6 col-xl-6  flex-row-reverse">
                        <div class="w-100 py-5 px-2  position-relative">
                            <div class="d-flex justify-content-between">
                                <label class="form-label" for="U_ID"> 아이디</label>
                                <a class="form-label-link" id="checkID" href="#" onclick="checkID()">중복 확인</a>
                            </div>
                            <div class="mb-4">
                                <input class="form-control" name="U_ID" id="U_ID" placeholder="아이디" type="text" autocomplete="off" required data-msg="아이디를 입력해주세요">
                            </div>
                            <div class="mb-4">
                                <label class="form-label" for="U_PW"> 비밀번호</label>
                                <input class="form-control" name="U_PW" id="U_PW" placeholder="비밀번호" type="password" required data-msg="Please enter your password">
                            </div>
                            <div class="mb-4">
                                <label class="form-label" for="U_PW2"> 비밀번호 확인</label>
                                <input class="form-control mb-3" name="U_PW2" id="U_PW2" placeholder="비밀번호 확인" type="password" required data-msg="Please enter your password">
                                <div class="alert alert-success " id="alert-success">비밀번호가 일치합니다.</div>
                                <div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
                            </div>
                            <div class="d-flex justify-content-between align-items-center">
                                <label class="form-label" for="U_NICKNAME"> 닉네임</label>
                                <a class="form-label-link" id="checkNickName" href="#" onclick="checkNickName()">중복 확인</a>
                            </div>
                            <div class="mb-4">
                                <input class="form-control" name="U_NICKNAME" id="U_NICKNAME" placeholder="닉네임" type="text" autocomplete="off" required data-msg="Please enter your email">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6 col-xl-6  d-flex align-items-center">
                        <div class="w-100 py-5 px-2 position-relative ">
                            <div class="mb-4">
                                <label class="form-label" for="U_NAME"> 이름</label>
                                <input class="form-control" name="U_NAME" id="U_NAME" placeholder="이름" type="text" required data-msg="Please enter your password">
                            </div>
                            <div class="mb-4">
                                <label class="form-label" for="U_PHONE"> 연락처</label>
                                <input class="form-control" name="U_PHONE" id="U_PHONE" type="text" maxlength="13" placeholder="'-'을 제외한 휴대폰번호" required data-msg="Please enter your password">
                            </div>
                            <div class="mb-4">
                                <label class="form-label" for="U_ADDRESS"> 주소</label>
                                <input class="form-control" name="U_ADDRESS" id="U_ADDRESS" placeholder="주소" type="text" required data-msg="Please enter your password">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container w-75">
                <div class="container w-50 align-items-center col-md-6 col-lg-6 col-xl-6">
                    <div class="d-grid gap-2 w-100">
                        <button class="btn btn-lg btn-primary" type="submit">회원 가입</button>
                    </div>
                </div>
            </div>
    </div>
    </form>
    <!-- JavaScript files-->
    <script type="text/javascript">
        // ------------------------------------------------------- //
        //   Inject SVG Sprite - 
        //   see more here 
        //   https://css-tricks.com/ajaxing-svg-sprite/
        // ------------------------------------------------------ //
        function injectSvgSprite(path) {

            var ajax = new XMLHttpRequest();
            ajax.open("GET", path, true);
            ajax.send();
            ajax.onload = function(e) {
                var div = document.createElement("div");
                div.className = 'd-none';
                div.innerHTML = ajax.responseText;
                document.body.insertBefore(div, document.body.childNodes[0]);
            }
        }

        // 핸드폰 자리수별'-'생성
        function autoHypenPhone(str) {
            str = str.replace(/[^0-9]/g, '');
            var tmp = '';
            if (str.length < 4) {
                return str;
            } else if (str.length < 7) {
                tmp += str.substr(0, 3);
                tmp += '-';
                tmp += str.substr(3);
                return tmp;
            } else if (str.length < 11) {
                tmp += str.substr(0, 3);
                tmp += '-';
                tmp += str.substr(3, 3);
                tmp += '-';
                tmp += str.substr(6);
                return tmp;
            } else {
                tmp += str.substr(0, 3);
                tmp += '-';
                tmp += str.substr(3, 4);
                tmp += '-';
                tmp += str.substr(7);
                return tmp;
            }
            return str;
        }

        var cellPhone = document.getElementById('U_PHONE');
        cellPhone.onkeyup = function(event) {
            event = event || window.event;
            var _val = this.value.trim();
            this.value = autoHypenPhone(_val);
        }

        // 비밀번호 일치/불일치
        function test() {
            var p1 = document.getElementById('U_PW').value;
            var p2 = document.getElementById('U_PW2').value;
            
            if (p1 != p2) {
                alert("비밀번호가 일치 하지 않습니다");
                return false;
            } else {
                alert("비밀번호가 일치합니다");
                return true;
            }

        }

        $(() => {
            $("#alert-success").hide();
            $("#alert-danger").hide();
            $("input").keyup(function() {
                var pwd1 = $("#U_PW").val();
                var pwd2 = $("#U_PW2").val();
                if (pwd1 != "" || pwd2 != "") {
                    if (pwd1 == pwd2) {
                        $("#alert-success").show();
                        $("#alert-danger").hide();
                    } else {
                        $("#alert-danger").show();
                        $("#alert-success").hide();
                    }
                }
            })

        })

        function checkID(){
        	var U_ID = document.getElementById('U_ID').value;

            $.ajax({
                type: 'get',
                data: U_ID,
                url: "${path}/member/checkID",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function(data) {
                	console.log(data)
                    if (data.validate == true) {
                        alert("사용중인 아이디입니다.")
                    } else {
                        alert("사용가능합니다.!")
                    }
                }
            })
        }

        function checkNickName(){
        	var U_NICKNAME = document.getElementById('U_NICKNAME').value;

            $.ajax({
                type: 'get',
                data: U_NICKNAME,
                url: "${path}/member/checkNickName",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function(data) {
                	console.log(data)
                    if (data.confirm == true) {
                        alert("사용중인 아이디입니다.")
                    } else {
                        alert("사용가능합니다.!")
                    }
                }
            })
        }
 
/*         $(() => {
                $("#checkID").click(() => {

                    var U_ID = $('#U_ID').val();

                    $ajax({
                        type: 'post',
                        data: U_ID,
                        url: "${path}/member/checkID",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function(data) {
                        	console.log(data)
                            if (data > 0) {
                                alert("사용중인 아이디입니다.")
                            } else {
                                alert("사용가능합니다.!")
                            }
                        }
                    })
                })
            })
 
        $(() => {
                $("#checkNickName").click(() => {

                    var U_NICKNAME = $('#U_NICKNAME').val();

                    $ajax({
                        type: 'POST',
                        data: U_NICKNAME,
                        url: "${path}/member/checkNickName",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function(data) {
                            if (data > 0) {
                                alert("사용중인 닉네임입니다.")
                            } else {
                                alert("사용가능합니다.!")
                            }
                        }
                    })
                })
            }) */
        // to avoid CORS issues when viewing using file:// protocol, using the demo URL for the SVG sprite
        // use your own URL in production, please :)
        // https://demo.bootstrapious.com/directory/1-0/icons/orion-svg-sprite.svg
        //- injectSvgSprite('${path}icons/orion-svg-sprite.svg'); 
        injectSvgSprite('https://demo.bootstrapious.com/directory/1-4/icons/orion-svg-sprite.svg');
    </script>
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
	
