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
<link href="/resources/css/sweetalert.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/sweetalert.min.js"></script> 
<link rel="shortcut icon" href="/resources/images/ico/5.ico">
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

.btn-common2 {
    font-size: 14px;
    color: #ffffff;
    background-color: #fd9483;
    border: 1px solid #fd7c66;
    font-family: 'Open Sans', sans-serif;
    font-weight: 300;
    /* padding: 10px 25px; */
}
</style>
<script >

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
      
      <br>
      <br>
      <br>
        <table class="table table-hover" style="text-align: center" >
          <tr >
            <th style="width: 10px">No.</th>
            <th>행사제목</th>
            <th>작성자</th>
            <th style="width: 180px">모집트럭수</th>
            <th style="width: 60px">승인여부</th>
          </tr>
          
          <c:forEach items="${list }" var="list" varStatus="status">
            <tr>
              <td>${list.eventId}</td>
              <td><a href='/event/detail?eventId=${list.eventId }'>${list.title }</a></td>
              <td>${list.name}</td>
              <td>${list.recruit }</td>
              <td>${list.success }</td>
            </tr>

          </c:forEach>
        </table>
        
      </div>
    </div>
  </div>
  </div>


<%@include file="../include/footer.jsp"%> <!--/#footer-->

  <script type="text/javascript" src="../resources/js/jquery.js"></script>
  <script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="../resources/js/lightbox.min.js"></script>
  <script type="text/javascript" src="../resources/js/wow.min.js"></script>
  <script type="text/javascript" src="../resources/js/main.js"></script>
</body>
</html>