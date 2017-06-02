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
                            <h1 class="title">회원가입</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   		</section>
   		
			<section id="services">
			<div class="container">
				<div class="row">
					<!-- 일반회원 -->
					<div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="300ms">
						<div class="single-service2" >
							<div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="300ms">
								<img src="../resources/images/regist/normal.png" alt="">
							</div>
							<h2>일반 회원</h2>
							<p>평점 & 리뷰를 등록 할 수 있으며,<br> 원하는 행사나 푸드트럭을 검색 할 수 있다.</p>
							<br>
							<form action="register" method="post">
								<input type="hidden" id="type" name="type" value="normal">
								<button type="submit" class="btn btn-common" >가입</button>
							</form>
						</div>
					</div>
					
					<!-- 트럭운영자 -->
					<div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="600ms">
						<div class="single-service2">
							<div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="600ms">
								<img src="../resources/images/regist/truck.png" alt="">
							</div>
							<h2>트럭 운영자</h2>
							<p>영업신청 & 행사신청 등 운영에 필요한 <br>각종 서비스를 제공</p>
							<br>
							<form action="register" method="post">
								<input type="hidden" id="type" name="type" value="truck">
								<button type="submit" class="btn btn-common" >가입</button>
							</form>
						</div>
					</div>
					
					<!-- 행사운영자 -->
					<div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="900ms">
						<div class="single-service2">
							<div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="900ms">
								<img src="../resources/images/regist/event.png" alt="">
							</div>
							<h2>행사 운영자</h2>
							<p>행사를 주최할 수 있으며, <br>푸드트럭 영업자들을 뽑을 수 있다.</p>
							<br>
							<form action="register" method="post">
								<input type="hidden" id="type" name="type" value="event">
								<button type="submit" class="btn btn-common" >가입</button>
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