<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>드림트럭</title>
<meta charset="UTF-8">
	<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/font-awesome.min.css" rel="stylesheet">
    <link href="/resources/css/animate.min.css" rel="stylesheet"> 
    <link href="/resources/css/lightbox.css" rel="stylesheet"> 
	<link href="/resources/css/main.css?ver=1" rel="stylesheet">
	<link href="/resources/css/responsive.css" rel="stylesheet">
  <link rel="shortcut icon" href="/resources/images/ico/favicon.ico">
	<script type="text/javascript" src="/resources/js/jquery.js"></script>
<style type="text/css">
/* -------------------------------- 

Primary style

-------------------------------- */


*, *:after, *:before {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}


/* -------------------------------- 

Modules - reusable parts of our design

-------------------------------- */
.cd-container {
  /* this class is used to give a max-width to the element it is applied to, and center it horizontally when it reaches that max-width */
  width: 1000px;
  max-width: 800px;
  margin: auto;
}
.cd-container::after {
  /* clearfix */
  content: '';
  display: table;
  clear: both;
}

/* -------------------------------- 

Main components 

-------------------------------- */


#cd-timeline {
  position: relative;
  padding: 2em 0;
  margin-top: 2em;
  margin-bottom: 2em;
}
#cd-timeline::before {
  /* this is the vertical line */
  content: '';
  position: absolute;
  top: 0;
  left: 18px;
  height: 100%;
  width: 4px;
  background: #d7e4ed;
}
@media only screen and (min-width: 1170px) {
  #cd-timeline {
    margin-top: 3em;
    margin-bottom: 3em;
  }
  #cd-timeline::before {
    left: 50%;
    margin-left: -2px;
  }
}

.cd-timeline-block {
  position: relative;
  margin: 2em 0;
}
.cd-timeline-block:after {
  content: "";
  display: table;
  clear: both;
}
.cd-timeline-block:first-child {
  margin-top: 0;
}
.cd-timeline-block:last-child {
  margin-bottom: 0;
}
@media only screen and (min-width: 1170px) {
  .cd-timeline-block {
    margin: 4em 0;
  }
  .cd-timeline-block:first-child {
    margin-top: 0;
  }
  .cd-timeline-block:last-child {
    margin-bottom: 0;
  }
}
.cd-left {
    float: left;
}

.cd-left::before {
	top: 24px;
	left: 100%!important;
    border-color: transparent!important;
    border-left-color: white!important;
}

.cd-right {
	float: right;
}

.cd-rigth::before {
	top: 24px;
    left: 100%;
    right: auto;
    border-color: transparent;
    border-right-color: white;
}

@media screen and (max-width: 1169px) and (min-width: 240px) {
	.cd-timeline-content::before{
		border: none!important;
	}
	.cd-timeline-content {
		display: block;
	}
	.cd-left, .cd-right {
		float: left;
	}
	.cd-left::before {
		top: 15px!important;
		right: 100%!important;
		left: auto !important;
		border: 7px solid transparent!important;
		border-color: transparent!important;
		border-right: 7px solid white !important
	}
	
	.cd-timeline-img strong {
		font-size: 15px!important;
	}
	
}


.cd-timeline-img strong {
	font-size: 15px;
}


.cd-timeline-img {
	font-size: 21px;
    position: absolute;
    top: 0;
    left: 0;
    width: 50px;
    height: 50px;
    -webkit-border-radius: 50%;
    border-radius: 50%;
    background-color: #fd9691; /* Circle Color */
    color: #ffffff;
    text-align: center;
    line-height: 1;
    font-size: 12px;
    font-weight: bold;
    padding-top: 6px;
    -webkit-transform: translateZ(0);
    -webkit-backface-visibility: hidden;
}


.cd-timeline-img.cd-movie {
  background: #c03b44;
}
.cd-timeline-img.cd-location {
  background: #f0ca45;
}
@media only screen and (min-width: 1170px) {
  .cd-timeline-img {
    width: 60px;
    height: 60px;
    left: 50%;
    margin-left: -30px;
    /* Force Hardware Acceleration in WebKit */
    -webkit-transform: translateZ(0);
    -webkit-backface-visibility: hidden;
  }
  .cssanimations .cd-timeline-img.is-hidden {
    visibility: hidden;
  }
  .cssanimations .cd-timeline-img.bounce-in {
    visibility: visible;
    -webkit-animation: cd-bounce-1 0.6s;
    -moz-animation: cd-bounce-1 0.6s;
    animation: cd-bounce-1 0.6s;
  }
}

