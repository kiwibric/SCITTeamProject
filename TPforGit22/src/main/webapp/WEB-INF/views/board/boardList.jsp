<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>掲示板</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#write").click(function() {
			location.href = "/board/edit?target=" + $(this).attr("board_target");
		});
	});
	
	function search(currentPage) {
		var searchForm = document.getElementById("searchForm");
		var page = document.getElementById("page");
		var target = document.getElementByUd("target")

		page.value = currentPage;

		searchForm.submit();
	};
</script>
<style>
.table-title {
	padding-bottom: 0px;
	background: #435d7d;
	color: #fff; /*제목색*/
	padding: 10px 20px;
	border-radius: 3px 3px 0 0;
}

.table-title h2 {
	margin: 5px 0px 10px 5px;
	font-size: 24px;
}

table.table tr th, table.table tr td {
	border-color: #e9e9e9;
	padding: 12px 10px;
	vertical-align: middle;
}

table.table-striped tbody tr:nth-of-type(odd) {
	background-color: #f4f4f4;
}

th {
	text-align: center;
}


.mouseOverHighlight {
	border-bottom: 1px solid blue;
	cursor: pointer !important;
	color: blue;
	pointer-events: auto;
}

.write{
	margin: 5px 0px 5px 10px;
	padding: 5px;
	float: left;
}
</style>
</head>
<body>
	<div class="table-title">
		<h2>
			<b>ハイセン</b> 
		</h2>
	</div>
	
	<div align="center">
		<button type="button" id="write" class="write" board_target="${list[0].target}">書き込む</button>
		<table border="1" width="1200px" class='table table-striped'>
			<tr>
				<th width="50px">No.</th>
				<th width="350px">タイトル</th>
				<th width="100px">ユーザー</th>
				<th width="50px">ヒット数</th>
				<th width="150px">作成日</th>
			</tr>
			<c:choose>
				<c:when test="${fn:length(list) == 0}">
					<tr>
						<td colspan="5" align="center">検索結果なし</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="board" items="${list }" varStatus="status">
						<tr>
							<td align="center">${board.cmt_id }</td>
							<td>
								<a href="/board/view?cmt_id=${board.cmt_id }">${board.subject }</a>
							</td>
							<td align="center">${board.writer }</td>
							<td align="center">${board.hits }</td>
							<td align="center">${board.indate }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		
	</div>

	<!-- ◁◁ ◀ 1 2 3 4 5 ▶ ▷▷ -->
	<div align="center">
		<a href="javascript:search(${navi.currentPage - navi.pagePerGroup });">◀</a>
		<a href="javascript:search(${navi.currentPage - 1 });">◁</a>
		<c:forEach var="num" begin="${navi.startPageGroup }" end="${navi.endPageGroup }">
			<c:if test="${navi.currentPage == num }">
				<b>
			</c:if>
				<a href="javascript:search(${num });">${num }</a>
			<c:if test="${navi.currentPage == num }">
				</b>
			</c:if>
		</c:forEach>
		<a href="javascript:search(${navi.currentPage + 1 });">▷</a>
		<a href="javascript:search(${navi.currentPage + navi.pagePerGroup });">▶</a>
	</div>
	
	<!-- Search Bar -->
	<div align="center">
		<form id="searchForm" action="/board/list" method="get">
			<label for="searchText">タイトル検索</label> 
			<input type="text" id="searchText" name="searchText" value="${searchText }">
			<input type="hidden" id="target" name="target" value="${list[0].target }">
			<input type="hidden" id="page" name="page"> 
			<input type="button" value="Search" onclick="search(1);">
		</form>
	</div>
	
</body>
</html>