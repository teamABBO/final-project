<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/references.jsp"%>
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
                    <h1 class="title">가입완료</h1>
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
		<div class="row text-center">
			<div class="col-sm-6 col-sm-offset-3">
				<br>
				<br>
				<h2 style="color: #0fad00">가입성공</h2>
				<img src="http://osmhotels.com//assets/check-true.jpg">
				<h2>환영합니다.</h2>
				<br>
				<p style="font-size: 20px; color: #5C5C5C;">로그인을 하시면 보다 더 많은 서비스를 이용하실 수 있습니다.</p>
				
				<br> <a href="login" class="btn btn-common">로그인</a> <br>
				<br>
			</div>

		</div>
	</div>
	<br>
	
	<!-- 푸터 -->
	<%@include file="../include/footer.jsp"%>

</body>
</html>