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
		
		$(".btn-warning").on("click", function(){
			formObj.attr("action", "/board/modify");
			formObj.attr("method", "get");
			formObj.submit();
		});
		
		//18.02.03 주석처리 -- 삭제할 때 자꾸 여기로 타서 주석처리....
		//밑에 이벤트 잘못줘서 그랬었던거임..
		$(".btn-danger").on("click", function(){
			formObj.attr("action", "/board/remove");
			formObj.submit();
		});
		
		$(".btn-primary").on("click", function(){
			self.location = "/board/listAll";
		});
		
		//18.02.01 p.294 클릭이벤트 추가
		$(".goListBtn").on("click", function(){
			formObj.attr("method", "get");
			formObj.attr("action", "/board/listPage");
			formObj.submit();
		});
		
		//18.02.03 p.296
		$(".removeBtn").on("click", function(){
			formObj.attr("action", "/board/removePage");
			formObj.submit();
		});
		
		//18.02.04 p.298
		$(".modifyBtn").on("click", function(){
			formObj.attr("action", "/board/modifyPage");
			formObj.attr("method", "get");
			formObj.submit();
		});
	});
</script>
</head>
<body>
	<%@include file="../include/header.jsp"%>
	<!-- 18.02.01
		 page 및 perPageNum추가 p.294 -->
	<form role="form" action="modifyPage" method="post">
		<input type='text' name='bno' value="${boardVO.bno }">
		<input type='text' name='page' value="${cri.page}">
		<input type='text' name='perPageNum' value="${cri.perPageNum}">
	</form>
	
	<div class="box-body">
		<div class="form-group">
			<label for="exampleInputEmail1">Title</label>
			<input type="text" name="title" class="form-control" value="${boardVO.title }" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">Content</label>
			<textarea class="form-control" name="content" rows="3" readonly="readonly">${boardVO.content }</textarea>
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">Title</label>
			<input type="text" name="writer" class="form-control" value="${boardVO.writer}" readonly="readonly">
		</div>
	</div>
	
	<!-- 18.02.01
		 class 추가 설정 p.294 -->
	<div class="box-footer">
		<button type="submit" class="btn btn-warning modifyBtn">Modify</button>
		<button type="submit" class="btn btn-danger removeBtn">Remove</button>
		<button type="submit" class="btn btn-primary goListBtn">목록으로</button>
	</div>
	<%@include file="../include/footer.jsp" %>
</body>
</html>