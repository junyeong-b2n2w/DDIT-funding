<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<ul class="menu-extra">

	 <li><a href="<%=request.getContextPath()%>/member/message.do"><span class="ti-user">메시지</span></a></li>
	 <li><a href="<%=request.getContextPath()%>/member/support.do"><span class="ti-user">후원현황</span></a></li>
	 <li><a href="<%=request.getContextPath()%>/member/like.do"><span class="ti-user">좋아한 프로젝트</span></a></li>
	 <li><a href="<%=request.getContextPath()%>/member/project.do"><span class="ti-user">내가만든 프로젝트</span></a></li>
	 <li><a href="<%=request.getContextPath()%>/member/settings.do"><span class="ti-user">마이페이지</span></a></li>
	 
	 
	 <li><a href="<%=request.getContextPath()%>/common/logout.do"><span class="">logOut</span></a></li>
	 
 </ul>
 
</body>
</html>