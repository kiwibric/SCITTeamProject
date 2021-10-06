<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>[메인화면] </title>
</head>
<body>	
	<c:if test = "${not empty sessionScope.loginId}">
	<h1>${sessionScope.loginNm}님 환영합니다.</h1>
	</c:if>
<ul>
	<c:choose>
		<c:when test = "${empty sessionScope.loginId }">
		<li>
	<a href = "Login/JoinStudent">학생 회원가입하기</a>
	</li>
	<li>
	<a href = "Login/JoinTeacher">강사 회원가입하기</a>
	</li>
	<li>
	<a href = "Login/loginForm">로그인하기</a>
	</li>
	</c:when>
		<c:otherwise>
		<li>
			<a href = "Login/logout">로그아웃</a>
		</li>
		</c:otherwise>
	</c:choose>
	<li>
	<a href = "map">map</a>
	</li>		
</ul>
</body>
</html>
	
</html>
