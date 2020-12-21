<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
body {
  background-size: 100% 100%;
  font-family: "Open Sans", sans-serif;
}
a.nostyle {
  color: inherit;
  text-decoration: none;
  padding: 0;
  margin: 0;
}
div.portfoliocard {
  position: relative;
  height: 550px;
  width: 600px;
  background: rgba(255, 255, 255, 1);
  border: 1px solid rgba(0, 0, 0, 0.7);
  box-shadow: 0px -1px 3px rgba(0, 0, 0, 0.1), 0px 2px 6px rgba(0, 0, 0, 0.5);
  border-radius: 6px;
  margin: 10% auto;
  overflow: hidden;
  z-index: 100;
}
div.portfoliocard div.coverphoto {
  width: 100%;
  height: 190px;
  background: url("https://s17.postimg.cc/ypm5ye95r/image.jpg");
  background-position: center center;
  border-top-right-radius: 5px;
  border-top-left-radius: 5px;
  border-bottom: 1px solid rgba(0, 0, 0, 0.1);
  box-shadow: inset 0px 3px 20px rgba(255, 255, 255, 0.3),
    1px 0px 2px rgba(255, 255, 255, 0.7);
  z-index: 99;
}
div.portfoliocard div.left_col,
div.portfoliocard div.right_col {
  float: left;
  height: 340px;
  overflow: scroll;
}
div.portfoliocard div.left_col {
  width: 40%;
  padding-top: 85px;
  box-sizing: border-box;
}
div.portfoliocard div.right_col {
  width: 60%;
  background: rgba(245, 245, 245, 1);
  border-left: 1px solid rgba(230, 230, 230, 1);
  box-shadow: inset 0px 1px 1px rgba(255, 255, 255, 0.7);
  margin-left: -1px;
  border-bottom-right-radius: 5px;
}
div.portfoliocard div.profile_picture {
  width: 110px;
  height: 110px;
  background: rgba(255, 255, 255, 1);
  position: absolute;
  top: 190px;
  left: 40px;
  border-radius: 100%;
  background-size: 100% 100%;
  padding: 7px;
  border: 4px solid rgba(255, 255, 255, 1);
}
div.portfoliocard div.right_col h2.name {
  font-size: 30px;
  font-weight: 300;
  color: rgba(30, 30, 30, 1);
  padding: 0;
  margin: 20px 10px 0px 30px;
}
div.portfoliocard div.right_col h3.location {
  font-size: 15px;
  font-weight: 300;
  color: rgba(170, 170, 170, 1);
  padding: 0;
  margin: -5px 10px 10px 30px;
}
div.portfoliocard ul.contact_information {
  margin-top: 20px;
  padding-left: 30px;
  list-style-type: none;
}
div.portfoliocard ul.contact_information li {
  height: 25px;
  width: 180px;
  line-height: 25px;
  font-weight: 300;
  font-size: 15px;
  color: rgba(140, 140, 140, 1);
  text-shadow: 1px 1px 1px rgba(255, 255, 255, 0.8);
  padding: 5px 0px;
  background-repeat: no-repeat;
  background-size: 18px 18px;
  border-bottom: 1px solid rgba(0, 0, 0, 0.1);
  box-shadow: 0px 1px 1px rgba(255, 255, 255, 0.6);
  cursor: default;
}
div.portfoliocard ul.contact_information li:before {
  content: "";
  width: 25px;
  height: 25px;
  display: block;
  float: left;
  background-position: center;
  background-size: 18px 18px;
  background-repeat: no-repeat;
  margin-right: 5px;
  opacity: 0.7;
}
div.portfoliocard ul.contact_information li:hover:before {
  opacity: 1;
}
div.portfoliocard ul.contact_information li.work:before {
  background-image: url("http://schulzmarcel.de/x/icons/case_24.png");
}
div.portfoliocard ul.contact_information li.website:before {
  background-image: url("http://schulzmarcel.de/x/icons/globe_24.png");
}
div.portfoliocard ul.contact_information li.mail:before {
  background-image: url("http://schulzmarcel.de/x/icons/paper_plane_24.png");
}
div.portfoliocard ul.contact_information li.phone:before {
  background-image: url("http://schulzmarcel.de/x/icons/phone_24.png");
}
div.portfoliocard ul.contact_information li.resume:before {
  background-image: url("http://schulzmarcel.de/x/icons/inbox_24.png");
}
div.portfoliocard div.followers,
div.portfoliocard div.following {
  margin: 15px 0px 0px 35px;
  font-weight: 300;
  font-size: 16px;
  color: rgba(30, 30, 30, 1);
}
div.portfoliocard div.follow_count {
  font-weight: 400;
  font-size: 25px;
  color: rgba(140, 140, 140, 1);
}

