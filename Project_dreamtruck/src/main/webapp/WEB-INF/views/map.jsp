<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="include/references.jsp"%>
 <script>
 $(document).ready(function(){
	 var GreenIcon = new google.maps.MarkerImage(
			   "http://labs.google.com/ridefinder/images/mm_20_green.png",
			   new google.maps.Size(12, 20),
			   new google.maps.Point(0, 0),
			   new google.maps.Point(6, 20));
			// 녹색 마커 아이콘을 정의하는 부분
		 var truckIcon = '/resources/images/truckMarker.png';
		 var map;
		 var maker=[];
		 var latlng;
		 var list = ${list };
		 var infowindow = new google.maps.InfoWindow();
		 
		 navigator.geolocation.getCurrentPosition(function(pos) {
			    latlng = new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude);
				 var myOptions = {
				  zoom: 12,
				  center:latlng,
				  mapTypeId: google.maps.MapTypeId.ROADMAP   
				 };
				 map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
				 for ( var num in list) {
					 latlng = new google.maps.LatLng(list[num].x, list[num].y);
					 maker.push(new google.maps.Marker({
						   position: latlng,
						   icon: truckIcon,
						   animation: google.maps.Animation.DROP,
						   id: num,
						   map: map
						  } ));
					 maker[num].addListener('mouseover', function(){
						infowindow.setContent('제'+'&emsp;&emsp;'+'목 : ' + list[this.id].title + '<br>'+
								              '트럭이름 : ' + list[this.id].truckName + '<br>'+
								              '음식종류 : ' + list[this.id].truckFood + '<br>'+
								              '영업시간 : ' + list[this.id].open + '~' + list[this.id].close+ '<br>'+
								              '전화번호 : ' + list[this.id].phone + '<br>'+
								              '<hr>'+
								              '<img src="/displayFile?fileName=/user/'+list[this.id].id+'/s_'+list[this.id].truckImg+'" class="img-responsive" style="margin: auto;" />'); 
						infowindow.setSize(new google.maps.Size(100,100));
						infowindow.open(map, this);
					 });
					 maker[num].addListener('mouseout', function(){
							infowindow.close();
					 });
					 maker[num].addListener('click', function(){
							self.location.href = "/truck/read?userId="+list[this.id].userId;
					 });
				}
				 latlng = new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude);
				 maker.push(new google.maps.Marker({   
					   position: latlng,
					   map: map
					  } ));
				 var infowindowMyPosition = new google.maps.InfoWindow( 
					     { content: '내 위치', 
					       size: new google.maps.Size(100,100) 
					     });
				 maker[list.length].addListener('mouseover', function(){
					 infowindowMyPosition.open(map, maker[list.length]);
				 });
				 maker[list.length].addListener('mouseout', function(){
					 infowindowMyPosition.close();
				 });
			}); 
 });

 </script>
</head>
<body>
<%@include file="include/header.jsp"%>
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
                    <h1 class="title">트럭지도</h1>
                    <p>주변트럭찾기</p>
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
  <div class="container">
  		<div class="row">
    		<div class="single-features">
      			<div id="map_canvas" class="col-sm-12" style="height: 500px;"></div>
      			<div id="hidden"></div>
      		</div>
      	</div>
  </div>
<%@include file="include/footer.jsp"%>
  
</body>
</html>