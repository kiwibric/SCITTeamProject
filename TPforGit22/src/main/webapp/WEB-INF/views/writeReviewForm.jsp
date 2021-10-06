<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</script>

</head>
<body>
<h1>후기 작성</h1>
	<form action="writeReview" method="post" onsubmit="return formCheck();">
		<table>
			<tr>
				<td>대상</td>
				<td><input type="hidden" name="rv_target" id="rv_target" value="${rv_target }">${rv_target }</td>
			</tr>
			<tr>
				<td>별점</td>
				<td><select name="rv_star" id="rv_star">
						<option value="1">★</option>
						<option value="2">★★</option>
						<option value="3">★★★</option>
						<option value="4">★★★★</option>
						<option value="5" selected>★★★★★</option>
				</select></td>
			</tr>
			<tr>
				<td>후기</td>
				<td><textarea name="rv_review" id="rv_review" cols="40" rows="8"></textarea></td>
			</tr>
			<tr>
				<td><input type="submit" value="입력"></td>
				<td><input type="button" value="취소" onclick="location.href='/'"></td>
			</tr>
		</table>
	</form>
</body>
</html>