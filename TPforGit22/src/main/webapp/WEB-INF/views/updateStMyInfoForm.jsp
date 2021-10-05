<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/* function formCheck(){
	var tc_id = document.getElementById("tc_id")
	var tc_intro = document.getElementById("tc_intro")
	var tc_teachLan = document.getElementById("tc_teachLan")
	var tc_lan1 = document.getElementById("tc_lan1")
	var tc_loc = document.getElementById("tc_loc")
	var tc_price = document.getElementById("tc_price")
	
	
	if (tc_id.value == ''){
		alert("수정할 아이디를 입력해 주세요")
		return false;
	}
	if (tc_intro.value == ''){
		alert("수정할 소개글을 입력해 주세요")
		return false;
	}
	if (tc_teachLan.value == ''){
		alert("수정할 강의 언어를 입력해 주세요")
		return false;
	}
	if (tc_lan1.value == ''){
		alert("수정할 가능언어 를 입력해 주세요")
		return false;
	}
	if (tc_loc.value == ''){
		alert("수정할 지역를 입력해 주세요")
		return false;
	}
	if (tc_price.value == ''){
		alert("수정할 가격를 입력해 주세요")
		return false;
	}
	
	return true;

} */



</script>
</head>
<body>

<form id="updateStMyInfo" action="updateStMyInfo" method="post" >
<input type="hidden" value="${studentInfo.st_id }" id="st_id" name="st_id">
<table border="1">

	<tr>
		<th>아이디</th>
		<td> 
		 ${studentInfo.st_id }
		</td>
	</tr>	
	<tr>
		<th>나이</th>
		<td>
		<input type="text" id="st_age" name="st_age" value="${studentInfo.st_age }" > 
		</td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input type="text" id="st_phone" name="st_phone" value="${studentInfo.st_phone }" > </td>
	</tr>
	<tr>
		<th>지역</th>
		<td><input type="text" id="st_loc" name="st_loc" value="${studentInfo.st_loc }" ></td>
	</tr>
	<tr>
		<th>가능 언어1</th>
		<td><input type="text" id="st_lan1" name="st_lan1" value="${studentInfo.st_lan1}" ></td>
	</tr>
	<tr>
		<th>가능 언어2</th>
		<td><input type="text" id="st_lan2" name="st_lan2" value="${studentInfo.st_lan2 }" ></td>
	</tr>
	<tr>
		<th>가능 언어3</th>
		<td><input type="text" id="st_lan3" name="st_lan3" value="${studentInfo.st_lan3 }" ></td>
	</tr>
	<tr>
		<td colspan="2" class="center">
			<input type="submit" value="정보 수정" />
		</td>
	</tr>	
		

</table>
</form>
</body>
</html>