<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="false" %>
<%@include file="../include/header.jsp"%>
<script>
	var result = '${msg}';
	
	if(result == 'success'){
		alert('처리가 완료되었습니다.');
	}
	
	$(".pagination li a").on("click", function(event){
		event.preventDefault();
		
		var targetPage = $(this).attr("href");
		
		var jobForm = $("#jobForm");
		jobForm.find("[name='page']").val(targetPage);
		jobForm.attr("action", "/board/listPage").attr("method", "get");
		jobForm.submit();
	});
</script>
	<form id="jobForm">
		<input type='hidden' name="page" value=${pageMaker.cri.perPageNum}>
		<input type='hidden' name="perPageNum" value=${pageMaker.cri.perPageNum}>
	</form>
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
				<td>
					<%-- <a href='/board/read?bno=${boardVO.bno}'>${boardVO.title}</a> --%>
					<!-- 18.02.03 p.287 -->
					<a href = '/board/readPage${pageMaker.makeQuery(pageMaker.cri.page)}&bno=${boardVO.bno}'>
						${boardVO.title}
					</a>
				</td>
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
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					<li
						<c:out value="${pageMaker.cri.page == idx?'class = active':''}"/>>
						<%-- <a href="listPage?page=${idx}">${idx}</a> --%>
						<!-- 18.02.01 p.288 -->
						<a href="listPage${pageMaker.makeQuery(idx)}">${idx}</a>
					</li>
				</c:forEach>
				
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a href="listPage?page=${pageMaker.endPage+1}">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
	<%@include file="../include/footer.jsp" %>