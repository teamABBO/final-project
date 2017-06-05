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
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<link href="../resources/css/font-awesome.min.css" rel="stylesheet">
<link href="../resources/css/animate.min.css" rel="stylesheet">
<link href="../resources/css/lightbox.css" rel="stylesheet">
<link href="../resources/css/main.css" rel="stylesheet">
<link href="../resources/css/responsive.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<link rel="shortcut icon" href="../resources/images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
  href="../resources/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
  href="../resources/images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
  href="../resources/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
  href="../resources/images/ico/apple-touch-icon-57-precomposed.png">
</head>
<script>

  $(document).ready(function() {
	  var formObj = $("form[role='form']");
		console.log(formObj);
		
		$(".btn-warning").on("click", function() {
			self.location = "/event/list";
		});
		
		$(".btn-primary").on("click", function() {
			formObj.submit();
		});
    

  });
</script>
<body>
  <%@include file="../include/header.jsp"%> <!--/#header-->


<!--  배너  -->
  <section id="page-breadcrumb">
    <div class="vertical-center sun">
      <div class="container">
        <div class="row">
          <div class="action">
            <div class="col-sm-12">
              <h1 class="title">행사</h1>
              <p>행사 수정</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--/배너-->

<!-- 행사등록 -->
  <form class="form-horizontal" method="post" role="form">
         <fieldset>
         <!-- 행사 게시판 번호 -->
         <div class="form-group">
               <label class="col-md-4 control-label">행사 게시판 번호</label>
               <label id="eventId"></label>
               <div class="col-md-4">
                  <input id="eventId" name="eventId" type="text"  class="form-control input-md" maxlength="16" value="${event.eventId }" readonly="readonly">
                  
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
               <input id="duration" name="duration" type="text"  class="form-control input-md" maxlength="16" value="${event.duration }" >
                  
               </div>
            </div>
         
         
            <!-- 모집트럭 수 -->
            <div class="form-group">
               <label class="col-md-4 control-label" for="recruit">모집트럭 수</label>
               <div class="col-md-4">
                  <input id="recruit" name="recruit" type="text" class="form-control input-md"  value="${event.recruit }" >
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
               <label class="col-md-4 control-label" for="img">파일 첨부</label>
               <div class="col-md-4">
                  <input id="img" name="img" type="file" class="form-control input-md" >
               </div>
            </div>
            
            <!-- 버튼 -->
            <div class="form-group">
               <label class="col-md-4 control-label" for="save"></label>
               <div class="col-md-8 text-center">
                  <button type="submit" id="modify" name="modify" class="btn btn-primary">저장</button>
                  <button type="button" id="list" name="list" class="btn  btn-warning">취소</button>
               </div>
            </div>
         </fieldset>
         </form>















  <%@include file="../include/footer.jsp"%> <!--/#footer-->

  <script type="text/javascript" src="../resources/js/jquery.js"></script>
  <script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="../resources/js/lightbox.min.js"></script>
  <script type="text/javascript" src="../resources/js/wow.min.js"></script>
  <script type="text/javascript" src="../resources/js/main.js"></script>
</body>
</html>