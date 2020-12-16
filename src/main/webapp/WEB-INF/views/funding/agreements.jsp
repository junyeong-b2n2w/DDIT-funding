<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<section class="pt--50 pb--50 mtb--120 bg__white" style="background: rgba(0, 0, 0, 0) url(<%=request.getContextPath() %>/resources/images/bg/2.jpg) ;">
	<div class="container">
	<div class="ProjectStartAgreements__ContentsBody-sc-1vrd6a2-1 hMCHfF">
		<h2 class="ProjectStartAgreements__Header-sc-1vrd6a2-2 gAoVXO">프로젝트를
			올리기 전에 확인해 주세요.</h2>
		<div class="ProjectStartAgreements__Guidance-sc-1vrd6a2-3 ipkmcm">
			텀블벅은 공개 검토 절차를 통해 창작자님이 작성한 프로젝트가 텀블벅의 정책을 준수하는지 확인하고 있습니다.<br>아래
			사항들을 확인한 후 프로젝트를 올려 주세요.
			<ul>
				<li><a
					href="https://help.tumblbug.com/hc/ko/articles/360052346633"
					target="_blank" rel="noopener noreferrer">프로젝트 공개검토 기준</a></li>
			</ul>
		</div>
		<form autocomplete="on" action="beforeRegistForm">
			<ul>
				<li><div
						class="_13KHfN73YmQgsYHxXvuh_J _3bQlo02zZkYjUBehiAWUDX ProjectStartAgreements__ServiceAgreementCheckbox-sc-1vrd6a2-4 iQcbCy">
						<input id="3f3ff" type="checkbox" required=""><label
							for="3f3ff" style="cursor: pointer;">새로운 아이디어를 실현하기 위한
							프로젝트입니다.</label>
					</div></li>
				<li><div
						class="_13KHfN73YmQgsYHxXvuh_J _3bQlo02zZkYjUBehiAWUDX ProjectStartAgreements__ServiceAgreementCheckbox-sc-1vrd6a2-4 iQcbCy">
						<input id="876d9" type="checkbox" required=""><label
							for="876d9" style="cursor: pointer;">이미 시판된 제품, 현금이나 지분 등
							수익 제공, 선물 없는 단순 기부, 성인 인증이 필요한 콘텐츠 등 기준에 맞지 않는 선물을 제공하지 않습니다.</label>
					</div></li>
				<li><div
						class="_13KHfN73YmQgsYHxXvuh_J _3bQlo02zZkYjUBehiAWUDX ProjectStartAgreements__ServiceAgreementCheckbox-sc-1vrd6a2-4 iQcbCy">
						<input id="3ddbe" type="checkbox" required=""><label
							for="3ddbe" style="cursor: pointer;">창작자의 신분증 혹은 사업자등록증,
							국내 은행 계좌, 연락 가능한 본인 휴대폰 번호가 있습니다.</label>
					</div></li>
				<li><div
						class="_13KHfN73YmQgsYHxXvuh_J _3bQlo02zZkYjUBehiAWUDX ProjectStartAgreements__ServiceAgreementCheckbox-sc-1vrd6a2-4 iQcbCy">
						<input id="30699" type="checkbox" required=""><label
							for="30699" style="cursor: pointer;">창작자 대표자는 19세 이상
							성인입니다.</label>
					</div></li>
			</ul>
			<button type="submit"
				class="Button-sc-1x93b2b-0 ProjectStartAgreements__SubmitButton-sc-1vrd6a2-5 iGkyrF">계속하기</button>
		</form>
	</div>
	</div>
</section>
<%@ include file="../include/footer.jsp"%>