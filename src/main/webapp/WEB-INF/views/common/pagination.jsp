<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="cri" value="${pageMaker.cri }" />

 <nav aria-label="member list Navigation">
 	<ul class="pagination justify-content-center m-0">
 		<li class="page-item">
			<a class="page-link" href="javascript:searchList_go(1);">
				<i class="fas fa-angle-double-left"></i>
			</a>
		</li>
		<li class="page-item">
			<a class="page-link" href="javascript:searchList_go(
			${pageMaker.prev ? pageMaker.startPage-1 : -1});"> 
				<i class="fas fa-angle-left"></i>
			</a>
		</li>
		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">						
		<li class="page-item 
			<c:out value="${pageMaker.cri.page == pageNum?'active':''}"/>">
			<a class="page-link" href="javascript:searchList_go(${pageNum});" >${pageNum }</a>
		</li>
		</c:forEach>
		<li class="page-item">
			<a class="page-link" href="javascript:searchList_go(
			${pageMaker.next ? pageMaker.endPage+1 :-1}			
			);"><i class="fas fa-angle-right" ></i></a>
		</li>
		<li class="page-item">
			<a class="page-link" href="javascript:searchList_go(${pageMaker.realEndPage} );">
				<i class="fas fa-angle-double-right"></i></a>
		</li>	
 	</ul>
 </nav>
 
 
<form id="jobForm">
	<input type='hidden' name="page" value="${cri.page}" />
	<input type='hidden' name="perPageNum" value="${cri.perPageNum}"/>
	<input type='hidden' name="keyword" value="${cri.keyword }" />
		<input type='hidden' name="fstatus" value="${cri.fstatus }"/>
		<input type='hidden' name="category" value="${cri.category }"/>
		<input type='hidden' name="min_percent" value="${cri.min_percent }"/>
		<input type='hidden' name="max_percent" value="${cri.max_percent }"/>
	
</form>

<script>
function searchList_go(page,url){
	
	if(page<1)return;
	
	var perPageNum =16;
	if($('.searchList input[name="perPageNum"]').val()){
		perPageNum = $('.searchList input[name="perPageNum"]').val();
	}
	
	var jobForm=$('#jobForm');
	jobForm.find("[name='page']").val(page);
	jobForm.find("[name='perPageNum']").val(perPageNum);
	jobForm.find("[name='keyword']").val($('.searchList input[name="keyword"]').val());
	jobForm.find("[name='fstatus']").val($('.searchList select[name="fstatus"]').val());
	jobForm.find("[name='category']").val($('.searchList select[name="category"]').val());
	jobForm.find("[name='min_percent']").val($('.searchList input[name="min_percent"]').val());
	jobForm.find("[name='max_percent']").val($('.searchList input[name="max_percent"]').val());
	
	
	
	jobForm.attr("method","get");
	
		jobForm.attr("action","fList")
	
	jobForm.submit();
}
</script>

 
 
 
 
 
 