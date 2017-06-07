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

  // 수정,삭제,리스트로돌아가기
  $(document).ready(function() {
    var formObj = $("form[role='form']");
    console.log(formObj);

    $(".btn-warning").on("click", function() {
      formObj.attr("action", "/event/modify");
      formObj.attr("method", "get");
      formObj.submit();
    });
    
    $(".btn-primary").on("click", function() {
    	self.location = "/event/list";
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
              <p>행사 상세보기</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--/배너-->

<!-- 행사등록 -->

  <form method="post" role="form"  class="form-horizontal" >
    <input type="hidden" name="eventId" value="${event.eventId }">
         <fieldset>
            <!-- 제목 -->
            <div class="form-group">
            <br><br>
               <label class="col-md-4 control-label" for="title">제목</label>
               <div class="col-md-4">
                  <input id="title" name="title"  type="text" class="form-control input-md" value="${event.title }" readonly="readonly">
                  <label class="col-md-4 control-label" for="title"></label>
               </div>
            </div>

            <!-- 행사시작날짜 -->
            <div class="form-group">
               <label class="col-md-4 control-label">행사시작날짜</label>
               <label id="startDate"></label>
               <div class="col-md-4">
                  <input id="startDate" name="startDate" type="text"  class="form-control input-md" maxlength=x"16" value="${event.startDate }" readonly="readonly">
                  
               </div>
            </div>

            <!-- 행사기간 -->
            <div class="form-group">
               <label class="col-md-4 control-label">행사기간</label>
               <label id="duration"></label>
               <div class="col-md-4">
               <input id="duration" name="duration" type="text"  class="form-control input-md" maxlength="16" value="${event.duration }" readonly="readonly">
                  
               </div>
            </div>
         
         
            <!-- 모집트럭 수 -->
            <div class="form-group">
               <label class="col-md-4 control-label" for="recruit">모집트럭 수</label>
               <div class="col-md-4">
                  <input id="recruit" name="recruit" type="text" class="form-control input-md" required="" value="${event.recruit }" readonly="readonly">
               </div>
            </div>
            
            <!-- 영업 장소 -->
            <div class="form-group">
               <label class="col-md-4 control-label" for="selectgu">영업 장소 </label>
               
               <div class="col-md-4">
               <select id="cityId" name="cityId" class="form-control " disabled="disabled">
                     <option value=""  selected="selected">서울</option>
                  </select>

          <c:choose>
            <c:when test="${event.guId  eq '1'}">
              <input id="guId" name="guId" type="text" class="form-control input-md" required="" value="강남구" readonly="readonly">
            </c:when>
            <c:when test="${event.guId  eq '2'}">
              <input id="guId" name="guId" type="text" class="form-control input-md" required="" value="강동구" readonly="readonly">
            </c:when>
            <c:when test="${event.guId  eq '3'}">
              <input id="guId" name="guId" type="text" class="form-control input-md" required="" value="강북구" readonly="readonly">
            </c:when>
            <c:when test="${event.guId  eq '4'}">
              <input id="guId" name="guId" type="text" class="form-control input-md" required="" value="강서구" readonly="readonly">
            </c:when>
            <c:when test="${event.guId  eq '5'}">
              <input id="guId" name="guId" type="text" class="form-control input-md" required="" value="관악구" readonly="readonly">
            </c:when>
            <c:when test="${event.guId  eq '6'}">
              <input id="guId" name="guId" type="text" class="form-control input-md" required="" value="광진구" readonly="readonly">
            </c:when>
            <c:when test="${event.guId  eq '7'}">
              <input id="guId" name="guId" type="text" class="form-control input-md" required="" value="구로구" readonly="readonly">
            </c:when>
            <c:when test="${event.guId  eq '8'}">
              <input id="guId" name="guId" type="text" class="form-control input-md" required="" value="금천구" readonly="readonly">
            </c:when>
            <c:when test="${event.guId  eq '9'}">
              <input id="guId" name="guId" type="text" class="form-control input-md" required="" value="노원구" readonly="readonly">
            </c:when>
            <c:when test="${event.guId  eq '10'}">
              <input id="guId" name="guId" type="text" class="form-control input-md" required="" value="도봉구" readonly="readonly">
            </c:when>
            <c:when test="${event.guId  eq '11'}">
              <input id="guId" name="guId" type="text" class="form-control input-md" required="" value="동대문구" readonly="readonly">
            </c:when>
            <c:when test="${event.guId  eq '12'}">
              <input id="guId" name="guId" type="text" class="form-control input-md" required="" value="동작구" readonly="readonly">
            </c:when>
            <c:when test="${event.guId  eq '13'}">
              <input id="guId" name="guId" type="text" class="form-control input-md" required="" value="마포구" readonly="readonly">
            </c:when>
            <c:when test="${event.guId  eq '14'}">
              <input id="guId" name="guId" type="text" class="form-control input-md" required="" value="서대문구" readonly="readonly">
            </c:when>
            <c:when test="${event.guId  eq '15'}">
              <input id="guId" name="guId" type="text" class="form-control input-md" required="" value="서초구" readonly="readonly">
            </c:when>
            <c:when test="${event.guId  eq '16'}">
              <input id="guId" name="guId" type="text" class="form-control input-md" required="" value="성동구" readonly="readonly">
            </c:when>
            <c:when test="${event.guId  eq '17'}">
              <input id="guId" name="guId" type="text" class="form-control input-md" required="" value="성북구" readonly="readonly">
            </c:when>
            <c:when test="${event.guId  eq '18'}">
              <input id="guId" name="guId" type="text" class="form-control input-md" required="" value="송파구" readonly="readonly">
            </c:when>
            <c:when test="${event.guId  eq '19'}">
              <input id="guId" name="guId" type="text" class="form-control input-md" required="" value="양천구" readonly="readonly">
            </c:when>
            <c:when test="${event.guId  eq '20'}">
              <input id="guId" name="guId" type="text" class="form-control input-md" required="" value="영등포구" readonly="readonly">
            </c:when>
            <c:when test="${event.guId  eq '21'}">
              <input id="guId" name="guId" type="text" class="form-control input-md" required="" value="용산구" readonly="readonly">
            </c:when>
            <c:when test="${event.guId  eq '22'}">
              <input id="guId" name="guId" type="text" class="form-control input-md" required="" value="은평구" readonly="readonly">
            </c:when>
            <c:when test="${event.guId  eq '23'}">
              <input id="guId" name="guId" type="text" class="form-control input-md" required="" value="종로구" readonly="readonly">
            </c:when>
            <c:when test="${event.guId  eq '24'}">
              <input id="guId" name="guId" type="text" class="form-control input-md" required="" value="중구" readonly="readonly">
            </c:when>
            <c:when test="${event.guId  eq '25'}">
              <input id="guId" name="guId" type="text" class="form-control input-md" required="" value="중랑구" readonly="readonly">
            </c:when>
          </c:choose>
          
        </div>
            </div>

      <!-- 내용 -->
            <div class="form-group">
               <label class="col-md-4 control-label" for="content">내용</label>
               <div class="col-md-4">
                  <textarea class="form-control col-md-12" name="content" rows="5" readonly="readonly"> ${event.content }</textarea>
               </div>
            </div>
            
             <!-- 첨부파일 -->
            <div class="form-group">
               <label class="col-md-4 control-label" for="img">파일 첨부</label>
               <div class="col-md-4">
               
               <c:choose>
            <c:when test="${event.img eq null}">
              <input id="img" name="img" type="text" class="form-control input-md" readonly="readonly" >
            </c:when>
            <c:when test="${event.img} ">
             <input id="img" name="img" type="text" class="form-control input-md"  value="${event.img }"   readonly="readonly" >
                  <img alt="" src="/dispalyFile?fileName=/event/${login.userId }/${event.img}"/>
              </c:when>
              </c:choose>
               
                  
               </div>
            </div>
            
        
            
            <!-- 버튼 -->
            <div class="form-group">
               <label class="col-md-4 control-label" for="save"></label>
               <div class="col-md-8 text-center">
                  <button type="button" id="modify" name="modify" class="btn btn-warning">수정</button>
                  <button type="button" id="list" name="list" class="btn btn-primary">목록</button>
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