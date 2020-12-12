<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<section class="htc__product__details pt--20 pb--50 bg__white">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">
                        <div class="product__details__container">
                            <div class="product__big__images">
                                <div class="portfolio-full-image tab-content">
                                    <div role="tabpanel" class="tab-pane fade in active product-video-position" id="img-tab-1">
                                        <img src="<%=request.getContextPath() %>/resources/images/product-details/big-img/10.jpg" alt="full-image">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6 col-sm-12 col-xs-12 smt-30 xmt-30">
                        <div class="htc__product__details__inner">
                            <div class="pro__detl__title">
                            <!-- 제목 -->
                                <h2>부루마부루우루루 제목 </h2>
                            </div>
                            <!--판매자 정보 사진첨부하고 하셈~ -->
                            <div class="pro__details">
                           		<p><i class="zmdi zmdi-circle"></i> 판매자 </p>
                            </div>
                            
                            
                            <ul class="pro__dtl__prize">
                                <li class="old__prize">모인금액</li>
                                <li>15,929,000 <span>원 <span class="percent">101</span>%</span></li>
                            </ul>
                            
                            <ul class="pro__dtl__prize">
                                <li class="old__prize">남은시간</li>
                                <li>13 <span>일</span></li>
                            </ul>
                            
                            
                            <blockquote>
	                           	<p><strong>펀딩 진행중</strong></p>
								<p>	목표 금액인 1,000,000원이 모여야만 결제됩니다.<br>
								결제는 2020년 12월 17일에 다함께 진행됩니다.</p>
							</blockquote>
                            
                            
                             <ul class="pro__dtl__prize">
                                <li class="old__prize">후원자</li>
                                <li>132 <span>명</span></li>
                            </ul>
                            
                            
                            
                            <ul class="pro__dtl__btn">
                                <li class="buy__now__btn"><a href="#">후원하기</a></li>
                                <li><a href="#"><span class="ti-heart"></span></a></li>
                                <li><a href="#"><span class="ti-sharethis"></span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>


<!-- divid -->

