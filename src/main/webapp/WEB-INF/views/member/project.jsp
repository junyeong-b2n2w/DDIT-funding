<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 상단 안내 -->
<section>
	<div class="ht__bradcaump__area" style="padding-bottom:-50px; background: rgba(0, 0, 0, 0) url(<%=request.getContextPath()%>/resources/images/bg/2.jpg) no-repeat scroll center center / cover ;">
		<div class="ht__bradcaump__wrap">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<div class="bradcaump__inner text-center">
							<h2 class="bradcaump-title">
								<i class="fab fa-product-hunt"></i>&nbsp;내가 만든 프로젝트
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
		<h2 class="mt--30">
			<strong>작성중</strong>
		</h2>


		<div class="" style="min-height: 500px; padding: 50px;">

			<table class="table">
				<c:forEach var="funding" items="${fundingList}">
				<tr>
					<td style="width:30%"><img src="<%=request.getContextPath()%>/member/getPicture?picture=${funding.project_img}" style="width:270px;height:270px;" alt="product images"></td>
					<td style="width:50%"><div class="col-8"><a href="<%=request.getContextPath()%>/funding/detail.do?fno=${funding.fno}">${funding.title }</a></div></td>
					<td style="width:10%"><a href="<%=request.getContextPath()%>/funding/modifyForm.do?fno=${funding.fno}"><button class="btn btn-primary">수정</button></a>
					<td style="width:10%"><button type="button" class="btn btn-info" data-toggle="modal" data-target="#supporterModal" onclick="supporterList(${funding.fno})">후원자 관리</button></td>
				</tr>
				</c:forEach>
			</table>

		</div>
	</div>

</section>
<div class="modal" id="supporterModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">후원자 목록</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body" id="supporterList">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

<script>
		function supporterList(fno){
			$.ajax({
				url : "<%=request.getContextPath()%>/member/supporterList.do",
				data : {fno : fno},
				success : function(res){
					$("#supporterList").empty();
					code = "<table class='table table-bordered'>"
					code += "<tr><th>아이디</th><th>후원금</th><th>리워드</th><th>주소</th>"
					$.each(res, function(i){
						code+="<tr><td>"+res[i].email+"</td>"
						code+="<td>" + res[i].sprice + "</td><td>"
						$.each(res[i].ritems, function(i, t){
							code+=t.ritem
							code+="&nbsp;&nbsp;&nbsp;&nbsp;"+t.options + "<br>"
						})
						code += "</td><td>"+res[i].address+"</td></tr>"
					})
					code += "</table>"
					$("#supporterList").append(code)
				}
			})
		}
</script>



<%@ include file="../include/footer.jsp"%>