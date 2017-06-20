<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/references.jsp"%>
</head>
<style type="text/css">
th {
	text-align: center;
}
</style>
<script>
$(document).ready(function () {
	var applierList = ${applierList};
	
	for ( var num in applierList) {
		if (applierList[num].success == "o") {
			$("#confirmTable").append(""+
				"<tr>" + 
      				"<td><a href='/truck/read?userId=" + applierList[num].userId + "'>" + applierList[num].applierName + "</a></td>" +
      				"<td>" + applierList[num].regdate + "</td>" +
      				"<td> <a href='/applier/downloadFile?userId=" + applierList[num].userId + "&docuName=Deong'><button class='btn btn-sm glyphicon glyphicon-save' style='background-color: #fd9483; color:#ffffff'></button></a>" + 
      				" || <a href='/applier/downloadFile?userId=" + applierList[num].userId + "&docuName=License'><button class='btn btn-sm glyphicon glyphicon-save' style='background-color: #fd9483; color:#ffffff'></button></a>" + 
      				" || <a href='/applier/downloadFile?userId=" + applierList[num].userId + "&docuName=Youngup'><button class='btn btn-sm glyphicon glyphicon-save' style='background-color: #fd9483; color:#ffffff'></button></a>" + 
      				" || <a href='/applier/downloadFile?userId=" + applierList[num].userId + "&docuName=Saup'><button class='btn btn-sm glyphicon glyphicon-save' style='background-color: #fd9483; color:#ffffff'></button></a>" + 
      				"</td>" +
      			"<tr>"); 
		} else if (applierList[num].success == "x") {
			$("#applyTable").append(""+
					"<tr>" + 
						"<td></td>" +
	      				"<td><a href='/truck/read?userId=" + applierList[num].userId + "'>" + applierList[num].applierName + "</a></td>" +
	      				"<td>" + applierList[num].regdate + "</td>" +
	      				"<td style='color: red'>거절</td>" + 
	      				"<td></td>" +
	      			"<tr>");
		} else {
			$("#applyTable").append(""+
					"<tr data-applierId='" + applierList[num].applierId + "' >" + 
						"<td><input type='checkbox' class='check' id='" + applierList[num].applierId + "' /></td>" +
	      				"<td><a href='/truck/read?userId=" + applierList[num].userId + "'>" + applierList[num].applierName + "</a></td>" +
	      				"<td>" + applierList[num].regdate + "</td>" +
	      				"<td style='color: orange'>대기</td>" + 
	      				"<td> <button class='btn btn-success confirm'>수락</button> <button class='btn btn-warning deny' id='deny'>거절</button></td>" +
	      			"<tr>");
		}
	}
	
	$("#checkEntire").on("click", function() {
		if ($(this).prop("checked")) {
			$("input[type=checkbox]").prop("checked",true);
		} else {
			$("input[type=checkbox]").prop("checked",false);
		}
	});
	
	$(".confirm").on("click", function() {
		swal({
			  title: '정말 수락하시겠습니까?',
			  text: "수락하시면 취소가 불가능합니다.",
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '수락',
			  cancelButtonText: '취소'
			}).then(function () {
				
	    		sendAlarm();
	    		$.ajax({
	    			url : "/applier/confirm",
	    			type : "post",
	    			data : {
	    				applierId : $(".confirm").parent().parent().attr("data-applierId")
	    			},
	    			dataType : "text",
	    			success : function(result) {
	    				if (result == "success") {
	    					swal('완료!',
	    						 '해당 트럭의 참가를 수락하였습니다',
	    						  'success').then(function(){
	    							  location.reload();
	    						  });
	    					
	    				}
	    			}
	    		});
			  
			});
	});
	
	$(".deny").on("click", function() {
		swal({
			  title: '정말 거절하시겠습니까?',
			  text: "거절하시면 취소가 불가능합니다.",
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '거절',
			  cancelButtonText: '취소'
			}).then(function () {
				
				$.ajax({
	    			url : "/applier/deny",
	    			type : "post",
	    			data : {
	    				applierId : $(".deny").parent().parent().attr("data-applierId")
	    			},
	    			dataType : "text",
	    			success : function(result) {
	    				if (result == "success") {
	    					swal('완료!','해당 트럭의 참가를 거절하였습니다','success').then(function(){
	    							  location.reload();
	    						  });
	    				}
	    			}
	    		});
			  
			});
	});
	
	$("#checkConfirm").on("click", function() {
		swal({
			  title: '정말 수락하시겠습니까?',
			  text: "수락하시면 취소가 불가능합니다.",
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '수락',
			  cancelButtonText: '취소'
			}).then(function () {
	    		var checkedList = $(".check");
	    		var confirmList = "";
	    		for ( var num in checkedList) {
	    			if (checkedList[num].checked) {
	    				confirmList += checkedList[num].id + "-";
	    			}
	    		}
	    		if(confirmList == "") {
	    			swal('오류!',
	    				 '트럭을 선택해주세요!',
	    				 'error').then(function(){
	    					  return;
	    				  });
	    		} else {
	    			
				sendAlarm();
	    		
	    		$.ajax({
	    			url : "/applier/checkConfirm",
	    			type : "post",
	    			data : {
	    				confirmList : confirmList
	    			},
	    			dataType : "text",
	    			success : function(result) {
	    				if (result == "success") {
	    					swal('완료!',
	    						 '선택하신 트럭의 참가를 수락하였습니다',
	    						 'success').then(function(){
	    							  location.reload(); 
	    						  });
	    				}
	    			}
	    		});
			  
	    		}
			});
	});
	
	$("#checkDeny").on("click", function() {
		swal({
			  title: '정말 거절하시겠습니까?',
			  text: "거절하시면 취소가 불가능합니다.",
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '거절',
			  cancelButtonText: '취소'
			}).then(function () {
				var checkedList = $(".check");
	    		var denyList = "";
	    		for ( var num in checkedList) {
	    			if (checkedList[num].checked) {
	    				denyList += checkedList[num].id + "-";
	    			}
	    		}
	    		if(denyList == "") {
	    			swal('오류!',
	    				 '트럭을 선택해주세요!',
	    				 'error').then(function(){
	    					  return;
	    				  });
	    		} else {
	    		
	    		$.ajax({
	    			url : "/applier/checkDeny",
	    			type : "post",
	    			data : {
	    				denyList : denyList
	    			},
	    			dataType : "text",
	    			success : function(result) {
	    				if (result == "success") {
	    					swal('완료!',
	    					     '선택하신 트럭의 참가를 거절하였습니다',
	    						 'success').then(function(){
	    						location.reload();
	    					});
	    				}
	    			}
	    		});
			  
			}
			});
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
                      "body": "신청하신 행사에 참가성공하였습니다! 신청현황 페이지를 확인하세요."
                    },
                 "to" : "cj4CNWrg5yg:APA91bGyScw4dpOzAEbJxvy8IBnqEP_pAUXEHGy1P_qdcDt5bHPREQGIf5tSlIrOTVEiWbQ0jdkjoUO4KSOIwldCn3sgh6M6pXgoU401YvLemdOA-DGOiK01OmpkqVwcc006bLN-_p0Z",
                 
                 
              }),
           success: function(error, response, body) {
           }
       });
	}
});
	
