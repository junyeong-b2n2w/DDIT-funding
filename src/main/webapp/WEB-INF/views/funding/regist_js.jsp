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
			if($("#inputFile").val() == ""){
				alert("사진을 등록해주세요.")
				$('#nav-summary-tab').trigger('click');
				$('#imgBtn').trigger('click');
				$("#inputFile").click()
				return;
			}
			
			if($("input[name='title']").val() == ""){
				alert("프로젝트 제목을 입력해주세요")
				$('#nav-summary-tab').trigger('click');
				$('#titleBtn').trigger('click');
				$("input[name='title']").focus()
				return
			}
			
			if($("input[name='category']").val() == ""){
				alert("카테고리를 선택해주세요.")
				$('#nav-summary-tab').trigger('click');
				$('#catrgoryBtn').trigger('click');
				$("input[name='category']").focus()
				return
			}
			if($("input[name='name']").val() == ""){
				alert("이름은 필수입니다.")
				return
			}
			
			var form = $("form[role='form']")
			form.submit()
		})
	})
</script>