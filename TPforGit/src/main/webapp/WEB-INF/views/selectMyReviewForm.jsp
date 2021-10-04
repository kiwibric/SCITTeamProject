<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>후기 관리</h1>
<div><a href="/">홈으로</a></div> 
<table border=1 style="text-align:center;">
		<tr>
			<th>no.</th>
			<th>선생님</th>
			<th>별점</th>
			<th>후기</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="list" items="${selectMyReview}" varStatus="status">
			<tr>
				<td>${status.count }</td>
				<td>${list.rv_target }</td>
				<td>${list.rv_star }</td>
				<td>${list.rv_review }</td>
				<td><input type="button" value="수정"
					onclick="location.href='updateReviewForm?rv_num=${list.rv_num}'"></td>
				<td><input type="button" value="삭제"
					onclick="location.href='deleteReview?rv_num=${list.rv_num}'"></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>