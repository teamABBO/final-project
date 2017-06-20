<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/references.jsp"%>
</head>
<style type="text/css">
th {
    text-align: center;
}

.btn-common2 {
    font-size: 14px;
    color: #ffffff;
    background-color: #fd9483;
    border: 1px solid #fd7c66;
    font-family: 'Open Sans', sans-serif;
    font-weight: 300;
    /* padding: 10px 25px; */
}
</style>
<script>
$(document).ready(
		function() {
			$('#searchB').on(
					"click", function (event) {
						self.location = "list"
						
						+ '${pageMaker.makeQuery(1)}'
						+"&searchType="
						+$("select option:selected").val()
						+"&keyword="+encodeURIComponent($('#keywordInput').val());
					});
			$('#newB').on("click", function(evt) {
				self.location = "upload";
			});
		});
	

</script>
<body>
	<%@include file="../include/header.jsp"%>
	<!--/#header-->

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
										<p>내가 쓴 행사 목록</p>
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
			<div class="single-features">
				<div class="col-md-12">


					<table class="table table-hover" style="text-align: center">
						<tr>
							<th style="width: 10px">No.</th>
							<th>행사제목</th>
							<th>작성자</th>
							<th style="width: 180px">모집트럭수</th>
							<th style="width: 60px">조회수</th>
							<th style="width: 180px"></th>


						</tr>

						<c:forEach items="${list }" var="list" varStatus="status">
							<tr>
								<input type="hidden" name="userId" value="${login.userId }" />
								<td>${list.eventId}</td>
								<td><a
									href='/event/detail${pageMaker.makeSearch(pageMaker.cri.page)}&eventId=${list.eventId }'>${list.title }</a></td>
								<td>${list.name}</td>
								<td>${list.recruit }</td>
								<td>${list.hit }</td>
								<td><a class="btn btn-common2"
									href="/applier/list/${list.eventId}">신청 현황</a></td>
							</tr>

						</c:forEach>
					</table>

				</div>
			</div>
		</div>
	</div>


	<%@include file="../include/footer.jsp"%>
	<!--/#footer-->
</body>
</html>