<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/references.jsp"%>
</head>
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
										<h1 class="title">회원가입</h1>
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

	<section id="services">
		<div class="container">
			<div class="row">
				<!-- 일반회원 -->
				<div class="col-sm-4 text-center padding wow fadeIn"
					data-wow-duration="1000ms" data-wow-delay="300ms">
					<div class="single-service2">
						<div class="wow scaleIn" data-wow-duration="500ms"
							data-wow-delay="300ms">
							<a href="normalRegister"><img
								src="/resources/images/regist/normal.png" alt=""></a>
						</div>
						<h2>일반 회원</h2>
						<p>
							평점 & 리뷰를 등록 할 수 있으며,<br> 원하는 행사나 푸드트럭을 검색 할 수 있다.
						</p>
						<br>
						<form method="get">
							<input type="hidden" id="type" name="type" value="normal">
							<a type="button" class="btn btn-common" href="normalRegister">가입</a>
						</form>
					</div>
				</div>

				<!-- 트럭운영자 -->
				<div class="col-sm-4 text-center padding wow fadeIn"
					data-wow-duration="1000ms" data-wow-delay="600ms">
					<div class="single-service2">
						<div class="wow scaleIn" data-wow-duration="500ms"
							data-wow-delay="600ms">
							<a href="truckRegister"><img
								src="/resources/images/regist/truck.png" alt=""></a>
						</div>
						<h2>트럭 운영자</h2>
						<p>
							영업신청 & 행사신청 등 운영에 필요한 <br>각종 서비스를 제공
						</p>
						<br>
						<form action="register" method="get">
							<input type="hidden" id="type" name="type" value="truck">
							<a type="button" class="btn btn-common" href="truckRegister">가입</a>
						</form>
					</div>
				</div>

				<!-- 행사운영자 -->
				<div class="col-sm-4 text-center padding wow fadeIn"
					data-wow-duration="1000ms" data-wow-delay="900ms">
					<div class="single-service2">
						<div class="wow scaleIn" data-wow-duration="500ms"
							data-wow-delay="900ms">
							<a href="eventRegister"><img
								src="/resources/images/regist/event.png" alt=""></a>
						</div>
						<h2>행사 운영자</h2>
						<p>
							행사를 주최할 수 있으며, <br>푸드트럭 영업자들을 뽑을 수 있다.
						</p>
						<br>
						<form method="get">
							<input type="hidden" id="type" name="type" value="event">
							<a type="button" class="btn btn-common" href="eventRegister">가입</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@include file="../include/footer.jsp"%>
</body>
</html>