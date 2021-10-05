<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e4dc7d49f044b282f847f02a4d57ea5e&libraries=services"></script>
<!-- 해야할 일:
필터 만들기 : 필터링 하는거 HTML로 만들고, 그 필터 적용하는 버튼 누르면 Ajax가 필터에서필터링 data를 선별해서 셀렉트해옴
그러면 아마 자동으로 핀 나올듯.
핀 클릭하면 센세들 정보 열람이 가능하게 만들어야됨.   -->
<script type="text/javascript">
	$(function() {

		var value = $(this).val();
		console.log(value);
		//현재는 처음 실행떄만 갱신됨
		$.ajax({
			url : "/list",
			type : "get",
			dataType : "json",
			success : function(data) {
				console.log("server data : " + data);

				result(data);
			},
			error : function(e) {
				console.log(e);
			}
		});

	});

	function filter() {
		var tc_gender = $("#genderSel").val();
		var tc_teachLan = $("#lanSel").val();
		var tc_avg = $("#avgSel").val();
		var tc_gen = $("#ageSel").val();
		console.log(tc_gender, tc_teachLan)
		$.ajax({
			url : "/filter",
			type : "get",
			dataType : "json",
			data : {
				"tc_gender" : tc_gender,
				"tc_teachLan" : tc_teachLan,
				"tc_avg" : tc_avg,
				"tc_gen" : tc_gen

			},
			success : function(data) {
				console.log("server data : " + data);

				result(data);
			},
			error : function(e) {
				console.log(e);
			}
		});

	}

	function result(data) {
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(37.511, 127.0605), //지도의 중심좌표. 우리는 접속한 사람 주소의 좌표로 할 것
			level : 7
		//지도의 레벨(확대, 축소 정도)
		};

		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		var geocoder = new kakao.maps.services.Geocoder();
		var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
		imageSize = new kakao.maps.Size(40, 40);// 마커이미지의 크기입니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize), markerPosition = new kakao.maps.LatLng(
				37.511, 127.0605); // 마커가 표시될 위치입니다

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : markerPosition,
			image : markerImage
		// 마커이미지 설정 
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		var html = "<table class='table table-striped table-hover'>";

		html += "<tr><th>아이디</th><th>성별</th><th>나이</th><th>과목</th><th>지역</th><th>별점</th></tr>";
		$
				.each(
						data,
						function(key, value) {
							var li = [];
							html += "<tr>";
							html += "<td>" + value.tc_id + "</td>";
							html += "<td>" + value.tc_gender + "</td>";
							html += "<td>" + value.tc_age + "</a></td>";
							html += "<td>" + value.tc_teachLan + "</td>";
							html += "<td>" + value.tc_loc + "</td>";
							html += "<td>" + value.tc_avg + "</td>";
							html += "</tr></div></div>";
							geocoder
									.addressSearch(
											value.tc_loc,
											function(result, status) {

												// 정상적으로 검색이 완료됐으면 
												if (status === kakao.maps.services.Status.OK) {

													var coords = new kakao.maps.LatLng(
															result[0].y,
															result[0].x);

													// 결과값으로 받은 위치를 마커로 표시합니다
													var marker = new kakao.maps.Marker(
															{
																map : map,
																position : coords
															});
													//프사는 마커이미지로
													var iwContent = '<div style="width:150px;text-align:center;padding:6px 0;">ID : '
															+ value.tc_id
															+ '<br>언어 : '
															+ value.tc_teachLan
															+ '<br>시급 : '
															+ value.tc_price
															+ '<br>평점 : '
															+ value.tc_avg
															+ '</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

													// 인포윈도우를 생성합니다
													var infowindow = new kakao.maps.InfoWindow(
															{
																content : iwContent
															});

													// 마커에 마우스오버 이벤트를 등록합니다
													kakao.maps.event
															.addListener(
																	marker,
																	'mouseover',
																	function() {
																		// 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
																		infowindow
																				.open(
																						map,
																						marker);
																	});

													// 마커에 마우스아웃 이벤트를 등록합니다
													kakao.maps.event
															.addListener(
																	marker,
																	'mouseout',
																	function() {
																		// 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
																		infowindow
																				.close();
																	});
													kakao.maps.event
															.addListener(
																	marker,
																	'click',
																	function() {
																		console
																				.log(value.tc_id)
																		//클릭하면 해당 센세 아이디로 접근해서 인포 새창 띄우기
																		var popup = window
																				.open(
																						"/infoWindow?teacherId="
																								+ value.tc_id,
																						"info",
																						"width=550px,height=600px");

																	});
												}
											});
						});

		html += "<table>";
		$("#display").empty();
		$("#display").append(html);

	}
</script>
<title>Insert title here</title>



<style>
#content {
	width: 67%;
	height: 89%;;
	padding: 20px;
	margin-bottom: 20px;
	float: left;
	border: 1px solid #bcbcbc;
}

#sidebar {
	width: 33%;
	height: 89%;
	padding: 20px;
	margin-bottom: 20px;
	float: right;
	border: 1px solid #bcbcbc;
	overflow: auto;
}

body {
	color: #566787;
	background: #f5f5f5;
	font-family: 'Varela Round', sans-serif;
	font-size: 13px;
}

.table-wrapper {
	padding: 10px 5px;
}

.table-title {
	padding-bottom: 0px;
	background: #435d7d;
	color: #fff; /*제목색*/
	padding: 10px 20px;
	border-radius: 3px 3px 0 0;
}

.table-title h2 {
	margin: 5px 0 0;
	font-size: 24px;
}

table.table tr th, table.table tr td {
	border-color: #e9e9e9;
	padding: 12px 5px;
	vertical-align: middle;
}

table.table-striped tbody tr:nth-of-type(odd) {
	background-color: #f4f4f4;
}

th, td {
	text-align: center;
}
</style>

</head>

<body>
	<div class="table-title">
		<div class="row">
			<div class="col-xs-6">
				<!--마이페이지로 화면 전환(홈화면 구성시 이동 예정) 선생님은 로그인한 경우 바로 마이페이지로 이동 학생은 따로 버튼 구성 예정 -->
				<a href="teacherMypage">선생님 마이페이지</a> <a href="studentMypage">학생
					마이페이지</a><br>
				<h2>
					Team <b>Project</b>
				</h2>
			</div>
		</div>
	</div>


	<div id="content">
		<div id="map" style="width: 100%; height: 100%;"></div>
	</div>

	<div id="sidebar">


		<div class="table-wrapper">
			<table>
				<tr>
					<td><select class="form-select form-select-lg mb-3"
						name="genderSel" id="genderSel" style="width: 100px;">
							<option value="">성별전체</option>
							<option value="male">남성</option>
							<option value="female">여성</option>
					</select></td>
					<td><select class="form-select form-select-lg mb-3"
						name="ageSel" id="ageSel" style="width: 100px;">
							<option value="">연령전체</option>
							<option value="gen1">20대미만</option>
							<option value="gen2">20대</option>
							<option value="gen3">30대</option>
							<option value="gen4">40대</option>
							<option value="gen5">50대</option>
							<option value="gen6">60대 이상</option>
					</select></td><td></td>
				</tr>
				<tr>
					<td colspan="2"><input type="text" class="form-control form-control-lg"
						id="lanSel" placeholder="언어" style="width: 198px;"></td>
					<td><input type="button" id="searchLan" value="검색"
						class="btn btn-outline-dark btn btn-secondary btn-lg"
						onclick="filter();"></td>
				</tr>

			</table>
			<div id="display"></div>
</body>

</html>



