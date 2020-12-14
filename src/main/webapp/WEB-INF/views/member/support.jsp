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

<section>
	<div class="container">
		<div class="row">
			<div class="col-6">
				<span>0</span>건의 후원 내역이 있습니다.
			</div>
			<div class="col-4">
				<input placeholder="프로젝트 선물, 창작자를 검색하세" />
			</div>
		</div>
		
		
		<div class="" style="min-height:500px;">
		
		<ul>
			<li>후원 내역이 없습니다 .</li>
		</ul>
		
		</div>
	</div>

</section>






<%@ include file="../include/footer.jsp"%>