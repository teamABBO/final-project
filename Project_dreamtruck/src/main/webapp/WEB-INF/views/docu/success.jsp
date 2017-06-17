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
                    <h1 class="title">제출 완료</h1>
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
				<h2 style="color: #0fad00">제출 성공</h2><br>
				<img src="http://osmhotels.com//assets/check-true.jpg">
				<br>
				<br><h2>영업신청서를 관련 기관에 제출하였습니다.</h2>
				<br>
                <br>
				<p style="font-size: 20px; color: #5C5C5C;">영업신청을 처리하는데 수일의 시간이 소요됩니다. 기관의 답변 메일을 기다려주세요.</p>
				<br>
				<br> <a href="/" class="btn btn-common" style="margin-right: 20px">홈</a> <a href="/docu/list" class="btn btn-common">서류관리</a> <br>
				<br>
			</div>

		</div>
	</div>
	<br>
	
	<!-- 푸터 -->
	<%@include file="../include/footer.jsp"%>

</body>


</html>