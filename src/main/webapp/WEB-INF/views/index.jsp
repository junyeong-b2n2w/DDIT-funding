<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>

<section class=" ptb--20 bg__white">
	<div class="container">

	</div>		
</section>

<section class="ptb--20">
	<div class="container">
		<h1>추천 항목</h1>
		<div class="row recommList">
		
		</div>
	</div>
</section>


<section class="ptb--20">
	<div class="container">
		<h1>진행중 프로젝트</h1>
		<div class="row ingList">
		
		</div>
	</div>
</section>

<section class="ptb--20">
	<div class="container">
		<h1>공개예정 프로젝트</h1>
		<div class="row soonList">
		
		</div>
	</div>
</section>

<section class="ptb--20">
	<div class="container">
		<h1>응원이 필요한 프로젝트</h1>
		<div class="row cheerupList">
		
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
								<li><a title="Wishlist" href="javascript:registWish({{fno}})"><i class="far fa-heart f{{fno}}	"></i></a></li>
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


recommnd = {
		perPageNum : 4
}


soon = { 	
		perPageNum : 8,
		fstatus : "soon"
};

ing = {
		perPageNum : 8,
		fstatus : "ing"
}

cheerup = {
		perPageNum : 8,
		min_percent : 80,
		max_percent :100,
		fstatus : "ing"
}



window.onload = function(){
	
getMainList(recommnd, $('.recommList') );
getMainList(ing, $('.ingList') );
getMainList(soon, $('.soonList') );
getMainList(cheerup, $('.cheerupList') );


}

Handlebars.registerHelper({
	"commas":function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	},
	"dateFunction":function dateFunction(date1, date2, status){
		if(status == 'ing' || status == 'success'){
			now = new Date();
			remain = Math.floor( ( date2 - now.getTime() ) / 1000/ 60 / 60 / 24 );
			return	 '<i class="far fa-clock"></i> '+remain+' 일 남음</span>'
		}else if(status == 'soon'){
			now = new Date();
			remain = Math.floor( ( date1 - now.getTime() ) / 1000/ 60 / 60 / 24 );
			return	 '<i class="far fa-calendar-alt"></i> 공개까지 '+remain+' 일 남음</span>'
			
		}else if(status == 'fail'){
			return '<span><i class="far fa-times-circle"></i> 펀딩 실패 </span>';
		}
	}
})




function printData(data,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(data);	
	target.append(html);
}

function getMainList(param, target){
	
	$.getJSON("<%=request.getContextPath()%>/funding/items",param,
			function(data) {
				//console.log(data);
				printData(data, target,
						$('#funding-item-list-template'));
			});
}
</script>

<%@ include file="include/footer.jsp"%>
