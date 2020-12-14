<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		cno: <input type="text" name="cno"	 value="${community.cno }"/>	
		fno:<input type="text" name="fno"	 value="${community.fno }"/>
		title: <input type="text" name="title"	 value="${community.title }"/>
		content: <input type="text" name="content"	 value="${community.content }"/>
		email: <input type="text" name="email"	 value="${community.email }"/>
		regdate: <input type="text" name="regdate"	 value="${community.regdate }"/>
		<input type="button" value="수정"> 
		<input type="button" value="삭제"> 
	</form>
	<h3>댓글을 뽑아보자</h3>
	<div class="reply"></div>
</body>
<script>
	const form = document.querySelector('form');
	
	document.querySelector('input[value="수정"]').onclick= function(){
		alert(this);
		form.setAttribute("action","modifyForm.do");
		form.setAttribute("method","post");
		form.submit();
	}
	
	document.querySelector('input[value="삭제"]').onclick= function(){
		form.setAttribute("action","remove.do");
		form.setAttribute("method","post");
		form.submit();
	}
	
	window.onload=function(){
		showReply();
	}
	
	  function showReply(){
		  const cno = document.querySelector('input[name="cno"]').value;
		  
		  // 요청
		  xhttp = new XMLHttpRequest();
		  xhttp.open('get', '<%=request.getContextPath()%>/reply/list.do?cno='+cno, true)
		  xhttp.send()
		    
		  //응답
		  xhttp.onreadystatechange = function() {
		      if(this.readyState == 4 && this.status == 200){
		          res = this.responseText;
		          jsondata = JSON.parse(res);
		          console.log(jsondata);
				  let code="";
				  for(let i=0; i<jsondata.length; i++){
					  code +="<form>"
					  code +='<input type="hidden" name="rpno" value="'+jsondata[i].rpno+'">';
					  code +='<input type="hidden" name="cno" value="'+jsondata[i].cno+'">';
					  code +='내용:<input type="text" name="title" value="'+jsondata[i].content+'">';
					  code +='작성자:<input type="text" name="email" value="'+jsondata[i].email+'">';
					  code +='<input type="text" name="regdate" value="'+jsondata[i].regdate+'">';
					  code +='<input type="button" value="수정" onclick="modify(this)">';
					  code +='<input type="button" value="삭제" onclick="remove(this)">';
					  code +="</form>"
				  }
		          document.querySelector('.reply').innerHTML=code;
		      }
		  }
		  
		  function modify(but){
			  const form = but.parentNode;
			  form.setAttribute("action","modify.do");
			  form.setAttribute("method","get");
			  form.submit();
		  }
		  
		  function remove(){
			  form.setAttribute("action","remove.do");
			  form.setAttribute("method","get");
			  form.submit();
		  }
	  }
	  
	  function modiAjax(){
		  
	  }
	  
	  function removeAjax(){
		  
	  }
</script>
</html>