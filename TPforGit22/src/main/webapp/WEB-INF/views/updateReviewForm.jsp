<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
function formCheck() {
	var rv_review = $('#rv_review').val();

	if (rv_review == '') {
		alert("후기를 입력해 주세요");
		return false;
	}

	return true;
	
	
}
$(function(){
	if($("#current_star").val()==1){
		$("#rv_star option:eq(0)").prop("selected", true);
	} else if($("#current_star").val()==2){
		$("#rv_star option:eq(1)").prop("selected", true);
	} else if($("#current_star").val()==3){
		$("#rv_star option:eq(2)").prop("selected", true);
	} else if($("#current_star").val()==4){
		$("#rv_star option:eq(3)").prop("selected", true);
	} else if($("#current_star").val()==5){
		$("#rv_star option:eq(4)").prop("selected", true);
	} 
	
});

</script>

</head>
<body>
<h1>후기 수정</h1>
	<form action="updateReview" method="post" onsubmit="return formCheck();">
		<table>
			<tr>
				<td>선생님</td>
				<td>${review.rv_target}</td>
			</tr>
			<tr>
				<td>별점</td>
				<td>
						<select id="rv_star" name="rv_star">
							<option value="1">★</option>
							<option value="2">★★</option>
							<option value="3">★★★</option>
							<option value="4">★★★★</option>
							<option value="5">★★★★★</option>
						</select>
				</td>
			</tr>
			<tr>
				<td>후기</td>
				<td><textarea name="rv_review" id="rv_review" cols="40" rows="8" >${review.rv_review}</textarea></td>
			</tr>
			<tr>
				<td><input type="submit" value="수정"></td>
				<td><input type="button" value="취소" onclick="location.href='selectMyReviewForm'"></td>
			</tr>
		</table>
		<input type="hidden" id="rv_num" name="rv_num" value="${review.rv_num}">
		<input type="hidden" id="current_star" name="current_star" value="${review.rv_star}">
		
	</form>
</body>
</html>