<%@ page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Documents | DreamTruck</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/font-awesome.min.css" rel="stylesheet">
<link href="/resources/css/animate.min.css" rel="stylesheet">
<link href="/resources/css/lightbox.css" rel="stylesheet">
<link href="/resources/css/main.css" rel="stylesheet">
<link href="/resources/css/responsive.css" rel="stylesheet">
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

<body>

  <%@include file="../include/header.jsp"%>
  <!-- /header -->

  <section id="page-breadcrumb">
    <div class="vertical-center sun">
      <div class="container">
        <div class="row">
          <div class="action">
            <div class="col-sm-12">
              <h1 class="title">마이 페이지</h1>
              <p>서류 관리</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--/#page-breadcrumb-->
  <div class="row" style="margin-top: 40px; margin-left: 230px">
    <div class="col-md-10">
        <caption><pre class="glyphicon glyphicon-file" style="color:green" > 등록완료 </pre><pre class="glyphicon glyphicon-file" style="color:#e7b903"> 만료임박 </pre><pre class="glyphicon glyphicon-file" style="color:red" > 기간만료 </pre></caption> 
      <div class="panel panel-default">
        <div class="panel-heading text-center">
          <span><strong><span
              class="glyphicon glyphicon-folder-open"> </span>  서류 관리</strong></span>
        </div>
        <table class="table table-bordered table-hover vmiddle">
          <thead>
            <tr>
              <th></th>
              <th>종류</th>
              <th style="text-align: center">상세/등록/삭제</th>
              <th>크기</th>
              <th>만료일자</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td class="text-center"><span
                class="glyphicon glyphicon-file" style="color:green"></span></td>
              <td>등/초본</td>
              <td class="text-center"><span
                  class="btn btn-sm btn-warning glyphicon glyphicon-info-sign"></span></a>
                <span
                  class="btn btn-sm btn-primary glyphicon glyphicon-pencil" data-toggle="modal" data-target="#registModal"></span></a>
                <span
                  class="btn btn-sm btn-danger glyphicon glyphicon-trash"></span></a>
              </td>
              <td>523.0 KB</td>
              <td>16-sep-16 09:48:2</td>
            </tr>
            <tr>
              <td class="text-center"><span
                class="glyphicon glyphicon-file" style="color:#e7b903"></span></td>
              <td>면허증</td>
              <td class="text-center"><span
                  class="btn btn-sm btn-warning glyphicon glyphicon-info-sign"></span></a>
                <span
                  class="btn btn-sm btn-primary glyphicon glyphicon-pencil" data-toggle="modal" data-target="#registModal"></span></a>
                <span
                  class="btn btn-sm btn-danger glyphicon glyphicon-trash"></span></a>
              </td>
              <td>523.0 KB</td>
              <td>16-sep-16 09:48:2</td>
            </tr>
            <tr>
              <td class="text-center"><span
                class="glyphicon glyphicon-file" style="color:red"></span></td>
              <td>사업계획서</td>
              <td class="text-center"><span
                  class="btn btn-sm btn-warning glyphicon glyphicon-info-sign"></span></a>
                <span
                  class="btn btn-sm btn-primary glyphicon glyphicon-pencil" data-toggle="modal" data-target="#registModal"></span></a>
                <span
                  class="btn btn-sm btn-danger glyphicon glyphicon-trash"></span></a>
              </td>
              <td>523.0 KB</td>
              <td>16-sep-16 09:48:2</td>
            </tr>
            <tr>
              <td class="text-center"><span
                class="glyphicon glyphicon-file" style="color: green"></span></td>
              <td>영업신청서</td>
              <td class="text-center"><span
                  class="btn btn-sm btn-warning glyphicon glyphicon-info-sign"></span></a>
                <span
                  class="btn btn-sm btn-primary glyphicon glyphicon-pencil" data-toggle="modal" data-target="#registModal"></span></a>
                <span
                  class="btn btn-sm btn-danger glyphicon glyphicon-trash"></span></a>
              </td>
              <td>523.0 KB</td>
              <td>16-sep-16 09:48:2</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>

  <%@include file="../include/footer.jsp"%>
  <!--/#footer-->
  
  <!-- Modal -->
  <div id="registModal" class="modal modal-primary fade" role="dialog" style="background-color: rgba(255, 255, 255, 0.4);">
    <div class="modal-dialog">
      <!-- modal content -->
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"></h4>
      </div>
      <div class="modal-body" data-docunum>
      <form>
        <p style="font-weight: bolder;">서류파일 : </p><input type="file" class="form-control" style="margin-bottom: 10px;">
        <p style="font-weight: bolder;">만료일자 : </p><input type="date" class="form-control input-md" style="margin-bottom: 10px;">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success">저장</button>
        <button type="button" class="btn btn-danger">취소</button>
      </div>
      </form>
    </div>
  </div>
</body>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/js/lightbox.min.js"></script>
<script type="text/javascript" src="../resources/js/wow.min.js"></script>
<script type="text/javascript" src="../resources/js/main.js"></script>
</html>