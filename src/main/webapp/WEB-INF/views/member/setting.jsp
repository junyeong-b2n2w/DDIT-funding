<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
					<li role="presentation" class=""><a href="#payment" role="tab" data-toggle="tab" aria-expanded="false">결제수단</a></li>
					<li role="presentation" class=""><a href="#address" role="tab" data-toggle="tab" aria-expanded="false">배송지</a></li>
					<li role="presentation" class=""><a href="#notice" role="tab" data-toggle="tab" aria-expanded="false">알림</a></li>
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
								<div class="card-header" id="cre_img">
									<h2 class="mb-0">
										<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#creater_img" aria-expanded="true" aria-controls="#creater_img">프로필 사진 : <img src="${member.picture }"></button>
									</h2>
								</div>
								
								<div id="creater_img" class="collapse" aria-labelledby="cre_img" data-parent="#aco_profile">
									<div class="card-body">
										<div style="width: 30px; height: 30px; background-color: black; border-radius: 50%; display: inline-block;"></div>
										<input type="file" style="display: inline-block;" class="form-control-file" id="">
									</div>
								</div>
							</div>

							<div class="card">
								<div class="card-header" id="cre_name">
									<h2 class="mb-0">
										<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#creater_name" aria-expanded="true" aria-controls="#creater_name">이름: ${member.name}</button>
									</h2>
								</div>
								<div id="creater_name" class="collapse" aria-labelledby="cre_name" data-parent="#aco_profile">
									<div class="card-body">
									<div>이름 수정</div>
										<input class="form-control" type="text" placeholder="변경할 이름 작성" name="name">
										<button type="button" id="nameBtn">수정</button>
									</div>
								</div>
							</div>

							<div class="card">
								<div class="card-header" id="cre_comment">
									<h2 class="mb-0">
										<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#creater_comment" aria-expanded="true" aria-controls="#creater_comment">비밀번호: ${member.password}</button>
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
										<button type="button" id="passBtn">수정</button>
									</div>
								</div>
							</div>

							<div class="card">
								<div class="card-header" id="cre_site">
									<h2 class="mb-0">
										<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#creater_site" aria-expanded="true" aria-controls="#creater_site">포인트: ${member.point}</button>
									</h2>
								</div>
								<div id="creater_site" class="collapse" aria-labelledby="cre_site" data-parent="#aco_profile">
									<div class="card-body">
										http://www.funhading.com/<input class="form-control" type="text" placeholder="url">
									</div>
								</div>
							</div>

							<div class="card">
								<div class="card-header" id="cre_site">
									<h2 class="mb-0">
										<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#creater_site" aria-expanded="true" aria-controls="#creater_site">회원구분 ${member.dist}</button>
									</h2>
								</div>
								<div id="creater_site" class="collapse" aria-labelledby="cre_site" data-parent="#aco_profile">
									<div class="card-body">
										http://www.funhading.com/<input class="form-control" type="text" placeholder="url">
									</div>
								</div>
							</div>

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
								<td>배송지</td>
								<td>-</td>
							</tr>
							<c:forEach items="${addressList }" var="address">
								<tr data-ano="${address.ano }">
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