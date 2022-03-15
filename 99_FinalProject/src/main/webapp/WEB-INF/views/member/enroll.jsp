<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="회원가입" name="title"/>
</jsp:include>
    
<!DOCTYPE html>
<html lang="en">

<body style="padding-top: 130px;">
    <form class="form-validate" action="${path}/member/enroll" method="POST">
        <div class="container-fluid px-10 w-75 min-vh-100 ">
            <div class="container col-md-4 col-lg-4 col-xl-4 d-flex justify-content-between" style="text-align: center; align-items: center;"><img class="img-fluid mb-4" src="${path}/images/book_logo.png" style="max-width: 5rem;">
                <h2>회원 가입 페이지</h2>
                <div class="col-auto "><a class="form-text small text-primary " href="${path}/"><img src="${path}/img/x.PNG" alt="" style="max-width: 3rem;"></a></div>
            </div>
            <div class="container w-50">
                <div class="row min-vh-80 w-100 ">
                    <div class="col-md-6 col-lg-6 col-xl-6  flex-row-reverse">
                        <div class="w-100 py-5 px-2  position-relative">
                            <div class="d-flex justify-content-between">
                                <label class="form-label" for="uId"> 아이디</label>
                                <a class="form-label-link" id="idCheck" href="#" onclick="idCheck()">중복 확인</a>
                            </div>
                            <div class="mb-4">
                                <input class="form-control" name="uId" id="uId" placeholder="아이디" type="text" autocomplete="off" required data-msg="아이디를 입력해주세요">
                            </div>
                            <div class="mb-4">
                                <label class="form-label" for="uPwd"> 비밀번호</label>
                                <input class="form-control" name="uPwd" id="uPwd" placeholder="비밀번호" type="password" required data-msg="Please enter your password">
                            </div>
                            <div class="mb-4">
                                <label class="form-label" for="pass2"> 비밀번호 확인</label>
                                <input class="form-control mb-3" name="pass2" id="pass2" placeholder="비밀번호 확인" type="password" required data-msg="Please enter your password">
                                <div class="alert alert-success " id="alert-success">비밀번호가 일치합니다.</div>
                                <div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
                            </div>
                            <div class="d-flex justify-content-between align-items-center">
                                <label class="form-label" for="uNickName"> 닉네임</label>
                                <a class="form-label-link" id="nickname" href="#" onclick="nicknameCheck()">중복 확인</a>
                            </div>
                            <div class="mb-4">
                                <input class="form-control" name="uNickName" id="uNickName" placeholder="닉네임" type="text" autocomplete="off" required data-msg="Please enter your email">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6 col-xl-6  d-flex align-items-center">
                        <div class="w-100 py-5 px-2 position-relative ">
                            <div class="mb-4">
                                <label class="form-label" for="uName"> 이름</label>
                                <input class="form-control" name="uName" id="uName" placeholder="이름" type="text" required data-msg="Please enter your password">
                            </div>
                            <div class="mb-4">
                                <label class="form-label" for="uPhone"> 연락처</label>
                                <input class="form-control" name="uPhone" id="uPhone" type="text" maxlength="13" placeholder="'-'을 제외한 휴대폰번호" required data-msg="Please enter your password">
                            </div>
                            <div class="mb-4">
                                <label class="form-label" for="uAddress"> 주소</label>
                                <input class="form-control" name="uAddress" id="uAddress" placeholder="주소" type="text" required data-msg="Please enter your password">
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

        var cellPhone = document.getElementById('uPhone');
        cellPhone.onkeyup = function(event) {
            event = event || window.event;
            var _val = this.value.trim();
            this.value = autoHypenPhone(_val);
        }

        // 비밀번호 일치/불일치
        function test() {
            var p1 = document.getElementById('uPwd').value;
            var p2 = document.getElementById('pass2').value;
            
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
                var pwd1 = $("#uPwd").val();
                var pwd2 = $("#pass2").val();
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

        function idCheck(){
        	var id = document.getElementById('uId').value;

            $.ajax({
                type: 'get',
                data: id,
                url: "${path}/member/idCheck",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function(data) {
                    if (data.validate === true) {
                        alert("사용중인 아이디입니다.")
                    } else {
                        alert("사용가능합니다.!")
                    }
                }
            })
        }

        function nicknameCheck(){
        	var nickname = document.getElementById('uNickName').value;

            $.ajax({
                type: 'get',
                data: nickname,
                url: "${path}/member/nicknameCheck",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function(data) {
                    if (data.confirm == true) {
                        alert("사용중인 아이디입니다.")
                    } else {
                        alert("사용가능합니다.!")
                    }
                }
            })
        };
</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>