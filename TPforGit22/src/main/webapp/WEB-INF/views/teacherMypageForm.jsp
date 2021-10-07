<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert</title>
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
<script type="text/javascript">
</script>
</head>
<body>
<div id="header">
	<button id="homeBtn" type="button" onclick="location.href='/'"><img src="resources/images/logo.png"></button>
	<span style="float:right; color:white; font-size: 50px" >TEACHER MYPAGE</span>
</div>
<div id="container">
 	<div id="profile">
 		<img src="${tc_pic}" style="float: left; width: 100px; height: 100px; padding: 10px;" class="left-img"><br>
 		<span style="font-size: 50px; line-height: 15px;">mosi</span>
 			<button type="button" onclick="" class="btn btn-secondary btn-sm" style="margin-left: 10px; margin-bottom: 15px;">로그아웃</button>
 			<button type="button" onclick="" class="btn btn-secondary btn-sm" style="margin-bottom: 15px;">회원탈퇴</button>
 		<h4 style="margin-left: 17px;">mosi님의 별점은 ${tc_starAvg}입니다</h4>
 	</div>
 	<div id="sidebar">
 		<button onclick="location.href='updateMyInfoForm'" class="btn btn-secondary btn-lg" style="margin-bottom: 5px">정보 수정</button><br>
		<!-- 후기관리 버튼 -->
		<button onclick="location.href='selectMyReviewForm'" class="btn btn-secondary btn-lg">후기 관리</button>
 	</div>

	<div id="information">
		<div class="hh-line"></div>
		<h1 style="color: #435D7D;">MY PAGE</h1><br>
		<div>
			<img id ="ticon" src="resources/images/chat.png" align="middle">새로 받은 신청 목록</img>
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
					<td> <input type="button" id="accept" value="수락" class="btn btn-outline-dark" onclick = "location.href='acceptSugang?sg_num=${list.sg_num}'"></td>
					<td> <input type="button" id="refuse" value="거절" class="btn btn-outline-dark" onclick = "location.href='refuseSugang?sg_num=${list.sg_num}'"></td>
				</tr>
			</c:forEach>
		</table>
		</div><br><br>
		
		<div>
		<img id ="ticon" src="resources/images/chat.png" align="middle">수락한 강의 목록</img>
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
				<!-- 후기작성 버튼 (작성된 후기가 없을 경우) -->
				<c:choose>
					<c:when test="${ReviewCount == 0}">
						<td><input type="button" value="후기작성" onclick = "location.href='writeForm?rv_target=${list1.st_id}'"></td>
					</c:when>
					<c:otherwise>
						<c:forEach var="list4" items="${selectMyReview }">
							<c:if test="${list4.rv_target != list1.st_id}">
								<td><input type="button" value="후기작성" onclick = "location.href='writeForm?rv_target=${list1.st_id}'"></td>
							</c:if>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tr>
			</c:forEach>
		</table>
		</div><br><br>
		
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