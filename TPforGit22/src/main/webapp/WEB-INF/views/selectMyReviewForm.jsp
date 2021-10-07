<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/styles.css"> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"> 
<link rel="stylesheet" href="   https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"> 
<style type="text/css">

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

</style>
</head>
<body>
<div id="header">
	<button id="homeBtn" type="button" onclick="location.href='/'">
	
	<img src="resources/images/logo.png">
	
	</button>
	<span style="float:right; color:white; font-size: 50px" >STUDENT MYPAGE</span>
</div>

<div class="row d-flex justify-content-center mt-100 mb-100">
    <div class="col-lg-6">
        <div class="card">
            <div class="card-body text-center">
                <h4 class="card-title" style="line-height: 300%; font-size: ">내가 쓴 후기</h4>
            </div>
            <div class="comment-widgets">
               
               
              <c:forEach var="list" items="${selectMyReview}" varStatus="status"> 
                <!-- Comment Row -->
                <div class="d-flex flex-row comment-row m-t-0">
                 	
                    <div class="p-2">
                    <c:if test="${list.tc_pic ==null}">
                    	<img src="resources/images/default.png" alt="user" width="50" class="rounded-circle">
                    </c:if>
                    	<img src="resources/images/${list.tc_pic}" alt="user" width="50" class="rounded-circle">
                    </div>
                    <div class="comment-text w-100">
                        <h6 class="font-medium">${list.rv_target }</h6> <span class="m-b-15 d-block">${list.rv_review }</span>
                        <div class="comment-footer"> <span class="text-muted float-right">내가 준 별점 : ${list.rv_star }</span> 
                        <!-- <button type="button" class="btn btn-cyan btn-sm">수정</button> -->
                         <button type="button" class="button button1"   onclick="location.href='updateReviewForm?rv_num=${list.rv_num}'">수정</button>
                          <button type="button" class="button button1" onclick="location.href='deleteReview?rv_num=${list.rv_num}'">삭제</button> </div>
                    </div>
                </div> <!-- Comment Row -->
               </c:forEach>
               
            </div> <!-- Card -->
        </div>
    </div>
</div>


<%--  <table border=1 style="text-align:center;">
      <tr>
         <th>no.</th>
         <th>대상</th>
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
   </table> --%> 
</body>
</html>