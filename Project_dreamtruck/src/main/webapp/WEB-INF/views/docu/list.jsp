<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/references.jsp"%>
<script>
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
					sendAlarm();
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
			
			swal({
				  title: '정말 삭제하시겠습니까?',
				  text: "거절하시면 취소가 불가능합니다.",
				  type: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '삭제',
				  cancelButtonText: '취소'
				}).then(function () {
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
							}
						}
					});
				  swal(
				    '완료!',
				    '해당 서류가 삭제되었습니다',
				    'success'
				  );
				});
		});
		
		/* 등록버튼 */
		$(".btn-primary").on("click", function() {
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
	                      "body": "등록하신 서류가 만료되었습니다! 서류관리 페이지를 확인하세요."
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
                    <p>서류관리</p>
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
  <!--/#page-breadcrumb-->
  <div class="container">
  <div class="row">
    <div class="col-md-12">
      <caption>
        <pre class="glyphicon glyphicon-file" style="color: green"> 등록완료 </pre>
        <pre class="glyphicon glyphicon-file" style="color: #e7b903"> 만료임박 </pre>
        <pre class="glyphicon glyphicon-file" style="color: red"> 기간만료 </pre>
        <pre class="glyphicon glyphicon-file" > 미등록 </pre>
      </caption>
      <div class="panel panel-default">
        <div class="panel-heading text-center">
          <span><strong><span
              class="glyphicon glyphicon-folder-open"
              style="margin-right: 5px"> </span> 서류 관리</strong></span>
        </div>
        <table class="table table-bordered table-hover vmiddle">
          <thead>
            <tr>
              <th></th>
              <th>종류</th>
              <th style="text-align: center">저장 / 등록 / 수정 / 삭제</th>
              <th>등록일자</th>
              <th>만료일자</th>
            </tr>
          </thead>
          <tbody>
            <tr id="Deong">
              <td class="text-center"><span id="iconDeong"
                class="glyphicon glyphicon-file" style="color: black"></span></td>
              <td>등/초본</td>
              <td class="text-center"><a id="downloadDeong" ><span><button id="downloadDeongBtn" disabled
                  class="btn btn-sm btn-warning glyphicon glyphicon-save"></button></span></a>
                <a><span><button id="registDeongBtn"
                  class="btn btn-sm btn-primary glyphicon glyphicon-pencil"
                  data-toggle="modal" data-target="#registModal"></button></span></a>
                <a><span><button
                  class="btn btn-sm btn-success glyphicon glyphicon-refresh" id="modifyDeongBtn" disabled
                  data-toggle="modal" data-target="#modifyModal" data-id=""></button></span></a>
                <a><span><button disabled
                  class="btn btn-sm btn-danger glyphicon glyphicon-trash"
                  id="deleteDeong" data-src=""></button></span></a></td>
              <td id="regdateDeong"> - </td>
              <td id="expdateDeong"> - </td>
            </tr>
            <tr id="License">
              <td class="text-center"><span id="iconLicense"
                class="glyphicon glyphicon-file" style="color: black"></span></td>
              <td>면허증</td>
              <td class="text-center"><a id="downloadLicense"><span><button id="downloadLicenseBtn" disabled
                  class="btn btn-sm btn-warning glyphicon glyphicon-save"></button></span></a>
                <a><span><button id="registLicenseBtn"
                  class="btn btn-sm btn-primary glyphicon glyphicon-pencil"
                  data-toggle="modal" data-target="#registModal"></button></span></a>
                <a><span><button
                  class="btn btn-sm btn-success glyphicon glyphicon-refresh" id="modifyLicenseBtn" disabled
                  data-toggle="modal" data-target="#modifyModal" data-id=""></button></span></a>
                <a><span><button disabled
                  class="btn btn-sm btn-danger glyphicon glyphicon-trash"
                  id="deleteLicense" data-src=""></button></span></a></td>
              <td id="regdateLicense"> - </td>
              <td id="expdateLicense"> - </td>
            </tr>
            <tr id="Saup">
              <td class="text-center"><span id="iconSaup"
                class="glyphicon glyphicon-file" style="color: black"></span></td>
              <td>사업계획서</td>
              <td class="text-center"><a id="downloadSaup"><span><button id="downloadSaupBtn" disabled
                  class="btn btn-sm btn-warning glyphicon glyphicon-save"></button></span></a>
                <a><span><button id="registSaupBtn"
                  class="btn btn-sm btn-primary glyphicon glyphicon-pencil"
                  data-toggle="modal" data-target="#registModal"></button></span></a>
                <a><span><button
                  class="btn btn-sm btn-success glyphicon glyphicon-refresh"  id="modifySaupBtn" disabled
                  data-toggle="modal" data-target="#modifyModal" data-id=""></button></span></a>
                <a><span><button disabled
                  class="btn btn-sm btn-danger glyphicon glyphicon-trash"
                  id="deleteSaup" data-src=""></button></span></a></td>
              <td id="regdateSaup"> - </td>
              <td id="expdateSaup"> - </td>
            </tr>
            <tr id="Youngup">
              <td class="text-center"><span id="iconYoungup"
                class="glyphicon glyphicon-file" style="color: black"></span></td>
              <td>영업신청서</td>
              <td class="text-center"><a id="downloadYoungup"><span><button id="downloadYoungupBtn" disabled
                  class="btn btn-sm btn-warning glyphicon glyphicon-save"></button></span></a>
                <a><span><button id="registYoungupBtn"
                  class="btn btn-sm btn-primary glyphicon glyphicon-pencil"
                  data-toggle="modal" data-target="#registModal"></button></span></a>
                <a><span><button
                  class="btn btn-sm btn-success glyphicon glyphicon-refresh"  id="modifyYoungupBtn" disabled
                  data-toggle="modal" data-target="#modifyModal" data-id=""></button></span></a>
                <a><span><button disabled
                  class="btn btn-sm btn-danger glyphicon glyphicon-trash"
                  id="deleteYoungup" data-src=""></button></span></a></td>
              <td id="regdateYoungup"> - </td>
              <td id="expdateYoungup"> - </td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="panel panel-default" style="margin-bottom: 300px">
        <div class="panel-heading text-center"></div>
      </div>
    </div>
  </div>
  </div>

  <%@include file="../include/footer.jsp"%>
  <!--/#footer-->

  <!-- Regist Modal -->
  <div id="registModal" class="modal modal-primary fade" role="dialog">
    <div class="modal-dialog modal-md"
      style="background-color: #ffffff;">
      <!-- modal content -->
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"></h4>
      </div>
      <form id="registForm" action="uploadForm" method="post"
        enctype="multipart/form-data">
        <div class="modal-body" data-docunum>
          <p style="font-weight: bolder;">서류파일 :</p>
          <input type="file" name="file" class="form-control"
            style="margin-bottom: 10px;" required>
          <p style="font-weight: bolder;">만료일자 :</p>
          <input type="date" class="form-control input-md"
            style="margin-bottom: 10px;" name="expdate" required>
          <input type="hidden" name="userId" value="${login.userId }" />
          <input type="hidden" name="docuName" value="" />
        </div>
        <div class="modal-footer">
          <input type="submit" class="btn" style="color: green" value="저장">
          <input type="reset" class="btn btn-warning" value="취소">
        </div>
      </form>
    </div>
  </div>
  
  <!-- Modify Modal -->
  <div id="modifyModal" class="modal modal-primary fade" role="dialog">
    <div class="modal-dialog modal-md"
      style="background-color: #ffffff;">
      <!-- modal content -->
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"></h4>
      </div>
      <form id="modifyForm" action="modifyForm" method="post"
        enctype="multipart/form-data">
        <div class="modal-body" data-docunum>
          <p style="font-weight: bolder;">서류파일 :</p>
          <input type="file" name="file" class="form-control"
            style="margin-bottom: 10px;" required>
          <p style="font-weight: bolder;">만료일자 :</p>
          <input type="date" class="form-control input-md"
            style="margin-bottom: 10px;" name="expdate" required>
          <input type="hidden" name="userId" value="${login.userId }" />
          <input type="hidden" name="docuName" value="" />
          <input type="hidden" name="docuId" value="" />
          <input type="hidden" name="path" value="" />
        </div>
        <div class="modal-footer">
          <input type="submit" class="btn" style="color: green" value="저장">
          <input type="reset" class="btn btn-warning" value="취소"> 
        </div>
      </form>
    </div>
  </div>
</body>
</html> 