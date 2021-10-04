<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 	<div><a href="/">홈으로</a></div> 
	<div><h1>"momo(로그인 정보)"님의 별점은 ${st_starAvg}입니다</h1>
	<a href="updateStMyInfoForm">내 정보 수정</a>
	<!-- 후기관리 버튼 -->
	<a href="selectMyReviewForm">후기 관리</a>
	 
	 </div>
	<div style="width: 100%;float: left;">
	<h2>신청한 강의 목록</h2>
	<table id="tb1">
		<tr>
			<th>선생님 ID</th>
			<th>나이</th>
			<th>강의 언어</th>	
			<th>지역</th>
			<th>별점</th>
		
		</tr>
		<%-- <c:if test="${newStudent !=null }">새로운 데이터 있음</c:if> --%>
		<c:forEach var="list" items="${applySugang}">
		
		<tr>
			<td>${list.tc_id}</td>
			<td>${list.tc_age}</td>
			<td>${list.tc_teachLan}</td>
			<td>${list.tc_loc}</td>
			<td>${list.tc_avg}</td>
			
		</tr>
		
		
		</c:forEach> 
	</table>
	
	</div>
	
	
	<div style="width: 60%;float:right;">
	<h2>수락된 강의 목록</h2>
	<table id="tb2">
		<tr>
			<th>선생님 ID</th>
			<th>나이</th>
			<th>강의 언어</th>
			<th>지역</th>
			<th>별점</th>
			<th>연락처</th>
		</tr>
		
		<c:forEach var="list1" items="${acceptedSugang}">
		
		<tr>
			<td>${list1.tc_id}</td>
			<td>${list1.tc_age}</td>
			<td>${list1.tc_teachLan}</td>
			<td>${list1.tc_loc}</td>
			<td>${list1.tc_avg}</td>
			<td>${list1.tc_phone}</td>
			
			
			<!-- 후기작성 버튼 (작성된 후기가 없을 경우) -->
			<c:choose>
				<c:when test="${ReviewCount == 0}">
					<td><input type="button" value="후기작성" onclick = "location.href='writeForm?tc_id=${list1.tc_id}'"></td>
				</c:when>
				<c:otherwise>
					<c:forEach var="list4" items="${selectMyReview }">
						<c:if test="${list4.rv_target != list1.tc_id}">
							<td><input type="button" value="후기작성" onclick = "location.href='writeForm?tc_id=${list1.tc_id}'"></td>
						</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			
		</tr>
		
		</c:forEach> 
		
	</table>
	
	</div>
	
	<div style="width: 40%;float:right;">
	<h2>거절된 강의 목록</h2>
	<table id="tb2">
		<tr>
			<th>선생님 ID</th>
			<th>나이</th>
			<th>강의 언어</th>
			<th>지역</th>
			<th>별점</th>
		</tr>
		 <c:forEach var="list2" items="${refuesdSugang}">
		
		<tr>
			<td>${list2.tc_id}</td>
			<td>${list2.tc_age}</td>
			<td>${list2.tc_teachLan}</td>
			<td>${list2.tc_loc}</td>
			<td>${list2.tc_avg}</td>
			<td>
			<input type="button" value="거절된 강의 삭제" onclick = "location.href='deleteSugang?sg_num=${list2.sg_num}'" >
			</td>
		</tr>
	
		</c:forEach> 
		
	</table>
	
	</div> 
	
</body>
</html>