</style>
<!-- 상단 안내 -->
<section>
	<div class="ht__bradcaump__area" style="padding-bottom:-50px; background: rgba(0, 0, 0, 0) url(<%=request.getContextPath()%>/resources/images/bg/2.jpg) no-repeat scroll center center / cover ;">
		<div class="ht__bradcaump__wrap">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<div class="bradcaump__inner text-center">
							<h2 class="bradcaump-title">
								<i class="fas fa-cog"></i>&nbsp;설정
							</h2>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</section>

<section>
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
				<ul class="product__deatils__tab" role="tablist">
					<li role="presentation" class="active"><a href="#profile" role="tab" data-toggle="tab" aria-expanded="true">프로필</a></li>
					<li role="presentation" class=""><a href="#address" role="tab" data-toggle="tab" aria-expanded="false">배송지</a></li>
				</ul>
			</div>
		</div>


		<div class="row" style="font-size: 1rem">
         <div class="col-md-12">


            <div class="product__details__tab__content">
               <!-- Start Single Content -->
               <div role="tabpanel" id="profile" class="product__tab__content fade in active">

                  <div class="accordion" id="aco_profile">
					
                     <div class="card">
                       <div class="portfoliocard">
		<div class="coverphoto"></div>
		<div class="profile_picture">
			<div class="card-header" id="cre_img">
                 <h2 class="mb-0">
                   <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#creater_img" 
                          aria-expanded="true" aria-controls="#creater_img" style="position: relative; top: 30px;left: 50px;background: #675d5d;border-radius: 100%;color: white;">+</button><br>
                          <img class="profile_picture" style=" border-radius:100%; width: 150px;  position:relative; top: -80px;" src="getPicture.do?picture=${member.picture }">
                           </h2>
           </div>
               <div id="creater_img" class="collapse" aria-labelledby="cre_img" data-parent="#aco_profile">
                        <form role="imageForm" enctype="multipart/form-data">
                           <div class="card-body">
                           
                           <div style="    display: flex;">
                           <label for="inputFile" class="btn btn-warning">
                          		 파일 선택
                           </label>
                           <input id="inputFile" style="display:none" name="picture" type="file" >
                           <input id="oldFile"   name="oldPicture" type="hidden" value="${member.picture }"/> 
                           <input name="checkUpload" type="hidden" value="0" />
                           <button type="button" class="btn btn-danger" id="profileImgBtn"> 수정 </button>
                           </div>
                           
                           
                           </div>
                        </form>                              
                        </div>      
                        <div style="margin-bottom: 30px;">
                        
                           <span style="font-size: 1.9em;color: #a2697d;font-weight: 900;">Welcome</span>
                        </div>   
                           <span style="font-weight: 900;color: #a961b5;position: relative;left: 20px;">Profile List</span>
		</div>
		<div class="left_col">
			<div class="followers">
			</div>
			<div class="following">
			</div>
		</div>
		<div class="right_col">
				<div class="card">
                        <div class="card-header" id="cre_name">
                           <h3 class="mb-0" style="margin-top: 20px;margin-bottom: 20px;">
                           
                             <span style="font-family: fantasy;color: #846a6a; font-size: 1.8em; margin: 12%;">Name : </span>
                              <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#creater_name" 
                              aria-expanded="true" aria-controls="#creater_name">
                              <span style="position: relative; top: -5px;font-size: x-large;color: #242325;font-family: onospace;font-weight: bold;">${member.name}<span style="color: #9c9292;font-size: 0.7em;">(click)</span></span></button>
                           </h3>
                        </div>
                        <div id="creater_name" class="collapse" aria-labelledby="cre_name" data-parent="#aco_profile">
                           <div class="card-body">
                           <div>Name Update</div>
                              <input class="form-control" type="text" placeholder="변경할 이름 작성" name="name">
                              <button type="button" class="btn btn-danger" class="btn btn-primary" id="nameBtn">수정</button>
                           </div>
                        </div>
                     </div>
                     <div class="card">
                        <div class="card-header" id="cre_comment">
                           <h2 class="mb-0" style="margin-top: 20px;margin-bottom: 35px;" >
                             <span style="font-family: fantasy;color: #846a6a; font-size: 0.9em; margin: 12%;">Password : </span>
                              <button style="font-size: x-large; color: #242325; font-family: onospace; position:relative; top:-5px; bold;" class="btn btn-link" type="button" data-toggle="collapse" data-target="#creater_comment" aria-expanded="true" aria-controls="#creater_comment">
                              ${member.password}<span style="color: #9c9292;font-size: 0.7em;">(click)</span></button>
                           </h2>
                        </div>
                        <div id="creater_comment" class="collapse" aria-labelledby="cre_comment" data-parent="#aco_profile">
                           <div class="card-body">
                              <div>비밀번호 수정</div>
                              <div>
                                 <div>
                                    <span><input type="password" class="form-control" name="password" inputmode="password" pattern="[a-zA-Z0-9!@#$%^*_|]{6,20}" placeholder="변경할 비밀번호" autocomplete="off" autocapitalize="off" class="Input__InnerInput-j7moqy-1 bnACyJ" value=""></span>
                                 </div>
                                 <div>
                                    <span><input type="password" class="form-control" name="passwordCheck" inputmode="password" pattern="[a-zA-Z0-9!@#$%^*_|]{6,20}" placeholder="변경할 비밀번호 확인" autocomplete="off" autocapitalize="off" class="Input__InnerInput-j7moqy-1 bnACyJ" value=""></span>
                                    <span id="passcheck"></span>
                                 </div>
                              </div>
                              <button type="button" id="passBtn" class="btn btn-danger">수정</button>
                           </div>
                        </div>
                     </div>
                     
                     <div class="card-header" id="cre_comment" >
                           <h2 class="mb-0">
                             <span style="font-family: fantasy;color: #846a6a; font-size: 0.9em; margin: 12%;">Point : </span>
                              ${member.point}
                           </h2>
                        </div>
                     
                     
                     
					</div>
					</div>
                 </div>
