<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>메시지</title>
</head>
<body>
	<form action="messageSend.do" method="post">
		받는사람  <input type="text" name="receiver" value="${param.receiver }" class="form-control" readonly="readonly">
		내용 
		<textarea rows="10" cols="10" name="mcontent" class="form-control"></textarea> <br>
		<input type="submit" value="전송" class="btn btn-light">
	</form>
</body>
</html>