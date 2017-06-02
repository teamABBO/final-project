<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<link href="../resources/css/font-awesome.min.css" rel="stylesheet">
<link href="../resources/css/animate.min.css" rel="stylesheet"> 
<link href="../resources/css/lightbox.css" rel="stylesheet"> 
<link href="../resources/css/main.css" rel="stylesheet">
<link href="../resources/css/responsive.css" rel="stylesheet">
</head>

<body>
<%@include file="../include/header.jsp"%>
<section id="page-breadcrumb">
        <div class="vertical-center sun">
             <div class="container">
                <div class="row">
                    <div class="action">
                        <div class="col-sm-12">
                            <h1 class="title">회원탈퇴</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   		</section>
	<div class="container">
	<div class="row">
	 <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		<form role="form">
			<fieldset>
				<br>
				<br>
				<hr class="colorgraph">
				<div class="form-group">
                    <input type="text" id="name" class="form-control" placeholder="아이디를 입력해 주세요.">
				</div>
				<div class="form-group">
                    <input type="password" id="paw" class="form-control" placeholder="비밀번호를 입력해 주세요.">
				</div>
				<hr class="colorgraph">
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-6">
                        <a class="btn btn-lg btn-danger btn-block" href="#primary" data-toggle="modal">탈퇴하기</a>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6">
						<a href="../" class="btn btn-lg btn-primary btn-block">홈으로</a>
					</div>
				</div>
				</fieldset>
			</form>
		</div>
	</div>		
</div>
<br>
<br><br>
<%@include file="../include/footer.jsp"%>
<!-- Modal -->
    <div class="modal fade" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="border-bottom: 4px solid #a94442; background-color: #f2dede; color: #a94446;">
              <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">닫기</span></button>
              <h4 class="modal-title" id="myModalLabel" style="font-size: 9pt;"><i class="fa fa-warning"></i> 경고</h4>
          		</div>
          <div style="margin-top: 1px; background-color: #a94442; height: 1px; width: 100%;"></div>
          <div class="modal-body">
              <div class="row">

                  <div class="col-xs-12">
                      <div class="alert alert-danger" role="alert" style="text-align: center;"><i class="fa fa-warning"></i> 탈퇴 시 해당 계정이 지워집니다.</div>
                      <div style="text-align: center; font-size: 10pt; margin: 16px;"><span style="color: #2e77bc;"><i class="fa fa-info-circle"></i></span> 탈퇴를 원하시면 밑에 확인 버튼을 눌러주세요.</div>
                      <div class="well">
                            <div style="color: #acacac; font-size: 9pt; text-align: center; padding: 0px; margin-bottom: 6px;">탈퇴를 원하시면 밑에 확인 버튼을 눌러주세요.</div>
                              
                      </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default pull-right" data-dismiss="modal">취소</button>
                    <a class="btn btn-default" href="../" >확인</a>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <!-- Modal -->
    </div>
    </div>
    </div>
</body>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
		<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="../resources/js/lightbox.min.js"></script>
		<script type="text/javascript" src="../resources/js/wow.min.js"></script>
		<script type="text/javascript" src="../resources/js/main.js"></script>  

</html>