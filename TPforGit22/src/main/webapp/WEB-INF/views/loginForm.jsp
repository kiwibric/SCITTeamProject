<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 로그인 ]</title>
<script type="text/javascript">
	function formCheck(){
			var tc_id = document.getElementById("tc_id").value;
			var tc_pw = document.getElementById("tc_pw").value;
			
			
			if(tc_id == ""){
				alert("아이디를 입력해주세요");
				return false;
			}else if(tc_id.length < 3 || tc_id.length > 8){
				alert("아이디는 3~8글자로 입력해 주세요");
				return false;
			}
			
			if(tc_pw == ""){
				alert("비밀번호를 입력해주세요");
				return false;
			}else if(tc_pw.length < 4 || tc_pw.length > 10){
				alert("비밀번호는 4~10글자로 입력해 주세요");
				return false;
			}
			
			return true;	
		
	}	
</script>


</head>
<body>
	<form action="/login" method="post" onsubmit="return formCheck();">
		<label>아이디</label> <input type="text" id="tc_id" name="tc_id"><br>
		<label>비밀번호</label> <input type="password" id="tc_pw" name="tc_pw">

		<br> <input type="submit" value="로그인">
	</form>
</body>
</html>