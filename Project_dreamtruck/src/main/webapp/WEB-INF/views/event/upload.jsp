<%@ page contentType="text/html; charset=utf-8"%>
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
<body>
  <%@include file="../include/header.jsp"%> <!--/#header-->

  <section id="page-breadcrumb">
    <div class="vertical-center sun">
      <div class="container">
        <div class="row">
          <div class="action">
            <div class="col-sm-12">
              <h1 class="title">행사</h1>
              <p>행사 등록</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--/#action-->


<form role="form" method="post">
  <div class="container">
    <div class="row">
      <div class="col-md-6" >
        <form role="form" method="post" >
          <div class="form-group col-md-12">
            <label for="exampleInputEmail1">제목</label> 
            <input type="text" name="title" class="form-control" placeholder="제목을 입력하세요">
          </div>
          <div class="form-group col-md-6" >
            <label for="exampleInputEmail1">행사시작날짜</label><input type="date" name="startDate" class="form-control">
          </div>
          <div class="form-group col-md-6">
           <label for="exampleInputEmail1">행사기간</label> <input type="text" name="duration" class="form-control">
          </div>
          <div class="form-group col-md-12">
            <label for="exampleInputEmail1">장소</label> 
             <input type="text" value="서울">
            <select name="guId">
              <option value="1">강남구</option>
              <option value="2">강동구</option>
              <option value="3">강북구</option>
              <option value="4">강서구</option>
            </select>
          </div>


          <div class="form-group col-md-12">
            <label>내용</label>
            <textarea class="form-control col-md-12" name="content" rows="5"></textarea>
          </div>
          <div class="form-group col-md-12">
            <label for="exampleInputFile">파일 첨부</label> 
            <input type="file" name="img">
          </div>
          <button type="submit" class="btn btn-common">등록</button>
        </form>
      </div>
    </div><!-- /row -->
  </div><!-- /container -->
  </form>














  <%@include file="../include/footer.jsp"%> <!--/#footer-->

  <script type="text/javascript" src="../resources/js/jquery.js"></script>
  <script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="../resources/js/lightbox.min.js"></script>
  <script type="text/javascript" src="../resources/js/wow.min.js"></script>
  <script type="text/javascript" src="../resources/js/main.js"></script>
</body>
</html>