<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/font-awesome.min.css" rel="stylesheet">
    <link href="/resources/css/animate.min.css" rel="stylesheet"> 
    <link href="/resources/css/lightbox.css" rel="stylesheet"> 
	<link href="/resources/css/main.css" rel="stylesheet">
	<link href="/resources/css/responsive.css" rel="stylesheet">
	<script type="text/javascript" src="/resources/js/jquery.js"></script>
<style type="text/css">

td, th{
	padding: 10px;
}
.table-show{
	float: left;
	width: 12%;
	height: 200px;
	padding: 10px;
}
.table-hidden{
	float: left;
	width: 2%;
}
.table-show:hover {
	cursor: pointer;
    transform: scale(1.5, 1.5);
    transition-duration: 0.3s;
    box-shadow: 10px 10px 5px #888888;
    z-index: 1;
    }
</style>
<script type = "text/javascript"
 src = "http://maps.googleapis.com/maps/api/js?key=AIzaSyAHwzmzrIszazfIsbVDKdROzIYy-UClUFg"></script>

<script>
$(document).ready(function(){
var geocoder;
var address = "";
geocoder =  new google.maps.Geocoder();
function reversegeo(day,x, y) {
	console.log(day);
	var latlng = new google.maps.LatLng(x, y);
	geocoder.geocode({'latLng' : latlng}, function(results, status) {
		  if (status == google.maps.GeocoderStatus.OK)  {
			  console.log(day+"성공");
		   if (results[1])
		   {
			  $("#"+day).append("<br>" + results[1].formatted_address);
		   }
		  }else{
			  console.log(day+"실패");
		  }
		 });
}
	var list = ${list };
	for ( var num in list) {
		$("#"+list[num].day).html(list[num].title + list[num].open + "~" + list[num].close);
		setTimeout(reversegeo(list[num].day, list[num].x, list[num].y), 3000);
		
	}
});

</script>
</head>
<body>
<%@include file="../include/header.jsp"%>
<section id="page-breadcrumb">
        <div class="vertical-center sun">
             <div class="container">
                <div class="row">
                    <div class="action">
                        <div class="col-sm-12">
                            <h1 class="title">마이페이지</h1>
                            <p>스케줄 관리</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   </section>
    <!--/#action-->
<section id="home-slider">
<div class="container">
	<div class="row">
		<div class="single-features">
			<a href="upload"><button class="btn btn-common" style="float: right; margin-right: 100px;">등록</button></a><br>
		</div>
		<table style="float: left; width: 4%;">
			<tr>
				<td></td>
			</tr>
		</table>
		<table border="1" style="width: 3%; float: left;">
			<tr>
				<td>월</td>
			</tr>
		</table>
		<table style="float: left; width: 11%;">
			<tr>
				<td></td>
			</tr>
		</table>
		<table border="1" style="width: 3%; float: left;">
			<tr>
				<td>화</td>
			</tr>
		</table>
		<table style="float: left; width: 11%;">
			<tr>
				<td></td>
			</tr>
		</table>
		<table border="1" style="width: 3%; float: left;">
			<tr>
				<td>수</td>
			</tr>
		</table>
		<table style="float: left; width: 11%;">
			<tr>
				<td></td>
			</tr>
		</table>
		<table border="1" style="width: 3%; float: left;">
			<tr>
				<td>목</td>
			</tr>
		</table>
		<table style="float: left; width: 11%;">
			<tr>
				<td></td>
			</tr>
		</table>
		<table border="1" style="width: 3%; float: left;">
			<tr>
				<td>금</td>
			</tr>
		</table>
		<table style="float: left; width: 11%;">
			<tr>
				<td></td>
			</tr>
		</table>
		<table border="1" style="width: 3%; float: left;">
			<tr>
				<td>토</td>
			</tr>
		</table>
		<table style="float: left; width: 11%;">
			<tr>
				<td></td>
			</tr>
		</table>
		<table border="1" style="width: 3%; float: left;">
			<tr>
				<td>일</td>
			</tr>
		</table>
		
		
		<table class="table-hidden">
			<tr>
				<td></td>
			</tr>
		</table>
		
		<table border="1" class="table-show"> <!-- 월 -->
			<tr>
				<td id="Mon">
				</td>
			</tr>
		</table>
		
		<table class="table-hidden">
			<tr>
				<td></td>
			</tr>
		</table>
		<table border="1" class="table-show"> <!-- 화 -->
			<tr>
				<td id="Tue">
				</td>
			</tr>
		</table>
		<table class="table-hidden">
			<tr>
				<td></td>
			</tr>
		</table>
		<table border="1" class="table-show"> <!-- 수 -->
			<tr>
				<td id="Wen">
				</td>
			</tr>
		</table>
		<table class="table-hidden">
			<tr>
				<td></td>
			</tr>
		</table>
		<table border="1" class="table-show"> <!-- 목 -->
			<tr>
				<td id="Thu">
				</td>
			</tr>
		</table>
		<table class="table-hidden">
			<tr>
				<td></td>
			</tr>
		</table>
		<table border="1" class="table-show"> <!-- 금 -->
			<tr>
				<td id="Fri">
				</td>
			</tr>
		</table>
		<table class="table-hidden">
			<tr>
				<td></td>
			</tr>
		</table>
		<table border="1" class="table-show"> <!-- 토 -->
			<tr>
				<td id="Sat">
				</td>
			</tr>
		</table>
		<table class="table-hidden">
			<tr>
				<td></td>
			</tr>
		</table>
		<table border="1" class="table-show">  <!-- 일 -->
			<tr>
				<td id="Sun">
				</td>
			</tr>
		</table>
	</div>
</div>
</section>
<br>
<%@include file="../include/footer.jsp"%>
</body>
</html>