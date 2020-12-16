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
	<form action="<%=request.getContextPath()%>/common/findpass.do" method="post">
	
	가입했던 이메일 입력: <input type="text" name="email">
	
	<input type="submit" >
	</form>
	<input type="button" id="back" value="뒤로가기" onclick="back()">
</body>
<script>
	function back(){
		location.href = "<%=request.getContextPath()%>/common/loginForm.do" ;
	}
</script>

</html>