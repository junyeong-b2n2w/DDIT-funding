<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
    <style>
    	#naver_id_login{
    		margin: 7px;
    	}
    </style>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
    <title>Login Demo - Kakao JavaScript SDK</title>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    
    
        <!-- Start Login Register Area -->
        <div class="htc__login__register bg__white ptb--130" style="background: rgba(0, 0, 0, 0) url(images/bg/5.jpg) no-repeat scroll center center / cover ;">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <ul class="login__register__menu" role="tablist">
                            <li role="presentation" class="login active"><a href="#login" role="tab" data-toggle="tab">로그인</a></li>
                        </ul>
                    </div>
                </div>
                <!-- Start Login Register Content -->
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <div class="htc__login__register__wrap">
                            <!-- Start Single Content -->
                            <div id="login" role="tabpanel" class="single__tabs__panel tab-pane fade active in">
                                <form role="form"  class="login">
                                    <input type="text" name="email" placeholder="User email*">
                                    <input type="password" name="password" placeholder="Password*">
                                </form>
                                <div class="tabs__checkbox">
                                    <input type="checkbox">
                                    <span> Remember me</span>
                                    <span class="forget"><a href="<%=request.getContextPath()%>/common/findpassForm.do">Forget Pasword?</a></span>
                                </div>
                                <div class="htc__login__btn mt--30">
                                  <a onclick="submit();">Login</a> <a onclick="signup();">Sign Up</a>
                                </div>
                                  
                                <br>
                            </div>
                            <!-- End Single Content -->
                            <!-- Start Single Content -->
                            <div id="naver_id_login" style="text-align:center"><a href="${url}" >
							<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
                        </div>
                        <div id="naver_id_login" style="text-align:center">
                        <a id="kakao-login-btn" style="width: 39%;"></a>
						    <a href="http://developers.kakao.com/logout"></a>
						</div>
						 <div id="naver_id_login" style="text-align:center">
						    <a href="${facebook_url}"><button
                                    class="btn btn-primary btn-round" style="width: 39%; height:50px; font-size:1.3rem">
                                    <i class="fab fa-facebook-square"></i>  Facebook Login
                                </button></a> 
                       </div>
                    </div>
                </div>
                <!-- End Login Register Content -->
            </div>
        </div>
        <script>
	      
        Kakao.init('YOUR KEY NUMBER');
        // 카카오 로그인 버튼을 생성합니다.
        Kakao.Auth.createLoginButton({
            container: '#kakao-login-btn',
            success: function (authObj) {
                alert(JSON.stringify(authObj));
            },
            fail: function (err) {
                alert(JSON.stringify(err));
            }
        });
        function submit() {
    		$.ajax({
    			url : "<%=request.getContextPath()%>/common/login",
    			type: "post",
    			data: {email : $('input[name="email"]').val(),
    				   password : $('input[name="password"]').val()
    				  },
    			success : function(req) {
    				if(req){
    					
    					alert(req)
    				}else{
						location.href= "<%=request.getContextPath()%>/index"
    				}
				},
				error : function(req){
					alert(req);
				}
    			
    		})
    	}
        function signup() {
    		location.href="<%=request.getContextPath()%>/common/registForm";
    	}
        
        </script>
        <!-- End Login Register Area -->
     <%@ include file="../include/footer.jsp" %>