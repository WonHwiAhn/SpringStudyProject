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
	$(document).ready(function(){
		$('#searchBtn').on("click", function(event){
			self.location = "list"
						  + '${pageMaker.makeQuery(1)}'
						  + "&searchType="
						  + $("select option:selected").val()
						  + "&keyword=" + encodeURIComponent($('#keywordInput').val());
		});
		
		$('#newBtn').on("click", function(evt){
			self.location = "register";
		});
	});
	
</script>
	<form id="jobForm">
		<input type='hidden' name="page" value=${pageMaker.cri.perPageNum}>
		<input type='hidden' name="perPageNum" value=${pageMaker.cri.perPageNum}>
	</form>
	
	<!-- 18.02.04 p.310 -->
	<div class='box-body'>
		<select name="searchType">
			<!-- n=검색조건이 없음 -->
			<!-- cri.searchType은 getSearchType을 의미 메소드 명 잘못되있으면 못가져옴 -->
			<option value="n"
				<c:out value="${cri.searchType == null?'selected':''}"/>>
				---
			</option>
			<!-- t = 제목으로 검색 -->
			<option value="t"
				<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
				Title
			</option>
			<!-- c = 내용으로 검색 -->
			<option value="c"
				<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
				Content
			</option>
			<!-- w = 작성자로 검색 -->
			<option value="w"
				<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
				Writer
			</option>
			<!-- tc = 제목이나 내용 검색 -->
			<option value="tc"
				<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
				Title OR Content
			</option>
			<!-- cw = 내용이나 작성자로 검색 -->
			<option value="cw"
				<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
				Content OR Writer
			</option>
			<!-- tcw = 제목이나 내용 혹은 작성자로 검색 -->
			<option value="tcw"
				<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
				Title OR Content OR Writer
			</option>
		</select>
		
		<input type="text" name='keyword' id="keywordInput" value='${cri.keyword}'>
		<button id='searchBtn'>Search</button>
		<button id='newBtn'>New Board</button>
	</div>
	
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
					<a href = '/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVO.bno}'>
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
					
					<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					<li
						<c:out value="${pageMaker.cri.page == idx?'class = active':''}"/>>
						
						<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
					</li>
				</c:forEach>
				
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
	<%@include file="../include/footer.jsp" %>