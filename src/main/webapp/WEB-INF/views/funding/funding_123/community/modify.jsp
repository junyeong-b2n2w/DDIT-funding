<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="modify.do" method="post">
		cno: <input type="text" name="cno"	 value="${community.cno }"/>	
		fno:<input type="text" name="fno"	 value="${community.fno }"/>
		title: <input type="text" name="title"	 value="${community.title }"/>
		content: <input type="text" name="content"	 value="${community.content }"/>
		email: <input type="text" name="email"	 value="${community.email }"/>
		regdate: <input type="text" name="regdate"	 value="${community.regdate }"/>
		<input type="submit" value="수정하기"> 
	</form>
</body>
</html>