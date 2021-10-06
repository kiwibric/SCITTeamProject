<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사 회원가입</title>
<script type = "text/javascript">
function teacherCheck(){
	var teacher_id = document.getElementById("teacher_id").value;
	var teacher_pw = document.getElementById("teacher_pw").value;
	var teacherCheck = document.getElementById("teacher_Check").value;
	var teacher_nm = doocument.getElementById("teacher_nm").value;
	var teacher_gender = document.getElementsByName("teacher_gender");
	if(teacher_id == ""){
	alert("아이디를 입력해주세요")
	return false;
	}else if(teacher_id.length <5 || teacher_id.length > 20){
		alert("아이디는 5~20글자로 입력해주세요");
		return false;
	}
	if(teacher_pw == ""){
		alert("비밀번호를 입력해주세요");
		return false;
	}else if(teacher_pw.length < 5 || teacher_pw.length > 21){
		alert("비밀번호는 5글자에서 20글자 사이로 입력해주세요");
		return false;
	}else if(teacher_pw != pwCheck){
		alert("동일한 비밀번호를 입력해 주세요");
	}
	if(teacher_nm = ""){
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

	var cnt = 0;
	for(var i = 0; i<teacher_gender.length; i++){
		if(member_gender[i].checked == true){
			cnt++;
		}
		
	}
if(cnt == 0){
	alert("성별을 선책해주세요");
	return false;
}return true;

}

</script>
</head>
<body>
	<table>
	<tr>
		<td>
			<label>ID</label>
		</td>
		<td>
			<input type = "text" id = "teacher_id" name = "teacher_id">
		</td>
	</tr>
	<tr>
		<td>
		<label>PassWord</label>
		</td>
		<td>
			<input type = "password"  id = "teacher_pw" name = "teacher_pw">
			</td>	
		<td>
		<label>남성</label>
		<input type = "radio" id = "teacher_gender" name = "teacher_gender">
		<label>여성</label>
		<input type = "radio" id = "teacher_gender" name = "teacher_gender">
		</td>
	</tr>
	<tr>
		<td colspan = "2">
			<input type = "submit" value = "회원가입">
			</td>
		</tr>
	</table>

</body>
</html>