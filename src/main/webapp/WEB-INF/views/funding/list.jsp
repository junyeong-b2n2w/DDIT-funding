<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<section class="ptb--20">
	<div class="container">
		<div class="row">
			<form action="list" role="form">
				<div class="col-md-12">
					<select name="category" class="form-control col-2">
						<option  ${cri.category eq '' ? 'selected':'' } value="">카테고리</option>
						<option ${cri.category eq '베이킹·디저트' ? 'selected':'' } value="베이킹·디저트">베이킹/디저트</option>
						<option ${cri.category eq '음료' ? 'selected':'' } value="음료">음료</option>
						<option ${cri.category eq '간편식' ? 'selected':'' } value="간편식">간편식</option>
						<option ${cri.category eq '요리책' ? 'selected':'' } value="요리책">요리책</option>
						<option ${cri.category eq '펫 푸드' ? 'selected':'' } value="펫 푸드">펫 푸드</option>
						<option ${cri.category eq '푸드 페스티벌/행사' ? 'selected':'' } value="푸드 페스티벌/행사">푸드 페스티벌/행사</option>
					</select>
					<div class="col-1">
						<input type="number" class="form-control" value="${cri.min_percent }" placeholder="%~" name="min_percent">
					</div>
					<div class="col-1">
						<input type="number" class="form-control" value="${cri.max_percent }"placeholder="~%" name="max_percent">
					</div>

					<select name="fstatus" class="form-control col-2">
						<option  ${cri.fstatus eq '' ? 'selected':'' }  value="">상태</option>
						<option  ${cri.fstatus eq 'soon' ? 'selected':'' }  value="soon">공개예정 프로젝트</option>
						<option  ${cri.fstatus eq 'ing' ? 'selected':'' }  value="ing">진행중인 프로젝트</option>
						<option  ${cri.fstatus eq 'success' ? 'selected':'' }  value="success">성공한 프로젝트</option>
					</select>


					<div class="col-2">
						<input name="keyword" class="form-control" value="${cri.keyword }" placeholder="작성자, 이름, 내용,태그 검색">
					</div>
					<div class="col-1">
						<input type="submit" class="form-control" value="검색하기">
					</div>
					<div class="col-1">
						<button type="reset" class="form-control" ><i class="fas fa-redo"></i> 검색 초기화</button>
					</div>

				</div>
			</form>
		</div>
	</div>
</section>


<section class="pt--10">
	<div class="container">
	<h3>총 <span style="color:#ff4136;">${totalCnt }</span> 건의 결과가 있습니다.</h3>
	</div></section>


