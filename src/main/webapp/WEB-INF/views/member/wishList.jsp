<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<c:forEach items="${fundingList}" var="funding" varStatus="f">
		<div>
			<p>펀딩 제목 : <a href="<%=request.getContextPath() %>/funding/detail.do?fno=${funding.fno}">${funding.title }</a></p><br>
			<input type="hidden" value="${wishList.get(f.index).wno}">
			<input type="button" class="removeWish" value="삭제" onclick="remove(this)">
		</div> 
	</c:forEach>
</body>
	<script>
		function remove(but){
			const par = but.parentNode.childNodes;
// 			console.log(par[4]);
			const wno = par[4].value;
		 	//요청
		 	xhttp = new XMLHttpRequest();
			xhttp.open('get', 'removeWish.do?wno='+wno, true)
			xhttp.send()
			  
			//응답
			xhttp.onreadystatechange = function() {
			    if(this.readyState == 4 && this.status == 200){
					location.reload();
			    }
			}
		}
	</script>
</html>