<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/font-awesome.min.css" rel="stylesheet">
    <link href="/resources/css/animate.min.css" rel="stylesheet"> 
    <link href="/resources/css/lightbox.css" rel="stylesheet"> 
	<link href="/resources/css/main.css?ver=1" rel="stylesheet">
	<link href="/resources/css/responsive.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type = "text/javascript"
 src = "http://maps.googleapis.com/maps/api/js?key=AIzaSyAHwzmzrIszazfIsbVDKdROzIYy-UClUFg">
</script>

<script type = "text/javascript">

var map;
var address;     //지도에서 클릭한 좌표의 주소
var point;       //지도에서 클릭한 좌표
var infowindow = new google.maps.InfoWindow();
var marker =[];
var geocoder;


var GreenIcon = new google.maps.MarkerImage(
   "http://labs.google.com/ridefinder/images/mm_20_green.png",
   new google.maps.Size(12, 20),
   new google.maps.Point(0, 0),
   new google.maps.Point(6, 20));
// 녹색 마커 아이콘을 정의하는 부분

function initialize(){

 var latlng = new google.maps.LatLng(37.555172, 126.970788);
 var myOptions = {
  zoom: 11,
  center:latlng,
  mapTypeId: google.maps.MapTypeId.ROADMAP   
 };
 
 map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
 geocoder =  new google.maps.Geocoder();
 google.maps.event.addListener(map, 'click', codeCoordinate);
        /*아랫글에서 설명한 event를 이용 지도를 'click'하면 codeCoordinate함수를 실행합니다.
           codeCoordinate함수는 클릭한 지점의 좌표를 가지고 주소를 찾는 함수입니다. */
}

function Setmarker(latLng) {
  if (marker.length > 0)
        {
  marker[0].setMap(null); 
  }
// marker.length는 marker라는 배열의 원소의 개수입니다.
// 만약 이 개수가 0이 아니라면 marker를 map에 표시되지 않게 합니다.
// 이는 다른 지점을 클릭할 때 기존의 마커를 제거하기 위함입니다.

  marker = [];
  marker.length = 0;
// marker를 빈 배열로 만들고, marker 배열의 개수를 0개로 만들어 marker 배열을 초기화합니
// 다.

   marker.push(new google.maps.Marker({
   position: latLng,
   map: map
  } ));
// marker 배열에 새 marker object를 push 함수로 추가합니다.

}
/*클릭한 지점에 마커를 표시하는 함수입니다.
   그런데 이 함수를 잘 봐야 하는 것이 바로 marker를 생성하지 않고 marker라는 배열 안에 Marker 
   obejct  원소를 계속 추가하고 있습니다. 이는 매번 클릭할 때마다 새로운 마커를 생성하기 위함입니
   다. */


//클릭 이벤트 발생 시 그 좌표를 주소로 변환하는 함수입니다.
function codeCoordinate(event) {
 Setmarker(event.latLng);
 point = event.latLng;
        //이벤트 발생 시 그 좌표에 마커를 생성합니다.
        // 좌표를 받아 reverse geocoding(좌표를 주소로 바꾸기)를 실행합니다.
 geocoder.geocode({'latLng' : event.latLng}, function(results, status) {
  if (status == google.maps.GeocoderStatus.OK)  {
   if (results[1])
   {
	   address = results[1].formatted_address;
    infowindow.setContent(results[1].formatted_address);
    infowindow.open(map,marker[0]);
                                //infowindow로 주소를 표시합니다.
   }
  }
 });
}
//
$(document).ready(function(){
	var button = document.getElementById('place');
	button.onclick = function(){
		opener.setChildValue('place', address, ${param.num});
		opener.setChildValue('point', point, ${param.num});
		window.close();
	}
});


 
</script>
<style type="text/css">
LI {list-style-type:circle}
</style>
</head>
<body onload="initialize()">

<div style="margin:auto;  margin-top: 20px;">
	<table>
		<tr>
			<td id="map_canvas" style="width: 500px; height: 500px;">
			</td>
			<td style="width: 10px; height: 10px;"></td>
			<td style="width: 150px; height: 150px;">
				<li>
					지역이동을 통해 <br>&emsp;&nbsp;&nbsp;원하는 지역으로 <br>&emsp;&nbsp;&nbsp;이동해보세요.
				</li><br>
				<li>
					지도의 확대/축소를 <br>&emsp;&nbsp;&nbsp;통해 원하는 지역<br>&emsp;&nbsp;&nbsp;으로 이동해보세요.
				</li><br>
				<li>
					푸드트럭을 운영할 <br>&emsp;&nbsp;&nbsp;장소를 찾아 클릭<br>&emsp;&nbsp;&nbsp;하세요.
				</li><br>
				<li>
					주소를 확인하고 <br>&emsp;&nbsp;&nbsp;'확인'버튼을 클릭<br>&emsp;&nbsp;&nbsp;하세요.
				</li>
			</td>
		</tr>
	</table>
</div>
<button class="btn btn-common" id="place" style="float: right; margin-top: 20px; margin-right: 20px;">확인</button>
</body>
</html>
