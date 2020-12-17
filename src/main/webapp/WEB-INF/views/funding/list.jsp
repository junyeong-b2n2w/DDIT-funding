<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<section class="ptb--20">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="filter__menu__container">
					<div class="product__menu">
						<button data-filter="*" class="is-checked">All</button>
						<button data-filter=".cat--1">Furnitures</button>
						<button data-filter=".cat--2">Bags</button>
						<button data-filter=".cat--3">Decoration</button>
						<button data-filter=".cat--4">Accessories</button>
					</div>
					<div class="filter__box">
						<a class="filter__menu" href="#">filter</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>




<section class="ptb--20">
	<div class="container">
		<div class="row">
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
</section>

<%@ include file="../include/footer.jsp"%>
