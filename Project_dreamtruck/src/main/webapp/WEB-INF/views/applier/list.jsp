<%@ page contentType="text/html; charset=utf-8"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>드림트럭</title>
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/lightbox.min.js"></script>
<script type="text/javascript" src="/resources/js/wow.min.js"></script>
<script type="text/javascript" src="/resources/js/main.js"></script>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/font-awesome.min.css" rel="stylesheet">
<link href="/resources/css/animate.min.css" rel="stylesheet">
<link href="/resources/css/lightbox.css" rel="stylesheet">
<link href="/resources/css/main.css" rel="stylesheet">
<link href="/resources/css/responsive.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<link href="/resources/css/sweetalert.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/sweetalert.min.js"></script>
<link rel="shortcut icon" href="/resources/images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
  href="/resources/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
  href="/resources/images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
  href="/resources/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
  href="/resources/images/ico/apple-touch-icon-57-precomposed.png">
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
		if (confirm("취소가 불가능합니다. 정말 수락하시겠습니까?") == true){
    		$.ajax({
    			url : "/applier/confirm",
    			type : "post",
    			data : {
    				applierId : $(this).parent().parent().attr("data-applierId")
    			},
    			dataType : "text",
    			success : function(result) {
    				if (result == "success") {
    					location.reload();
    				}
    			}
    		});
		} else {
			return;
		}
	});
	
	$(".deny").on("click", function() {
		if (confirm("취소가 불가능합니다. 정말 거절하시겠습니까?") == true){
    		$.ajax({
    			url : "/applier/deny",
    			type : "post",
    			data : {
    				applierId : $(this).parent().parent().attr("data-applierId")
    			},
    			dataType : "text",
    			success : function(result) {
    				if (result == "success") {
    					location.reload();
    				}
    			}
    		});
		} else {
			return;
		}
	});
	
	$("#checkConfirm").on("click", function() {
		if (confirm("취소가 불가능합니다. 정말 수락하시겠습니까?") == true){
    		var checkedList = $(".check");
    		var confirmList = "";
    		for ( var num in checkedList) {
    			if (checkedList[num].checked) {
    				confirmList += checkedList[num].id + "-";
    			}
    		}
    		
    		$.ajax({
    			url : "/applier/checkConfirm",
    			type : "post",
    			data : {
    				confirmList : confirmList
    			},
    			dataType : "text",
    			success : function(result) {
    				if (result == "success") {
    					location.reload();
    				}
    			}
    		});
		} else {
			return;
		}
	});
	
	$("#checkDeny").on("click", function() {
		if (confirm("취소가 불가능합니다. 정말 거절하시겠습니까?") == true){
    		var checkedList = $(".check");
    		var denyList = "";
    		for ( var num in checkedList) {
    			if (checkedList[num].checked) {
    				denyList += checkedList[num].id + "-";
    			}
    		}
    		
    		$.ajax({
    			url : "/applier/checkDeny",
    			type : "post",
    			data : {
    				denyList : denyList
    			},
    			dataType : "text",
    			success : function(result) {
    				if (result == "success") {
    					location.reload();
    				}
    			}
    		});
		} else {
			return;
		}
	});
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
          <h2>참가 확정 트럭</h2>
          <table class="table table-hover" style="text-align: center" id="confirmTable">
            <tr>
              <th style="width: 200px">트럭이름</th>
              <th style="width: 90px">신청날짜</th>
              <th style="width: 100px">서류 다운로드<br>등본 | 면허증 | 영업신청서 | 사업계획서</th>
            </tr>
          </table>
          <br>
          <hr>
          <br>
          <h2>신청 트럭</h2>
          <table class="table table-hover" style="text-align: center" id="applyTable">
            <tr>
              <th style="width: 20px"><input type="checkbox" id="checkEntire">전체</th>
              <th style="width: 200px">트럭이름</th>
              <th style="width: 70px">신청날짜</th>
              <th style="width: 20px">승인여부</th>
              <th style="width: 100px"> <button class="btn btn-success" id="checkConfirm">선택 수락</button> <button class="btn btn-warning" id="checkDeny">선택 거절</button></th>
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