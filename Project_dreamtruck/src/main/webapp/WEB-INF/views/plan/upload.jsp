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
form{
	text-align: center;
}
</style>
<script type="text/javascript">

function popupOpen(num){

	var popUrl = "searchMap?num="+num+"";	//팝업창에 출력될 페이지 URL

	var popOption = "width=500, height=500, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"",popOption);

	}
	
function setChildValue(target, name, num){
	if(target=='place'){
		document.getElementsByClassName("placename")[num-1].value = name;
	}
	else if(target=='point'){
		document.getElementsByClassName("x")[num-1].value = name.lat();
		document.getElementsByClassName("y")[num-1].value = name.lng();
	}
}
</script>
<script>
$(document).ready(function(){
	var count=0;
	var str = '';
	str += '<fieldset>'+
		'<div class="form-group">' +
		'<label class="col-md-4 control-label" for="title">제목</label>'+
   		'<div class="col-md-5">'+
      		'<input id="title" name="title" type="text" placeholder="제목을 입력 해 주세요." class="form-control input-md" required>'+
   		'</div>'+
   		'<div class="col-md-5">'+
   			'<input id="x" name="x" type="hidden" class="form-control input-md x" required>'+
   			'<input id="y" name="y" type="hidden" class="form-control input-md y" required>'+
   		'</div>'+
	'</div>'+
	'<div class="form-group">'+
   		'<label class="col-md-4 control-label" for="place">장소</label>'+
   		'<div class="col-md-5">'+
      		'<input id="placename" name="placename" type="text" class="form-control input-md placename" required>'+
   		'</div>'+
   		'<div class="col-md-1">'+
   			'<input class="btn btn-common" style="margin-top: -2px;" type="button" id="map" value="지도">'+
   		'</div>'+
	'</div>'+
	'<div class="form-group">'+
   		'<label class="col-md-4 control-label" for="date">일시</label>'+
   		'<div class="col-xs-1">'+
      		'<select id="day" name="day" class="form-control input-md" required>'+
      			'<option value="Mon">월</option>'+
      			'<option value="Tue">화</option>'+
      			'<option value="Wen">수</option>'+
      			'<option value="Thu">목</option>'+
      			'<option value="Fri">금</option>'+
      			'<option value="Sat">토</option>'+
      			'<option value="Sun">일</option>'+
      		'</select>'+
      	'</div>'+
      	'<div class="col-xs-2">'+
      		'<input id="open" name="open" type="time" class="form-control input-md" required>'+
      	'</div>'+
      	'<div class="col-xs-1">'+
      		'<label>~</label>'+
      	'</div>'+
      	'<div class="col-xs-2">'+
      		'<input id="close" name="close" type="time" class="form-control input-md" required>'+
      	'</div>'+
	'</div>'+
	'<hr>'+
	'</fieldset>';
	document.getElementById('form').innerHTML = str;
	$("#add").click(function(){
		if(count==6){
			alert("스케줄은 최대 7개만 합시다.");
		}else{
			count++;
	        document.getElementById('addForm'+count).innerHTML = str;
		}
	});
	$("#remove").click(function(){
		if(count==0){
			alert("전부없앨꺼면 왜 등록하냐?");
		}else{
			$('#addForm'+count).empty();
			count--;
		}
	});
	$("#form").on("click", "#map", function(){
		popupOpen(1);
	});
	$("#addForm1").on("click", "#map", function(){
		popupOpen(2);
	});
	$("#addForm2").on("click", "#map", function(){
		popupOpen(3);
	});
	$("#addForm3").on("click", "#map", function(){
		popupOpen(4);
	});
	$("#addForm4").on("click", "#map", function(){
		popupOpen(5);
	});
	$("#addForm5").on("click", "#map", function(){
		popupOpen(6);
	});
	$("#addForm6").on("click", "#map", function(){
		popupOpen(7);
	});
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
                            <p>스케줄 등록</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   </section>
<section id="home-slider">
<div class="container">
	<div class="row">
		<div class="single-features">
			
			<form class="form-horizontal" method="post" role="form">
				<input type="button" class="btn btn-common" id="add" value="+">
				<input type="button" class="btn btn-common" id="remove" value="-">
				<div id="form"> </div>
            	
            	<c:forEach begin="1" end="6" varStatus="status">
            		<div id="addForm${status.count }"> </div>
            	</c:forEach>
            	
            	<input class="btn btn-common" type="submit" value="등록">
            	<a href="schedule"><input class="btn btn-common" type="button" value="취소"></a>
			</form>
		</div>
	</div>
</div>
</section>
<%@include file="../include/footer.jsp"%>
</body>
</html>