<section class="blog-details-wrap ptb--20 bg__white">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-lg-8 col-sm-12 col-xs-12">
                        <!--  왼쪽 -->
                        <div class="blog-details-left-sidebar">
                            <!-- 메뉴선택 바 -->
			                <div class="row">
			                    <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
			                        <ul class="product__deatils__tab mb--60" role="tablist">
			                            <li role="presentation" class="active">
			                                <a href="#story" role="tab" data-toggle="tab" aria-expanded="true">스토리</a>
			                            </li>
			                            <li role="presentation" class="">
			                                <a href="#community" role="tab" data-toggle="tab" aria-expanded="false">커뮤니티</a>
			                            </li>
			                            <li role="presentation" class="">
			                                <a href="#funding_info" role="tab" data-toggle="tab" aria-expanded="false">펀딩 안내</a>
			                            </li>
			                        </ul>
			                    </div>
			                </div>
			                
					                
					                <div class="row">
					                    <div class="col-md-12">
					                        <div class="product__details__tab__content">
					                        	<!--스토리탭 --> 
					                            <div role="tabpanel" id="story" class="fade active in">
					                                   story
					                            </div>
					                            <!-- 스토리 끝 -->
					                            
					                            
					                            
					                            <!-- 커뮤니티 -->
					                            <div role="tabpanel" id="community" class="fade">
													<div class="review__address__inner">
					                                    <!-- Start Single Review -->
					                                    <div class="pro__review">
					                                        <div class="review__thumb">
					                                            <img src="images/review/1.jpg" alt="review images">
					                                        </div>
					                                        <div class="review__details">
					                                            <div class="review__info">
					                                                <h4><a href="#">Gerald Barnes</a></h4>
					                                                <ul class="rating">
					                                                    <li><i class="zmdi zmdi-star"></i></li>
					                                                    <li><i class="zmdi zmdi-star"></i></li>
					                                                    <li><i class="zmdi zmdi-star"></i></li>
					                                                    <li><i class="zmdi zmdi-star-half"></i></li>
					                                                    <li><i class="zmdi zmdi-star-half"></i></li>
					                                                </ul>
					                                                <div class="rating__send">
					                                                    <a href="#"><i class="zmdi zmdi-mail-reply"></i></a>
					                                                    <a href="#"><i class="zmdi zmdi-close"></i></a>
					                                                </div>
					                                            </div>
					                                            <div class="review__date">
					                                                <span>27 Jun, 2016 at 2:30pm</span>
					                                            </div>
					                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer accumsan egestas elese ifend. Phasellus a felis at estei to bibendum feugiat ut eget eni Praesent et messages in con sectetur posuere dolor non.</p>
					                                        </div>
					                                    </div>
					                                    <!-- End Single Review -->
					                                    <!-- Start Single Review -->
					                                    <div class="pro__review ans">
					                                        <div class="review__thumb">
					                                            <img src="images/review/2.jpg" alt="review images">
					                                        </div>
					                                        <div class="review__details">
					                                            <div class="review__info">
					                                                <h4><a href="#">Gerald Barnes</a></h4>
					                                                <ul class="rating">
					                                                    <li><i class="zmdi zmdi-star"></i></li>
					                                                    <li><i class="zmdi zmdi-star"></i></li>
					                                                    <li><i class="zmdi zmdi-star"></i></li>
					                                                    <li><i class="zmdi zmdi-star-half"></i></li>
					                                                    <li><i class="zmdi zmdi-star-half"></i></li>
					                                                </ul>
					                                                <div class="rating__send">
					                                                    <a href="#"><i class="zmdi zmdi-mail-reply"></i></a>
					                                                    <a href="#"><i class="zmdi zmdi-close"></i></a>
					                                                </div>
					                                            </div>
					                                            <div class="review__date">
					                                                <span>27 Jun, 2016 at 2:30pm</span>
					                                            </div>
					                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer accumsan egestas elese ifend. Phasellus a felis at estei to bibendum feugiat ut eget eni Praesent et messages in con sectetur posuere dolor non.</p>
					                                        </div>
					                                    </div>
					                                    <!-- End Single Review -->
					                                </div>
					                                
					                            </div>
					                            <!-- End 커뮤니티 -->
					                            
					                            
					                            
					                            
					                            <!-- Start펀딩 인포  -->
					                            <div role="tabpanel" id="funding_info" class=" fade">
					                                
					                                펀딩 ㅓㅇ보 
					                                
					                            </div>
					                            <!-- End Single Content -->
					                        </div>
					                    </div>
					                </div>
                            
                            
                            
                        </div>
                    </div>
                    
    <!-- 오른쪽 -->
                    <div class="col-md-4 col-lg-4 col-sm-12 col-xs-12 smt-30 xmt-40">
        
                        <div class="blod-details-right-sidebar">
                        <!-- 창작자 소개 -->
                            <div class="" style="background: rgba(0, 0, 0, 0) url(<%=request.getContextPath() %>/resources/images/bg/2.jpg) ; padding:20px; border-radius:10px; ">
						          	<p><strong>창작자 소개</strong></p>
						          	<img class="ti-heart" /> <strong>김 아무개</strong>
						          	<p>녕하세요. 현재 작품활동 및 미술교육을 하고있는 임여송입니다. 외할머니와 함께 살적에 종종 미술활동을 함께 하다보니 할머니께서 그림에 취미를 가지게 되었습니다. 이제는 혼자서 심심하실 때마다 그림을 그리십니다. 스케치북과 간단한 크레파
						          	</p>
						          	<hr>
						          	<div style="font-color:#333333;">
						          	<p>마지막 로그인 <strong> 한 시간 전 </strong></p>
						          	<p>진행한 프로젝트 <strong class="plr--10">1</strong> 밀어준 프로젝트 <strong class="plr--10">1</strong> </p>
						          	<button class="btn text-center mt--10" style="width:100%; padding:5px;" href="#"> <i class="ti-email"></i>&nbsp;&nbsp;창작자에게 문의 하기</button>
						          	</div>
						        </div>
                            
                            <!-- 선물선택 기본 -->
                             	<div class="mt--20" style="background: rgba(0, 0, 0, 0) url(<%=request.getContextPath() %>/resources/images/bg/2.jpg) ; padding:20px; border-radius:10px; ">
						         <strong style="font-size:1.5rem">1,000 + </strong>
						         <p>선물을 선택하지 않고 밀어만 줍니다.</p>
						        </div>
                            <!-- 리워드 반복 -->
                            	<div class="mt--20" style="background: rgba(0, 0, 0, 0) url(<%=request.getContextPath() %>/resources/images/bg/2.jpg) ; padding:20px; border-radius:10px; ">
						         <p style=" margin:0px 10px 10px 0px ;"><i class="ti-check" ></i> <span>123</span>명이 선택</p>
						         <strong  style="font-size:1.5rem; margin-bottom:10px;">5,000 + </strong>
						         <p>선물 내용 ~</p>
						         <ul style="list-style:disc; list-style-position: inside; ">
						         	<li>선물 1</li>
						         	<li>선물 2</li>
						         
						         </ul>
						        </div>
						        
						        <div class="mt--20" style="background: rgba(0, 0, 0, 0) url(<%=request.getContextPath() %>/resources/images/bg/2.jpg) ; padding:20px; border-radius:10px; ">
						         <p style=" margin:0px 10px 10px 0px ;"><i class="ti-check" ></i> <span>123</span>명이 선택</p>
						         <strong  style="font-size:1.5rem; margin-bottom:10px;">5,000 + </strong>
						         <p>선물 내용 ~</p>
						         <ul style="list-style:disc; list-style-position: inside; ">
						         	<li>선물 1</li>
						         	<li>선물 2</li>
						         
						         </ul>
						        </div>
						        
						        <div class="mt--20" style="background: rgba(0, 0, 0, 0) url(<%=request.getContextPath() %>/resources/images/bg/2.jpg) ; padding:20px; border-radius:10px; ">
						         <p style=" margin:0px 10px 10px 0px ;"><i class="ti-check" ></i> <span>123</span>명이 선택</p>
						         <strong  style="font-size:1.5rem; margin-bottom:10px;">5,000 + </strong>
						         <p>선물 내용 ~</p>
						         <ul style="list-style:disc; list-style-position: inside; ">
						         	<li>선물 1</li>
						         	<li>선물 2</li>
						         
						         </ul>
						        </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </section>


<%@ include file="../include/footer.jsp" %>
