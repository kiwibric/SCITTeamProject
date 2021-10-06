<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Information of teacher</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

//ajax를 사용하여 수강신청이 완료되면 alert창으로 수강신청이 완료되었음을 알려주는 창을 띄운다
$(function(){
	$("#contact").on("click", function(){
		var tc_id = $("#tc_id").val();
		
		$.ajax({
			url : "/insertSugang",
			type: "get",
			data : {
				tc_id : tc_id
			},
			dataType : "json",
			success : function(data){
				if(data){
					alert("受講申し込みが完了しました");
				}else{
					alert("受講申し込みが失敗しました");
				}
			},
			error : function(e){
				console.log(e);
			}
			
		})
		
	})
})


</script>
<style>
body {
	color: #566787;
	background: #f5f5f5;
	font-family: 'Varela Round', sans-serif;
	font-size: 13px;
	
}

.table-wrapper {
	padding: 10px 5px;
}


table.table tr th, table.table tr td {
	border-color: #e9e9e9;
	padding: 12px 5px;
	vertical-align: middle;
}

table.table-striped tbody tr:nth-of-type(odd) {
	background-color: #f4f4f4;
}

th, td {
	text-align: center;
}

table {
    margin-left:auto; 
    margin-right:auto;
}
</style>
</head>
<body>
	<table width="500px" border="1" style="">
		<tr><td rowspan="7"><img src="resources/image/${tc.tc_pic}"></td><td>ID</td><td>${tc.tc_id}</td></tr>
		<tr><td>性別</td><td>${tc.tc_gender}</td></tr>
		<tr><td>地域</td><td>${tc.tc_loc}</td></tr>
		<tr><td>評点</td><td>${tc.tc_avg}</td></tr>
		<tr><td>時給</td><td>${tc.tc_price}</td></tr>
		<tr><td>授業科目</td><td>${tc.tc_teachLan}</td></tr>
		<tr><td>できる言語</td><td>${tc.tc_lan1}</td></tr>
		<tr><td colspan="3">${tc.tc_intro}</td></tr>
		<tr><td><input type="hidden" id="tc_id" value="${tc.tc_id}"></td></tr>
		<tr><td colspan="3"><input type="button" id ="contact" value="受講申請"></td></tr>
	</table>
	
	<!-- 선생님 후기 목록 -->
	<table width="500px" style=" border: 1px solid; border-collapse: collapse;">
		<tr><th width="50px">no.</th><th width="100px">評価</th><th width="350px">レビュー</th></tr>
		<c:forEach var="list" items="${selectTcReview}" varStatus="status">
			<tr>
				<td>${status.count }</td>
				<c:if test="${list.rv_star eq 1}">
					<td>★</td>
				</c:if>
				<c:if test="${list.rv_star eq 2}">
					<td>★★</td>
				</c:if>
				<c:if test="${list.rv_star eq 3}">
					<td>★★★</td>
				</c:if>
				<c:if test="${list.rv_star eq 4}">
					<td>★★★★</td>
				</c:if>
				<c:if test="${list.rv_star eq 5}">
					<td>★★★★★</td>
				</c:if>
				<td>${list.rv_review }</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>