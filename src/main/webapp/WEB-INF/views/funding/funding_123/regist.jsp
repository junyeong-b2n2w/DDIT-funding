<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<form role="registForm" action="regist.do">
		<table border="1">
			<tr>
				<th>writer</th>
				<td><input type="text" name="writer" value="test" readonly></td>
			<tr>
			<tr>
				<th>title</th>
				<td><input type="text" name="title"></td>
			<tr>
			<tr>
				<th>content</th>
				<td><input type="text" name="content"></td>
			<tr>
			<tr>
				<th>price_goal</th>
				<td><input type="text" name="price_goal"></td>
			<tr>
			<tr>
				<th>price_pre</th>
				<td><input type="text" name="price_pre"></td>
			<tr>
			<tr>
				<th>startdate</th>
				<td><input type="date" name="startdate"></td>
			<tr>
			<tr>
				<th>enddate</th>
				<td><input type="date" name="enddate"></td>
			<tr>
			<tr>
				<th>fstatus</th>
				<td><input type="text" name="fstatus"></td>
			<tr>
			<tr>
				<th>tag</th>
				<td><input type="text" name="tag"></td>
			</tr>
			<tr>
				<th>creater</th>
				<td><input type="text" name="creater"></td>
			</tr>
			<tr>
				<th>furl</th>
				<td><input type="text" name="furl"></td>
			</tr>
			<tr>
				<th>category</th>
				<td><input type="text" name="category"></td>
			</tr>
			<tr>
				<th>project_img</th>
				<td colspan="2"><input type="hidden" name="project_img" />
					<div id="pictureView"
						style="height: 100px; width: 100px; border-radius: 100px;"></div>
					<label for="inputFile">사진선택</label></td>
			</tr>
			<tr>
				<th>reward</th>
				<td id="reward"></td>
			</tr>
			<tr>
				<td colspan="2"><button type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#myModal">아이템 등록</button>
				</td>
			</tr>

			<tr>
				<th colspan="2"><input type="submit" value="등록!!" /></th>
			</tr>
		</table>
	</form>
	<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        Modal body..
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
	
</body>
<%@ include file="regist_js.jsp"%>
</html>