<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form role="imageForm" enctype="multipart/form-data">
	<input id="inputFile" name="pictureFile" type="file" style="display: none;" onchange="imageChange_go();">
	<input id="oldFile"	name="oldPicture" type="hidden"/> 
	<input name="checkUpload" type="hidden" value="0" />
</form>

<script>
	function preViewPicture(inputImage,target){
		if (inputImage.files && inputImage.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	        	//이미지 미리보기	        	
	        	target.css({'background-image':'url('+e.target.result+')',
					  'background-position':'center',
					  'background-size':'cover',
					  'background-repeat':'no-repeat'
	        		});
	        }
	        reader.readAsDataURL(inputImage.files[0]);
	        upload_go()
		}
	}
	function imageChange_go(){
		$('input[name="checkUpload"]').val(0);
		var fileObj = $("#inputFile").val()
		pathHeader = fileObj.lastIndexOf("\\");
        pathMiddle = fileObj.lastIndexOf(".");
        pathEnd = fileObj.length;
        fileName = fileObj.substring(pathHeader+1, pathMiddle);
        extName = fileObj.substring(pathMiddle+1, pathEnd);
        allFilename = fileName+"."+extName;
		$('input[name="project_img"]').val(allFilename);
		preViewPicture($('input#inputFile')[0],$("div#pictureView"));
	}
	function upload_go(){
		if($('input[name="pictureFile"]').val()==""){
			alert("사진을 선택 하세요");
			$('input[name="pictureFile"]').click();
			return;
		};	
			//form 태그 양식을 객체화
		var form = new FormData($('form[role="imageForm"]')[0]);
		
		$.ajax({
			url : "<%=request.getContextPath()%>/funding/picture.do",
			data : form,
			type : 'post',
			processData : false,
			contentType : false,
			success : function(data) {
				$('input[name="checkUpload"]').val(1);
				$('input#oldFile').val(data);
				$('input[name="project_img"]').val(data);
				$('label[for="inputFile"]').text("사진변경");
			},
		})
	}
	
	window.addEventListener("load", function() {
		$("#fundingRegistBtn").on("click", function() {
			if($("input[name='title']").val() == ""){
				$('#nav-summary-tab').trigger('click');
				$('#titleBtn').trigger('click');
				$("input[name='title']").focus()
				alert("프로젝트 제목을 입력해주세요")
				return
			}
			
			if($("#inputFile").val() == ""){
				$('#nav-summary-tab').trigger('click');
				$('#imgBtn').trigger('click');
				alert("사진을 등록해주세요.")
				$("#inputFile").click()
				return;
			}
			
			if($("select[name='category']").val() == ""){
				$('#nav-summary-tab').trigger('click');
				$('#catrgoryBtn').trigger('click');
				$("select[name='category']").focus()
				alert("카테고리를 선택해주세요.")
				return
			}
			if($("input[name='furl']").val() == ""){
				$('#nav-summary-tab').trigger('click');
				$('#urlBtn').trigger('click');
				$("input[name='url']").focus()
				alert("URL을 입력해주세요.")
				return
			}
			if($("input[name='tag']").val() == ""){
				$('#nav-summary-tab').trigger('click');
				$('#tagBtn').trigger('click');
				$("input[name='tag']").focus()
				alert("태그를 입력해주세요.")
				return
			}
			if($("input[name='creater']").val() == ""){
				$('#nav-summary-tab').trigger('click');
				$('#createrBtn').trigger('click');
				$("input[name='creater']").focus()
				alert("창작자명을 입력해주세요.")
				return
			}
			if($("input[name='price_goal']").val() == ""){
				$('#nav-funding-tab').trigger('click');
				$('#priceGoalBtn').trigger('click');
				$("input[name='price_goal']").focus()
				alert("목표금액을 설정해주세요.")
				return
			}
			if($("input[name='startdate']").val() == ""){
				$('#nav-funding-tab').trigger('click');
				$('#startDateBtn').trigger('click');
				$("input[name='startdate']").focus()
				alert("공개일시를 설정해주세요.")
				return
			}
			if($("input[name='enddate']").val() == ""){
				$('#nav-funding-tab').trigger('click');
				$('#endDateBtn').trigger('click');
				$("input[name='enddate']").focus()
				alert("마감일시를 설정해주세요.")
				return
			}
			if($(".rewardRegistItemList").length == 0){
				$('#nav-funding-tab').trigger('click');
				$('#rewardBtn').trigger('click');
				alert("리워드는 한개이상 필요합니다.")
				$("#itemAddBtn").click()
				return
			}
			if($("textarea[name='content']").val() == ""){
				$('#nav-stroy-tab').trigger('click');
				$('#contentBtn').trigger('click');
				$("textarea[name='content']").focus()
				alert("프로젝트 내용을 입력해주세요.")
				return
			}
			
			var form = $("form[role='fundingForm']")
			form.submit()
		})
		
		
		$("input[name=startdate]").on("change", function() {
			var date = new Date($("input[name=startdate]").val());
			var today = new Date();
			
			if(today.getTime() > date.getTime()) {
				alert("현재날짜 이후로만 가능합니다.")			
				$("input[name=startdate]").val("")
			}
			
		})
		$("input[name=enddate]").on("change", function() {
			var start = new Date($("input[name=startdate]").val());
			var end = new Date($("input[name=enddate]").val());
			var minimum = 1000 * 60 * 60 * 24 *7
			if($("input[name=startdate]").val()==""){
				alert("시작일시를 먼저 설정해주세요")
				$("input[name='enddate']").val("")
				$('#startDateBtn').trigger('click');
				$("input[name='startdate']").focus()
			}
			if((end.getTime()-start.getTime()) < minimum) {
				alert("시작일시 이후로 7일후부터 가능합니다.")			
				$("input[name='enddate']").val("")
				$("input[name='enddate']").focus()
			}
		})
	})
</script>