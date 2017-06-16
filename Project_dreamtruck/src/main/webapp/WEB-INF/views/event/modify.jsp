<%@ page contentType="text/html; charset=utf-8"%>
<%@ page language="java"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>드림트럭</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/font-awesome.min.css" rel="stylesheet">
<link href="/resources/css/animate.min.css" rel="stylesheet">
<link href="/resources/css/lightbox.css" rel="stylesheet">
<link href="/resources/css/main.css" rel="stylesheet">
<link href="/resources/css/responsive.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery.js"></script>

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
<script>

  $(document).ready(function() {
	  var formObj = $("form[role='form']");
		console.log(formObj);
		
		$("#save").on("click", function() {
			formObj.submit();
			
		});
		
		$("#list").on("click", function() {
			self.location = "/event/list?page=${cri.page}&perPageNum=${cri.perPageNum}";
		});
		
		// 이미지 변경
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
            
            $('#deleteImg').on("click",function(){
            	$('#img').val(null);
            	$('#img-upload').attr('src',null);
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
                    <p>행사수정</p>
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

<!-- 행사수정 -->
  <form class="form-horizontal" method="post" role="form" id="form1" enctype="multipart/form-data" action="modify" >
    <input type="hidden" name="page" value="${cri.page }">
    <input type="hidden" name="perPageNum" value="${cri.perPageNum}">
    <input type="hidden" name="searchType" value="${cri.searchType}">
<input type="hidden" name="keyword" value="${cri.searchType}">
         <fieldset>
         <!-- 행사 게시판 번호 -->
         <div class="form-group">
               <label class="col-md-4 control-label">행사 게시판 번호</label>
               <label id="eventId"></label>
               <div class="col-md-4">
                  <input id="eventId" name="eventId" type="text"  class="form-control input-md" maxlength="16" value="${event.eventId }" readonly="readonly">
                  <input type="hidden" name="userId" value="${login.userId }">
               </div>
            </div>
         
            <!-- 제목 -->
            <div class="form-group">
            <br><br>
               <label class="col-md-4 control-label" for="title">제목</label>
               <div class="col-md-4">
                  <input id="title" name="title"  type="text" class="form-control input-md" value="${event.title }" >
                  <label class="col-md-4 control-label" for="title"></label>
               </div>
            </div>

            <!-- 행사시작날짜 -->
            <div class="form-group">
               <label class="col-md-4 control-label">행사시작날짜</label>
               <label id="startDate"></label>
               <div class="col-md-4">
                  <input id="startDate" name="startDate" type="date"  class="form-control input-md" maxlength="16" value="${event.startDate }" >
                  
               </div>
            </div>

            <!-- 행사기간 -->
            <div class="form-group">
               <label class="col-md-4 control-label">행사기간</label>
               <label id="duration"></label>
               <div class="col-md-4">
               <input id="duration" name="duration" type="number"  class="form-control input-md" maxlength="16" value="${event.duration }" >
                  
               </div>
            </div>
         
         
            <!-- 모집트럭 수 -->
            <div class="form-group">
               <label class="col-md-4 control-label" for="recruit">모집트럭 수</label>
               <div class="col-md-4">
                  <input id="recruit" name="recruit" type="number" class="form-control input-md"  value="${event.recruit }" >
               </div>
            </div>
            
            <!-- 영업 장소 -->
            <div class="form-group">
               <label class="col-md-4 control-label" for="selectgu">영업 장소</label>
               
               <div class="col-md-4">
               <select id="cityId" name="cityId" class="form-control " disabled="disabled">
                     <option value=""  selected="selected">서울</option>
                  </select>

                  <select id="guId" name="guId" class="form-control" value="${event.guId }" >
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
                  <textarea class="form-control col-md-12" name="content" rows="5" >${event.content }</textarea>
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
                              <input type="text" class="form-control" style="margin-left: 15px; margin-top: 2px;" id="img" name="img"  value="${event.img}">
                              <span class="btn btn-file image-preview-input" style="margin-right: 1px; margin-top: 2px; height: 40px;" >업로드
                               <input type="file" name="file" id="imgInp">
                              </span>
                              <a type="button" id="deleteImg" class="btn btn-default image-preview-input" style="margin-right: 30px; margin-top: 2px; height: 40px;"><i class="fa fa-close"></i></a>
                              </span>
                           </div>
                           <c:if test="${empty event.img}">
                           <img id='img-upload' style="margin-left: 20px; margin-top: 10px;" src="/displayFile?fileName=/event/noimage.png" />
                           </c:if>
                           <c:if test="${not empty event.img}">
                           <img id='img-upload' style="margin-left: 20px; margin-top: 10px;" src="/displayFile?fileName=/event${event.img}"/>
                           </c:if>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            
            <!-- 버튼 -->
            <div class="form-group">
               <label class="col-md-4 control-label" for="save"></label>
               <div class="col-md-8 text-center">
                  <button type="submit" id="save" name="save" class="btn btn-common">저장</button>
                  <button type="button" id="list" name="list" class="btn  btn-common">취소</button>
               </div>
            </div>
         </fieldset>
         </form>















  <%@include file="../include/footer.jsp"%> <!--/#footer-->

  <script type="text/javascript" src="/resources/js/jquery.js"></script>
  <script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="/resources/js/lightbox.min.js"></script>
  <script type="text/javascript" src="/resources/js/wow.min.js"></script>
  <script type="text/javascript" src="/resources/js/main.js"></script>
</body>
</html>