<section class="ptb--20">
	<div class="container">
		<div class="row fundingList">
			<c:forEach items="${fundingList }" var="funding">

				<!-- Start Single Product -->
				<div class="col-md-3 single__pro col-lg-3 cat--1 col-sm-4 col-xs-12">
					<div class="product foo" data-sr-id="1" style="visibility: visible; -webkit-transform: translateY(0) scale(1); opacity: 1; transform: translateY(0) scale(1); opacity: 1; -webkit-transition: -webkit-transform 0.8s cubic-bezier(0.6, 0.2, 0.1, 1) 0s, opacity 0.8s cubic-bezier(0.6, 0.2, 0.1, 1) 0s; transition: transform 0.8s cubic-bezier(0.6, 0.2, 0.1, 1) 0s, opacity 0.8s cubic-bezier(0.6, 0.2, 0.1, 1) 0s;">
						<div class="product__inner">
							<div class="pro__thumb">
								<a href="#"> <img src="<%=request.getContextPath()%>/member/getPicture?picture=${funding.project_img}" style="width:270px;height:270px;" alt="product images">
								</a>
							</div>
							<div class="product__hover__info">
								<ul class="product__action">
								<c:set var="wstatus" value="far"></c:set>
									<c:if test="${!empty wishList }">
										<c:forEach var="wish" items="${wishList }">
											<c:if test="${funding.fno == wish.fno}">
												<c:set var="wstatus" value="fas"></c:set>
											</c:if>
										</c:forEach>
									</c:if>
									<li><a title="Wishlist" href="javascript:registWish(${funding.fno})"><i class="${wstatus} fa-heart f${funding.fno}"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="product__details">
							<p style="font-size: 0.8em; color: #DDDDDD;">
								<a href="<%=request.getContextPath()%>/funding/list?category=${funding.category}">${funding.category }</a> | <a>${funding.creater }</a>
							</p>
							<h2 style="width: 90%;padding: 0 5px;overflow: hidden;text-overflow: ellipsis;	white-space: nowrap;">
								<a href="<%=request.getContextPath()%>/funding/detail?fno=${funding.fno}" >${funding.title }</a>
							</h2>
							<div class="progress" style="height: 2px; margin-bottom: 3px; margin-top: 5px;">
								<div class="progress-bar bg-danger" role="progressbar" style="background-color: #ff4136; width: ${funding.percent }%;" aria-valuenow="${funding.percent } " aria-valuemin="0" aria-valuemax="100"></div>
							</div>
							<ul class="product__price">
								<li class="new__price" style="font-size: 0.8em"><span style="font-size: 0.9em; color: #333"> <fmt:formatNumber type="number" maxFractionDigits="3" value="${funding.price_pre }" />

								</span> ${funding.percent }% 달성  
								
									<c:if test="${ funding.fstatus eq 'success' }" >
										<i class="far fa-thumbs-up"></i>펀딩 성공</span>
									</c:if>
								
								<c:if test="${funding.fstatus eq 'ing'}" >
								<span> <jsp:useBean id="now" class="java.util.Date"/>
								 <fmt:formatDate value="${now }" pattern="yyyy-MM-dd" var="now2"/>
								<fmt:parseDate var="startDate" value="${now2 }" pattern="yyyy-MM-dd" />
						       <fmt:parseNumber value="${startDate.time / (1000*60*60*24)}" integerOnly="true" var="start" scope="request" />
						       <fmt:parseDate var="endDate" value="${funding.enddate}" pattern="yyyy-MM-dd" />
						       <fmt:parseNumber value="${endDate.time / (1000*60*60*24)}" integerOnly="true" var="end" scope="request" />
						      <i class="far fa-clock"></i> ${end - start} 일 남음</span>
								</c:if>
								
								<c:if test="${funding.fstatus eq 'fail' }" >
									<span><i class="far fa-times-circle"></i> 펀딩 실패 </span>
								</c:if>
								<c:if test="${funding.fstatus eq 'soon' }" >
									<span> <jsp:useBean id="now3" class="java.util.Date"/>
									<fmt:formatDate value="${now3 }" pattern="yyyy-MM-dd" var="now4"/>
									<fmt:parseDate var="startDate" value="${now4 }" pattern="yyyy-MM-dd" />
							       <fmt:parseNumber value="${startDate.time / (1000*60*60*24)}" integerOnly="true" var="start" scope="request" />
							       <fmt:parseDate var="endDate" value="${funding.startdate}" pattern="yyyy-MM-dd" />
							       <fmt:parseNumber value="${endDate.time / (1000*60*60*24)}" integerOnly="true" var="end" scope="request" />
							      <i class="far fa-calendar-alt"></i> 공개까지 ${end - start} 일 남음</span>								

								</c:if>
								
								</li>
								
							</ul>
						</div>
					</div>
				</div>
				<!-- End Single Product -->
			</c:forEach>

		</div>
	</div>
</section>



<!-- handlebars -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js"></script>

