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

<form id="updateMyInfo" action="updateMyInfo" method="post" >
<input type="hidden" value="${teacherInfo.tc_id }" id="tc_id" name="tc_id">
<table border="1">

	<tr>
		<th>아이디</th>
		<td> 
		 ${teacherInfo.tc_id }
		</td>
	</tr>	
	<tr>
		<th>소개</th>
		<td>
		<input type="text" id="tc_intro" name="tc_intro" value="${teacherInfo.tc_intro }" > 
		</td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td>
		<input type="text" id="tc_phone" name="tc_phone" value="${teacherInfo.tc_phone }" > 
		</td>
	</tr>
	<tr>
		<th>수업 언어</th>
		<td><input type="text" id="tc_teachLan" name="tc_teachLan" value="${teacherInfo.tc_teachLan }" > </td>
	</tr>
	<tr>
		<th>가능 언어</th>
		<td><input type="text" id="tc_lan1" name="tc_lan1" value="${teacherInfo.tc_lan1 }" ></td>
	</tr>
	<tr>
		<th>지역</th>
		<td><input type="text" id="tc_loc" name="tc_loc" value="${teacherInfo.tc_loc }" ></td>
	</tr>
	<tr>
		<th>수업료</th>
		<td><input type="text" id="tc_price" name="tc_price" value="${teacherInfo.tc_price }" ></td>
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