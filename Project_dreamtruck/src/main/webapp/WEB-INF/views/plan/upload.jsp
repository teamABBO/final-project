<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/references.jsp"%>
<style type="text/css">
.circle3 {
 width:50px;
 height:50px;
 border-radius:25px;
 -moz-border-radius : 25px;
 -webkit-border-radius : 25px;
 -ms-border-radius :25px;
 -khtml-border-radius : 25px;
 -o-border-radius :25px;
 background:#fd9483;
 font:normal 11px/50px "나눔고딕", "돋움", "굴림";
 color:#fff;
 text-align:center;
}
form{
   text-align: center;
}
</style>
<script type="text/javascript">

function popupOpen(num){

   var popUrl = "searchMap";   //팝업창에 출력될 페이지 URL

   var popOption = "width=650, height=650, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

   window.open(popUrl,"",popOption);

   $("#param").val(num);
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
   function makestr(num){
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
	            '<input id="placename" name="placename" type="text" placeholder="지도를 이용해주세요." class="form-control input-md placename" required>'+
	         '</div>'+
	         '<div class="col-md-1">'+
	            '<input class="btn btn-common" style="margin-top: -2px;" type="button" id="map" data-src="'+num+'" value="지도">'+
	         '</div>'+
	   '</div>'+
	   '<div class="form-group">'+
	         '<label class="col-md-4 control-label" for="date">일시</label>'+
	         '<div class="col-md-1">'+
	            '<select id="day" name="day" class="form-control input-md" style="width:70px;" required>'+
	               '<option value="1">월</option>'+
	               '<option value="2">화</option>'+
	               '<option value="3">수</option>'+
	               '<option value="4">목</option>'+
	               '<option value="5">금</option>'+
	               '<option value="6">토</option>'+
	               '<option value="0">일</option>'+
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
	   return str;
   }
   
   document.getElementById('form').innerHTML = makestr(1);
   $("#add").click(function(){
      if(count==13){
    	  alert("스케줄은 최대 14개만 합시다.");
      }else{
         count++;
         document.getElementById('addForm'+count).innerHTML = makestr(count+1);
      }
      $(this).blur();
   });
   $("#remove").click(function(){
      if(count==0){
    	  alert("전부없앨수 없습니다.");
      }else{
         $('#addForm'+count).empty();
         count--;
      }
      $(this).blur();
   });
   $("#form").on("click", "#map", function(){
      popupOpen($(this).attr("data-src"));
      $(this).blur();
   });
   for (var i = 0; i < 15; i++) {
	   $("#addForm"+i).on("click", "#map", function(){
		      popupOpen($(this).attr("data-src"));
	   }); 
   }
   $(".placename").on("click", function(){
	   alert("지도를 이용해주세요");
   });
   $("#submit").on("click",function(){
	   if($(this).attr('type')=='button'){
		   var dayValue = "";
		   var openValue = "";
		   var closeValue = "";
		   for (var i = 0; i <= count; i++) {
			   if(i!=0){
				   dayValue += ","+$("select[name=day]")[i].value;
				   openValue += ","+$("input[name=open]")[i].value;
				   closeValue += ","+$("input[name=close]")[i].value;
			   }else{
				   dayValue += $("select[name=day]")[i].value;
				   openValue += $("input[name=open]")[i].value;
				   closeValue += $("input[name=close]")[i].value;
			   }
		   }
		   $.ajax({
				url : "uploadCheck",
				type : "post",
				data : {
					userId: ${login.userId},
					day: dayValue,
					open: openValue,
					close: closeValue
				},
				dataType : "text",
				success : function(result) {
					if(result == 'OK'){
						sendAlarm();
						$("#submit").attr("type", "submit");
						$("#submit").trigger("click");
					}else if(result == 'NO'){
						alert('입력하신 시간에 등록되어있는 스케줄이 있습니다.');
					}
				}
			});
	   }
   });
   function sendAlarm(){
		 $.ajax({
           url : 'https://fcm.googleapis.com/fcm/send',
           type: "post",
            headers : {
               'Content-Type' : 'application/json',
               'Authorization' : 'key=AAAAhlGBbq0:APA91bFr0dGj6GP3thL0zkKtpuCZEnj2jZ5YzypbSDI3iAH6FD-J9Q0KnE6jFKMsIEqVRPowSfM-JkvVEj8lhWGgHyThn5GU-sl5tMMd3Yhlo_X7H_MS8q1TjIo4NwHxmTKRDsF3I477'
            },
            data : JSON.stringify({
                "notification": {
                    "title": "Dream Truck",
                    "body": "관심등록하신 푸드트럭의 스케줄이 등록되었습니다! 마이페이지에서 확인하세요!"
                  },
               "to" : "cj4CNWrg5yg:APA91bGyScw4dpOzAEbJxvy8IBnqEP_pAUXEHGy1P_qdcDt5bHPREQGIf5tSlIrOTVEiWbQ0jdkjoUO4KSOIwldCn3sgh6M6pXgoU401YvLemdOA-DGOiK01OmpkqVwcc006bLN-_p0Z",
               
               
            }),
         success: function(error, response, body) {
            if (error) {
               console.error(error, response, body);
            } else if (response.statusCode >= 400) {
               console.error('HTTP Error: ' + response.statusCode + ' - '
                     + response.statusMessage + '\n' + body);
            } else {
               console.log('JSON 메세지 전송 성공!')
            }
         }
     });
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
                    <p>스케쥴등록</p>
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
<section id="home-slider">
<div class="container">
   <div class="row">
   	 <input type="hidden" id="param">
   	 <input type="hidden" id="where" value="upload">
      <div class="single-features">
         <form class="form-horizontal" method="post" action="" id="uploadForm" >
            <input type="button" class="btn btn-common" id="add" value="추가" >
            <input type="button" class="btn btn-common" id="remove" value="제거" >
            <hr>
            <div id="form"> </div>
               
               <c:forEach begin="1" end="13" varStatus="status">
                  <div id="addForm${status.count }"> </div>
               </c:forEach>
               
               <input type="hidden" id="userId" name="userId" value="${login.userId }">
               <input class="btn btn-common" type="button" id="submit" value="등록">
               <div class="hide">
               </div>
               <a href="schedule"><input class="btn btn-common" type="button" value="취소"></a>
         </form>
      </div>
   </div>
</div>
</section>
<%@include file="../include/footer.jsp"%>
</body>
</html>