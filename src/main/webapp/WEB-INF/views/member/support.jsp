<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>


<!-- 상단 안내 -->
<section>
	<div class="ht__bradcaump__area" style="padding-bottom:-50px; background: rgba(0, 0, 0, 0) url(<%=request.getContextPath()%>/resources/images/bg/2.jpg) no-repeat scroll center center / cover ;">
		<div class="ht__bradcaump__wrap">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<div class="bradcaump__inner text-center">
							<h2 class="bradcaump-title">
								<i class="fas fa-donate"></i>&nbsp;후원 현황
							</h2>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</section>

<section class="mtb--20">
	<div class="container">
		<div class="row">
			<div class="col-6" style="margin: 5px 0px">
				<span>0</span>건의 후원 내역이 있습니다.
			</div>
			<div class="col-4 ">
				<input class="form-control" placeholder="프로젝트 선물, 창작자를 검색하세" />
			</div>
		</div>
	</div>
</section>

<section class="mb--20">
	<div class="container">


		<div class="" style="min-height: 500px;">

			<!-- 후원성공 -->
			<h3 class="mt--20 mb--10" style="font-size:1.2em;">후원 성공 ( 2 )</h3>
			<!--  -->
			<div class="row" style="border:1px solid #aaaaaa; padding:15px; margin:5px; border-radius:5px;">
				<div class="col-2 text-center">
					<img src="<%=request.getContextPath()%>/resources/images/product-details/small-img/1.jpg">
				</div>
				<div class="col-8" style="padding-left:20px;">
					<p style="color:#cccccc; font-size:0.75em;"> 결제완료일 <span>2019.01.02</span> | 후원번호 <span>123123123</span></p>
					<p><strong style="font-size:1.2em;">펀딩 제목 </strong></p>
					<p>선물 내용</p>
					<ul style="list-style: disc; list-style-position: inside;">
						<li>선물 1</li>
						<li>선물 2</li>
					</ul>
					<p style="color:red; font-size:0.75em;"> 선물전달 완료일 2019.01.02 </p>
					<p style="font-size:0.75em;">33000원 결제 완료</p>
				</div>
			</div>
			<!--  -->
			
			<!-- 후원진행중 -->
			<h3 class="mt--20 mb--10" style="font-size:1.2em;">후원 진행중( 2 )</h3>
			<!--  -->
			<div class="row" style="border:1px solid #aaaaaa; padding:15px; margin:5px; border-radius:5px;">
				<div class="col-2 text-center">
					<img src="<%=request.getContextPath()%>/resources/images/product-details/small-img/1.jpg">
				</div>
				<div class="col-8" style="padding-left:20px;">
					<p style="color:#cccccc; font-size:0.75em;"> 후원일 <span>2019.01.02</span> | 후원번호 <span>123123123</span></p>
					<p><strong style="font-size:1.2em;">펀딩 제목 </strong></p>
					<p>선물 내용</p>
					<ul style="list-style: disc; list-style-position: inside;">
						<li>선물 1</li>
						<li>선물 2</li>
					</ul>
					<p style="font-size:0.75em;">33000원 결제 예약</p>
				</div>
			</div>
			<!--  -->
			
			<!-- 후원 실패 -->
			<h3 class="mt--20 mb--10" style="font-size:1.2em;">후원 실패( 2 )</h3>
			<!--  -->
			<div class="row" style="border:1px solid #aaaaaa; padding:15px; margin:5px; border-radius:5px;">
				<div class="col-2 text-center">
					<img src="<%=request.getContextPath()%>/resources/images/product-details/small-img/1.jpg">
				</div>
				<div class="col-8" style="padding-left:20px;">
					<p style="color:#cccccc; font-size:0.75em;"> 후원일 <span>2019.01.02</span> | 후원번호 <span>123123123</span></p>
					<p><strong style="font-size:1.2em;">펀딩 제목 </strong></p>
					<p>선물 내용</p>
					<ul style="list-style: disc; list-style-position: inside;">
						<li>선물 1</li>
						<li>선물 2</li>
					</ul>
					<p style="font-size:0.75em;">33000원 결제 예약취소</p>
					<p style="font-size:0.75em;"> 결제 예약취소일 2019.01.02 </p>
				</div>
			</div>
			<!--  -->
			<!--  -->
			<div class="row" style="border:1px solid #aaaaaa; padding:15px; margin:5px; border-radius:5px;">
				<div class="col-2 text-center">
					<img src="<%=request.getContextPath()%>/resources/images/product-details/small-img/1.jpg">
				</div>
				<div class="col-8" style="padding-left:20px;">
					<p style="color:#cccccc; font-size:0.75em;"> 후원일 <span>2019.01.02</span> | 후원번호 <span>123123123</span></p>
					<p><strong style="font-size:1.2em;">펀딩 제목 </strong></p>
					<p>선물 내용</p>
					<ul style="list-style: disc; list-style-position: inside;">
						<li>선물 1</li>
						<li>선물 2</li>
					</ul>
					<p style="font-size:0.75em;">33000원 결제 예약취소</p>
					<p style="font-size:0.75em;"> 결제 예약취소일 2019.01.02 </p>
				</div>
			</div>
			<!--  -->
			
		</div>


	</div>

</section>






<%@ include file="../include/footer.jsp"%>