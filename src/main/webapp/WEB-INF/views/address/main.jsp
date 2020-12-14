<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/header.jsp"%>

<h4>주소 메인</h4><br><br>

	<c:forEach items="${addressList }" var="address">
		<div>
			<input type="button" data-ano="${address.ano }" value="주소 삭제"><br>			
			<input type="hidden" name="email" value="test"><%-- ${loginUser.email } --%>
			우편번호  : ${address.post } <br>
			도로명주소 : ${address.addr1 }<br>
			지번주소 : ${address.addr2 }<br>
			상세주소 : ${address.de_Addr }<br>
			참고주소 : ${address.re_Addr }
			<hr>
		</div>
	</c:forEach>

<script>
window.onload=function(){
	$('input[type="button"]').on('click', function () {
		var ano = $(this).data('ano');
		
		alert(ano);
		
ㄴ		
	});
}
</script>
<%@ include file="../include/footer.jsp"%>