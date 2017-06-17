<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/references.jsp"%>
</head>
<style type="text/css">
.container{
    margin-top:20px;
}
.image-preview-input {
    position: relative;
    overflow: hidden;
    margin: 0px;    
    color: #333;
    background-color: #fff;
    border-color: #ccc;    
}
.image-preview-input input[type=file] {
   position: absolute;
   top: 0;
   right: 0;
   margin: 0;
   padding: 0;
   font-size: 20px;
   cursor: pointer;
   opacity: 0;
   filter: alpha(opacity=0);
}
.image-preview-input-title {
    margin-left:2px;
}
</style>
<script type="text/javascript">
$(document).ready( function() {
		    $("#save").hide();
	
			$("#list").on("click", function() {
				self.location = "/event/list";
			});
         
        
            $(document).on(
                  'change',
                  '.btn-file :file',
                  function() {
                     var input = $(this), label = input.val().replace(
                           /\\/g, '/').replace(/.*\//, '');
                     input.trigger('fileselect', [ label ]);
                  }); 
            
            $('.btn-file :file').on(
                  'fileselect',
                  function(event, label) {

                     var input = $(this).parents('.input-group').find(
                           ':text'), log = label;

                     if (input.length) {
                        input.val(log);
                     } else {
                        if (log)
                           alert(log);
                     }

                  });
            
            function readURL(input) {
               if (input.files && input.files[0]) {
                  var reader = new FileReader();

                  reader.onload = function(e) {
                     $('#img-upload').attr('src', e.target.result);
                  }
                  reader.readAsDataURL(input.files[0]);
               }
            }
            $("#imgInp").change(function() {
               readURL(this);
            });
            
            $("#upload").on("click", function() {
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
   	                      "body": "회원님의 관심지역에 새로운 행사가 등록되었습니다! 행사 목록을 확인하세요!"
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
            	$("#save").click();
            });
            
         });

</script> 
<body>
  <%@include file="../include/header.jsp"%> <!--/#header-->

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
                    <h1 class="title">행사</h1>
                    <p>행사등록</p>
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

<!-- 행사등록 -->
         <form class="form-horizontal" method="post" role="form" id="form1" enctype="multipart/form-data">
         <fieldset>
            <!-- 제목 -->
            <div class="form-group">
            <br><br>
               <label class="col-md-4 control-label" for="title">제목</label>
               <div class="col-md-4">
                  <input id="title" name="title"  type="text" placeholder="제목을 입력하세요." class="form-control input-md" required>
                  <label class="col-md-4 control-label" for="title"></label>
               </div>
            </div>
            
            <input type="hidden" name="userId" value="${login.userId }">

            <!-- 행사시작날짜 -->
            
<!--             <div class="form-inline  col-md-12" > -->
            <div class="form-group">
               <label class="col-md-4 control-label">행사시작날짜</label>
               <label id="startDate"></label>
               <div class="col-md-4">
                  <input id="startDate" name="startDate" type="date" placeholder="행사 시작 날짜를 입력해주세요."   class="form-control input-md" maxlength="16">
                  
               </div>
            </div>

            <!-- 행사기간 -->
            <div class="form-group">
               <label class="col-md-4 control-label">행사기간</label>
               <label id="duration"></label>
               <div class="col-md-4">
               <input id="duration" name="duration" type="number" placeholder="행사기간을 입력해주세요." class="form-control input-md" maxlength="16">
                  
               </div>
            </div>
<!--             </div> -->
         
         
            <!-- 모집트럭 수 -->
            <div class="form-group">
               <label class="col-md-4 control-label" for="recruit">모집트럭 수</label>
               <div class="col-md-4">
                  <input id="recruit" name="recruit" type="number" placeholder="모집트럭 수를 입력 해 주세요." class="form-control input-md" required>
               </div>
            </div>
            
            <!-- 영업 장소 -->
            <div class="form-group">
               <label class="col-md-4 control-label" for="selectgu">영업 장소</label>
               
               <div class="col-md-4">
               <select id="cityId" name="cityId" class="form-control " disabled="disabled">
                     <option value=""  selected="selected">서울</option>
                  </select>

                  <select id="guId" name="guId" class="form-control">
                    <option value="">선택 해 주세요.</option>
                     <option value="1">강남구</option>
                     <option value="2">강동구</option>
                     <option value="3">강북구</option>
                     <option value="4">강서구</option>
                     <option value="5">관악구</option>
                     <option value="6">광진구</option>
                     <option value="7">구로구</option>
                     <option value="8">금천구</option>
                     <option value="9">노원구</option>
                     <option value="10">도봉구</option>
                     <option value="11">동대문구</option>
                     <option value="12">동작구</option>
                     <option value="13">마포구</option>
                     <option value="14">서대문구</option>
                     <option value="15">서초구</option>
                     <option value="16">성동구</option>
                     <option value="17">성북구</option>
                     <option value="18">송파구</option>
                     <option value="19">양천구</option>
                     <option value="20">영등포구</option>
                     <option value="21">용산구</option>
                     <option value="22">은평구</option>
                     <option value="23">종로구</option>
                     <option value="24">중구</option>
                     <option value="25">중랑구</option>
                  </select>
               </div>
            </div>
            
            <!-- 내용 -->
            <div class="form-group">
               <label class="col-md-4 control-label" for="content">내용</label>
               <div class="col-md-4">
                  <textarea class="form-control col-md-12" name="content" rows="5"></textarea>
               </div>
            </div>
            
             <!-- 첨부파일 -->
            <div class="form-group">
               <label class="col-md-4 control-label" for="contactphone">파일 첨부 </label>
               <div class="col-md-4">
                  <div class="form-group">
                     <div class="col-md-5">
                        <div class="form-group">
                           <div class="input-group">
                              <span class="input-group-btn"> 
                              <input type="text" class="form-control" readonly style="margin-left: 15px; margin-top: 2px;" id="truckImg" name="truckImg">
                              <span class="btn btn-file image-preview-input" style="margin-right: 1px; margin-top: 2px; height: 40px;" >업로드
                               <input type="file" name="file" id="imgInp">
                              </span>
                              <a type="button" id="deleteImg" class="btn btn-default image-preview-input" style="margin-right: 30px; margin-top: 2px; height: 40px;"><i class="fa fa-close"></i></a>
                              </span>
                           </div>
                           <img id='img-upload' style="margin-left: 20px; margin-top: 10px;" />
                        </div>
                     </div>
                  </div>
               </div>
            </div> 
            
            
            <!-- 버튼 -->
            <div class="form-group">
               <label class="col-md-4 control-label" for="save"></label>
               <div class="col-md-8 text-center">
                  <button type="button" id="upload" class="btn btn-common">등록</button>
                  <button type="submit"  id="save" name="save"></button>
                  <button type="button" id="list" name="list" class="btn btn-common">취소</button>
               </div>
            </div>
         </fieldset>
         </form>
  <%@include file="../include/footer.jsp"%> <!--/#footer-->
</body>
</html>