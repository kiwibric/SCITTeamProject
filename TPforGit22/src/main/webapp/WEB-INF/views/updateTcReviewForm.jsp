<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 수정</title>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="/resources/css/styles2.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"> 
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"> 
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


<script type="text/javascript">
function formCheck() {
	var rv_review = $('#rv_review').val();

	if (rv_review == '') {
		alert("후기를 입력해 주세요");
		return false;
	}

	return true;
	
	
}
$(function(){
	if($("#current_star").val()==1){
		$("#rv_star option:eq(0)").prop("selected", true);
	} else if($("#current_star").val()==2){
		$("#rv_star option:eq(1)").prop("selected", true);
	} else if($("#current_star").val()==3){
		$("#rv_star option:eq(2)").prop("selected", true);
	} else if($("#current_star").val()==4){
		$("#rv_star option:eq(3)").prop("selected", true);
	} else if($("#current_star").val()==5){
		$("#rv_star option:eq(4)").prop("selected", true);
	} 
	
});

</script>

</head>
<body>


<div id="header">
	<button id="homeBtn" type="button" onclick="location.href='/'">
	
	<img src="resources/images/logo.png">
	
	</button>
	<span style="float:right; color:white; font-size: 50px" >STUDENT MYPAGE</span>
</div>


<div class="formthree ptb-100">
	<h4 style="line-height: 300%; margin-left: 300px">후기 수정</h4>

    <div class="container" >
        <div class="row">
            <div class="col-md-8 col-md-offset-2" style="text-align:center; display: inline-block;">
              <form action="updateReview" method="post" onsubmit="return formCheck();">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group"> <label class="sr-only">
                          
                            
                            
                            </label> <input type="text" class="form-control" value="${review.rv_target}" id="nameSix" > </div>
                        </div> 
                        <div class="col-md-6">
                            <div class="form-group"> <label class="sr-only">
                            <input type="hidden" name="rv_target" id="rv_target" value="${rv_target }">
                            </label> 
                            <select id="rv_star" name="rv_star">
							<option value="1">★</option>
							<option value="2">★★</option>
							<option value="3">★★★</option>
							<option value="4">★★★★</option>
							<option value="5">★★★★★</option>
						</select>
						</div>
                        </div>
                    </div>
                    <!--end of /.row-->
                    <div class="form-group"> <label class="sr-only">Message</label> 
                    <textarea name="rv_review"  id="rv_review" class="form-control"  rows="7" placeholder="Write Message">${review.rv_review}</textarea> </div>
                    <input type="hidden" id="rv_num" name="rv_num" value="${review.rv_num}">
					<input type="hidden" id="current_star" name="current_star" value="${review.rv_star}">
                    
                    <input type="submit" class="btn btn-primary" value="수정">
					<input type="button" class="btn btn-primary" value="취소" onclick="location.href='selectTcMyReviewForm?rv_sender=${sessionScope.tcLogin}'">
                    
                    
                </form>
            </div> <!-- /.col-md-8 -->
        </div> <!-- /.row -->
    </div> <!-- /.container -->
</div>

</body>
</html>