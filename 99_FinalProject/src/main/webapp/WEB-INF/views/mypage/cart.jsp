<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="장바구니" name="title"/>
</jsp:include>

	<section class="py-5">
      <div class="container" style="padding-top: 100px;">

        <div class="d-flex justify-content-between align-items-end mb-5">
          <h1 class="hero-heading mb-0">장바구니</h1>
        </div>
        <c:if test="${cartList != null}">
	        <div class="d-flex justify-content-between align-items-center flex-column flex-lg-row mb-3">
	          <button type="button" id="emptyCart" class="btn btn-secondary" onclick="location.href='${path}/mypage/deleteAllCart'">장바구니 비우기</button>
	        </div>
        </c:if>
        <div class="list-group shadow mb-5">
        	<c:if test="${cartList == null}">
        		<div style="height: 500px; text-align: center;">
        			<h5 style="margin: 250px 0px 50px 0px;">장바구니가 비어있습니다...</h5>
        			<button type="button" class="btn btn-primary" onclick="location.href='${path}'">메인으로</button>
        		</div>
        	</c:if>
	        <c:if test="${cartList != null}">
	        	<c:forEach var="cart" items="${cartList }" varStatus="status">
		          <div class="list-group-item p-4">
		            <div class="row">
		              <div class="col-lg-1 align-self-center" style="text-align: center;"></div>
		              <div class="col-lg-2 align-self-center">
		                <a href="${path}/book/view?bNo=${cart.BNo}">
		                  <img src="${path}/book/${cart.BImage}" alt="${cart.BImage}" class="rounded-0 card-img mb-3 border border-1">
		                </a>
		              </div>
		              <div class="col-lg-9">
		                <div class="row">
		                  <div class="col-6 col-md-4 col-lg-3 py-3 mb-3 mb-lg-0">
		                    <h6 class="label-heading">도서 제목</h6>
		                    <p class="text-sm fw-bold">${cart.BName}</p>
		                    <h6 class="label-heading">저자</h6>
		                    <p class="text-sm fw-bold">${cart.BWriter}</p>
		                    <h6 class="label-heading">출간일</h6>
		                    <p class="text-sm fw-bold">
		                    	<fmt:formatDate value="${cart.publishDate}" pattern="yyyy-MM-dd"/>
		                    </p>
		                  </div>
		                  <div class="col-6 col-md-4 col-lg-3 py-3 mb-3 mb-lg-0"></div>
		                  <div class="col-6 col-md-4 col-lg-3 py-3 mb-3 mb-lg-0"></div>
						  <div class="col-12 col-lg-3 align-self-center" style="text-align: center;">
						  	<a href="${path}/mypage/deleteCart?cNo=${cart.CNo}">
						  		<h2 class="text-dark"><i class="bi bi-trash"></i></h2>
						  	</a>
						  </div>
		                </div>
		              </div>
		            </div>
		          </div>
	        	</c:forEach>
	        </c:if>
        </div>
		
		<c:if test="${cartList != null}">
	        <div class="d-flex justify-content-between align-items-center flex-column flex-lg-row mb-3">
	          <div class="me-3">
	            <h4>배송지 정보</h4>
	          </div>
	        </div>
	        <div class="mb-5">
	          <div class="input-group mb-1" style="width: 400px;">
	            <input type="text" id="sample6_postcode" class="form-control" placeholder="우편번호">
	            <button type="button" class="btn btn-primary" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
	          </div>
	          <div class="input-group mb-1" style="width: 600px;">
	            <input type="text" id="sample6_address" class="form-control" placeholder="주소">
	          </div>
	          <div class="input-group" style="width: 600px;">
	            <input type="text" id="sample6_detailAddress" class="form-control" placeholder="상세주소">
	            <input type="text" id="sample6_extraAddress" class="form-control" placeholder="참고항목">
	          </div>
	        </div>
	
			
			<div class="me-3 mb-2">
	        	<div class="row">
	        		<div class="col">
	        			<div class="col"><h4 id="resultAddr">도서관 위치</h4></div>
	        		</div>
	        		<div class="col input-group">
	        			<input type="text" class="form-control" id="libAddr">
	        			<button type="button" class="btn btn-primary" onclick="libAddr()">검색</button>
	        		</div>
	        	</div>
	        </div>
	        <div id="map" style="width:100%; height:600px;"></div>
        </c:if>
          
        <c:if test="${cartList != null}">  
	        <div style="text-align: center; margin-top: 50px;">
	        	<button type="button" class="btn btn-primary" onclick="location.href='${path}/mypage/rentAll'">대여하기</button>
	        	<button type="button" class="btn btn-secondary" onclick="location.href='${path}'">취소하기</button>
	        </div>  
        </c:if>
          
      </div>
    </section>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=77b583295ff7fedbd491197251af563e"></script>

<script>
      var container = document.getElementById('map');
      var options = {
        center: new kakao.maps.LatLng(37.4995141410151, 127.03423483328707),
        level: 3
      };

      var map = new kakao.maps.Map(container, options);
</script>    

<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
                
                document.getElementById("libAddr").value = addr.split(' ')[1];
            }
        }).open();
    }
    
    function libAddr() {
    	var addr = document.getElementById("libAddr").value;
    	var name = [];
    	var address = [];
    	var lat = [];
    	var lng = [];
    	var length = 0;
    	var i = 0;
    	
    	$.ajax({												
            type: "post",
            url: "<%=request.getContextPath() %>/mypage/libAddr",
            async: false,
            data: {
				addr: addr
            },
            success : function(data){
            	length = data.length;
	   			$(data).each(function(){
	   				name[i] = this.name;
	   				address[i] = this.address;
	   				lat[i] = this.lat;
	   				lng[i] = this.lng;
	   		    	i++;
	   			});
   			},
    		error :function(){
   				alert("request error!");
   			}
        });

    	var moveLatLon = new kakao.maps.LatLng(lat[0], lng[0]);

        map.panTo(moveLatLon);  
        
        var position = {};
        var positions = [];
        
        for (var i = 0; i < length; i ++) {
        	position.title = name[i];
        	position.address = address[i];
        	position.latlng = new kakao.maps.LatLng(lat[i], lng[i]);
        	positions.push({...position});
        }
        
        for (var i = 0; i < positions.length; i ++) {
            var marker = new kakao.maps.Marker({
            	map: map,
                position: positions[i].latlng,
                title : positions[i].title,
                clickable: true
            });
            
            var iwContent = '<div style="padding:5px; width:150px;">' + positions[i].title + '<br>' + '<a href="javascript:void(0);" onclick="selectLib(this)">선택</a>' + '</div>'
            
            var infowindow = new kakao.maps.InfoWindow({
                position : positions[i].latlng, 
                content : iwContent,
                removable : true
            });

            kakao.maps.event.addListener(marker, 'click', makeClickListener(map, marker, infowindow));
        }
        
        map.setLevel(7);
    }
    
    function makeClickListener(map, marker, infowindow) {
    	return function() {
    		infowindow.open(map, marker);
    	};
   	}
    
    function selectLib(obj) {
    	var str = $(obj).parent().text();
    	
    	$('#resultAddr').text('도서관 위치 : ' + str.slice(0, str.length-2));
    }
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>