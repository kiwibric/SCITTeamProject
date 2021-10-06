<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div{
	border: 1px solid #ccc;
}
#container {
	width: 960px;
	padding : 20px;
	margin : 0 auto;
}
#profile{
	width: 420px;
	padding: 20px;
	float: left;
	margin-bottom: 20px;
}
#sideProfile{
	width: 120px;
	padding: 20px;
	float: left;
	margin-bottom: 20px;
}
#sidebar {
	width: 220px;
	padding: 20px;
	float: right;
	margin-bottom: 20px;
}
#information{
	clear: both;
	padding: 20px;
}
.hh-line::before {
    border-top: 1px solid #eee;
    display:block;
    width: 100%;
    content: "";
}
#ticon{
	width: 30px;
	height: 30px;
}
</style>
</head>
<body>
<div id="container">
	<div id="header">
	<button type="button" onclick="location.href='/'">홈버튼로고</button><span style="float:right;">MY</span>
	</div>
	
 	<div id="profile">
 		<img style="float: left; width: 80px; height: 80px; padding: 10px;" class="left-img" src="/resources/image/student.png">
 		<h3>학생</h3>
 		<h1>momo</h1>
 		<h3>momo님의 별점은 ${st_starAvg}입니다</h3>
 	</div>
 	<div id="sideProfile"><button type="button" onclick="">로그아웃</button><button type="button" onclick="">회원탈퇴</button></div>
 	<div id="sidebar">
 		<button onclick="location.href='updateStMyInfoForm'">정보 수정</button><br>
		<!-- 후기관리 버튼 -->
		<button onclick="location.href='selectMyReviewForm'">후기 관리</button>
 	</div>
	
	<div id="information"">
		<div class="hh-line"></div>
		<h1 style="color: navy;">MY PAGE</h1>
		<div>
		
		<img id ="ticon" src="resources/image/chat.png" align="middle">신청한 강의 목록</img>
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
		
		<div>
		<img id ="ticon" src="resources/image/chat.png" align="middle">수락된 강의 목록</img>
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
						<td><input type="button" value="후기작성" onclick = "location.href='writeForm?rv_target=${list1.tc_id}'"></td>
					</c:when>
					<c:otherwise>
						<c:forEach var="list4" items="${selectMyReview }">
							<c:if test="${list4.rv_target != list1.tc_id}">
								<td><input type="button" value="후기작성" onclick = "location.href='writeForm?rv_target=${list1.tc_id}'"></td>
							</c:if>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tr>
			</c:forEach> 
			
		</table>
		</div>
		
		<div>
		<img id ="ticon" src="resources/image/chat.png" align="middle">거절된 강의 목록</img>
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
	
		<!-- 내가 받은 후기 보기 -->
		<div>
		<img id ="ticon" src="resources/image/pencil.png" align="middle">내가 받은 후기 목록</img>
		<table id="tb1">
			<tr>
				<th>no.</th>	
				<th>별점</th>
				<th>후기</th>
			
			</tr>
			<c:forEach var="list3" items="${selectTrReview}" varStatus="status">
				<tr>
					<td>${status.count }</td>
					<td>${list3.rv_star}</td>
					<td>${list3.rv_review }</td>			
				</tr>
			</c:forEach> 
		</table>
		</div>
	</div>
</div>
</body>
</html>