@-webkit-keyframes cd-bounce-1 {
  0% {
    opacity: 0;
    -webkit-transform: scale(0.5);
  }

  60% {
    opacity: 1;
    -webkit-transform: scale(1.2);
  }

  100% {
    -webkit-transform: scale(1);
  }
}
@-moz-keyframes cd-bounce-1 {
  0% {
    opacity: 0;
    -moz-transform: scale(0.5);
  }

  60% {
    opacity: 1;
    -moz-transform: scale(1.2);
  }

  100% {
    -moz-transform: scale(1);
  }
}
@keyframes cd-bounce-1 {
  0% {
    opacity: 0;
    -webkit-transform: scale(0.5);
    -moz-transform: scale(0.5);
    -ms-transform: scale(0.5);
    -o-transform: scale(0.5);
    transform: scale(0.5);
  }

  60% {
    opacity: 1;
    -webkit-transform: scale(1.2);
    -moz-transform: scale(1.2);
    -ms-transform: scale(1.2);
    -o-transform: scale(1.2);
    transform: scale(1.2);
  }

  100% {
    -webkit-transform: scale(1);
    -moz-transform: scale(1);
    -ms-transform: scale(1);
    -o-transform: scale(1);
    transform: scale(1);
  }
}
.cd-timeline-content {
  position: relative;
  margin-left: 60px;
  background: #fdf2f6; /* Box Color */
  border-radius: 0.25em;
  padding: 1em;
  /*box-shadow: 0 3px 0 #d7e4ed;*/
  border: 1px solid #ddd;
}
.cd-timeline-content:after {
  content: "";
  display: table;
  clear: both;
}
.cd-timeline-content h2 {
  color: #303e49;
  f
}
.cd-timeline-content p, .cd-timeline-content .cd-read-more, .cd-timeline-content .cd-date {
  font-size: 13px;
  font-size: 0.8125rem;
}
.cd-timeline-content .cd-read-more, .cd-timeline-content .cd-date {
  display: inline-block;
}
.cd-timeline-content p {
  margin: 1em 0;
  line-height: 1.6;
}
.cd-timeline-content .cd-read-more {
  float: right;
  padding: .8em 1em;
  background: #fd9691;
  color: white;
  border-radius: 0.25em;
}
.no-touch .cd-timeline-content .cd-read-more:hover {
  background-color: #bac4cb;
}
.cd-timeline-content .cd-date {
  float: left;
  padding: .8em 0;
  opacity: .7;
}
.cd-timeline-content::before {
  content: '';
  position: absolute;
  top: 16px;
  right: 100%;
  height: 0;
  width: 0;	
  border: 7px solid transparent;
  border-right: 7px solid white;
  background: #fd9691;
}
@media only screen and (min-width: 768px) {
  .cd-timeline-content h2 {
    font-size: 20px;
    font-size: 1.25rem;
  }
  .cd-timeline-content p {
    font-size: 16px;
    font-size: 1rem;
  }
  .cd-timeline-content .cd-read-more, .cd-timeline-content .cd-date {
    font-size: 14px;
    font-size: 0.875rem;
  }
}
@media only screen and (min-width: 1170px) {
  .cd-timeline-content {
    margin-left: 0;
    padding: 1.6em;
    width: 45%;
  }
  
  .cd-timeline-content .cd-read-more {
    float: left;
  }
  .cd-timeline-content .cd-date {
    position: absolute;
    width: 100%;
    left: 122%;
    top: 6px;
    font-size: 16px;
    font-size: 1rem;
  }
  
  .cd-timeline-block:nth-child(even) .cd-timeline-content .cd-date {
    left: auto;
    right: 122%;
    text-align: right;
  }
  .cssanimations .cd-timeline-content.is-hidden {
    visibility: hidden;
  }
  .cssanimations .cd-timeline-content.bounce-in {
    visibility: visible;
    -webkit-animation: cd-bounce-2 0.6s;
    -moz-animation: cd-bounce-2 0.6s;
    animation: cd-bounce-2 0.6s;
  }
}

