<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert</title>
</head>
<body>
	<div>
	<h1>"mosi(로그인 정보)"님의 별점은 ${tc_starAvg}입니다</h1>
	<a href="updateMyInfoForm">내 정보 수정</a>
	</div>
	<div style="width: 40%;float: left;">
	<h2>새로 받은 신청 목록</h2>
	<table id="tb1">
		<tr>
			<th>학생이름</th>
			<th>나이</th>
			<th>성별</th>	
			<th>지역</th>
			<th>별점</th>
		
		</tr>
		<%-- <c:if test="${newStudent !=null }">새로운 데이터 있음</c:if> --%>
		<c:forEach var="list" items="${newStudent}">
		
		<tr>
			<td>${list.sg_num}</td>
			<td>${list.st_id}</td>
			<td>${list.st_age}</td>
			<td>${list.st_gender}</td>
			<td>${list.st_loc}</td>
			<td>${list.st_avg}</td>
			<td> <input type="button" id="accept" value="수락" onclick = "location.href='acceptSugang?sg_num=${list.sg_num}'"></td>
			<td> <input type="button" id="refuse" value="거절" onclick = "location.href='refuseSugang?sg_num=${list.sg_num}'"></td>
		</tr>
		
		
		</c:forEach>
	</table>
	
	</div>
	
	
	<div style="width: 60%;float:right;">
	<h2>수락한 강의 목록</h2>
	<table id="tb2">
		<tr>
			<th>학생이름</th>
			<th>나이</th>
			<th>성별</th>
			<th>지역</th>
			<th>별점</th>
			<th>연락처</th>
		</tr>
		<c:forEach var="list1" items="${acceptStudent}">
		
		<tr>
			<td>${list1.st_id}</td>
			<td>${list1.st_age}</td>
			<td>${list1.st_gender}</td>
			<td>${list1.st_loc}</td>
			<td>${list1.st_avg}</td>
			<td>${list1.st_phone}</td>
		
		</tr>
		
		
		</c:forEach>
		
	</table>
	
	</div>
	
	
</body>
</html>