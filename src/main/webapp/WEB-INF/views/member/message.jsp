<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="sendList" value="${sendMap.sendList }"></c:set>
<c:set var="sendCount" value="${sendMap.sendCount }"></c:set>
<c:set var="receiveList" value="${receiveMap.receiveList }"></c:set>
<c:set var="receiveCount" value="${receiveMap.sendCount }"></c:set>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
					<li role="presentation" class="active"><a href="#ask" role="tab" data-toggle="tab" aria-expanded="true" onclick="reset()">받은 메시지</a></li>
					<li role="presentation" class=""><a href="#make" role="tab" data-toggle="tab" aria-expanded="false" onclick="reset()">보낸 메시지</a></li>
				</ul>
			</div>
		</div>
		
		
		<div class="row">
                    <div class="col-md-12">
                    
                    
                        <div class="product__details__tab__content">
                            <!-- Start Single Content -->
                            <div role="tabpanel" id="ask" class="product__tab__content fade in active">
                           		 <c:if test="${fn:length(receiveList) > 0}">
	                           		 <table class="table table-hover">
	                           		 	<tr>
	                           		 		<th><input type="checkbox" id="r"></th>
	                           		 		<th>보낸 사람</th>
	                           		 		<th>내용</th>
	                           		 		<th>받은 날짜</th>
	                           		 	</tr>
		                           		 <c:forEach var="receive" items="${receiveList}">
		                           		 	<tr>
		                           		 		<td><input type="checkbox" name="mno" value="${receive.mno}" data-chk="r"></td>
		                           		 		<td>${receive.sender}</td>
		                           		 		<td><a href="javascript:OpenWindow('messageDetail.do?mno=${receive.mno}&from=2','메시지',800,600);"><c:choose>
		                           		 			<c:when test="${receive.mcontent.length() >= 15}">
		                           		 				${fn:substring(receive.mcontent,0,14)}...
		                           		 			</c:when>
		                           		 			<c:otherwise>
		                           		 				${receive.mcontent}
		                           		 			</c:otherwise>
		                           		 		</c:choose> </a></td>
		                           		 		<td><fmt:formatDate value="${receive.regdate }" pattern="yyyy-MM-dd"/></td>
		                           		 	</tr>
		                           		 </c:forEach>
	                           		 </table>
	                           		 <input type="button" value="삭제" onclick="Remove()" class="btn btn-light">
                           		 </c:if>
                            </div>
                            <!-- End Single Content -->
                            
                            <!-- Start Single Content -->
                            <div role="tabpanel" id="make" class="product__tab__content fade">
                            	<c:if test="${fn:length(sendList) > 0}">
								  <table class="table table-hover">
                           		 	<tr>
                           		 		<th><input type="checkbox" id="s"></th>
                           		 		<th>받는 사람</th>
                           		 		<th>내용</th>
                           		 		<th>보낸 날짜</th>
                           		 		<th>읽기 여부</th>
                           		 	</tr>
	                           		 <c:forEach var="send" items="${sendList}">
	                           		 	<tr>
	                           		 		<td><input type="checkbox" name="mno" value="${send.mno}" data-chk="s"></td>
	                           		 		<td>${send.receiver}</td>
	                           		 		<td><a href="javascript:OpenWindow('messageDetail.do?mno=${send.mno}&from=1','메시지',800,600);"><c:choose>
	                           		 			<c:when test="${send.mcontent.length() >= 15}">
	                           		 				${fn:substring(send.mcontent,0,14)}...
	                           		 			</c:when>
	                           		 			<c:otherwise>
	                           		 				${send.mcontent}
	                           		 			</c:otherwise>
	                           		 		</c:choose></a></td>
	                           		 		<td><fmt:formatDate value="${send.regdate }" pattern="yyyy-MM-dd"/></td>
	                           		 		<td>${send.status}</td>
	                           		 	</tr>
	                           		 </c:forEach>
                           		 </table>
                           		 <input type="button" value="삭제" onclick="Remove2()" class="btn btn-light">
	                            </c:if>
                            </div>
                            <!-- End Single Content -->
                           
                            
                            
                        </div>
                    </div>
                </div>
		
	</div>
</section>
<script>
	const r = document.getElementById("r");
	const s = document.getElementById("s");
	const chk = document.getElementsByName("mno");
	
	r.addEventListener("change",function(){
		chk.forEach(function(e){
			if(r.checked){
				if(e.dataset.chk==="r"){
					e.checked=true
				}	
			}else{
				if(e.dataset.chk==="r"){
					e.checked=false
				}
			}
		});
	});
	
	s.addEventListener("change",function(){
		chk.forEach(function(e){
			if(s.checked){
				if(e.dataset.chk==="s"){
					e.checked=true
				}	
			}else{
				if(e.dataset.chk==="s"){
					e.checked=false
				}
			}
		});
	});
	
	
	function Remove() {
		
		const form = document.createElement("form");
		form.setAttribute("method", "post");  //Post 방식
		form.setAttribute("action", "messageRemove.do?from=2"); //요청 보낼 주소
		let count = 0;
		for(let i=0; i<chk.length; i++){
			if(chk[i].checked){
				const hiddenField = document.createElement("input");
				hiddenField.setAttribute("type","hidden");
				hiddenField.setAttribute("name","mno");
				hiddenField.setAttribute("value",chk[i].value);
				form.append(hiddenField);
				count++;
			}
		}
		
		if(count == 0){
			alert("선택된 메시지가 없습니다");
			return false;
		}
		document.body.appendChild(form);
        form.submit();
	}
	
	function Remove2() {
		
		const form = document.createElement("form");
		form.setAttribute("method", "post");  //Post 방식
		form.setAttribute("action", "messageRemove.do?from=1"); //요청 보낼 주소
		let count = 0;
		for(let i=0; i<chk.length; i++){
			if(chk[i].checked){
				const hiddenField = document.createElement("input");
				hiddenField.setAttribute("type","hidden");
				hiddenField.setAttribute("name","mno");
				hiddenField.setAttribute("value",chk[i].value);
				form.append(hiddenField);
				count++;
			}
		}
		
		if(count == 0){
			alert("선택된 메시지가 없습니다");
			return false;
		}
		
		document.body.appendChild(form);
        form.submit();
	}
	
	function reset(){
		for(let i=0; i<chk.length; i++){
			if(chk[i].checked){
				chk[i].checked = false;
			}
		}	
		r.checked = false;
		s.checked = false;
	}
</script>



<%@ include file="../include/footer.jsp"%>