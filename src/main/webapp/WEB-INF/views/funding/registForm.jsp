<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<form action="regist.do" method="post" role="fundingForm">
	<section class="htc__product__details pt--20 pb--50 bg__white">
		<div class="container">
			<!-- 상단 메 -->
			<nav>
				<div class="nav nav-tabs text-center ptb--20" id="nav-tab"
					role="tablist">
					<a class="nav-item nav-link active" id="nav-summary-tab"
						style="margin: 20px 30px" data-toggle="tab" href="#nav-summary"
						role="tab" aria-controls="nav-summary" aria-selected="true">프로젝트
						개요</a> <a class="nav-item nav-link" id="nav-funding-tab"
						style="margin: 20px 30px" data-toggle="tab" href="#nav-funding"
						role="tab" aria-controls="nav-funding" aria-selected="false">펀딩
						및 선물 구성</a> <a class="nav-item nav-link" id="nav-stroy-tab"
						style="margin: 20px 30px" data-toggle="tab" href="#nav-story"
						role="tab" aria-controls="nav-stroy" aria-selected="false">스토리텔링</a>
					<a class="nav-item nav-link" id="nav-account-tab"
						style="margin: 20px 30px" data-toggle="tab" href="#nav-account"
						role="tab" aria-controls="nav-account" aria-selected="false">계좌
						설정</a>
				</div>
			</nav>

			<!-- inner인풋  -->
			<div class="tab-content" id="nav-tabContent">
				<!-- 프로젝트 개요  -->

				<div class="tab-pane fade container active in" id="nav-summary"
					role="tabpanel" aria-labelledby="nav-summary-tab">

					<div class="mtb--20"
						style="background-color: #eeeeee; padding: 50px">

						<h3>프로젝트 개요</h3>
						<div class="mtb--10">
							<div class="accordion" id="projectSummary">

								<div class="card">
									<div class="card-header" id="headdingTitle">
										<h2 class="mb-0">
											<button class="btn btn-link" type="button"
												data-toggle="collapse" data-target="#summary_title"
												aria-expanded="true" aria-controls="#summary_title"
												id="titleBtn">프로젝트 제목</button>
										</h2>
									</div>
									<div id="summary_title" class="collapse"
										aria-labelledby="headdingTitle" data-parent="#projectSummary">
										<div class="card-body">
											<input class="form-control" type="text" name="title"
												placeholder="프로젝트 제목">
										</div>
									</div>
								</div>

								<div class="card">
									<div class="card-header" id="headdingImage">
										<h2 class="mb-0">
											<button class="btn btn-link" type="button"
												data-toggle="collapse" data-target="#summary_img"
												aria-expanded="true" aria-controls="#summary_img"
												id="imgBtn">프로젝트 대표 이미지</button>
										</h2>
									</div>
									<div id="summary_img" class="collapse"
										aria-labelledby="headdingImage" data-parent="#projectSummary">
										<div class="card-body">
											<div
												style="width: 300px; height: 300px; background-color: black; display: inline-block;"
												id="pictureView"></div>
											<label for="inputFile" class="btn btn-primary">사진선택</label> <input
												type="hidden" name="project_img">
										</div>
									</div>
								</div>

								<div class="card">
									<div class="card-header" id="headding_cate">
										<h2 class="mb-0">
											<button class="btn btn-link" type="button"
												data-toggle="collapse" data-target="#summary_cate"
												aria-expanded="true" aria-controls="#summary_cate"
												id="catrgoryBtn">프로젝트 카테고리</button>
										</h2>
									</div>
									<div id="summary_cate" class="collapse"
										aria-labelledby="headding_cate" data-parent="#projectSummary">
										<div class="card-body">
											<select
												class="_13KHfN73YmQgsYHxXvuh_J _3_IGkn3uaje0g2ZA6Tx9wd _3vQWHh2J_erdzly2Ip3e87"
												name="category">
												<option value="" selected>프로젝트 카테고리를 정해주세요</option>
												<option value="베이킹·디저트">베이킹·디저트</option>
												<option value="음료">음료</option>
												<option value="간편식">간편식</option>
												<option value="요리책">요리책</option>
												<option value="펫 푸드">펫 푸드</option>
												<option value="푸드 페스티벌·행사">푸드 페스티벌·행사</option>
											</select>
										</div>
									</div>
								</div>

								<input type="hidden" id="basic-url"
									aria-describedby="basic-addon3" name="furl" value="empty">
								<div class="card">
									<div class="card-header" id="headding_tag">
										<h2 class="mb-0">
											<button class="btn btn-link" type="button"
												data-toggle="collapse" data-target="#summary_tag"
												aria-expanded="true" aria-controls="#summary_tag"
												id="tagBtn">검색용 태그</button>
										</h2>
									</div>
									<div id="summary_tag" class="collapse"
										aria-labelledby="headding_tag" data-parent="#projectSummary">
										<div class="card-body">
											<input type="text" class="form-control" name="tag"
												placeholder="태그는 #으로 구분해주세요">
										</div>
									</div>
								</div>

								<div class="card">
									<div class="card-header" id="cre_name">
										<h2 class="mb-0">
											<button class="btn btn-link" type="button"
												data-toggle="collapse" data-target="#creater_name"
												aria-expanded="true" aria-controls="#creater_name"
												id="createrBtn">창작자 이름</button>
										</h2>
									</div>
									<div id="creater_name" class="collapse"
										aria-labelledby="cre_name" data-parent="#creater">
										<div class="card-body">

											<input class="form-control" type="text" placeholder="창작자명"
												name="creater">
										</div>
									</div>
								</div>

							</div>
							<!-- 아코디언 -->
						</div>
					</div>
				</div>
				<!--  펀딩 및 선물구성  -->
				<div class="tab-pane fade" id="nav-funding" role="tabpanel"
					aria-labelledby="nav-funding-tab">
					<div class="mtb--20"
						style="background-color: #eeeeee; padding: 50px">

						<h3>펀딩 및 선물 구성</h3>
						<div class="mtb--10">
							<div class="accordion" id="funding">

								<div class="card">
									<div class="card-header" id="fun_goal">
										<h2 class="mb-0">
											<button class="btn btn-link" type="button"
												data-toggle="collapse" data-target="#funding_goal"
												aria-expanded="true" aria-controls="#funding_goal"
												id="priceGoalBtn">목표 금액</button>
										</h2>
									</div>
									<div id="funding_goal" class="collapse"
										aria-labelledby="#fun_goal" data-parent="#funding">
										<div class="card-body">
											<input class="form-control" type="number" placeholder="목표 금액"
												name="price_goal" min="1000000" step="100000">
										</div>
									</div>
								</div>

								<div class="card">
									<div class="card-header" id="fun_open_date">
										<h2 class="mb-0">
											<button class="btn btn-link" type="button"
												data-toggle="collapse" data-target="#funding_open_date"
												aria-expanded="true" aria-controls="#funding_open_date"
												id="startDateBtn">프로젝트 공개 일시</button>
										</h2>
									</div>
									<div id="funding_open_date" class="collapse"
										aria-labelledby="fun_open_date" data-parent="#funding">
										<div class="card-body">
											<input class="form-control" type="date" placeholder=""
												name="startdate">
										</div>
									</div>
								</div>

								<div class="card">
									<div class="card-header" id="fun_end_date">
										<h2 class="mb-0">
											<button class="btn btn-link" type="button"
												data-toggle="collapse" data-target="#funding_end_date"
												aria-expanded="true" aria-controls="#funding_end_date"
												id="endDateBtn">프로젝트 마감 일시</button>
										</h2>
									</div>
									<div id="funding_end_date" class="collapse"
										aria-labelledby="fun_end_date" data-parent="#funding">
										<div class="card-body">
											<input class="form-control" type="date" placeholder=""
												name="enddate">
										</div>
									</div>
								</div>
								<div class="card">
									<div class="card-header" id="fun_reward">
										<h2 class="mb-0">
											<button class="btn btn-link" type="button"
												data-toggle="collapse" data-target="#funding_reward"
												aria-expanded="true" aria-controls="#funding_reward"
												id="rewardBtn">선물 구성</button>
										</h2>
									</div>
									<div id="funding_reward" class="collapse"
										aria-labelledby="fun_reward" data-parent="#funding">
										<div class="card-body">
											<input type="number" id="rewardPrice" min="1000" step="1000"
												placeholder="천원 이상">원 이상 후원해주신 분들께 드리는 선물입니다. <br>
											<button type="button" class="btn btn-warning col-sm-12"
												data-toggle="modal" data-target="#rewardItemModal"
												id="itemAddBtn">선물 추가</button>
											<div id="rewardItemList"></div>
											<input type="number" id="rewardCount" min="5" step="5"
												placeholder="5개 이상등록">개 제한 <input id="rewardRegist"
												class="btn btn-primary" type="button" value="선물등록"
												style="float: right;">
											<div id="rewardList">
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 아코디언 -->
						</div>
					</div>
				</div>
				<!-- 스토리 텔링 -->
				<div class="tab-pane fade" id="nav-story" role="tabpanel"
					aria-labelledby="nav-story-tab">
					<div class="mtb--20"
						style="background-color: #eeeeee; padding: 50px">

						<h3>펀딩 및 선물 구성</h3>
						<div class="mtb--10">
							<div class="accordion" id="storytelling">

								<div class="card">
									<div class="card-header" id="sto_tell">
										<h2 class="mb-0">
											<button class="btn btn-link" type="button"
												data-toggle="collapse" data-target="#story_tell"
												aria-expanded="true" aria-controls="#story_tell"
												id="contentBtn">프로젝트 스토리</button>
										</h2>
									</div>
									<div id="story_tell" class="collapse"
										aria-labelledby="#sto_tell" data-parent="#storytelling">
										<div class="card-body">
											<textarea class="form-control" placeholder="스토리를 입력해주세요"
												rows="2" style="width: 100%;" name="content" id="content"></textarea>
										</div>
									</div>
								</div>
							</div>
							<!-- 아코디언 -->
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="nav-account" role="tabpanel"
					aria-labelledby="nav-account-tab">계좌 설정</div>
			</div>
		</div>
		<input name="writer" value="${loginUser.email}" type="hidden">

		<input type="button" value="등록" class="btn btn-danger col-sm-12" style="height: 50px"
			id="fundingRegistBtn">
		</div>
	</section>
</form>


<%@ include file="reward_js.jsp"%>
<%@ include file="regist_js.jsp"%>
<%@ include file="../common/summernote.jsp"%>
<%@ include file="../include/footer.jsp"%>