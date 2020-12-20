<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/header.jsp"%>

<section class="ptb--20">
	<div class="container">
		<div class="row">
			<form action="fList" role="form">
				<select class="form-control" name="fstatus">
					<option value="" selected="selected">전체</option>
					<option ${fstatus eq 'no_accept' ? 'selected':'' } value="no_accept">신청한 프로젝트</option>
					<option ${fstatus eq 'soon' ? 'selected':'' } value="soon">공개예정 프로젝트</option>
					<option ${fstatus eq 'ing' ? 'selected':'' } value="ing">진행중인 프로젝트</option>
					<option ${fstatus eq 'success' ? 'selected':'' } value="success">성공한 프로젝트</option>
					<option ${fstatus eq 'fail' ? 'selected':'' } value="fail">실패한 프로젝트</option>
				</select>
			</form>
		
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

		</div>
	</div>
</section>
<script type="text/javascript">

window.onload = function() {
	var form = $('form[role="form"]');
	
	$('select[name="fstatus"]').on("change",function(){
		form.submit();
	});
}
</script>
<%@ include file="../include/footer.jsp"%>