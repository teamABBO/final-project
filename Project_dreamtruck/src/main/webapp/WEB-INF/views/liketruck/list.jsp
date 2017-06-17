<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/references.jsp"%>
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

<script>
$(document).ready(function(){
	$(".delete").on("click", function(){
		var truckId = $(this).attr('id').split('delete')[1];
		$.ajax({
			type: 'post',
			url: '/liketruck/delete',
			data: {
				userId : truckId
				},
			success: function(result){
				console.log("result: "+result);
					if (result == 'SUCCESS') {
						alert("관심트럭 목록에서 삭제되었습니다!");
						location.reload();
						}
				}
			
		});
	});
	
	
});

</script>

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
										<a href="../truck/read?page=1&perPageNum=9&searchType&keyword=&userId=${liketruck.truckId }" class=""><i class="fa fa-eye"> 상세보기</i></a> &nbsp;&nbsp;<a class="delete" id="delete${liketruck.truckId}" href=""><i class="fa fa-ban" > 제거</i></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
	<!--/#projects-->
	<%@include file="../include/footer.jsp"%>

</body>
</html>