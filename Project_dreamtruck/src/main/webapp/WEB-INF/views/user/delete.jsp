<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/references.jsp"%>
<script type="text/javascript">

var result = '${msg}';
if (result == 'fale') {
   swal("오류!", "회원 정보를 확인 해 주세요.", "warning");
}

</script>
<style type="text/css">
.box-radius {
	width: 550px;
	padding: 10px;
	border: 1px solid #cc0000;
	border-radius: 30px;
	-moz-border-radius: 30px;
	-webkit-border-radius: 30px;
	-o-border-radius: 30px;
}

.box-radius2 {
	width: 200px;
	height: 50px;
	padding: 15px;
	border: 1px solid;
	border-radius: 30px;
	margin-left: 60px;
	-moz-border-radius: 30px;
	-webkit-border-radius: 30px;
	-o-border-radius: 30px;
}
</style>

</head>

<body>
	<!-- 헤더 -->
	<%@include file="../include/header.jsp"%>

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
										<h1 class="title">회원탈퇴</h1>
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
			<div
				class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<form class="form-horizontal" role="form" method="post"
					onsubmit="return check();">
					<fieldset>
						<br> <br>
						<div class="form-group">
							<input type="text" id="id" name="id" class="box-radius"
								placeholder="아이디를 입력해 주세요." style="margin-left: 20px;">
						</div>
						<div class="form-group">
							<input type="password" id="pw" name="pw" class="box-radius"
								placeholder="비밀번호를 입력해 주세요." style="margin-left: 20px;">
						</div>
						<hr>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
								<button type="submit" class="btn btn-sm btn-common btn-block">탈퇴하기</button>
								<!-- <a class="btn btn-lg btn-danger btn-block" href="#primary" data-toggle="modal">탈퇴하기</a> -->
							</div>

							<div class="col-xs-6 col-sm-6 col-md-6">
								<a href="../" class="btn btn-sm btn-common btn-block">홈으로</a>
							</div>
						</div>

						<script type="text/javascript">
							function check(){
								if($.trim($("#id").val())==""){
								swal("오류!", "아이디를 입력하세요!", "error");
								$("#id").val("").focus();
								return false;
								}
					
								if($.trim($("#pw").val())==""){
								swal("오류!", "비밀번호를 입력하세요!", "error");
								$("#pw").val("").focus();
								return false;
								}
							};
				 
				 		
				
				</script>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<!-- 푸터 -->
	<%@include file="../include/footer.jsp"%>

</body>

</html>