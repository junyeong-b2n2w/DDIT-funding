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

<section>
	<div class="container">
		<div class="row">
			<div class="col-6">
				<span>0</span>건의 프로젝트가 있습니다.
			</div>
			<div class="col-4">
				<select>
					<option>추가순</option>
					<option>마감 임박순</option>
				</select>
			</div>
		</div>


		<div class="" style="min-height: 500px;">

			<ul>
				<li>좋아한 프로젝트가 없습니다 .</li>
			</ul>

		</div>
	</div>

</section>






<%@ include file="../include/footer.jsp"%>