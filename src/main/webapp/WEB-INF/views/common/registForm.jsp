<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
    
        <!-- Start Login Register Area -->
        <div class="htc__login__register bg__white ptb--130" style="background: rgba(0, 0, 0, 0) url(images/bg/5.jpg) no-repeat scroll center center / cover ;">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <ul class="login__register__menu" role="tablist">
                            <li role="presentation" class="register active"><a href="#register" role="tab" data-toggle="tab">Register</a></li>
                        </ul>
                    </div>
                </div>
                <!-- Start Login Register Content -->
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <div class="htc__login__register__wrap">
                            
                            <!-- Start Single Content -->
                            <div id="register" role="tabpanel" class="single__tabs__panel tab-pane fade active in">
                                <form class="login" role="form" method="post" action="<%=request.getContextPath() %>/common/regist.do">
                                    <input type="text" name="name" placeholder="Name">
                                    
                                    <input type="email" id="email" name="email" placeholder="EX)cypi123@naver.com" >
                                    <button type="button" id="check">중복 확인</button>
                                    <span id="email_regular"></span>
	                       			<button type="button" id="auth" name="submits">이메일 인증받기 (이메일 보내기)</button>
	                       			
	                       			<input type="text" id= "checkEmail" name="email_injeung" placeholder=" 인증번호를 입력하세요.">
                        			<button id="injeung" type="button" name="submits">인증</button>
                        			
                                    <input type="password" id="password" name="password" placeholder="Password(영대소문자 ,숫자,특수문자 하나이상)">
                                    <span id="password_regular"></span>
                                    
                                    <input type="password" id="password_Check" placeholder="Password_Check">
                                    <span id="passwordCheck_regular"></span>
                                </form>
                                
                                <div class="tabs__checkbox">
                                    <input type="checkbox">
                                    <span> Remember me</span>
                                </div>
                                
                                <div class="htc__login__btn">
                                    <a onclick="submit_go();">regist</a>
                                </div>
                                <br>
                                <div class="htc__login__btn">
                                    <a onclick="back();">login</a>
                                </div>
                                
                                <div class="htc__social__connect">
                                    <h2>Or Login With</h2>
                                    <ul class="htc__soaial__list">
                                        <li><a class="bg--twitter" href="#"><i class="zmdi zmdi-twitter"></i></a></li>
                                        <li><a class="bg--instagram" href="#"><i class="zmdi zmdi-instagram"></i></a></li>
                                        <li><a class="bg--facebook" href="#"><i class="zmdi zmdi-facebook"></i></a></li>
                                        <li><a class="bg--googleplus" href="#"><i class="zmdi zmdi-google-plus"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <!-- End Single Content -->
                        </div>
                    </div>
                </div>
                <!-- End Login Register Content -->
            </div>
        </div>
        <div class="resp"></div>
          <script>
       	
	    var checkEmail = "";
       	var loginFlag = false;
          window.onload=function(){
       $('#check').on('click', function(){
    	 $.ajax({
    		url:"<%=request.getContextPath()%>/common/emailCheck.do",
    		type:"post",
    		data: {email : $('input[name="email"]').val()},
    		success:function(req){
    			if(req){
    				alert("사용가능한 이메일 입니다");
    				checkEmail=req;
    				$('input[name="email"]').val(req)
    				loginFlag = true;
    			}else{
    				alert("중복된 이메일입니다, 다시입력 하세요");
    				$('input[name="email"]').focus();
    			}
    		},
    		error:function(req){
    			
    		}
    	 })  
       }) 	  
       
       	$('#auth').on('click',function(){
		$.ajax({
			url:"<%=request.getContextPath()%>/common/auth.do",
			type:"post",
			data:  $('#email').serialize(),
			success:function(req){
				alert(req);
			},
			error:function(req){
				alert(req);
			}
		})
       	})
       	
       	 $('#injeung').on('click',function(){
       		$.ajax({
       			url:"<%=request.getContextPath()%>/common/join_injeung.do",
       			type:"post",
       			data: $('#checkEmail').serialize(),
       			success:function(req){
       				alert(req);
       			},
       			error:function(req){
       				alert(req);
       			}
       			})
       	
     		  	}) 
     		  	
     		$('#email').on('keyup',function(){
     			var email = $('#email').val().trim();
     			var reg =  /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
     			
     			if(!(reg.test(email))){
     				$('#email_regular').html("올바른 형식이 아닙니다").css('color','red');
     				if(email=="" || email == null){
     					$('#email_regular').text("");
     				}
     			}else{
     				$('#email_regular').html("올바른 형식 입니다").css('color','green');
     			}
     			
     			
     		})
     		
     		$('#password').on('keyup',function(){
     			var password = $('#password').val().trim();
     			var reg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_]).{4,20}$/;
     			
     			if(!(reg.test(password))){
     			$('#password_regular').html("올바른 형식이 아닙니다").css('color','red');
     				if(password =="" || password==null){
     					$('#password_regular').text("");
     				}
     			}else{
     			$('#password_regular').html("올바른 형식 입니다").css('color','green');
     			}
     		})
     		
     		$('#password_Check').on('keyup',function(){
     			var password = $('#password').val().trim();
     			var password_Check = $('#password_Check').val().trim();
				
     			if(password_Check==password){
     			$('#passwordCheck_regular').html("비밀번호가 일치합니다").css('color','green');
	     			if(password_Check =="" || password_Check==null){
	 					$('#passwordCheck_regular').text("");
	 				}
     			}else{
     				$('#passwordCheck_regular').html("비밀번호가 일치하지 않습니다").css('color','red');
     			}
     		})
     		
          }
        function back(){
        	location.href = "<%=request.getContextPath()%>/common/loginForm.do" ;
        }
          
          
          
        function submit_go() {
        	
        
        	
        	/* if($('input[name="email"]').val() != checkEmail ){
        		console.log("체크 이메일은 : "+checkEmail);
        		console.log("이메일 : "+ $('input[name="email"]').val());
        		
        		alert("중복확인을 다시해주세요");
        		return;
        	} */
        	
        	if($('input[name="name"]').val() == ""){
        		alert("이름은 필수 입니다");
        		return;
        	}
        	if($('input[name="email"]').val() == ""){
        		alert("이메일은 필수 입니다");
        		return;
        	}
        	
        	if(!loginFlag){
        		alert("이메일 중복 확인이 필요 합니다");
        		return;
        	}
        	
        	
        	if($('input[name="password"]').val() == ""){
        		alert("패스워드는 필수 입니다");
        		return;
        	}
        	
        	if($('input[name="name"]').val() == ""){
        		alert("이름은 필수 입니다");
        		return;
        	}
        	var form = $('form[role="form"]');
        	form.submit();
        }
    	
        </script>
        <!-- End Login Register Area -->
     <%@ include file="../include/footer.jsp" %>