@media only screen and (min-width: 1170px) {
  /* inverse bounce effect on even content blocks */
  .cssanimations .cd-timeline-block:nth-child(even) .cd-timeline-content.bounce-in {
    -webkit-animation: cd-bounce-2-inverse 0.6s;
    -moz-animation: cd-bounce-2-inverse 0.6s;
    animation: cd-bounce-2-inverse 0.6s;
  }
}
@-webkit-keyframes cd-bounce-2 {
  0% {
    opacity: 0;
    -webkit-transform: translateX(-100px);
  }

  60% {
    opacity: 1;
    -webkit-transform: translateX(20px);
  }

  100% {
    -webkit-transform: translateX(0);
  }
}
@-moz-keyframes cd-bounce-2 {
  0% {
    opacity: 0;
    -moz-transform: translateX(-100px);
  }

  60% {
    opacity: 1;
    -moz-transform: translateX(20px);
  }

  100% {
    -moz-transform: translateX(0);
  }
}
@keyframes cd-bounce-2 {
  0% {
    opacity: 0;
    -webkit-transform: translateX(-100px);
    -moz-transform: translateX(-100px);
    -ms-transform: translateX(-100px);
    -o-transform: translateX(-100px);
    transform: translateX(-100px);
  }

  60% {
    opacity: 1;
    -webkit-transform: translateX(20px);
    -moz-transform: translateX(20px);
    -ms-transform: translateX(20px);
    -o-transform: translateX(20px);
    transform: translateX(20px);
  }

  100% {
    -webkit-transform: translateX(0);
    -moz-transform: translateX(0);
    -ms-transform: translateX(0);
    -o-transform: translateX(0);
    transform: translateX(0);
  }
}
@-webkit-keyframes cd-bounce-2-inverse {
  0% {
    opacity: 0;
    -webkit-transform: translateX(100px);
  }

  60% {
    opacity: 1;
    -webkit-transform: translateX(-20px);
  }

  100% {
    -webkit-transform: translateX(0);
  }
}
@-moz-keyframes cd-bounce-2-inverse {
  0% {
    opacity: 0;
    -moz-transform: translateX(100px);
  }

  60% {
    opacity: 1;
    -moz-transform: translateX(-20px);
  }

  100% {
    -moz-transform: translateX(0);
  }
}
@keyframes cd-bounce-2-inverse {
  0% {
    opacity: 0;
    -webkit-transform: translateX(100px);
    -moz-transform: translateX(100px);
    -ms-transform: translateX(100px);
    -o-transform: translateX(100px);
    transform: translateX(100px);
  }

  60% {
    opacity: 1;
    -webkit-transform: translateX(-20px);
    -moz-transform: translateX(-20px);
    -ms-transform: translateX(-20px);
    -o-transform: translateX(-20px);
    transform: translateX(-20px);
  }

  100% {
    -webkit-transform: translateX(0);
    -moz-transform: translateX(0);
    -ms-transform: translateX(0);
    -o-transform: translateX(0);
    transform: translateX(0);
  }
}
</style>
<script type = "text/javascript"
 src = "http://maps.googleapis.com/maps/api/js?key=AIzaSyAHwzmzrIszazfIsbVDKdROzIYy-UClUFg"></script>

