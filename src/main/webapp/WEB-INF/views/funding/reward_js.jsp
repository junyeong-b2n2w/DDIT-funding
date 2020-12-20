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
			code += "<div class='input-group mb-3'><div class='input-group-prepend'><span class='input-group-text'>아이템 이름</span></div>"
			code += "<input type='text' name='mrewardItem' class='form-control'></div>"
			code += "<div>"
			code += "옵션 : 없음<input type='radio' name='"+cnt+"option' value='없음' class='noOp' onchange='direct(this)' checked>"
			code += ""
			code += "직접입력<input type='radio' name='"+cnt+"option' onchange='direct(this)'>"
			code += "<input type='text' name='mitemOptions' value='없음' disabled class='mb-3'>"
			code += "<input type='button' onclick='deleteItem(this)' value='삭제x'>"
			code += "</div></div>"
			$("#addItem").before(code)
			cnt++;
		})
		
		$("#rewardItemRegist").on('click', function () {
			$("#rewardItemList").empty()
			var options = $("input[name='mitemOptions']")
			var rewardItems = $("input[name='mrewardItem']")
			var data = "<table border='1'><tr class='row'><th class='col-sm-4'>아이템 이름</th><th class='col-sm-8'>옵션</th>	</tr>";
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
				data += "<tr class='row'><td name='rewardItem'>" + rewardItems[i].value+ "</td><td name='itemOptions'>" + options[i].value + "</td></tr>"
			})
			if(!check){
				return
			}
			data += "<input type='hidden' class='itemcnt' value='"+(itemcnt+1)+"'>"
			data += "</table><br>"
			$("#rewardItemList").append(data)
			$("#rewardItemRegistBtn").trigger("click")
			$("#itemAddBtn").text("선물 수정")
		})
		
		$("#rewardRegist").on("click", function() {
			var options = $("td[name='itemOptions']")
			var ritem = $("td[name='rewardItem']")
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
			var code = "<div class='mt--20 selectReward' style='padding:20px; border-radius:10px; border:2px solid black'>"
			code += "<input type='button' onclick='deleteReward(this)' class='btn btn-danger' value='X'>"
			code += "<input type='button' onclick='modifyReward(this)' class='btn btn-warning' value='수정'><br>"
			code += "설정금액<input type='number' name='rprice' value='"+rprice+"' readonly  min='1000' step='1000' placeholder='천원 이상'>"
			code += "설정개수<input type='number' name='rcount' value='"+rcount+"' readonly  min='5' step='5' placeholder='5개 이상등록'>"
			code += "<input type='hidden' name='itemcnt' value='"+itemcnt+"' readonly>"
			$.each(options, function(i) {
				code+="아이템이름<input type='text' name='ritem' value='"+ritem.eq(i).text()+"' readonly style='width:150px'>"
				code+="옵션<input type='text' name='options' value='"+options.eq(i).text()+"' readonly style='width:150px'><br>"
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
	function deleteReward(reward){
		var reward = $(reward)
		var delChk = confirm("정말 지우시겠습니까?")
		if(delChk){
			reward.parents(".rewards").remove();
		}
	}
	function modifyReward(reward) {
		var reward = $(reward)
		reward.parents(".rewards").find("input[name='rprice']").prop("readonly",false)
		reward.parents(".rewards").find("input[name='rcount']").prop("readonly",false)
		reward.parents(".rewards").find("input[name='options']").prop("readonly",false)
		reward.parents(".rewards").find("input[name='ritem']").prop("readonly",false)
	}
</script>

















