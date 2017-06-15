<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
<link rel="shortcut icon" href="/resources/images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="/resources/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="/resources/images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="/resources/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed" href="/resources/images/ico/apple-touch-icon-57-precomposed.png">
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/lightbox.min.js"></script>
<script type="text/javascript" src="/resources/js/wow.min.js"></script>
<script type="text/javascript" src="/resources/js/main.js"></script>

<script>
	$(function() {
		$('img').on('click', function() {
			$('.enlargeImageModalSource').attr('src', $(this).attr('src'));
			$('#enlargeImageModal').modal('show');
		});
	});
	
</script>
<style type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
@import url('https://fonts.googleapis.com/css?family=Dancing+Script');

body {
	font-family: 'Dancing Script', cursive !important;
	background-color: #ddd;
	padding-top: 70px;
}

* {
	padding: 0;
	margin: 0;
}

.bottom {
	margin-bottom: 20px;
}

.border {
	border: 1px solid #e3e2;
	padding: 15px;
	margin-bottom: 30px;
}

.caption h4 {
	text-transform: uppercase;
}

.caption p {
	font-size: 1.5em;
}

.img-responsive {
	-webkit-transition: all 0.5s ease-in-out;
	-moz-transition: all 0.5s ease-in-out;
	-o-transition: all 0.5s ease-in-out;
	-ms-transition: all 0.5s ease-in-out;
	transition: all 0.5s ease-in-out;
}

.img-responsive:hover {
	-webkit-transform: rotate(-10deg);
	-moz-transform: rotate(-10deg);
	-o-transform: rotate(-10deg);
	-ms-transform: rotate(-10deg);
	transform: rotate(-10deg);
}
</style>
</head>
<!--/head-->

<body>
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
										<h1 class="title">마이페이지</h1>
										<p>관심트럭 목록</p>
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
	
	<div class="container">
		
		<div class="row">
			<c:if test="${empty list}">
				<label style="color: red; margin-left: 500px;">관심 트럭이 존재하지 않습니다.</label>
				<br><br><br>
			</c:if>
			<c:if test="${not empty list}">
				<c:forEach items="${list}" var="liketruck">
					<div class="col-xs-6 col-sm-6 col-md-4 portfolio-item branded mobile">
						<div class="portfolio-wrapper">
							<div class="portfolio-single">
								<div class="portfolio-thumb">
									<c:if test="${empty liketruck.truckImg}">
										<img src="/displayFile?fileName=/user/noimage.png" class="img-responsive" />
									</c:if>
									<c:if test="${not empty liketruck.truckImg}">
										<img src="/displayFile?fileName=/user/${liketruck.id}/${liketruck.truckImg }" class="img-responsive" />
									</c:if>
									<div class="caption border">
										<h4 style="color: #fd9483;">${liketruck.truckName}<span class="pull-right"><i class="fa fa-heart">&nbsp;${liketruck.truckLikecnt}</i></span>
										</h4>
										<a href="../truck/read?userId=${liketruck.truckId }" class=""><i class="fa fa-eye"> 상세보기</i></a> &nbsp;&nbsp;<a href="#" class=""><i class="fa fa-ban"> 제거</i></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
	
	</div>
	</div>
	</div>
	</section>
	<!--/#projects-->
	<%@include file="../include/footer.jsp"%>

</body>
</html>