<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/header.jsp"%>

<table class="table">
	<tr>
		<td>배송지</td><td>-</td>
	</tr>
	<c:forEach items="${addressList }" var="address">
		<tr>
			<td>
			<div>
			<input type="hidden" name="email" value="test"><%-- ${loginUser.email } --%>
			<p style="color:light-gray">${address.post }</p> 
			<p>${address.addr1 }&nbsp;${address.addr2 }&nbsp;${address.re_Addr }</p>
			<p>${address.de_Addr }</p>
			</div>
			</td>
			<td><input type="button" data-ano="${address.ano }" value="X"><br></td>
			</tr>
	</c:forEach>
</table>
<script>
window.onload=function(){
	$('input[type="button"]').on('click', function () {
		var ano = $(this).data('ano');
		
		//alert(ano);
		$.ajax({
			url:"remove.do?ano="+ano,
			success:function(e){
				alert("삭제에 성공했습니다.");	
			}
			
		})
		
		
	});
}
</script>
<%@ include file="../include/footer.jsp"%>