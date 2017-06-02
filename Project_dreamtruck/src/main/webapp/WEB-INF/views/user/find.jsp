<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
							<h1 class="title">아이디 & 비밀번호 찾기</h1>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section id="services">
		<div class="container">
			<div class="row">
				<!-- 아이디 찾기 -->
				<div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="300ms" style="margin-right: 100px;">
					<div class="single-service2">
						<form id="idsearch" action="#" method="post" role="form" style="display: block; margin-left: 100px;" >
							<div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="900ms">
								<img src="../resources/images/regist/event.png" alt="">
							</div>
							<h2>아이디 찾기</h2>
							<br>
							<div class="form-group">
								<input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="이름을 입력하세요." value="" size="5">
							</div>
							<div class="form-group">
								<input type="text" name="phone" id="phone" tabindex="2" class="form-control" placeholder="휴대폰번호를 입력하세요.">
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-sm-6 col-sm-offset-3">
										<button type="submit" id="idsubmit" name="idsubmit" class="btn btn-common" >찾기</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
				
				<!-- 비밀번호 찾기 -->
				<div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="300ms" style="margin-left: 200px;">
					<div class="single-service2">
						<form id="pwsearch" action="#" method="post" role="form" style="display: block; margin-left: 100px;" >
							<div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="900ms">
								<img src="../resources/images/regist/event.png" alt="">
							</div>
							<h2>비밀번호 찾기</h2>
							<br>
							<div class="form-group">
								<input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="아이디를 입력하세요." value="" size="5">
							</div>
							<div class="form-group">
								<input type="text" name="phone" id="phone" tabindex="2" class="form-control" placeholder="이름을 입력하세요.">
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-sm-6 col-sm-offset-3">
										<button type="submit" id="pwsubmit" name="pwsubmit" class="btn btn-common" >찾기</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<%@include file="../include/footer.jsp"%>
</body>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/js/lightbox.min.js"></script>
<script type="text/javascript" src="../resources/js/wow.min.js"></script>
<script type="text/javascript" src="../resources/js/main.js"></script>

</html>