</script>
<body>
	<%@include file="../include/header.jsp"%>
	<!--/#header-->

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
										<p>신청 현황</p>
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
				<div class="col-md-12">
				<a href="/user/myboard"><button type="button" class="btn btn-common pull-right">목록</button></a>
					<h2>참가 확정 트럭</h2>
					<table class="table table-hover" style="text-align: center"
						id="confirmTable">
						<tr>
							<th style="width: 200px">트럭이름</th>
							<th style="width: 90px">신청날짜</th>
							<th style="width: 100px">서류 다운로드<br>등본 | 면허증 | 영업신청서 |
								사업계획서
							</th>
						</tr>
					</table>
					<br>
					<hr>
					<br>
					<h2>신청 트럭</h2>
					<table class="table table-hover" style="text-align: center"
						id="applyTable">
						<tr>
							<th style="width: 20px"><input type="checkbox"
								id="checkEntire" style="margin-right: 10px;">전체</th>
							<th style="width: 200px">트럭이름</th>
							<th style="width: 70px">신청날짜</th>
							<th style="width: 20px">승인여부</th>
							<th style="width: 100px">
								<button class="btn btn-success" id="checkConfirm">선택 수락</button>
								<button class="btn btn-warning" id="checkDeny">선택 거절</button>
							</th>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" id="sendAlarm" />
	<%@include file="../include/footer.jsp"%>
	<!--/#footer-->
</body>
</html>