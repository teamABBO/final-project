<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/references.jsp"%>
<script>
    var map;
    var address;     //지도에서 클릭한 좌표의 주소
    var point;       //지도에서 클릭한 좌표
    var infowindow = new google.maps.InfoWindow();
    var marker =[];
    var geocoder;
    
    function initialize(){
    	$("#applyBtn").hide();
    
       var latlng = new google.maps.LatLng(37.555172, 126.970788);
       var myOptions = {
        zoom: 11,
        center:latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP   
       };
       
       map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
       geocoder =  new google.maps.Geocoder();
       google.maps.event.addListener(map, 'click', codeCoordinate);
    }
      
      function Setmarker(latLng) {
        if (marker.length > 0) {
        	marker[0].setMap(null); 
        }
        
        marker = [];
        marker.length = 0;
      
        marker.push(new google.maps.Marker({
         	position: latLng,
          	map: map
        }));
      
      }

      function codeCoordinate(event) {
       Setmarker(event.latLng);
       point = event.latLng;

       geocoder.geocode({'latLng' : event.latLng}, function(results, status) {
          if (status == google.maps.GeocoderStatus.OK)  {
             if (results[1]) {
            	  address = results[1].formatted_address;
                infowindow.setContent(results[1].formatted_address);
                infowindow.open(map,marker[0]);
                
                $.ajax({
                    url: "getLocation",
                    type: "POST",
                    data : {
        				latitude : event.latLng.lat(),
        				longitude : event.latLng.lng()
        			},
                    dataType: "text",
                    success: function(result) {
                        $("#location").attr("value", result);
                        if (result == "서비스 구역이 아닙니다." || result == "") {
							$("#applyBtn").hide();
						} else {
							$("#applyBtn").show();
						}
                    }
                });
             }
          }
       });
      }
      
      $(document).ready(function() {
    	  $("#applyBtn").on("click", function() {
        	  $.ajax({
                  url: "send",
                  type: "POST",
                  data : {
      				location : $("#location").attr("value")
      			},
                dataType: "text",
                success: function(result) {
                	if (result == "success") {
    					self.location = "success";
    				}
                },
      			error: function(result) {
					$("#loadingModal").hide();
					swal({
						  title: '필요 서류가 부족합니다.',
						  text: "서류를 등록/수정해주세요. 확인을 누르시면 서류관리 페이지로 이동합니다.",
						  type: 'warning',
						  showCancelButton: true,
						  confirmButtonColor: '#3085d6',
						  cancelButtonColor: '#d33',
						  confirmButtonText: '확인',
						  cancelButtonText: '취소'
						}).then(function () {
							self.location = "/docu/list";
						});
				}
              });
          }); 
      });
</script>
</head>
<body onload="initialize()">

	<%@include file="../include/header.jsp"%>
	<!-- /header -->

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
										<p>영업신청서 제출</p>
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
			<div class="col-sm-12">
				<div style="margin: auto; margin-top: 20px; margin-bottom: 50px">
					<table>
						<tr>
							<td id="map_canvas" style="width: 700px; height: 500px;"></td>
							<td style="width: 50px; height: 500px;"><div id="place"></div></td>
							<td style="width: 300px; height: 500px;">
								<h3>* 영업하고 싶은 지역을 선택하시면 서류를 제출해야하는 기관이 표시됩니다.</h3>
								<br>
								<h3>* '영업신청' 버튼을 클릭하여 등록하신 서류를 간편하게 제출하세요!</h3>
								<br>
							<br>
							<br> <input id="location" name="location" type="text"
								style="margin-bottom: 20px" class="form-control input-md"
								required disabled value="">
								<button class="btn btn-common form-control" type="submit"
									style="font-size: large;" id="applyBtn" data-toggle="modal"
									data-target="#loadingModal">영 업 신 청</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>

	<%@include file="../include/footer.jsp"%>
	<!--/#footer-->

	<!-- Modify Modal -->
	<div id="loadingModal" class="modal modal-primary fade" role="dialog">
		<div class="modal-dialog modal-md" style="background-color: #ffffff;">
			<!-- modal content -->
			<div class="modal-header">
				<h4 class="modal-title"></h4>
			</div>
			<form id="modifyForm" action="modifyForm" method="post"
				enctype="multipart/form-data">
				<div class="modal-body">
					<h3>처리를 완료하는 중입니다.</h3>
					<br>
					<h3>최대 1분의 시간이 소요될 수 있습니다.</h3>
					<br>
					<h3>잠시만 기다려주세요.</h3>
					<br>
				</div>
				<div class="modal-footer"></div>
			</form>
		</div>
	</div>

</body>
</html>