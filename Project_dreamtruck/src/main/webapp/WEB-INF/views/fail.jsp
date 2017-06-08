<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/font-awesome.min.css" rel="stylesheet">
<link href="/resources/css/animate.min.css" rel="stylesheet">
<link href="/resources/css/lightbox.css" rel="stylesheet">
<link href="/resources/css/main.css" rel="stylesheet">
<link href="/resources/css/responsive.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/lightbox.min.js"></script>
<script type="text/javascript" src="/resources/js/wow.min.js"></script>
<script type="text/javascript" src="/resources/js/main.js"></script>
</head>
<body>
	<!-- 헤더 -->
	<%@include file="include/header.jsp"%>
	
	<!-- 배너 -->
	<section id="page-breadcrumb">
		<div class="vertical-center sun">
			<div class="container">
				<div class="row">
					<div class="action">
						<div class="col-sm-12">
							<h1 class="title">접근 불가</h1>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	
	<div class="container">
		<div class="row text-center">
			<div class="col-sm-6 col-sm-offset-3">
				<br>
				<br>
				<h2 style="color: red">접근 불가</h2>
				<img src="/resources/images/fail.png">
				<h2>잘못된 접근입니다.</h2>
				<br>
				<p style="font-size: 20px; color: #5C5C5C;">현재 회원님은 이 서비스를 이용하실 수 없습니다.</p>
				
				<br> <a href="/" class="btn btn-common">홈으로</a> <br>
				<br>
			</div>

		</div>
	</div>
	<br>
	
	<!-- 푸터 -->
	<%@include file="include/footer.jsp"%>

</body>


</html>