<script type="text/x-handlebars-template" id="funding-item-list-template">
{{#each .}}
			<div class="col-md-3 single__pro col-lg-3 cat--1 col-sm-4 col-xs-12">
				<div class="product foo" data-sr-id="1" style="visibility: visible; -webkit-transform: translateY(0) scale(1); opacity: 1; transform: translateY(0) scale(1); opacity: 1; -webkit-transition: -webkit-transform 0.8s cubic-bezier(0.6, 0.2, 0.1, 1) 0s, opacity 0.8s cubic-bezier(0.6, 0.2, 0.1, 1) 0s; transition: transform 0.8s cubic-bezier(0.6, 0.2, 0.1, 1) 0s, opacity 0.8s cubic-bezier(0.6, 0.2, 0.1, 1) 0s;">
					<div class="product__inner">
						<div class="pro__thumb">
							<a href="#"> <img src="<%=request.getContextPath()%>/member/getPicture?picture={{project_img}}" style="width:270px;height:270px;" alt="product images">
							</a>
						</div>
						<div class="product__hover__info">
							<ul class="product__action">
								<li><a title="Wishlist" href="javascript:registWish({{fno}})">{{{hasWish fno}}}</a></li>
							</ul>
						</div>
					</div>
					<div class="product__details">
						<p style="font-size: 0.8em; color: #DDDDDD;">
							<a href="<%=request.getContextPath()%>/funding/list?category={{category}}">{{category }}</a> | <a>{{creater }}</a>
						</p>
						<h2 style="width: 90%;padding: 0 5px;overflow: hidden;text-overflow: ellipsis;	white-space: nowrap;">
							<a href="<%=request.getContextPath()%>/funding/detail?fno={{fno}}">{{title }}</a>
						</h2>
						<div class="progress" style="height: 2px; margin-bottom: 3px; margin-top: 5px;">
							<div class="progress-bar bg-danger" role="progressbar" style="background-color: #ff4136; width: {{percent }}%;" aria-valuenow="{{percent }} " aria-valuemin="0" aria-valuemax="100"></div>
						</div>
						<ul class="product__price">
							<li class="new__price" style="font-size: 0.8em"> <span style="font-size:0.9em ;color:#333">
							{{commas price_pre }}

							</span> {{percent }}% 달성

							{{{dateFunction startdate enddate fstatus}}}
</li>

							
						</ul>
					</div>
				</div>
			</div>
{{/each}}
</script>





<script>
	window.onload=function(){
		form = $('form[role="form"]');
		$('select, input[type="number"]').on("change",function(){
			form.submit();
		});
		
		$('button[type="reset"]').on('click', function(){
			location.href="<%=request.getContextPath()%>/funding/list";
		})
	}
	
	let page = 1;
	
	
	
	Handlebars.registerHelper({
		"commas":function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		},
		"dateFunction":function dateFunction(date1, date2, status){
			if(status == 'ing' ){
				now = new Date();
				remain = Math.floor( ( date2 - now.getTime() ) / 1000/ 60 / 60 / 24 );
				return	 '<i class="far fa-clock"></i> '+remain+' 일 남음</span>'
			}else if(status == 'soon'){
				now = new Date();
				remain = Math.floor( ( date1 - now.getTime() ) / 1000/ 60 / 60 / 24 );
				return	 '<i class="far fa-calendar-alt"></i> 공개까지 '+remain+' 일 남음</span>'
				
			}else if(status == 'fail'){
				return '<span><i class="far fa-times-circle"></i> 펀딩 실패 </span>';
			}else if (status == 'success'){
				return '<i class="far fa-thumbs-up"></i>펀딩 성공</span>';
			}
		},
		"hasWish":function wishFunction(fno){
			if(${!empty wishList}){
				const s = ${wishList};
				for(let i=0; i<s.length; i++){
					if(fno == s[i]){
						return '<i class="fas fa-heart f'+fno+	'"></i>';
					}
				}
			}
			return '<i class="far fa-heart f'+fno+	'"></i>';
		}
	});
	
	function printData(fundingItemList,target,templateObject){
		var template=Handlebars.compile(templateObject.html());
		var html = template(fundingItemList);	
		target.append(html);
	}
	function getItemList(page){
		data = { 	page : page,
				category : $('select[name="category"]').val(),
				min_percent : $('input[name="min_percent"]').val(),
				max_percent : $('input[name="max_percent"]').val(),
				fstatus : $('select[name="fstatus"]').val(),
				keyword : $('input[name="keyword"]').val()
		};
		console.log(data);
		
		$.getJSON("<%=request.getContextPath()%>/funding/items",data,
				function(data) {
					//console.log(data);
					printData(data, $('.fundingList'),
							$('#funding-item-list-template'));
				});
	}
	function getDocumentHeight() {
		const body = document.body;
		const html = document.documentElement;
		return Math.max(body.scrollHeight, body.offsetHeight,
				html.clientHeight, html.scrollHeight, html.offsetHeight);
	};
	function getScrollTop() {
		return (window.pageYOffset !== undefined) ? window.pageYOffset
				: (document.documentElement || document.body.parentNode || document.body).scrollTop;
	}
	window.onscroll = function() {
		if (getScrollTop() < getDocumentHeight() - window.innerHeight)
			return;
		getItemList(++page);
	};
</script>


<%@ include file="../include/footer.jsp"%>