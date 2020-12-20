<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true"%>    
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
@import "compass/reset";
@import "compass/css3";
@import url(https://fonts.googleapis.com/css?family=Open + Sans:700, 300);
@import url(http://weloveiconfonts.com/api/?family=fontawesome);

/* fontawesome */
[class*="fa-"]:before {
  font-family: "FontAwesome", sans-serif;
}

body {
  font-family: "Open Sans", sans-serif;
  font-size: 16px;
  font-weight: 300;
  line-height: 1em;

  text-align: center;

  color: #444444;
  background-color: #d0d0d0;
}
h1 {
  font-size: 2.5em;

  margin: 2em 0 1em;
}
h2 {
  margin-bottom: 3em;
}
em,
strong {
  font-weight: 700;
}

header p {
  margin-bottom: 2em;
}


</style>
</head>
<body>
<header>
  <h1>Password <strong>Find</strong> Page</h1>
</header>
   <form action="<%=request.getContextPath()%>/common/findpass.do" method="post">

   
   가입했던 이메일 입력: <input type="email" name="email">
   
   <input type="submit" class="btn btn-primary" >
      
   </form>
   <input type="button" id="back" class="btn btn-danger" value="뒤로가기" onclick="back()">


</body>
<script>
   function back(){
      location.href = "<%=request.getContextPath()%>/common/loginForm.do" ;
   }
</script>

</html>