<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>
<c:set var="cri" value="${pageMaker.cri }" />
<section class="ptb--20">

	<div class="container">
	<h1>매니저 페이지</h1>
		<div class="row">
			<form action="fList" role="form">
				<div class="col-md-12 searchList">
				<input type="hidden" class="form-control" value="${cri.perPageNum }" name="perPageNum" / >
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
						<option ${cri.fstatus eq 'no_accept' ? 'selected':'' } value="no_accept">신청한 프로젝트</option>
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
	<h3>총 <span style="color:#ff4136;">${pageMaker.totalCount }</span> 건의 결과가 있습니다.</h3>
	</div></section>
.

<section class="ptb--20">
	<div class="container">
		<div class="row">
			
		
			<c:forEach items="${fList }" var="fList">
				<!-- Start Single Product -->
				<div class="col-md-3 single__pro col-lg-3 cat--1 col-sm-4 col-xs-12">
					<div class="product foo" data-sr-id="1" style="visibility: visible; -webkit-transform: translateY(0) scale(1); opacity: 1; transform: translateY(0) scale(1); opacity: 1; -webkit-transition: -webkit-transform 0.8s cubic-bezier(0.6, 0.2, 0.1, 1) 0s, opacity 0.8s cubic-bezier(0.6, 0.2, 0.1, 1) 0s; transition: transform 0.8s cubic-bezier(0.6, 0.2, 0.1, 1) 0s, opacity 0.8s cubic-bezier(0.6, 0.2, 0.1, 1) 0s;">
						<div class="product__inner">
							<div class="pro__thumb">
								<a href="#"> <img src="<%=request.getContextPath()%>/member/getPicture?picture=${fList.project_img}" style="width:270px;height:270px;" alt="product images">
								</a>
							</div>
							<div class="product__hover__info">
								<ul class="product__action">
									<li><a title="WishfList" href="#"><i class="far fa-heart"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="product__details">
							<p style="font-size: 0.8em; color: #DDDDDD;">
								<a>${fList.category }</a> | <a>${fList.creater }</a>
							</p>
							<h2 style="width: 90%;padding: 0 5px;overflow: hidden;text-overflow: ellipsis;	white-space: nowrap;">
								<input type="hidden" name="fno" value="${fList.fno }">
								<a href="<%=request.getContextPath() %>/funding/detail?fno=${fList.fno }">${fList.title }</a>
							</h2>
						</div>
					</div>
				</div>
				<!-- End Single Product -->
			</c:forEach>	
<%@include file="../common/pagination.jsp" %>
		</div>
	</div>
</section>
<script type="text/javascript">

window.onload = function() {
	form = $('form[role="form"]');
	$('select, input[type="number"]').on("change",function(){
		form.submit();
	});
	
	$('button[type="reset"]').on('click', function(){
		location.href="<%=request.getContextPath()%>/manager/fList";
	})
}
</script>
<%@ include file="../include/footer.jsp"%>