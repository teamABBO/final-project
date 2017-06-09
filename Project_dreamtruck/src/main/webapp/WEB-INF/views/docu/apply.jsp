<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>드림트럭</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/font-awesome.min.css" rel="stylesheet">
<link href="/resources/css/animate.min.css" rel="stylesheet">
<link href="/resources/css/lightbox.css" rel="stylesheet">
<link href="/resources/css/main.css" rel="stylesheet">
<link href="/resources/css/responsive.css" rel="stylesheet">
<link rel="shortcut icon" href="/resources/images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
  href="/resources/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
  href="/resources/images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
  href="/resources/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
  href="/resources/images/ico/apple-touch-icon-57-precomposed.png">
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/lightbox.min.js"></script>
<script type="text/javascript" src="/resources/js/wow.min.js"></script>
<script type="text/javascript" src="/resources/js/main.js"></script>
<script type="text/javascript"
  src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAHwzmzrIszazfIsbVDKdROzIYy-UClUFg">
</script>
<script>
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
	
  	$(document).ready(function() {
		var docuList = ${docuList};
		var today = new Date();
		
		/* 서류 종류별 model 설정 */
		for ( var num in docuList) {
			var name = docuList[num].docuName;
				$("#download" + name).attr("href", ("downloadFile?fileName="+docuList[num].path));
				$("#download" + name + "Btn").removeAttr("disabled");
				$("#regist" + name + "Btn").attr("disabled", "disabled");
				$("#modify" + name + "Btn").removeAttr("disabled");
				$("#modify" + name + "Btn").attr("data-id", docuList[num].docuId);
				$("#modify" + name + "Btn").attr("data-path", docuList[num].path);
				$("#delete" + name).attr("data-src", docuList[num].path);
				$("#delete" + name).attr("data-id", docuList[num].docuId);
				$("#delete" + name).removeAttr("disabled");
				$("#regdate" + name).html(docuList[num].regdate);
				$("#expdate" + name).html(docuList[num].expdate);
				
				var dateArray = docuList[num].expdate.split("/");
				var dateObj = new Date(dateArray[0], Number(dateArray[1])-1, dateArray[2]);
				
				var betweenDay = ((dateObj.getTime() - today.getTime()) / 1000 / 60 / 60 / 24);
				
				if (betweenDay <= 0) {
					$("#icon" + name).attr("style", "color: red");
				} else if (betweenDay > 0 && betweenDay <= 28) {
					$("#icon" + name).attr("style", "color: #e7b903");
				} else {
					$("#icon" + name).attr("style", "color: green");
				}
		}

		/* 삭제 버튼 이벤트 처리 */
		$(".btn-danger").on("click", function(event) {
			var kind = $(this).parent().parent().parent().parent().attr("id");
			
			var aId = "download" + kind;
			var downloadId = "download" + kind + "Btn";
			var deleteId = "delete" + kind;
			var iconId = "icon" + kind
			
			if (confirm("정말 삭제하시겠습니까??") == true){
				$.ajax({
					url : "deleteFile",
					type : "post",
					data : {
						fileName : $(this).attr("data-src"),
						docuId : $(this).attr("data-id")
					},
					dataType : "text",
					success : function(result) {
						if (result == "deleted") {
							$("#download" + kind).removeAttr("href");
							$("#download" + kind + "Btn").attr("disabled", "disabled");
							$("#regist" + kind + "Btn").removeAttr("disabled");
							$("#modify" + kind + "Btn").attr("disabled", "disabled");
							$("#delete" + kind).attr("disabled", "disabled");
							$("#icon" + kind).attr("style", "color: black");
							$("#regdate" + kind).attr("style", "color: black");
							$("#regdate" + kind).html(" - ");
							$("#expdate" + kind).html(" - ");
							alert("삭제되었습니다.");
						}
					}
				});
			} else {
			    return;
			}
		});
		
		/* 등록버튼 */
		$(".btn-primary").on("click", function() {
			console.log($(this).parent().parent().parent().parent().attr("id"));
			var downName = $(this).parent().parent().parent().parent().attr("id");
			$("[name='docuName']").attr("value", downName);
		});
		
		/* 수정버튼 */
		$(".btn-success").on("click", function() {
			var downName = $(this).parent().parent().parent().parent().attr("id");
			$("[name='docuName']").attr("value", downName);
			$("[name='docuId']").attr("value", $(this).attr("data-id"));
			$("[name='path']").attr("value", $(this).attr("data-path"));
		});
		
	  	$("#place").on("click", function(){
	  		opener.setChildValue('place', address, ${param.num});
	  		opener.setChildValue('point', point, ${param.num});
	  		window.close();
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
              <td id="map_canvas" style="width: 700px; height: 500px;">
              </td>
              <td style="width: 50px; height: 500px;"></td>
              <td style="width: 300px; height: 500px;">
                <h3>* 영업하고 싶은 지역을 선택하시면 서류를 제출해야하는 기관이 표시됩니다.</h3><br>
                <h3>* '영업신청' 버튼을 클릭하여 등록하신 서류를 간편하게 제출하세요!</h3><br><br><br>
                      <input id="placename" name="placename" type="text" style="margin-bottom: 20px"
                        class="form-control input-md placename" required disabled>
                  <button class="btn btn-common form-control" type="button" style="font-size: large;">영 업 신 청</button>
              </td>
            </tr>
          </table>
        </div>
      </div>
    </div>
  </div>

  <%@include file="../include/footer.jsp"%>
  <!--/#footer-->

</body>
</html>