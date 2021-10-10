<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style type="text/css">
#container {
	width: 960px;
	padding : 20px;
	margin : 0 auto;
}
#header{
	background: #435D7D;
	padding: 0px;
	height: 60px;
	margin-bottom: 20px;
}
#homeBtn{
	padding: 0;
	border: none;
	background: none;
}
#profile{
	width: 500px;
	height: 100px;
	padding: 20px;
	float: left;
	margin-bottom: 20px;
	display: table-cell;
    vertical-align: middle;
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
table{
	heigt: 100px;
	text-align: center;
	margin-left: 25px;
}
div img{
	margin-right : 5px;
}
</style>
</head>
<body>
<div id="header">
	<button id="homeBtn" type="button" onclick="location.href='/'"><img src="resources/images/logo.png"></button>
	<span style="float:right; color:white; font-size: 50px" >STUDENT MYPAGE</span>
</div>
<div id="container">
 	<div id="profile">
 		<img style="float: left; width: 100px; height: 100px; padding: 10px;" class="left-img" src="/resources/images/student.png"><br>
 		<span style="font-size: 50px; line-height: 15px;">${sessionScope.stLogin}</span>
 			<button type="button" onclick="location.href='/Login/stLogout'" class="btn btn-secondary btn-sm" style="margin-left: 10px; margin-bottom: 15px;">로그아웃</button>
 			<button type="button" onclick="" class="btn btn-secondary btn-sm" style="margin-bottom: 15px;">회원탈퇴</button>
 		<h4 style="margin-left: 17px;">${sessionScope.stLogin}님의 별점은 ${st_starAvg}입니다</h4>
 	</div>
 	<div id="sidebar">
 		<button onclick="location.href='updateStMyInfoForm'" class="btn btn-secondary btn-lg" style="margin-bottom: 5px">정보 수정</button><br>
		<!-- 후기관리 버튼 -->
		<button onclick="location.href='selectMyReviewForm?rv_sender=${sessionScope.stLogin}'" class="btn btn-secondary btn-lg">후기 관리</button>
 	</div>
	
	<div id="information">
		<div class="hh-line"></div>
		<h1 style="color: #435D7D;">MY PAGE</h1><br>
		<div>
		
		<img id ="ticon" src="resources/images/chat.png" align="middle">신청한 강의 목록</img>
		<table id="tb1">
			<tr>
				<th>선생님ID</th>
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
		</div><br><br>
		
		<div>
		<img id ="ticon" src="resources/images/chat.png" align="middle">수락된 강의 목록</img>
		<table id="tb2">
			<tr>
				<th>선생님ID</th>
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
						<td><input type="button" value="후기작성" onclick = "location.href='writeForm?rv_target=${list1.tc_id}&rv_sender=${sessionScope.stLogin}'"></td>
					</c:when>
					<c:otherwise>
						<c:forEach var="list4" items="${selectMyReview }">
							<c:if test="${list4.rv_target != list1.tc_id}">
								<td><input type="button" value="후기작성" onclick = "location.href='writeForm?rv_target=${list1.tc_id}&rv_sender=${sessionScope.stLogin}'"></td>
							</c:if>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tr>
			</c:forEach> 
			
		</table>
		</div><br><br>
		
		<div>
		<img id ="ticon" src="resources/images/chat.png" align="middle">거절된 강의 목록</img>
		<table id="tb2">
			<tr>
				<th>선생님ID</th>
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
		</div> <br><br>
	
		<!-- 내가 받은 후기 보기 -->
		<div>
		<img id ="ticon" src="resources/images/pencil.png" align="middle">내가 받은 후기 목록</img>
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
		</div><br><br>
	</div>
</div>
</body>
</html>