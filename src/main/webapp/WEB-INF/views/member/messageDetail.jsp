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
	보낸이: ${message.sender }<br>
	보낸날짜: ${message.regdate}<br>
	내용: ${message.mcontent }<br>
	<c:if test="${param.from == 2 }">
		<input type="button" value="답장" onclick="resend()">
	</c:if>
	<input type="button" value="삭제" onclick="remove()">
</body>
<script>
	function resend(){
		location.href="messageSend.do?receiver=${message.sender}";
	}
	function remove(){
		 const form = document.createElement("form");
		 document.body.appendChild(form); 
	     var hiddenField = document.createElement("input");
         hiddenField.setAttribute("type", "hidden");
         hiddenField.setAttribute("name", "mno");
         hiddenField.setAttribute("value", "${message.mno}");
         form.appendChild(hiddenField);
         form.setAttribute("method", "Post");  //Post 방식
         form.setAttribute("action", "remove.do?mno=${message.mno}&from=${param.from}"); //요청 보낼 주소
         form.submit();

         // 		location.href="remove.do?mno=${message.mno}&from=${param.from}";
	}
</script>
</html>