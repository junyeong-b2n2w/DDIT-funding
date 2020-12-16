<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>funfun</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Place favicon.ico in the root directory -->
    <link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath() %>/resources/images/favicon.ico">
    <link rel="apple-touch-icon" href="apple-touch-icon.png">
    
   

    <!-- All css files are included here. -->
    <!-- Bootstrap fremwork main css -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css">
   
    <!-- This core.css file contents all plugings css file. -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/core.css">
    <!-- Theme shortcodes/elements style -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/shortcode/shortcodes.css">
    <!-- Theme main style -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style.css">
    <!-- Responsive css -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/responsive.css">
    <!-- fonsaswame css -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/fa.all.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/owlcarousel/owl.carousel.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/owlcarousel/owl.theme.default.min.css">
    <!-- User style -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/custom.css">


    
</head>

<body>
	
		
		
		<form action="regist" method="post" name="addressForm">
		<div class="container">
		<h1 class="mtb--20">주소 입력</h1>
		<div class="col-5">
			<input type="hidden" class="form-control" name="email" value="test"><%-- ${loginUser.email } --%>
		
		
			<input type="text" class="form-control" id="sample4_postcode" name="post" placeholder="우편번호">
		</div>
		<div class="col-5">
			<input type="button" class="btn btn-primary" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
			</div>
			<input type="text" class="form-control" id="sample4_roadAddress" name="addr1" placeholder="도로명주소">
			<input type="text" class="form-control" id="sample4_jibunAddress" name="addr2" placeholder="지번주소">
			<span id="guide"  style="color:#999;display:none"></span>
			<input type="text" class="form-control" id="sample4_detailAddress" name="de_Addr" placeholder="상세주소">
			<input type="text" class="form-control" id="sample4_extraAddress" name="re_Addr" placeholder="참고항목">
			<input type="button" class=" btn btn-primary" value="저장" id="addressSubmit">
		
		</div>
		</form>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
    
window.onload=function(){
    $('#addressSubmit').on('click', function (e) {
		var form = $('form[name="addressForm"]');
		
		if($('input[name="zonecode"]') == ""){
			alert("우편번호를 입력해주세요.");
			return;
		}
		
		if($('input[name="roadAddress"]') == ""){
			alert("도로명주소를 입력해주세요.");
			return;
		}
		
		if($('input[name="jibunAddress"]') == ""){
			alert("지번주소를 입력해주세요.");
			return;
		}
		
		form.submit();
	});
}
</script>
    <!-- jquery latest version -->
    <script src="<%=request.getContextPath() %>/resources/js/vendor/jquery-1.12.0.min.js"></script>
    <!-- Bootstrap framework js -->
    <script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
    
    <script src="<%=request.getContextPath() %>/resources/js/owl.carousel.min.js"></script>
    <!-- All js plugins included in this file. -->
  
   
</body>

</html>