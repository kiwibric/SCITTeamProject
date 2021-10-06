<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 회원가입</title>
<script type="text/javascript">
function memberCheck(){
	var member_id = document.getElementById("member_id").value;
	var member_pw = document.getElementById("member_pw").value;
	var pwCheck = document.getElementById("pwCheck").value;
	var member_nm = doocument.getElementById("member_nm").value;
	var mmber_gender = document.getElementsByName("member_gender");
	
	if(member_id == ""){
	alert("아이디를 입력해주세요")
	return false;
	}else if(member_id.length <5 || member_id.length > 20){
		alert("아이디는 5~20글자로 입력해주세요");
		return false;
	}
	if(member_pw == ""){
		alert("비밀번호를 입력해주세요");
		return false;
	}else if(member_pw.length < 5 || member_pw.length > 21){
		alert("비밀번호는 5글자에서 20글자 사이로 입력해주세요");
		return false;
	}else if(member_pw != pwCheck){
		alert("동일한 비밀번호를 입력해 주세요");
	}
	if(member_nm = ""){
		alert("이름을 입력해주세요");
		return false;
	}
	var cnt = 0;
	for(var i = 0; i<member_gender.length; i++){
		if(member_gender[i].checked == true){
			cnt++;
		}
	}
	if(cnt == 0){
		alert("성별을 선택해주세요");
		return false;
	}
	return true;
}
	var cnt = 0;
	for(var i = 0; i<member_gender.length; i++){
		if(member_gender[i].checked == true){
			cnt++;
		}	
	}
if(cnt == 0){
	alert("성별을 선책해주세요");
	return false;
	}return true;}

</script>
</head>
<body>
	<form action="/joinStudent" method="post" onclick="return memberCheck();">
		<table>
	<tr>
		<td>
			<label>ID</label>
		</td>
		<td>
			<input type = "text" id = "member_id" name = "member_id">
		</td>
	</tr>
	<tr>
		<td>
		<label>PassWord</label>
		</td>
		<td>
			<input type = "password"  id = "member_pw" name = "member_pw">
			</td>	
		<td>
		<label>남성</label>
		<input type = "radio" id = "member_gender" name = "member_gender">
		<label>여성</label>
		<input type = "radio" id = "member_gender" name = "member_gender">
		</td>
	</tr>
	<tr>
		<td colspan = "2">
			<input type = "submit" value = "회원가입">
			</td>
		</tr>
	</table></form>
</body>
</html>