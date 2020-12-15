<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal" id="rewardModal">
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
        <button type="button" class="btn btn-primary" data-dismiss="modal">등록</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>  
  </div>
</div>

<script>
	window.addEventListener("load", function() {
		var cnt = 0
		$("#addItem").on("click", function () {
			var code = "";
			code += "<div>아이템 이름"
			code += "<input type='text'></div>"
			code += "<div>옵션"
			code += "<input type='radio' name='"+cnt+"option' value='없음' checked class='noOp' onchange='direct(this)'>"
			code += "없음"
			code += "<input type='radio' name='"+cnt+"option' value='직접입력'>"
			code += "<input type='text' placeholder='직접입력' name='direct'>"
			code += "</div>"
			$("#addItemLine").before(code)
			cnt++;
		})
		
	})		
	function direct(noOp) {
			noOp = $(noOp)
			if(noOp.prop("checked")){
				$(noOp).parents().children('input[name="direct"]').prop("disabled", true)
			} else{
				$(noOp).parents().children('input[name="direct"]').prop("disabled", false)
			}
		}
</script>