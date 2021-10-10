<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<h4 style="line-height: 300%; margin-left: 300px">후기 작성</h4>

    <div class="container" >
        <div class="row">
            <div class="col-md-8 col-md-offset-2" style="text-align:center; display: inline-block;">
               <form action="writeReview" method="post" onsubmit="return formCheck();">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group"> <label class="sr-only">
                          
                            
                            
                            </label> <input type="text" class="form-control" value="${rv_target }" id="nameSix" > </div>
                        </div> 
                        <div class="col-md-6">
                            <div class="form-group"> <label class="sr-only">
                            <input type="hidden" name="rv_target" id="rv_target" value="${rv_target }">
                            <input type="hidden" name="rv_sender" id="rv_sender" value="${rv_sender }">
                            </label>  <select name="rv_star" id="rv_star">
							<option value="1">★</option>
							<option value="2">★★</option>
							<option value="3">★★★</option>
							<option value="4">★★★★</option>
							<option value="5" selected>★★★★★</option>
		 					</select></div>
                        </div>
                    </div>
                    <!--end of /.row-->
                    <div class="form-group"> <label class="sr-only">Message</label> 
                    <textarea name="rv_review"  id="rv_review" class="form-control"  rows="7" placeholder="Write Message"></textarea> </div>
                    <input type="submit" class="btn btn-primary" value="입력">
				<input type="button" class="btn btn-primary" value="취소" onclick="location.href='/'">
                    
                    
                     <!-- <button type="submit" >입력</button>
                      <button type="button" class="btn btn-primary" onclick="location.href='/'">취소</button> -->
                </form>
            </div> <!-- /.col-md-8 -->
        </div> <!-- /.row -->
    </div> <!-- /.container -->
</div>

</body>
</html>