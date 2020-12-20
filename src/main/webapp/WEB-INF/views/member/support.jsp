<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="saleListSuccess" value="${dataMap.saleListSuccess }"></c:set>
<c:set var="saleListFail" value="${dataMap.saleListFail }"></c:set>
<c:set var="saleListIng" value="${dataMap.saleListIng }"></c:set>

<c:set var="rewardItemListSuccess" value="${dataMap.rewardItemListSuccess }"></c:set>
<c:set var="rewardItemListFail" value="${dataMap.rewardItemListFail }"></c:set>
<c:set var="rewardItemListIng" value="${dataMap.rewardItemListIng }"></c:set>

<c:set var="fundingListSuccess" value="${dataMap.fundingListSuccess }"></c:set>
<c:set var="fundingListFail" value="${dataMap.fundingListFail }"></c:set>
<c:set var="fundingListIng" value="${dataMap.fundingListIng }"></c:set>

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
				<span>${fn:length(saleListSuccess)+fn:length(saleListFail)+fn:length(saleListIng)}</span>건의 후원 내역이 있습니다.
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
			<h3 class="mt--20 mb--10" style="font-size:1.2em;">후원 성공 ( ${fn:length(saleListSuccess)} )</h3>
			<!--  -->
			<c:forEach var="success" items="${saleListSuccess }" varStatus="i">
			<div class="row" style="border:1px solid #aaaaaa; padding:15px; margin:5px; border-radius:5px;">
				<div class="col-2 text-center">
					<img src="<%=request.getContextPath()%>/member/getPicture?picture=${fundingListSuccess.get(i.index).project_img}" style="width:270px;height:270px;" alt="product images">
				</div>
				<div class="col-8" style="padding-left:20px;">
					<p><strong style="font-size:1.2em;"><a href="<%=request.getContextPath()%>/funding/detail.do?fno=${fundingListSuccess.get(i.index).fno }">${fundingListSuccess.get(i.index).title }</a> </strong></p>
					<p>선물 내용</p>
					<ul style="list-style: disc; list-style-position: inside;">
						<c:forEach items="${rewardItemListSuccess.get(i.index)}" var="reward">
								<li>${reward.ritem }</li>
						</c:forEach>
					</ul>
					<p style="font-size:0.75em;">${success.sprice }원 결제 완료</p>
				</div>
			</div>
			<!--  -->
			</c:forEach>
			
			<!-- 후원진행중 -->
			<h3 class="mt--20 mb--10" style="font-size:1.2em;">후원 진행중( ${ fn:length(saleListIng)} )</h3>
			<!--  -->
			<c:forEach var="ing" items="${saleListIng }" varStatus="i">
			<div class="row" style="border:1px solid #aaaaaa; padding:15px; margin:5px; border-radius:5px;">
				<div class="col-2 text-center">
					<img src="<%=request.getContextPath()%>/member/getPicture?picture=${fundingListIng.get(i.index).project_img}" style="width:270px;height:270px;" alt="product images">
				</div>
				<div class="col-8" style="padding-left:20px;">
					<p><strong style="font-size:1.2em;"><a href="<%=request.getContextPath()%>/funding/detail.do?fno=${fundingListIng.get(i.index).fno }">${fundingListIng.get(i.index).title }</a> </strong></p>
					<p>선물 내용</p>
					<ul style="list-style: disc; list-style-position: inside;">
						<c:forEach items="${rewardItemListIng.get(i.index)}" var="reward">
								<li>${reward.ritem }</li>
						</c:forEach>
					</ul>
					<p style="font-size:0.75em;">${ing.sprice }원 결제 완료</p>
					<input type="button" value="취소" onclick="logRemove(${ing.sno })">
				</div>
			</div>
			<!--  -->
			</c:forEach>
			<!--  -->
			
			
			<!-- 후원 실패 -->
			<h3 class="mt--20 mb--10" style="font-size:1.2em;">후원 실패( ${fn:length(saleListFail)} )</h3>
			<!--  -->
			<c:forEach var="fail" items="${saleListFail }" varStatus="i">
			<div class="row" style="border:1px solid #aaaaaa; padding:15px; margin:5px; border-radius:5px;">
				<div class="col-2 text-center">
					<img src="<%=request.getContextPath()%>/member/getPicture?picture=${fundingListFail.get(i.index).project_img}" style="width:270px;height:270px;" alt="product images">
				</div>
				<div class="col-8" style="padding-left:20px;">
					<p><strong style="font-size:1.2em;"><a href="<%=request.getContextPath()%>/funding/detail.do?fno=${fundingListFail.get(i.index).fno }">${fundingListFail.get(i.index).title }</a> </strong></p>
					<p>선물 내용</p>
					<ul style="list-style: disc; list-style-position: inside;">
						<c:forEach items="${rewardItemListFail.get(i.index)}" var="reward">
								<li>${reward.ritem }</li>
						</c:forEach>
					</ul>
					<p style="font-size:0.75em;">${fail.sprice }원 결제 완료</p>
				</div>
			</div>
			<!--  -->
			</c:forEach>
			
			
		</div>


	</div>

</section>


<script>
	function logRemove(sno) {
		xhttp = new XMLHttpRequest();
		xhttp.open('get', 'cancel.do?sno='+sno, true)
		xhttp.send()
		    
		xhttp.onreadystatechange = function() {
			if(this.readyState == 4 && this.status == 200){
				location.reload();
			}
		}
	}
</script>



<%@ include file="../include/footer.jsp"%>