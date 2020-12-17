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
	<h3>댓글을 뽑아보자 내용 작성자 날짜순</h3>
	<div class="reply"></div>
	<h3>댓글 입력</h3>
	<form>
		<input type="hidden" name="email" id="email" value="test">
		<input type="hidden" name="cno" id="cno" value="${community.cno }">
		<input type="text" name="content" id="content">
		<input type="button" value="전송">
	</form>
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
	
	document.querySelector('input[value="전송"]').onclick= function(){
		insertReply(this);
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
				  let code="";
				  for(let i=0; i<jsondata.length; i++){
					  code +="<form>"
					  code +='<input type="hidden" name="rpno" value="'+jsondata[i].rpno+'">';
					  code +='<input type="hidden" name="cno" value="'+jsondata[i].cno+'">';
					  code +='<input type="text" name="content" value="'+jsondata[i].content+'">';
					  code +='<input type="text" name="email" value="'+jsondata[i].email+'">';
					  code +='<input type="text" name="regdate" value="'+jsondata[i].regdate+'">';
					  code +='<input type="button" value="수정" onclick="modify(this)">';
					  code +='<input type="button" value="삭제" onclick="remove(this)">';
					  code +="</form>"
				  }
		          document.querySelector('.reply').innerHTML=code;
		      }
		  }
	  }
		  
		  function modify(but){
			  const form = but.parentNode;
		  	  const children = form.childNodes;
			  const rpno =  children[0].value;
			  const content = children[2].value;

				// 요청
			  xhttp = new XMLHttpRequest();
			  xhttp.open('get', '<%=request.getContextPath()%>/reply/modify.do?rpno='+rpno+'&content='+content, true)
			  xhttp.send()
			    
			  //응답
			  xhttp.onreadystatechange = function() {
			      if(this.readyState == 4 && this.status == 200){
		        	  location.reload();
			      }
			  }
		  }
		  
		  function remove(but){
			  const form = but.parentNode;
		  	  const children = form.childNodes;
		  	
		  	  const rpno =  children[0].value;
			// 요청
			  xhttp = new XMLHttpRequest();
			  xhttp.open('get', '<%=request.getContextPath()%>/reply/remove.do?rpno='+rpno , true)
			  xhttp.send()
			    
			  //응답
			  xhttp.onreadystatechange = function() {
			      if(this.readyState == 4 && this.status == 200){
			    	  location.reload();
			      }
			  }
			  
		  }
		  
		  function insertReply(but){
			  const email = document.querySelector('#email').value;
			  const cno = document.querySelector('#cno').value;
			  const content =  document.querySelector('#content').value;
			  
			  console.log(email);
			  console.log(cno);
			  console.log(content);
			  
			  
			// 요청
			  xhttp = new XMLHttpRequest();
			  xhttp.open('get', '<%=request.getContextPath()%>/reply/regist.do?email='+email+'&cno='+cno+'&content='+content, true)
			  xhttp.send()
			    
			  //응답
			  xhttp.onreadystatechange = function() {
			      if(this.readyState == 4 && this.status == 200){
			    	  location.reload();
			      }
			  }
		  }
	  
</script>
</html>