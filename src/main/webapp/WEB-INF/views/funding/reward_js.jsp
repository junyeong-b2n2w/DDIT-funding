<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal" id="rewardItemModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      		<div id="addItemLine">
      			<div id="addItem"> + 아이템 추가하기</div>  
      		</div>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary" id="rewardItemRegist">등록</button>
        <button type="button" data-dismiss="modal" id="rewardItemRegistBtn" style="display: none;">등록</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>  
  </div>
</div>

<script>
	window.addEventListener("load", function() {
		var cnt = 0
		$("#addItem").on("click", function () {
			var code = "<div class='rewardItems'>";
			code += "<div>아이템 이름"
			code += "<input type='text' name='mrewardItem'></div>"
			code += "<div>옵션"
			code += "<input type='radio' name='"+cnt+"option' value='없음' class='noOp' onchange='direct(this)' checked>"
			code += "없음"
			code += "<input type='radio' name='"+cnt+"option' onchange='direct(this)'>"
			code += "<input type='text' name='mitemOptions' value='없음' disabled>"
			code += "<input type='button' onclick='deleteItem(this)' value='x'>"
			code += "</div></div>"
			$("#addItem").before(code)
			cnt++;
			
		})
		
		$("#rewardItemRegist").on('click', function () {
			$("#rewardItemList").empty()
			var options = $("input[name='mitemOptions']")
			var rewardItems = $("input[name='mrewardItem']")
			var data = "<div style='border:1px solid red'><ul>";
			var itemcnt = 0
			var check = true
			$.each(options, function(i) {
				itemcnt = i
				if(rewardItems[i].value == ""){
					$(rewardItems[i]).focus()
					alert("리워드 이름을 입력해주세요")
					check = false
					return false
				}
				if(options[i].value == ""){
					$(options[i]).focus()
					alert("옵션내용을 입력해주세요")
					check = false
					return false
				}
				data += "<li><span name='rewardItem'>" + rewardItems[i].value+ "</span><span name='itemOptions'>" + options[i].value + "</span></li>"
			})
			if(!check){
				return
			}
			data += "<input type='hidden' class='itemcnt' value='"+(itemcnt+1)+"'>"
			data += "</ul></div><br>"
			$("#rewardItemList").append(data)
			$("#rewardItemRegistBtn").trigger("click")
			$("#itemAddBtn").text("선물 수정")
		})
		
		$("#rewardRegist").on("click", function() {
			var options = $("span[name='itemOptions']")
			var ritem = $("span[name='rewardItem']")
			var rprice = $("#rewardPrice").val()
			var rcount = $("#rewardCount").val()
			var itemcnt = $(".itemcnt").val()
			if(rprice == ""){
				$("#rewardPrice").focus()
				alert("선물가격을 입력해주세요.")
				return
			}
			if(options.length==0){
				alert("선물내용을 등록해주세요.")
				$("#itemAddBtn").trigger("click")
				return
			}
			if(rcount == ""){
				$("#rewardCount").focus()
				alert("선물개수를 입력해주세요.")
				return
			}
			var code = "<div class='rewardRegistItemList'>"
			code += "<input type='text' name='rprice' value='"+rprice+"'>"
			code += "<input type='text' name='rcount' value='"+rcount+"'>"
			code += "<input type='text' name='itemcnt' value='"+itemcnt+"'>"
			$.each(options, function(i) {
				code+="<input type='text' name='options' value='"+options.eq(i).text()+"'>"
				code+="<input type='text' name='ritem' value='"+ritem.eq(i).text()+"'>"
			})
			code+="</div>"
			$("#rewardList").append(code)
			
			var options = $("span[name='itemOptions']")
			var ritem = $("span[name='rewardItem']")
			var rprice = $("#rewardPrice").val("")
			var rcount = $("#rewardCount").val("")
			var itemcnt = $(".itemcnt").val("")
			$('.rewardItems').remove()
			$("#rewardItemList").empty()
		})
		
	})		
	function direct(noOp) {
		noOp = $(noOp)
		if(noOp.val()=='없음'){
			$(noOp).parents().children("input[name='mitemOptions']").val("없음")
			$(noOp).parents().children("input[name='mitemOptions']").prop("disabled", true)
		} else{
			$(noOp).parents().children("input[name='mitemOptions']").val("")
			$(noOp).parents().children("input[name='mitemOptions']").attr("placeholder", "색상선택, 각인 등")
			$(noOp).parents().children("input[name='mitemOptions']").prop("disabled", false)
		}
	}
	function deleteItem(item) {
		var item = $(item)
		var delChk = confirm("정말 지우시겠습니까?")
		if(delChk){
			item.parents(".rewardItems").remove();
		}
	}
</script>

















