<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>계시판</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#write").click(function(){
            location.href = "/board/edit?target=" + $(this).attr("target");
        });
	

		$("a[name='subject']").click(function() {
			location.href = "/board/view?cmt_id=" + $(this).attr("content_id");
		});
	})
	
	function search(currentPage) {
		var searchForm = document.getElementById("searchForm");
		var page = document.getElementById("page");

		page.value = currentPage;

		searchForm.submit();
	}
</script>
<style>
.mouseOverHighlight {
	border-bottom: 1px solid blue;
	cursor: pointer !important;
	color: blue;
	pointer-events: auto;
}
</style>
</head>
<body>
	<div align="center">
		<table width="1200px">
			<tr>
				<td align="right">
					<button type="button" id="write" board_target="${board.target }">글 작성</button>
				</td>
			</tr>
		</table>
		<table border="1" width="1200px">
			<tr>
				<th width="50px">No</th>
				<th width="850px">제목</th>
				<th width="100px">작성자</th>
				<th width="200px">작성일</th>
			</tr>
			<c:choose>
				<c:when test="${fn:length(board) == 0}">
					<tr>
						<td colspan="4" align="center">조회결과 없음</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="board" items="${list }" varStatus="status">
						<tr>
							<td align="center">${board.cmt_id }</td>
							<td>
								<a name="subject" class="mouseOverHighlight" content_id="${board.cmt_id}">${board.subject }</a>
							</td>
							<td>${board.writer }</td>
							<td>${board.indate }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		<br>
		<div id="pagination"></div>
	</div>

	<!-- ◁◁ ◀ 1 2 3 ▶ ▷▷ -->
	<a href="javascript:search(${navi.currentPage - navi.pagePerGroup });">◁◁</a>
	<a href="javascript:search(${navi.currentPage - 1 });">◀</a>
	<c:forEach var="num" begin="${navi.startPageGroup }"
		end="${navi.endPageGroup }">
		<c:if test="${navi.currentPage == num }">
			<b>
		</c:if>
		<a href="javascript:search(${num });">${num }</a>
		<c:if test="${navi.currentPage == num }">
			</b>
		</c:if>
	</c:forEach>
	<a href="javascript:search(${navi.currentPage + 1 });">▶</a>
	<a href="javascript:search(${navi.currentPage + navi.pagePerGroup });">▷▷</a>

	<!-- Search Bar -->
	<form id="searchForm" action="/board/list" method="get">
		<label>제목</label> <input type="text" name="searchText"
			value="${searchText }"> <input type="hidden" id="page"
			name="page"> <input type="button" value="검색"
			onclick="search(1);">
	</form>

</body>
</html>