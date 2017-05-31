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
	<link href="/resources/css/main.css" rel="stylesheet">
	<link href="/resources/css/responsive.css" rel="stylesheet">
<style type="text/css">
h1, h3, form{
	text-align: center;
}
</style>
<script type="text/javascript">

function popupOpen(){

	var popUrl = "searchMap";	//팝업창에 출력될 페이지 URL

	var popOption = "width=500, height=500, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"",popOption);

	}
	
function setChildValue(target, name){
	if(target=='place'){
		document.getElementById("place").value = name;
	}
	else if(target=='point'){
		/* document.getElementById("point").value = name; */
		console.log("좌표 : " + name);
		console.log("x : " + name.lat);
	}
}


</script>
</head>
<body>
<section id="home-slider">
<div class="container">
	<div class="row">
		<div class="single-features">
			<h1>마이페이지</h1>
			<h3>스케줄 등록</h3>
			<form id="main-contact-form" action="">
				<fieldset>
				<div class="form-group">
               		<label class="col-md-4 control-label" for="title">제목</label>
               		<div class="col-md-5">
                  		<input id="title" name="title" type="text" placeholder="제목을 입력 해 주세요." class="form-control input-md" required>
                  		<input id="point" name="point" type="hidden">
               		</div>
            	</div>
            	<div class="form-group">
               		<label class="col-md-4 control-label" for="place">장소</label>
               		<div class="col-md-5">
                  		<input id="place" name="place" type="text" class="form-control input-md" required>
               		</div>
               		<div class="col-md-1">
               			<input class="btn btn-common" style="margin-top: -2px;" type="button" id="map" value="지도" onclick="javascript:popupOpen();">
               		</div>
            	</div>
            	<div class="form-group">
               		<label class="col-md-4 control-label" for="date">일시</label>
               		<div class="col-md-2">
                  		<input id="startDate" name="startDate" type="date" class="form-control input-md" required>
                  	</div>
                  	<div class="col-md-2">
                  		<input id="startTime" name="startTime" type="time" class="form-control input-md" required>
                  	</div>
               		<div class="col-md-2">
                  		<input id="endDate" name="endDate" type="date" class="form-control input-md" required>
                  	</div>
                  	<div class="col-xs-2">
                  		<input id="endTime" name="endTime" type="time" class="form-control input-md" required>
                  	</div>
            	</div>
            	
            	</fieldset>
            	<input class="btn btn-common" type="submit" value="등록">
			</form>
		</div>
	</div>
</div>
</section>
</body>
</html>