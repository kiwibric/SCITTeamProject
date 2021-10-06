<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 하기</title>
<script type = "text/javascript">
function formCheck(){
	var member_id = document.getElementById("member_id").value;
	var member_pw = document.getElementById("member_pw").value;
	
	if(member_id == ""){
		alert("아이디를 입력해주세요");
		return false;
	}
	if(member_pw == ""){
		alert("비밀번호를 입력해주세요");
		return false;
	}
	return true;	
}
</script>
</head>
<body>
<form action = "login" method = "post" onsubmit = "return formCheck();">
	<label>아이디</label>
	<input type = "text" id = "member_id" name = "member_id"><br>
	<label>비밀번호</label>
	<input type = "password" id = "member_pw" name = "member_pw"><br>
	<input type = "submit" value = "로그인">
</form>
</body>
</html>