<script>
$(document).ready(function(){
var geocoder;
var address = "";
var GreenIcon = new google.maps.MarkerImage(
		   "http://labs.google.com/ridefinder/images/mm_20_green.png",
		   new google.maps.Size(12, 20),
		   new google.maps.Point(0, 0),
		   new google.maps.Point(6, 20));
		// 녹색 마커 아이콘을 정의하는 부분
		
geocoder =  new google.maps.Geocoder();
		
function reversegeo(day,count,x, y) {
	var latlng = new google.maps.LatLng(x, y);
	geocoder.geocode({'latLng' : latlng}, function(results, status) {
		  if (status == google.maps.GeocoderStatus.OK)  {
		   if (results[1]){
			  $("#"+day+count).append(results[1].formatted_address);
		   }
		  }else{
			  setTimeout(function(){
				  reversegeo(day, count,x, y);
			  	} ,500);
		  }
		 });
}

	var list = ${list };
	var count = [0,0,0,0,0,0,0];  //일 , 월, 화, 수, 목, 금, 토 카운트 스케줄 개수에 따라 지그재그로 출력하기 위한 카운트
	for ( var num in list) {
		if(list[num].day%2==0 && count[list[num].day]%2 == 0){
			var marginLeft = 0+50*count[list[num].day];
			$("#div"+list[num].day).append('<div class="cd-timeline-content cd-left" style="margin-top: '+marginLeft+'px;">'+
										   '	<h2>'+list[num].title+'</h2>'+
										   '	<p>'+list[num].open+'~'+list[num].close+'</p>'+
										   '	<h2 id="'+list[num].day+count[list[num].day]+'"></h2>'+
										   '	<button type="button" id="detailMap" value="'+list[num].x+","+list[num].y+","+list[num].day+count[list[num].day]+'">지도보기</button>'+
										   '	<hr><div id="map_canvas'+list[num].day+count[list[num].day]+'" class="toggleMap" style="width: 300px; height: 300px;"></div>'+
										   '</div> <!-- cd-timeline-content -->');
		}else if(list[num].day%2==0 && count[list[num].day]%2 == 1){
			var marginRight = 100+50*count[list[num].day];
			$("#div"+list[num].day).append('<div class="cd-timeline-content cd-right" style="margin-top: '+marginRight+'px;">'+
					   					   '	<h2>'+list[num].title+'</h2>'+
					   					   '	<p>'+list[num].open+'~'+list[num].close+'</p>'+
					   					   '	<h2 id="'+list[num].day+count[list[num].day]+'"></h2>'+
					   					   '	<button type="button" id="detailMap" value="'+list[num].x+","+list[num].y+","+list[num].day+count[list[num].day]+'">지도보기</button>'+
					   					   '	<hr><div id="map_canvas'+list[num].day+count[list[num].day]+'" class="toggleMap" style="width: 300px; height: 300px;"></div>'+
					   					   '</div> <!-- cd-timeline-content -->');
		}else if(list[num].day%2==1 && count[list[num].day]%2 == 0){
			var marginRight = 0+50*count[list[num].day];
			$("#div"+list[num].day).append('<div class="cd-timeline-content cd-right" style="margin-top: '+marginRight+'px;">'+
					   '	<h2>'+list[num].title+'</h2>'+
					   '	<p>'+list[num].open+'~'+list[num].close+'</p>'+
					   '	<h2 id="'+list[num].day+count[list[num].day]+'"></h2>'+
					   '	<button type="button" id="detailMap" value="'+list[num].x+","+list[num].y+","+list[num].day+count[list[num].day]+'">지도보기</button>'+
					   '	<hr><div id="map_canvas'+list[num].day+count[list[num].day]+'" class="toggleMap" style="width: 300px; height: 300px;"></div>'+
					   '</div> <!-- cd-timeline-content -->');
}
		else if(list[num].day%2==1 && count[list[num].day]%2 == 1){
			var marginLeft = 100+50*count[list[num].day];
			$("#div"+list[num].day).append('<div class="cd-timeline-content cd-left" style="margin-top: '+marginRight+'px;">'+
					   					   '	<h2>'+list[num].title+'</h2>'+
					   					   '	<p>'+list[num].open+'~'+list[num].close+'</p>'+
					   					   '	<h2 id="'+list[num].day+count[list[num].day]+'"></h2>'+
					   					   '	<button type="button" id="detailMap" value="'+list[num].x+","+list[num].y+","+list[num].day+count[list[num].day]+'">지도보기</button>'+
					   					   '	<hr><div id="map_canvas'+list[num].day+count[list[num].day]+'" class="toggleMap" style="width: 300px; height: 300px;"></div>'+
					   					   '</div> <!-- cd-timeline-content -->');
		}
		reversegeo(list[num].day, count[list[num].day], list[num].x, list[num].y);
		count[list[num].day]++;
	}
	
	var date = new Date();
	var week = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일');
	for (var i = 0; i < 7; i++) {
		if(i!=date.getDay()){
			date.setDate(date.getDate()-date.getDay()+i);
			$("#day"+i).html((date.getMonth()+1)+"월<br>"+date.getDate()+"일<br>"+week[i]);
		}else{
			$("#day"+i).html((date.getMonth()+1)+"월<br>"+date.getDate()+"일<br>"+week[i]);
		}
	}
	
	$("button").on("click", function(){
		var parse = $(this).val().split(',');
		if($(this).html()=='지도보기'){
			$(this).html('지도닫기');
			$("#map_canvas"+parse[2]).show();
			initialize(parse[0],parse[1],parse[2]);
		}else{
			$(this).html('지도보기');
			$("#map_canvas"+parse[2]).hide();
		}
		
	});
	
	$(".toggleMap").hide();
	
	function initialize(x, y, target){
		 var map;
		 var maker=[];
		 var latlng = new google.maps.LatLng(x, y);
		 var myOptions = {
		  zoom: 14,
		  center:latlng,
		  mapTypeId: google.maps.MapTypeId.ROADMAP   
		 };
		 map = new google.maps.Map(document.getElementById("map_canvas"+target), myOptions);
		 maker.push(new google.maps.Marker({
			   position: latlng,
			   map: map
			  } ));
	}
});
</script>
</head>
<body>
<%@include file="../include/header.jsp"%>
   <!-- 배너 -->
  <br>
  <br>
  <section id="services" style="margin-top: 0px">
    <div class="container">
      <div class="row">

        <section id="page-breadcrumb">
          <div class="vertical-center sun">
            <div class="container">
              <div class="row">
                <div class="action">
                  <div class="col-sm-12">
                    <h1 class="title">마이페이지</h1>
                    <p>스케줄관리</p>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </section>
        <br>
      </div>
    </div>
  </section>
  <!-- 배너 -->
    <!--/#action-->
<div class="single-features">
	<a href="upload"><input type="button" class="btn btn-common" style="float: right; margin-right: 300px;" value="등록"></a>
</div>
<section id="cd-timeline" class="cd-container">
		
		<c:forEach begin="0" end="6" varStatus="status">
			<div class="cd-timeline-block">
				<div class="cd-timeline-img cd-picture" id="day${status.index }">
					
				</div> <!-- cd-timeline-img -->
				<div id="div${status.index }">
				
				</div>
			</div> <!-- cd-timeline-block -->
		</c:forEach>
		
</section> <!-- cd-timeline -->
<br>
<%@include file="../include/footer.jsp"%>
</body>
</html>