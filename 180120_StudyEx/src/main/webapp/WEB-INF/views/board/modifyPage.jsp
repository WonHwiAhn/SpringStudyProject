<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="../../resources/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function(){
			var formObj = $("form[role='form']");
			console.log(formObj);
			
			/* $(".btn-warning").on("click", function(){
				self.location = "/board/listAll";
			}); */
			
			//18.02.04 p.300
			$(".btn-warning").on("click", function(){
				self.location = "/board/listPage?page=${cri.page}&perPageNum=${cri.perPageNum}";
			}); 
			
			$(".btn-primary").on("click", function(){
				formObj.submit();
			});
		});
</script>
</head>
<body>
	<%@include file="../include/header.jsp"%>
	<form role="form" method="post">
		<!-- 18.02.04 p.299 페이지 히든을 이용해 목록으로 갔을 떄 해당 페이지로 이동 -->
		<input type='hidden' name='page' value="${cri.page}">
		<input  type='hidden' name='perPageNum' value="${cri.perPageNum}">
	
		<div class="box-body">
			<div class="form-group">
				<label for="exampleInputEmail1">BNO</label>
				<input type="text" name="bno" class="form-control" value="${boardVO.bno }" readonly="readonly">
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">Title</label>
				<input type="text" name="title" class="form-control" value="${boardVO.title}">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Content</label>
				<textarea class="form-control" name="content" rows="3">${boardVO.content }</textarea>
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">Writer</label>
				<input type="text" name="writer" class="form-control" value="${boardVO.writer}" readonly>
			</div>
		</div>
	</form>
	
	<div class="box-footer">
		<button type="submit" class="btn btn-primary">SAVE</button>
		<button type="submit" class="btn btn-warning">CANCEL</button>
	</div>
	
	<%@include file="../include/footer.jsp" %>
</body>
</html>