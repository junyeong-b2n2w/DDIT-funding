<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>

<section class=" ptb--20 bg__white">
	<div class="owl-carousel">
		<div style="backgroud-color:red;">Your Content</div>
		<div style="backgroud-color:yellow;">Your Content</div>
		<div style="backgroud-color:tomato;">Your Content</div>
		<div style="backgroud-color:green;">Your Content</div>
		<div style="backgroud-color:blue;">Your Content</div>
	</div>
</section>
<script>
window.onload = function(){
	$('.owl-carousel').owlCarousel({
	    loop:true,
	    margin:10,
	    nav:true,
	    responsive:{
	        0:{
	            items:1
	        },
	        600:{
	            items:3
	        },
	        1000:{
	            items:5
	        }
	    }
	})
	
	};
</script>
<section class="htc__product__area shop__page ptb--20 bg__white">
	<div class="container">
		<div class="htc__product__container">


			<h1 class="mt--40">추천 프로젝트</h1>
			<div class="row">
				<div class="product__list another-product-style" style="">

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
								<h2>
									<a href="product-details.html">Simple Black Clock</a>
								</h2>
								<ul class="product__price">
									<li class="old__price">$16.00</li>
									<li class="new__price">$10.00</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- End Single Product -->


				</div>
			</div>

			<h1 class="mt--40">성공한 프로젝트</h1>
			<div class="row">
				<div class="product__list another-product-style" style="">

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
								<h2>
									<a href="product-details.html">Simple Black Clock</a>
								</h2>
								<ul class="product__price">
									<li class="old__price">$16.00</li>
									<li class="new__price">$10.00</li>
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

<%@ include file="include/footer.jsp"%>
