<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css"> 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 

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
/* function formCheck(){
	var tc_id = document.getElementById("tc_id")
	var tc_intro = document.getElementById("tc_intro")
	var tc_teachLan = document.getElementById("tc_teachLan")
	var tc_lan1 = document.getElementById("tc_lan1")
	var tc_loc = document.getElementById("tc_loc")
	var tc_price = document.getElementById("tc_price")
	
	
	if (tc_id.value == ''){
		alert("수정할 아이디를 입력해 주세요")
		return false;
	}
	if (tc_intro.value == ''){
		alert("수정할 소개글을 입력해 주세요")
		return false;
	}
	if (tc_teachLan.value == ''){
		alert("수정할 강의 언어를 입력해 주세요")
		return false;
	}
	if (tc_lan1.value == ''){
		alert("수정할 가능언어 를 입력해 주세요")
		return false;
	}
	if (tc_loc.value == ''){
		alert("수정할 지역를 입력해 주세요")
		return false;
	}
	if (tc_price.value == ''){
		alert("수정할 가격를 입력해 주세요")
		return false;
	}
	
	return true;

} */



</script>
</head>
<body>
<div id="header">
	<button id="homeBtn" type="button" onclick="location.href='/'">
	
	<img src="resources/images/logo.png">
	
	</button>
	<span style="float:right; color:white; font-size: 50px" >STUDENT MYPAGE</span>
</div>





<div class="bg-gray-300">
    <div class="py-12">
        <div class="max-w-md mx-auto bg-white shadow-lg rounded-lg md:max-w-xl mx-2">
            <div class="md:flex ">
                <div class="w-full p-4 px-5 py-5">
                    <div class="flex flex-row">
                        <h2 class="text-3xl font-semibold">회원</h2>
                        <h2 class="text-3xl text-green-400 font-semibold">정보수정</h2>
                    </div>
                    
                   <!--  <span>Customer Information</span>
                    <div class="relative pb-5">
                    	 <input type="text" name="mail" class="border rounded h-10 w-full focus:outline-none focus:border-green-200 px-2 mt-2 text-sm" placeholder="E-mail"> 
                    	 <span class="absolute text-blue-500 right-2 top-4 font-medium text-sm">Log out</span> 
                    </div> 
                     -->
                    <span>mosi님의 정보입니다</span>
                    
                     <form id="updateMyInfo" action="updateMyInfo" method="post" >
                    	
                   		<input type="text" value="${teacherInfo.tc_id }" id="tc_id" name="tc_id"  class="border rounded h-10 w-full focus:outline-none focus:border-green-200 px-2 mt-2 text-sm">

                    	<input type="text"  id="tc_intro" name="tc_intro" value="${teacherInfo.tc_intro }" class="border rounded h-10 w-full focus:outline-none focus:border-green-200 px-2 mt-2 text-sm" placeholder="Company (optional)"> 
                    	<input type="text" id="tc_phone" name="tc_phone" value="${teacherInfo.tc_phone }"  class="border rounded h-10 w-full focus:outline-none focus:border-green-200 px-2 mt-2 text-sm" placeholder="Address*"> 
                    	<input type="text"  id="tc_loc" name="tc_loc" value="${teacherInfo.tc_loc }" class="border rounded h-10 w-full focus:outline-none focus:border-green-200 px-2 mt-2 text-sm" placeholder="Apartment, suite, etc. (optional)">
                    	<input type="text"  id="tc_price" name="tc_price" value="${teacherInfo.tc_price }" class="border rounded h-10 w-full focus:outline-none focus:border-green-200 px-2 mt-2 text-sm" placeholder="Apartment, suite, etc. (optional)">
                    
                    <div class="grid md:grid-cols-3 md:gap-2"> 
                    	<input type="text" id="tc_teachLan" name="tc_teachLan" value="${teacherInfo.tc_teachLan }"  class="border rounded h-10 w-full focus:outline-none focus:border-green-200 px-2 mt-2 text-sm" placeholder="Zipcode*">
                    	 <input type="text" id="tc_lan1" name="tc_lan1" value="${teacherInfo.tc_lan1 }"  class="border rounded h-10 w-full focus:outline-none focus:border-green-200 px-2 mt-2 text-sm" placeholder="City*"> 
                    </div> 
                    <div class="flex justify-between items-center pt-2"> 
                    	<button type="button" class="h-12 w-24 text-blue-500 text-xs font-medium" onclick="location.href='teacherMypage'">마이페이지로</button> 
                    	<button type="submit" class="h-12 w-48 rounded font-medium text-xs bg-blue-500 text-white">정보수정</button> 
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div> 



</body>
</html>