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
								<i class="fas fa-envelope"></i>&nbsp;메세지
							</h2>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</section>



<section class="htc__product__details__tab bg__white pb--120">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
				<ul class="product__deatils__tab mb--60" role="tablist">
					<li role="presentation" class="active"><a href="#ask" role="tab" data-toggle="tab" aria-expanded="true">문의/후원한 프로젝트</a></li>
					<li role="presentation" class=""><a href="#make" role="tab" data-toggle="tab" aria-expanded="false">만든 프로젝트</a></li>
				</ul>
			</div>
		</div>
		
		
		<div class="row">
                    <div class="col-md-12">
                    
                    
                        <div class="product__details__tab__content">
                            <!-- Start Single Content -->
                            <div role="tabpanel" id="ask" class="product__tab__content fade in active">
								<a class="btn btn-pirmary active">모든 메세지</a>
								<a class="btn btn-pirmary">보낸 메세지</a>
								<a class="btn btn-pirmary">안 읽은 메세지</a>
								
                           		 <div>
                           		 messagelist
                           		 </div>
                            </div>
                            <!-- End Single Content -->
                            
                            <!-- Start Single Content -->
                            <div role="tabpanel" id="make" class="product__tab__content fade">
								<a class="btn btn-pirmary active">모든 메세지</a>
								<a class="btn btn-pirmary">보낸 메세지</a>
								<a class="btn btn-pirmary">안 읽은 메세지</a>
								 <div>
                           		 messagelist
                           		 </div>
								
                            </div>
                            <!-- End Single Content -->
                           
                            
                            
                        </div>
                    </div>
                </div>
		
	</div>
</section>




<%@ include file="../include/footer.jsp"%>