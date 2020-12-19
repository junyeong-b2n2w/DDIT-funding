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
								<i class="far fa-heart"></i>&nbsp;좋아한 프로젝트
							</h2>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</section>

<section class="mb--20">
	<div class="container ">
		<div class="" style="min-height: 500px;">

			<div class="row">
				<div class="product__list another-product-style" style="">


<!--  -->
	<c:forEach items="${fundingList}" var="funding" varStatus="f">
		<div>
			<p>펀딩 제목 : <a href="<%=request.getContextPath() %>/funding/detail.do?fno=${funding.fno}">${funding.title }</a></p><br>
			<input type="hidden" value="${wishList.get(f.index).wno}">
			<input type="button" class="removeWish" value="삭제" onclick="remove(this)">
		</div> 
	</c:forEach>
<!--  -->
	<!-- Start Single Product -->
					<div class="col-md-3 single__pro col-lg-3 cat--1 col-sm-4 col-xs-12">
						<div class="product foo" data-sr-id="1" style="visibility: visible; -webkit-transform: translateY(0) scale(1); opacity: 1; transform: translateY(0) scale(1); opacity: 1; -webkit-transition: -webkit-transform 0.8s cubic-bezier(0.6, 0.2, 0.1, 1) 0s, opacity 0.8s cubic-bezier(0.6, 0.2, 0.1, 1) 0s; transition: transform 0.8s cubic-bezier(0.6, 0.2, 0.1, 1) 0s, opacity 0.8s cubic-bezier(0.6, 0.2, 0.1, 1) 0s;">
							<div class="product__inner">
								<div class="pro__thumb">
									<a href="#"> <img src="<%=request.getContextPath()%>/resources/images//product/1.png" alt="product images">
									</a>
								</div>
								<div class="product__hover__info">
									<ul class="product__action">
										<li><a title="Wishlist" href="#"><i class="far fa-heart"></i></a></li>
									</ul>
								</div>
							</div>
							<div class="product__details">
								<p style="font-size: 0.8em; color: #DDDDDD;">
									<a>카테고리</a> | <a>창작자</a>
								</p>
								<h2>
									<a href="product-details.html">프로젝트 제목오오</a>
								</h2>
								<div class="progress" style="height: 2px; margin-bottom: 3px; margin-top: 5px;">
									<div class="progress-bar bg-danger" role="progressbar" style="width: 125%;" aria-valuenow="124" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
								<ul class="product__price">
									<li class="new__price" style="font-size: 0.8em">1231% 달성</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- End Single Product -->


				</div>
			</div>

		</div>
	</div>

</section>







	<script>
		function remove(but){
			const par = but.parentNode.childNodes;
// 			console.log(par[4]);
			const wno = par[4].value;
		 	//요청
		 	xhttp = new XMLHttpRequest();
			xhttp.open('get', 'removeWish.do?wno='+wno, true)
			xhttp.send()
			  
			//응답
			xhttp.onreadystatechange = function() {
			    if(this.readyState == 4 && this.status == 200){
					location.reload();
			    }
			}
		}
	</script>
	
	<%@ include file="../include/footer.jsp"%>
	
