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
		<td>${funding.fno}</td>
	<tr>
	<tr>
		<th>writer</th>
		<td>${funding.writer}</td>
	<tr>
	<tr>
		<th>title</th>
		<td>${funding.title}</td>
	<tr>
	<tr>
		<th>content</th>
		<td>${funding.content}</td>
	<tr>
	<tr>
		<th>price_goal</th>
		<td>${funding.price_goal}</td>
	<tr>
	<tr>
		<th>price_pre</th>
		<td>${funding.price_pre}</td>
	<tr>
	<tr>
		<th>regdate</th>
		<td>${funding.regdate}</td>
	<tr>
	<tr>
		<th>startdate</th>
		<td>${funding.startdate}</td>
	<tr>
	<tr>
		<th>enddate</th>
		<td>${funding.enddate}</td>
	<tr>
	<tr>
		<th>fstatus</th>
		<td>${funding.fstatus}</td>
	<tr>
	<tr>
		<th>tag</th>
		<td>${funding.tag}</td>
	</tr>
	<tr>
		<th>creater</th>
		<td>${funding.creater}</td>
	</tr>
	<tr>
		<th>furl</th>
		<td>${funding.furl}</td>
	</tr>
	<tr>
		<th>category</th>
		<td>${funding.category}</td>
	</tr>
	<tr>
		<th>project_img</th>
		<td>${funding.project_img}</td>
	</tr>
	<tr>
		<th colspan="2">
		<input type="button" value="수정" onclick="location.href='modifyForm.do?fno=${funding.fno}'"/>
		<input type="button" value="삭제" onclick="location.href='remove.do?fno=${funding.fno}'"/>
		<input type="button" value="찜하기" onclick="wish()">
		</th>
	</tr>
</table>
</body>
	<script>
		function wish(){
			xhttp = new XMLHttpRequest();
			xhttp.open('GET','<%=request.getContextPath()%>/member/regishWish.do?fno=${funding.fno}', true) // 메소드, 이동할 주소, 비동기사용(true)
			xhttp.send();
			    
			//응답
			xhttp.onreadystatechange = function(){
				if(this.readyState == 4 && this.status == 200){
					alert(this.responseText)
				}
  			}
		}
	</script>
</html>