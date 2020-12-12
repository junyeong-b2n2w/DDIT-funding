<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="modify.do">
<table border="1">
	<tr>
		<th>fno</th>
		<td><input type="text" value="${funding.fno}" readonly name="fno"></td>
	</tr>
	<tr>
		<th>writer</th>
		<td><input type="text" value="${funding.writer}" readonly></td>
	<tr>
	<tr>
		<th>title</th>
		<td><input type="text" value="${funding.title}" name="title"></td>
	<tr>
	<tr>
		<th>content</th>
		<td><input type="text" value="${funding.content}" name="content"></td>
	<tr>
	<tr>
		<th>price_goal</th>
		<td><input type="text" value="${funding.price_goal}" readonly></td>
	<tr>
	<tr>
		<th>price_pre</th>
		<td><input type="text" value="${funding.price_pre}" readonly></td>
	<tr>
	<tr>
		<th>regdate</th>
		<td><input type="date" value="${funding.regdate}" readonly></td>
	<tr>
	<tr>
		<th>startdate</th>
		<td><input type="date" value="${funding.startdate}" readonly></td>
	<tr>
	<tr>
		<th>enddate</th>
		<td><input type="date" value="${funding.enddate}" readonly></td>
	<tr>
	<tr>
		<th>fstatus</th>
		<td><input type="text" value="${funding.fstatus}" readonly></td>
	<tr>
	<tr>
		<th>tag</th>
		<td><input type="text" value="${funding.tag}" readonly></td>
	</tr>
	<tr>
		<th>creater</th>
		<td><input type="text" value="${funding.creater}" readonly></td>
	</tr>
	<tr>
		<th>furl</th>
		<td><input type="text" value="${funding.furl}" readonly></td>
	</tr>
	<tr>
		<th>category</th>
		<td><input type="text" value="${funding.category}"></td>
	</tr>
	<tr>
		<th>project_img</th>
		<td><input type="text" value="${funding.project_img}"></td>
	</tr>
	<tr>
		<th colspan="2">
		<input type="submit" value="수정!!"/>
		</th>
	</tr>
</table>
</form>
</body>
</html>