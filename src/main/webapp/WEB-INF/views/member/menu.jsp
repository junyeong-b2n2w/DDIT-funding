<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.test {
    width: 100%;
    margin: 0 auto;
    height: 800px;
    opacity: 0.9;
}
 
.modal-dialog {
    width: 90%;
    margin: 1.75rem auto;
}
.menu-extra {
    display: block;
    justify-content: flex-end;
}
.ti-user{
padding-left: 40%;
margin: 5%;
}
.menu-extra li {
    padding: 0 15px;
    margin: 5%;
}
</style>
<title></title>

</head>
<body>
<div>

<ul class="menu-extra">
	 <li><a href="<%=request.getContextPath()%>/member/message.do"><span class="ti-user" style="position: relative; left: 10px;">메시지</span></a></li>
	 <li><a href="<%=request.getContextPath()%>/member/support.do"><span class="ti-user">후원현황</span></a></li>
	 <li><a href="<%=request.getContextPath()%>/member/wishList.do"><span class="ti-user">좋아한 프로젝트</span></a></li>
	 <li><a href="<%=request.getContextPath()%>/member/project.do"><span class="ti-user">내가만든 프로젝트</span></a></li>
	 <li><a href="<%=request.getContextPath()%>/member/settings.do"><span class="ti-user">마이페이지</span></a></li>
	
	 <li><a href="<%=request.getContextPath()%>/common/logout.do"><span class="ti-user">logOut</span></a></li>
	 
 </ul>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
</div>
  
</body>

</html>


