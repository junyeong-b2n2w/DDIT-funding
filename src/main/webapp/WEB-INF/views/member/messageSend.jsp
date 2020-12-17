<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<form action="send.do" method="post">
		받는사람 : <input type="text" name="receiver" value="${param.receiver }">
		내용: <input type="text" name="mcontent">
		<input type="submit" value="전송">
	</form>
</body>
</html>