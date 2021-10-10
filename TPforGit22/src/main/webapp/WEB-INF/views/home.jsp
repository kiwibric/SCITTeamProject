<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>[메인화면]</title>
</head>
<body>
	<ul>
		<c:choose>
			<c:when test="${not empty sessionScope.tcLogin }">
				<h1>${sessionScope.tcLogin}님환영합니다.</h1>
				<a href="teacherMypage">센세마이페이지</a>

			</c:when>
			<c:when test="${not empty sessionScope.stLogin }">
				<h1>${sessionScope.stLogin}님환영합니다.</h1>
				<a href="map?st_id=${sessionScope.stLogin }">MAP</a>
			</c:when>
			<c:otherwise>
				<li><a href="loginForm">로그인</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</body>
</html>

</html>
