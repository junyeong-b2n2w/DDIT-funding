<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr>
		<th>이메일</th>
		
		<th>비밀번호</th>
		
		<th>이름</th>
		
		<th>사진</th>
		
		<th>포인트</th>
		
		<th>회원구분</th>
		
	</tr>
	
	<tr>
		<td>${member.email }</td>
		<td>${member.password }</td>
		<td>${member.name }</td>
		<td>${member.picture }</td>
		<td>${member.point }</td>
		<td>${member.dist }</td>
	</tr>
</table>


</body>
</html>