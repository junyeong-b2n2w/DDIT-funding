<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="regist.do" method="post">
		fno:<input type="text" name="fno"	 value="${param.fno }"/>
		title: <input type="text" name="title"	 />
		content: <input type="text" name="content"	 />
		email: <input type="text" name="email"	/>
		<input type="submit" value="등록"> 
	</form>
</body>
</html>