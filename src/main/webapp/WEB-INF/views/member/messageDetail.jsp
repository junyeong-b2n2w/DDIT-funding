<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>메시지</title>
</head>
<body>
	보낸이 <input type="text" disabled value="${message.sender }" class="form-control"><br>
	보낸날짜 <input type="text" disabled value="<fmt:formatDate value='${message.regdate}' pattern='yyyy-MM-dd'/>" class="form-control"><br>
	내용: <textarea rows="10" cols="20" class="form-control" disabled>${message.mcontent }</textarea><br>
	<c:if test="${param.from == 2 }">
		<input type="button" value="답장" onclick="resend()" class="btn btn-light">
	</c:if>
	<input type="button" value="삭제" onclick="remove()" class="btn btn-light">
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
         form.setAttribute("action", "messageRemove.do?mno=${message.mno}&from=${param.from}"); //요청 보낼 주소
         form.submit();

         // 		location.href="remove.do?mno=${message.mno}&from=${param.from}";
	}
</script>
</html>