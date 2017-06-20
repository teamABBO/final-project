<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/references.jsp"%>
<script>
$(function() {
   $('#searchB').click(function() {
      
      var name = $('#name').val();
      var phone = $('#phone').val();
      
      $.ajax({
         async : true,
         type : "post",
         url : "idCheck",
         dataType : "text",
         data: {
           "name" : name,
           "phone" : phone
            },  
         success : function(data) {
        	if(data == 'fail'){
        		$('.modal-body').html("회원 정보를 다시 확인 해 주세요.");
        	}else{
           $('.modal-body').html("고객님의 아이디는 : "+data+"입니다.");
        	}
         }
      });
      $('#search').modal('show');
   });
   
   $('#searchP').click(function() {
	      
	      var id = $('#id').val();
	      var email = $('#email').val();
	      
	      $.ajax({
	         async : true,
	         type : "post",
	         url : "pwCheck",
	         dataType : "text",
	         data: {
	           "id" : id,
	           "email" : email
	            },  
	         success : function(data) {
	        	if(data == 'fail'){
	        		$('.modal-body').html("회원 정보를 다시 확인 해 주세요.");
	        	}else{
	           $('.modal-body').html("고객님의 비밀번호는 : "+data+"입니다.");
	        	}
	         }
	      });
	      $('#searchPw').modal('show');
	   });
   
}); 

</script>
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
										<h1 class="title">회원 찾기</h1>
									</div>
								</div>
							</div>
						</div>
					</div>

				</section>
			</div>
		</div>
	</section>
	<!-- 배너 -->

	<section id="services">
		<div class="container">
			<div class="row">
				<!-- 아이디 찾기 -->
				<div class="col-sm-4 text-center padding wow fadeIn"
					data-wow-duration="1000ms" data-wow-delay="300ms"
					style="margin-right: 100px;">
					<div class="single-service2">
						<form id="idsearch" action="#" method="post" role="form"
							style="display: block; margin-left: 100px;">
							<div class="wow scaleIn" data-wow-duration="500ms"
								data-wow-delay="900ms">
								<img src="/resources/images/regist/idSearch.png" alt="">
							</div>
							<h2>아이디 찾기</h2>
							<br>
							<div class="form-group">
								<input type="text" name="name" id="name" tabindex="1"
									class="form-control" placeholder="이름을 입력하세요." value="" size="5">
							</div>
							<div class="form-group">
								<input type="text" name="phone" id="phone" tabindex="2"
									class="form-control" placeholder="휴대폰번호를 입력하세요.">
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-sm-6 col-sm-offset-3">
										<button type="button" id="searchB" name="searchB"
											class="btn btn-common">찾기</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>

				<!-- 비밀번호 찾기 -->
				<div class="col-sm-4 text-center padding wow fadeIn"
					data-wow-duration="1000ms" data-wow-delay="300ms"
					style="margin-left: 200px;">
					<div class="single-service2">
						<form id="pwsearch" action="#" method="post" role="form"
							style="display: block; margin-left: 100px;">
							<div class="wow scaleIn" data-wow-duration="500ms"
								data-wow-delay="900ms">
								<img src="/resources/images/regist/PasswordSearch.png" alt="">
							</div>
							<h2>비밀번호 찾기</h2>
							<br>
							<div class="form-group">
								<input type="text" name="id" id="id" tabindex="1"
									class="form-control" placeholder="아이디를 입력하세요." value=""
									size="5">
							</div>
							<div class="form-group">
								<input type="email" name="email" id="email" tabindex="2"
									class="form-control" placeholder="이메일을 입력하세요.">
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-sm-6 col-sm-offset-3">
										<button type="button" id="searchP" name="searchP"
											class="btn btn-common">찾기</button>
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
<!-- 아이디 찾기 모달 -->
<div id="search" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">아이디 찾기</h4>
			</div>
			<!-- Modal Body-->
			<div class="modal-body"></div>
			<!-- Modal Footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal"
					id="closeB">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- 비밀번호 찾기 모달 -->
<div id="searchPw" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">비밀번호 찾기</h4>
			</div>
			<!-- Modal Body-->
			<div class="modal-body"></div>
			<!-- Modal Footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal"
					id="closeB">닫기</button>
			</div>
		</div>
	</div>
</div>
</html>