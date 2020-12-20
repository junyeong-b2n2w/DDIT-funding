<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="sendList" value="${sendMap.sendList }"></c:set>
<c:set var="sendCount" value="${sendMap.sendCount }"></c:set>
<c:set var="receiveList" value="${receiveMap.receiveList }"></c:set>
<c:set var="receiveCount" value="${receiveMap.sendCount }"></c:set>

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
					<li role="presentation" class="active"><a href="#ask" role="tab" data-toggle="tab" aria-expanded="true">받은 메시지</a></li>
					<li role="presentation" class=""><a href="#make" role="tab" data-toggle="tab" aria-expanded="false">보낸 메시지</a></li>
				</ul>
			</div>
		</div>
		
		
		<div class="row">
                    <div class="col-md-12">
                    
                    
                        <div class="product__details__tab__content">
                            <!-- Start Single Content -->
                            <div role="tabpanel" id="ask" class="product__tab__content fade in active">
                           		 <div>
                           		  보낸사람 내용 날짜<br>
                           		 <c:forEach var="receive" items="${receiveList}">
                           		 	${receive.sender}| <a href="javascript:OpenWindow('messageDetail.do?mno=${receive.mno}&from=2','메시지',800,600);">${receive.mcontent }</a> | ${receive.regdate } | ${receive.status }<br>
                           		 </c:forEach>
                           		 </div>
                            </div>
                            <!-- End Single Content -->
                            
                            <!-- Start Single Content -->
                            <div role="tabpanel" id="make" class="product__tab__content fade">
								  <div>
                           		 받는사람 내용 날짜<br>
                           		 <c:forEach var="send" items="${sendList}">
                           		 	${send.receiver} | <a href="javascript:OpenWindow('messageDetail.do?mno=${send.mno}&from=1','메시지',800,600)">${send.mcontent }</a> | ${send.regdate } | ${send.status }<br>
                           		 </c:forEach>
                           		 </div>
                            </div>
                            <!-- End Single Content -->
                           
                            
                            
                        </div>
                    </div>
                </div>
		
	</div>
</section>



<%@ include file="../include/footer.jsp"%>