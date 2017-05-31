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
                            <p>행사 목록</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   </section>
    <!--/#action-->



<div class="container">
    <div class="row">
      <div class="col-md-12">

        <div class="input-group col-md-4">
          <input type="text" class="form-control" placeholder="Search" /> 
          <span class="input-group-btn">
            <button class="btn btn-default" type="button">
              <span class=" glyphicon glyphicon-search"></span>
            </button>
          </span>
        </div>



        <table class="table table-hover">
          <tr>
            <th style="width: 10px">No.</th>
            <th>행사제목</th>
            <th>작성자</th>
            <th style="width: 60px">조회수</th>
          </tr>

          <tr>
            <td>1</td>
            <td>밤도깨비 야시장</td>
            <td>여의도</td>
            <td >100</td>
          </tr>
        </table>

        <div class="">
          <button type="submit" class="btn btn-default">등록</button>
        </div>
      </div>
    </div>
  </div>



  <div class="portfolio-pagination">
    <ul class="pagination">
      <li><a href="#">left</a></li>
      <li class="active"><a href="#">1</a></li>
      <li><a href="#">2</a></li>
      <li><a href="#">3</a></li>
      <li><a href="#">4</a></li>
      <li><a href="#">5</a></li>
      <li><a href="#">right</a></li>
    </ul>
  </div>













<%@include file="../include/footer.jsp"%> <!--/#footer-->

  <script type="text/javascript" src="../resources/js/jquery.js"></script>
  <script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="../resources/js/lightbox.min.js"></script>
  <script type="text/javascript" src="../resources/js/wow.min.js"></script>
  <script type="text/javascript" src="../resources/js/main.js"></script>
</body>
</html>