<!--  
                     <div class="card">
                        <div class="card-header" id="cre_site">
                           <h2 class="mb-0">
                              <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#creater_site" aria-expanded="true" aria-controls="#creater_site">포인트: ${member.point}</button>
                           </h2>
                        </div>
                        
                     </div>

                     <div class="card">
                        <div class="card-header" id="cre_site">
                           <h2 class="mb-0">
                              <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#creater_site" aria-expanded="true" aria-controls="#creater_site">회원구분 ${member.dist}</button>
                           </h2>
                        </div>
                        
                     </div>
-->
                  </div>
                  <!-- 아코디언 -->


					</div>
					<!-- End Single Content -->

					<!-- Start Single Content -->
					<div role="tabpanel" id="account" class="product__tab__content fade">

						<div class="accordion" id="aco_account">

							<div class="card">
								<div class="card-header" id="acc_email">
									<h2 class="mb-0">
										<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#account_email" aria-expanded="true" aria-controls="#account_email">이메일</button>
									</h2>
								</div>
								<div id="account_email" class="collapse" aria-labelledby="#acc_email" data-parent="#aco_account">
									<div class="card-body">
										<input class="form-control" type="email" placeholder="이메일">
									</div>
								</div>
							</div>
							<div class="card">
								<div class="card-header" id="acc_pwd">
									<h2 class="mb-0">
										<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#account_pwd" aria-expanded="true" aria-controls="#account_pwd">비밀번호</button>
									</h2>
								</div>
								<div id="account_pwd" class="collapse" aria-labelledby="#acc_pwd" data-parent="#aco_account">
									<div class="card-body">
										<div>
											<div>
												<div>현재 비밀번호</div>
												<div>
													<span><input class="form-control" type="password" inputmode="password" pattern="[a-zA-Z0-9!@#$%^*_|]{6,20}" placeholder="현재 비밀번호" autocomplete="off" autocapitalize="off" value=""></span>
												</div>
												<div>
													비밀번호가 기억나지 않나요? <span ccolor="sub0180"><a href="/forgot-password">비밀번호 초기화</a></span>
												</div>
											</div>
											<div>
												<div>변경할 비밀번호</div>
												<div>
													<span><input type="password" class="form-control" inputmode="password" pattern="[a-zA-Z0-9!@#$%^*_|]{6,20}" placeholder="변경할 비밀번호" autocomplete="off" autocapitalize="off" class="Input__InnerInput-j7moqy-1 bnACyJ" value=""></span>
												</div>
												<div>
													<span><input type="password" class="form-control" inputmode="password" pattern="[a-zA-Z0-9!@#$%^*_|]{6,20}" placeholder="변경할 비밀번호 확인" autocomplete="off" autocapitalize="off" class="Input__InnerInput-j7moqy-1 bnACyJ" value=""></span>
												</div>
											</div>
											<div>
												<button class="btn btn-primary">
													<span>저장</span>
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>


							<div class="card">
								<div class="card-header" id="acc_phone">
									<h2 class="mb-0">
										<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#account_phone" aria-expanded="true" aria-controls="#"account_phone">연락처</button>
									</h2>
								</div>
								<div id="account_phone" class="collapse" aria-labelledby="#acc_phone" data-parent="#aco_account">
									<div class="card-body">
										<input class="form-control" type="email" placeholder="연락처">
									</div>
								</div>
							</div>

						</div>
						<!-- 아코디언 -->
					</div>
					<!-- End Single Content -->

					<!-- Start Single Content -->
					<div role="tabpanel" id="payment" class="product__tab__content fade"></div>
					<!-- End Single Content -->


					<!-- Start Single Content -->
					<div role="tabpanel" id="address"  class="col-12 product__tab__content fade">
					
					<div>
					<a href='javascript:window.open("<%=request.getContextPath() %>/address/registForm","주소추가","width=400,height=600")'  class="btn btn-info">주소 추가</a>
					
					</div>
					
					<div class="mx-auto" style="max-width:70%;">
						<table class="table mt--20 ">
							<tr>
								<td>별칭</td>
								<td>배송지</td>
								<td>-</td>
							</tr>
							<c:forEach items="${addressList }" var="address">
								<tr data-ano="${address.ano }">
									<td>${address.alias}
									<td>
										<div>
											<input type="hidden" name="email" value="${loginUser.email }">
											
											<p style="color: light-gray">${address.post }</p>
											<p>${address.addr1 }&nbsp;${address.addr2 }&nbsp;${address.re_Addr }</p>
											<p>${address.de_Addr }</p>
										</div>
									</td>
									<td><input type="button" data-ano="${address.ano }" value="X"><br></td>
								</tr>
							</c:forEach>
						</table>
						</div>
						<div class="aj"></div>
						<script>
							window.onload = function() {
								
								var imageURL = "getPicture.do?picture=${member.picture}";
								$('div#pictureView').css({'background' :'url('+imageURL+')',
														  'background-position':'center',
														  'background-size':'cover',
														  'background-repeat':'no-repeat'
														});
								
				
								$('#profileImgBtn').on('click',function(e){
									
									$.ajax({
										url : "<%=request.getContextPath()%>/member/modify.do",
										data: new FormData($("form[role='imageForm']")[0]),
									    enctype: 'multipart/form-data',
									    processData: false,
									    contentType: false,
									    cache: false,
										type:"post",
										success:function(req){
											location.reload();
										}
									})
								});
								
								
								$('#nameBtn').on('click',function(){
									$.ajax({
										url : "<%=request.getContextPath()%>/member/modify",
										data: {name : $('input[name="name"]').val()},
										type:"post",
										success:function(req){
											location.reload();
										}
									})
								});
								$('#passBtn').on('click',function(){
									var password = $('input[name="password"]').val().trim();
					     			var password_Check = $('input[name="passwordCheck"]').val().trim();
					     			
					     			
					     			if(password != password_Check){
					     				alert('비밀번호가 일지하지 않습니다.');
					     				return;
					     			}
									$.ajax({
										url : "<%=request.getContextPath()%>/member/modify",
										data: {password : $('input[name="password"]').val()},
										type:"post",
										success:function(req){
											location.reload();
										}
									})
								});
									
								$('input[name="passwordCheck"]').on('keyup',function(){
					     			var password = $('input[name="password"]').val().trim();
					     			var password_Check = $('input[name="passwordCheck"]').val().trim();
									
					     			if(password_Check==password){
					     			$('#passcheck').html("비밀번호가 일치합니다").css('color','green');
						     			if(password_Check =="" || password_Check==null){
						 					$('#passcheck').text("");
						 				}
					     			}else{
					     				$('#passcheck').html("비밀번호가 일치하지 않습니다").css('color','red');
					     			}
					     		})
					     		
								$('input[type="button"]').on('click',
										function() {
											var ano = $(this).data('ano');

											//alert(ano);
											$.ajax({
												url : "<%=request.getContextPath()%>/address/remove?ano=" + ano,
												success : function(e) {
													alert("삭제에 성공했습니다.");
													$('tr[data-ano="+ano+"]').remove();
												}

											})

										});
							}
						</script>

					</div>
					<!-- End Single Content -->


					<!-- Start Single Content -->
					<div role="tabpanel" id="notice" class="product__tab__content fade"></div>
					<!-- End Single Content -->



				</div>
			</div>
		</div>

	</div>

</section>




<%@ include file="../include/footer.jsp"%>