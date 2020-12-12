<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<th>fno</th>
		<th>writer</th>
		<th>title</th>
		<th>content</th>
		<th>price_goal</th>
		<th>price_pre</th>
		<th>regdate</th>
		<th>startdate</th>
		<th>enddate</th>
		<th>fstatus</th>
		<th>fcount</th>
		<th>tag</th>
		<th>creater</th>
		<th>furl</th>
		<th>category</th>
		<th>project_img</th>
	</tr>
	<c:forEach items="${fundingList}" var="funding">
		<tr>
			<th><a href="detail.do?fno=${funding.fno}">${funding.fno}</a></th>
			<th>${funding.writer}</th>
			<th>${funding.title}</th>
			<th>${funding.content}</th>
			<th>${funding.price_goal}</th>
			<th>${funding.price_pre}</th>
			<th>${funding.regdate}</th>
			<th>${funding.startdate}</th>
			<th>${funding.enddate}</th>
			<th>${funding.fstatus}</th>
			<th>${funding.fcount}</th>
			<th>${funding.tag}</th>
			<th>${funding.creater}</th>
			<th>${funding.furl}</th>
			<th>${funding.category}</th>
			<th>${funding.project_img}</th>
		</tr>
	</c:forEach>
	<tr>
		<td colspan="14"><input type="button" value="등록" onclick="location.href='registForm.do'"></td>
	</tr>
</table>
</body>
</html>