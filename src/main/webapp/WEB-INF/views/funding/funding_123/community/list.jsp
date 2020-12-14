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
	<c:forEach var="community" items="${communityList}" varStatus="status">
		<h3>cno:${community.cno }</h3>		
		<h3>fno:${community.fno }</h3>
		<h3>title:<a href="detail.do?cno=${community.cno}">${community.title }</a></h3>
		<h3>content:${community.content }</h3>
		<h3>email:${community.email }</h3>
		<h3>regdate:${community.regdate }</h3>
		<h3>replyCount:${community.replyCount }</h3>
	</c:forEach>
</body>
</html>