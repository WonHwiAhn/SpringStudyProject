<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var result = '${msg}';
	
	if(result == 'success'){
		alert('처리가 완료되었습니다.');
	}
</script>
</head>
<body>
	<%@include file="../include/header.jsp"%>
	<table class="table table-bordered">
		<tr>
			<th style="width:10px">BNO</th>
			<th>TITLE</th>
			<th>WRITER</th>
			<th>REGDATE</th>
			<th style="width:40px">VIEWCNT</th>
		</tr>
		<c:forEach items="${list}" var="boardVO">
		<tr>
			<td>${boardVO.bno }</td>
			<td><a href='/board/read?bno=${boardVO.bno}'>${boardVO.title}</a></td>
			<td>${boardVO.writer}</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regdate}"/></td>
			<td><span class="badge bg-red">${boardVO.viewcnt}</span></td>
		</tr>
	</c:forEach>
	</table>
	
	<div class="text-center">
		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
				<li><a href="listPage?page=${pageMaker.startPage - 1}">&laquo;</a></li>
			</c:if>
		</ul>
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			<li
				<c:out value="${pageMaker.cri.page == idx?'class = active':''}"/>>
				<a href="listPage?page=${idx}">${idx}</a>
		</c:forEach>
		
		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<li><a href="listPage?page=${pageMaker.endPage+1}">&raquo;</a></li>
		</c:if>
	</div>
	
	<%@include file="../include/footer.jsp" %>
</body>
</html>