<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/references.jsp"%>
<style type="text/css">
.container{
    margin-top:20px;
}
.image-preview-input {
    position: relative;
    overflow: hidden;
    margin: 0px;    
    color: #333;
    background-color: #fff;
    border-color: #ccc;    
}
.image-preview-input input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	margin: 0;
	padding: 0;
	font-size: 20px;
	cursor: pointer;
	opacity: 0;
	filter: alpha(opacity=0);
}
.image-preview-input-title {
    margin-left:2px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
			var reg_pw = /^.*(?=.{6,16})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;	
				
			// 비밀번호 유효성 검사
			$("#pw").keyup(function() {
		      var pw = $(this).val();
		      if(pw.length < 6 ) {
		         $("#pwLabel").text("6~15자리 영문숫자조합").css("color","red");
		      }else if (reg_pw.test($("#pw").val()) &&  pw.length >= 6 && pw.length <= 15){
		         $("#pwLabel").text("사용가능").css("color","green");
		      }
		  	 });
		   $("#repw").keyup(function() {
			  var repw = $(this).val();
		      if(repw.length < 6){
		    	  $("#repwLabel").text("6~15자리 영문숫자조합").css("color","red")
		      }else if($("#repw").val() != $("#pw").val()){
		         $("#repwLabel").text("비밀번호가 다릅니다").css("color","red")
		      }else if($("#repw").val() == $("#pw").val() && reg_pw.test($("#repw").val())){
		         $("#repwLabel").text("사용가능").css("color","green");
		      }
		   });
		
		
		   // 이미지 변경
           $(document).on(
                 'change',
                 '.btn-file :file',
                 function() {
                    var input = $(this), label = input.val().replace(
                          /\\/g, '/').replace(/.*\//, '');
                    input.trigger('fileselect', [ label ]);
                 }); 
           
           $('.btn-file :file').on(
                 'fileselect',
                 function(event, label) {

                    var input = $(this).parents('.input-group').find(
                          ':text'), log = label;

                    if (input.length) {
                       input.val(log);
                    } else {
                       if (log)
                          swal("오류!", log, "error");
                    }

                 });
           
           $('#deleteImg').on("click",function(){
               $('#truckImg').val(null);
               $('#img-upload').attr('src',null);
            });
           
           function readURL(input) {
              if (input.files && input.files[0]) {
                 var reader = new FileReader();

                 reader.onload = function(e) {
                    $('#img-upload').attr('src', e.target.result);
                 }
                 reader.readAsDataURL(input.files[0]);
              }
           }
           $("#imgInp").change(function() {
              readURL(this);
           });
 });
</script> 
<body>
<%@include file="../include/header.jsp"%>
	<input type="hidden" name="userId" value="${login.userId}">
	<input type="hidden" name="type" value="${login.type}">
	
	<c:choose>
	<c:when test="${login.type == 'normal'}">
	
	<!-- 배너 -->
	<br><br>
  	<section id="services" style="margin-top: 0px">
    <div class="container">
    <div class="row">
   
	<section id="page-breadcrumb">
    <div class="vertical-center sun">
     <div class="container">
       <div class="row">
         <div class="action">
            <div class="col-sm-12">
              <h1 class="title">회원정보수정</h1>
                            <p>일반 사용자</p>
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
   		
   			<!-- 일반 사용자 회원가입 -->
			<form class="form-horizontal" method="post" role="form" onsubmit="return Check(this);">
			<fieldset>
				<!-- 아이디 -->
				<div class="form-group">
				<br><br>
					<label class="col-md-4 control-label" for="name">아이디</label>
					<div class="col-md-4">
						<input id="id" name="id" type="text" placeholder="아이디를 입력 해 주세요." class="form-control input-md" value="${normal.id}" disabled>
						<input id="type" name="type" type="hidden" value="${login.type}">
						<input id="userId" name="userId" type="hidden" value="${login.userId}">
						<input type="hidden" id="id" name="id" value="${login.id}">
					</div>
				</div>

				<!-- 비밀번호 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="phone">비밀번호</label>
					<label id="pwLabel"></label>
					<div class="col-md-4">
						<input id="pw" name="pw" type="password" placeholder="비밀번호를 입력 해 주세요." class="form-control input-md">
					</div>
				</div>

				<!-- 비밀번호 확인 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="phone">비밀번호 확인</label>
					<label id="repwLabel"></label>
					<div class="col-md-4">
						<input id="repw" name="repw" type="password" placeholder="비밀번호를 다시 입력 해 주세요." class="form-control input-md">
					</div>
				</div>
			
			
				<!-- 전화번호 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="password">전화번호 </label>
					<div class="col-md-4">
						<input id="phone" name="phone"  type="text" placeholder="전화번호를 입력 해 주세요. " class="form-control input-md" value="${normal.phone}">
					</div>
					
				</div>
				
				<!-- 이름 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="rpassword">이름</label>
					<div class="col-md-4">
						<input id="name" name="name" type="text" placeholder="이름을 입력 해 주세요." class="form-control input-md" value="${normal.name}" disabled>
					</div>
				</div>
				
				<!-- 이메일 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="email">이메일</label>
					<div class="col-md-4">
						<input id="email" name="email" type="email" placeholder="이메일을 입력 해 주세요." class="form-control input-md" required value="${normal.email}">
					</div>
				</div>
				
				<!-- 관심 지역 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="selectgu">관심 지역</label>
					<div class="col-md-4">
					
						<select id="likeArea" name="likeArea" class="form-control">
						<c:choose>
                		  <c:when test="${normal.likeArea eq '1'}">
                   			  <option value="1">강남구</option>
                    	  </c:when>
                  		<c:when test="${normal.likeArea eq '2'}">
                    		  <option value="2">강동구</option>		
                    	</c:when>
                  		<c:when test="${normal.likeArea eq '3'}">
                   			  <option value="3">강북구</option>
                   		</c:when>
                  		<c:when test="${normal.likeArea eq '4'}">
                   			  <option value="4">강서구</option>
                    	</c:when>
                  		<c:when test="${normal.likeArea eq '5'}">
                    		  <option value="5">관악구</option>
                    	</c:when>
                  		<c:when test="${normal.likeArea eq '6'}">
                    		  <option value="6">광진구</option>
                    	</c:when>
                  		<c:when test="${normal.likeArea  eq '7'}">
                    		  <option value="7">구로구</option>
                   		</c:when>
                  		<c:when test="${normal.likeArea  eq '8'}">
                      		  <option value="8">금천구</option>
                    	</c:when>
                  		<c:when test="${normal.likeArea  eq '9'}">
                   			  <option value="9">노원구</option>
                    	</c:when>
                  		<c:when test="${normal.likeArea  eq '10'}">
                    		  <option value="10">도봉구</option>
                    	</c:when>
                  		<c:when test="${normal.likeArea  eq '11'}">
                   			  <option value="11">동대문구</option>
                    	</c:when>
                  		<c:when test="${normal.likeArea  eq '12'}">
                    		  <option value="12">동작구</option>
                    	</c:when>
                  		<c:when test="${normal.likeArea  eq '13'}">
                     		  <option value="13">마포구</option>
                    	</c:when>
                  		<c:when test="${normal.likeArea  eq '14'}">
                    		  <option value="14">서대문구</option>
                    	</c:when>
                  		<c:when test="${normal.likeArea  eq '15'}">
                   			  <option value="15">서초구</option>
                    	</c:when>
                  		<c:when test="${normal.likeArea  eq '16'}">
                    		  <option value="16">성동구</option>
                    	</c:when>
                  		<c:when test="${normal.likeArea  eq '17'}">
                   			  <option value="17">성북구</option>
                    	</c:when>
                  		<c:when test="${normal.likeArea  eq '18'}">
                    		  <option value="18">송파구</option>
                    	</c:when>
                  		<c:when test="${normal.likeArea  eq '19'}">
                    		  <option value="19">양천구</option>
                    	</c:when>
                  		<c:when test="${normal.likeArea  eq '20'}">
                    		  <option value="20">영등포구</option>
                    	</c:when>
                  		<c:when test="${normal.likeArea  eq '21'}">
                    		  <option value="21">용산구</option>
                    	</c:when>
                  		<c:when test="${normal.likeArea  eq '22'}">
                    		  <option value="22">은평구</option>
                    	</c:when>
                  		<c:when test="${normal.likeArea  eq '23'}">
                              <option value="23">종로구</option>
                    	</c:when>
                  		<c:when test="${normal.likeArea  eq '24'}">
                    		  <option value="24">중구</option>
                    	</c:when>
                  		<c:when test="${normal.likeArea  eq '25'}">
                    		  <option value="25">중랑구</option>
                    	</c:when>
                </c:choose>
							<option value="1">강남구</option>
							<option value="2">강동구</option>
							<option value="3">강북구</option>
							<option value="4">강서구</option>
							<option value="5">관악구</option>
							<option value="6">광진구</option>
							<option value="7">구로구</option>
							<option value="8">금천구</option>
							<option value="9">노원구</option>
							<option value="10">도봉구</option>
							<option value="11">동대문구</option>
							<option value="12">동작구</option>
							<option value="13">마포구</option>
							<option value="14">서대문구</option>
							<option value="15">서초구</option>
							<option value="16">성동구</option>
							<option value="17">성북구</option>
							<option value="18">송파구</option>
							<option value="19">양천구</option>
							<option value="20">영등포구</option>
							<option value="21">용산구</option>
							<option value="22">은평구</option>
							<option value="23">종로구</option>
							<option value="24">중구</option>
							<option value="25">중랑구</option>
						</select>
					</div>
				</div>
				
				<!-- 버튼 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="save"></label>
					<div class="col-md-8">
						<a class="btn btn-common" href="delete">회원 탈퇴</a>
						<button type="submit" id="save" name="save" class="btn btn-common">수정</button>
						<a class="btn btn-common" href="#primary" data-toggle="modal">취소</a>
					</div>
				</div>
			</fieldset>
			</form>
			
			<script type="text/javascript">
			function Check(form) {
				   var likearea = $("#likeArea option:selected").val();
				   var pw = $("#pw").val();
				   var repw = $("#repw").val();
				   var reg_pw = /^.*(?=.{6,16})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
				   
					if(likearea == "" ){
						swal("회원 수정 중 에러", "관심 지역을 설정 해 주세요!", "error")
						return false;
					} 
					if(pw != repw || pw.length <= 6 || !reg_pw.test(pw)){
						swal("회원 수정 중 에러", "비밀 번호를 확인 해 주세요!", "error")
						return false;
					}
			}
			
			</script>
		 </c:when> 
		
	 <c:when test="${login.type == 'event'}">
	<!-- 배너 -->
	<br><br>
  	<section id="services" style="margin-top: 0px">
    <div class="container">
      <div class="row">
   
	<section id="page-breadcrumb">
    <div class="vertical-center sun">
     <div class="container">
       <div class="row">
         <div class="action">
            <div class="col-sm-12">
              <h1 class="title">회원정보수정</h1>
                            <p>행사 운영자</p>
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
	<form class="form-horizontal" method="post" role="form" onsubmit="return Check(this);">
			<fieldset>
				<!-- 아이디 -->
				<div class="form-group">
				<br><br>
					<label class="col-md-4 control-label" for="name">아이디</label>
					<div class="col-md-4">
						<input id="type" name="type" type="hidden" value="${login.type}">
						<input id="userId" name="userId" type="hidden" value="${login.userId}">
						<input id="id" name="id" type="text" placeholder="아이디를 입력 해 주세요." class="form-control input-md" disabled value="${event.id}">
					</div>
				</div>

				<!-- 비밀번호 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="phone">비밀번호</label>
					<label id="pwLabel"></label>
					<div class="col-md-4">
						<input id="pw" name="pw" type="password" placeholder="비밀번호를 입력 해 주세요." class="form-control input-md">
					</div>
				</div>

				<!-- 비밀번호 확인 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="phone">비밀번호 확인</label>
					<label id="repwLabel"></label>
					<div class="col-md-4">
						<input id="repw" name="repw" type="password" placeholder="비밀번호를 다시 입력 해 주세요." class="form-control input-md">
					</div>
				</div>
			
			
				<!-- 전화번호 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="password">전화번호 </label>
					<div class="col-md-4">
						<input id="phone" name="phone" type="text" placeholder="전화번호를 입력 해 주세요. " class="form-control input-md" value="${event.phone}">
					</div>
				</div>
				
				<!-- 이름 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="rpassword">이름</label>
					<div class="col-md-4">
						<input id="name" name="name" type="text" placeholder="이름을 입력 해 주세요." class="form-control input-md" disabled value="${event.name}">
					</div>
				</div>
				
				<!-- 관심 지역 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="selectgu">관심 지역</label>
					<div class="col-md-4">
					
						<select id="likeArea" name="likeArea" class="form-control">
						<c:choose>
                		  <c:when test="${event.likeArea eq '1'}">
                   			  <option value="1">강남구</option>
                    	  </c:when>
                  		<c:when test="${event.likeArea eq '2'}">
                    		  <option value="2">강동구</option>		
                    	</c:when>
                  		<c:when test="${event.likeArea eq '3'}">
                   			  <option value="3">강북구</option>
                   		</c:when>
                  		<c:when test="${event.likeArea eq '4'}">
                   			  <option value="4">강서구</option>
                    	</c:when>
                  		<c:when test="${event.likeArea eq '5'}">
                    		  <option value="5">관악구</option>
                    	</c:when>
                  		<c:when test="${event.likeArea eq '6'}">
                    		  <option value="6">광진구</option>
                    	</c:when>
                  		<c:when test="${event.likeArea  eq '7'}">
                    		  <option value="7">구로구</option>
                   		</c:when>
                  		<c:when test="${event.likeArea  eq '8'}">
                      		  <option value="8">금천구</option>
                    	</c:when>
                  		<c:when test="${event.likeArea  eq '9'}">
                   			  <option value="9">노원구</option>
                    	</c:when>
                  		<c:when test="${event.likeArea  eq '10'}">
                    		  <option value="10">도봉구</option>
                    	</c:when>
                  		<c:when test="${event.likeArea  eq '11'}">
                   			  <option value="11">동대문구</option>
                    	</c:when>
                  		<c:when test="${event.likeArea  eq '12'}">
                    		  <option value="12">동작구</option>
                    	</c:when>
                  		<c:when test="${event.likeArea  eq '13'}">
                     		  <option value="13">마포구</option>
                    	</c:when>
                  		<c:when test="${event.likeArea  eq '14'}">
                    		  <option value="14">서대문구</option>
                    	</c:when>
                  		<c:when test="${event.likeArea  eq '15'}">
                   			  <option value="15">서초구</option>
                    	</c:when>
                  		<c:when test="${event.likeArea  eq '16'}">
                    		  <option value="16">성동구</option>
                    	</c:when>
                  		<c:when test="${event.likeArea  eq '17'}">
                   			  <option value="17">성북구</option>
                    	</c:when>
                  		<c:when test="${event.likeArea  eq '18'}">
                    		  <option value="18">송파구</option>
                    	</c:when>
                  		<c:when test="${event.likeArea  eq '19'}">
                    		  <option value="19">양천구</option>
                    	</c:when>
                  		<c:when test="${event.likeArea  eq '20'}">
                    		  <option value="20">영등포구</option>
                    	</c:when>
                  		<c:when test="${event.likeArea  eq '21'}">
                    		  <option value="21">용산구</option>
                    	</c:when>
                  		<c:when test="${event.likeArea  eq '22'}">
                    		  <option value="22">은평구</option>
                    	</c:when>
                  		<c:when test="${event.likeArea  eq '23'}">
                              <option value="23">종로구</option>
                    	</c:when>
                  		<c:when test="${event.likeArea  eq '24'}">
                    		  <option value="24">중구</option>
                    	</c:when>
                  		<c:when test="${event.likeArea  eq '25'}">
                    		  <option value="25">중랑구</option>
                    	</c:when>
                </c:choose>
							<option value="1">강남구</option>
							<option value="2">강동구</option>
							<option value="3">강북구</option>
							<option value="4">강서구</option>
							<option value="5">관악구</option>
							<option value="6">광진구</option>
							<option value="7">구로구</option>
							<option value="8">금천구</option>
							<option value="9">노원구</option>
							<option value="10">도봉구</option>
							<option value="11">동대문구</option>
							<option value="12">동작구</option>
							<option value="13">마포구</option>
							<option value="14">서대문구</option>
							<option value="15">서초구</option>
							<option value="16">성동구</option>
							<option value="17">성북구</option>
							<option value="18">송파구</option>
							<option value="19">양천구</option>
							<option value="20">영등포구</option>
							<option value="21">용산구</option>
							<option value="22">은평구</option>
							<option value="23">종로구</option>
							<option value="24">중구</option>
							<option value="25">중랑구</option>
						</select>
					</div>
				</div>
				
				<!-- 이메일 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="email">이메일</label>
					<div class="col-md-4">
						<input id="email" name="email" type="email" placeholder="이메일을 입력 해 주세요." class="form-control input-md" required value="${event.email}">
					</div>
				</div>
					
				<!-- 담당부서명 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="contactname">담당부서명</label>
					<div class="col-md-4">
						<input id="eventDep" name="eventDep" type="text" value="${event.eventDep}" class="form-control input-md">
					</div>
				</div>
				<!-- 버튼 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="save"></label>
					<div class="col-md-8">
						<a class="btn btn-common" href="delete">회원 탈퇴</a>
						<button type="submit" id="save" name="save" class="btn btn-common">수정</button>
						<a class="btn btn-common" href="#primary" data-toggle="modal">취소</a>
					</div>
				</div>
			</fieldset>
			</form>
			<script type="text/javascript">
			function Check(form) {
				   var likearea = $("#likeArea option:selected").val();
				   var pw = $("#pw").val();
				   var repw = $("#repw").val();
				   var reg_pw = /^.*(?=.{6,16})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
				   
					if(likearea == "" ){
						swal("회원 수정 중 에러", "관심 지역을 설정 해 주세요!", "error")
						return false;
					} 
					if(pw != repw || pw.length <= 6 || !reg_pw.test(pw)){
						swal("회원 수정 중 에러", "비밀 번호를 확인 해 주세요!", "error")
						return false;
					}
			}
			
			</script>
		</c:when>
		
		<c:when test="${login.type == 'truck' }">
	<!-- 배너 -->
	<br><br>
  	<section id="services" style="margin-top: 0px">
    <div class="container">
      <div class="row">
   
	<section id="page-breadcrumb">
    <div class="vertical-center sun">
     <div class="container">
       <div class="row">
         <div class="action">
            <div class="col-sm-12">
              <h1 class="title">회원정보수정</h1>
                            <p>트럭 운영자</p>
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
	<form class="form-horizontal" id="form1" enctype="multipart/form-data" method="post" role="form" onsubmit="return Check(this);">
			<fieldset>
				<!-- 아이디 -->
				<div class="form-group">
				<br><br>
					<label class="col-md-4 control-label" for="name">아이디</label>
					<div class="col-md-4">
						<input id="type" name="type" type="hidden" value="${login.type}">
						<input id="userId" name="userId" type="hidden" value="${login.userId}">
						<input type="hidden" id="id" name="id" value="${login.id}">
						<input id="id2" name="id2" type="text" placeholder="아이디를 입력 해 주세요." class="form-control input-md"  value="${truck.id}" disabled>
					</div>
				</div>

				<!-- 비밀번호 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="phone">비밀번호</label>
					<label id="pwLabel"></label>
					<div class="col-md-4">
						<input id="pw" name="pw" type="password" placeholder="비밀번호를 입력 해 주세요." class="form-control input-md" >
					</div>
				</div>

				<!-- 비밀번호 확인 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="phone">비밀번호 확인</label>
					<label id="repwLabel"></label>
					<div class="col-md-4">
						<input id="repw" name="repw" type="password" placeholder="비밀번호를 다시 입력 해 주세요." class="form-control input-md" >
					</div>
				</div>
			
			
				<!-- 전화번호 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="password">전화번호 </label>
					<div class="col-md-4">
						<input id="phone" name="phone" type="text" placeholder="전화번호를 입력 해 주세요. " class="form-control input-md" value="${truck.phone}">
					</div>
				</div>
				
				<!-- 이름 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="rpassword">이름</label>
					<div class="col-md-4">
						<input id="name" name="name" type="text" placeholder="이름을 입력 해 주세요." class="form-control input-md" disabled value="${truck.name}">
					</div>
				</div>
				
				<!-- 이메일 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="email">이메일</label>
					<div class="col-md-4">
						<input id="email" name="email" type="email" placeholder="이메일을 입력 해 주세요." class="form-control input-md" required value="${truck.email}">
					</div>
				</div>
				
				<!-- 관심 지역 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="selectgu">관심 지역</label>
					<div class="col-md-4">
					
						<select id="likeArea" name="likeArea" class="form-control">
						<c:choose>
                		  <c:when test="${truck.likeArea eq '1'}">
                   			  <option value="1">강남구</option>
                    	  </c:when>
                  		<c:when test="${truck.likeArea eq '2'}">
                    		  <option value="2">강동구</option>		
                    	</c:when>
                  		<c:when test="${truck.likeArea eq '3'}">
                   			  <option value="3">강북구</option>
                   		</c:when>
                  		<c:when test="${truck.likeArea eq '4'}">
                   			  <option value="4">강서구</option>
                    	</c:when>
                  		<c:when test="${truck.likeArea eq '5'}">
                    		  <option value="5">관악구</option>
                    	</c:when>
                  		<c:when test="${truck.likeArea eq '6'}">
                    		  <option value="6">광진구</option>
                    	</c:when>
                  		<c:when test="${truck.likeArea  eq '7'}">
                    		  <option value="7">구로구</option>
                   		</c:when>
                  		<c:when test="${truck.likeArea  eq '8'}">
                      		  <option value="8">금천구</option>
                    	</c:when>
                  		<c:when test="${truck.likeArea  eq '9'}">
                   			  <option value="9">노원구</option>
                    	</c:when>
                  		<c:when test="${truck.likeArea  eq '10'}">
                    		  <option value="10">도봉구</option>
                    	</c:when>
                  		<c:when test="${truck.likeArea  eq '11'}">
                   			  <option value="11">동대문구</option>
                    	</c:when>
                  		<c:when test="${truck.likeArea  eq '12'}">
                    		  <option value="12">동작구</option>
                    	</c:when>
                  		<c:when test="${truck.likeArea  eq '13'}">
                     		  <option value="13">마포구</option>
                    	</c:when>
                  		<c:when test="${truck.likeArea  eq '14'}">
                    		  <option value="14">서대문구</option>
                    	</c:when>
                  		<c:when test="${truck.likeArea  eq '15'}">
                   			  <option value="15">서초구</option>
                    	</c:when>
                  		<c:when test="${truck.likeArea  eq '16'}">
                    		  <option value="16">성동구</option>
                    	</c:when>
                  		<c:when test="${truck.likeArea  eq '17'}">
                   			  <option value="17">성북구</option>
                    	</c:when>
                  		<c:when test="${truck.likeArea  eq '18'}">
                    		  <option value="18">송파구</option>
                    	</c:when>
                  		<c:when test="${truck.likeArea  eq '19'}">
                    		  <option value="19">양천구</option>
                    	</c:when>
                  		<c:when test="${truck.likeArea  eq '20'}">
                    		  <option value="20">영등포구</option>
                    	</c:when>
                  		<c:when test="${truck.likeArea  eq '21'}">
                    		  <option value="21">용산구</option>
                    	</c:when>
                  		<c:when test="${truck.likeArea  eq '22'}">
                    		  <option value="22">은평구</option>
                    	</c:when>
                  		<c:when test="${truck.likeArea  eq '23'}">
                              <option value="23">종로구</option>
                    	</c:when>
                  		<c:when test="${truck.likeArea  eq '24'}">
                    		  <option value="24">중구</option>
                    	</c:when>
                  		<c:when test="${truck.likeArea  eq '25'}">
                    		  <option value="25">중랑구</option>
                    	</c:when>
                </c:choose>
							<option value="1">강남구</option>
							<option value="2">강동구</option>
							<option value="3">강북구</option>
							<option value="4">강서구</option>
							<option value="5">관악구</option>
							<option value="6">광진구</option>
							<option value="7">구로구</option>
							<option value="8">금천구</option>
							<option value="9">노원구</option>
							<option value="10">도봉구</option>
							<option value="11">동대문구</option>
							<option value="12">동작구</option>
							<option value="13">마포구</option>
							<option value="14">서대문구</option>
							<option value="15">서초구</option>
							<option value="16">성동구</option>
							<option value="17">성북구</option>
							<option value="18">송파구</option>
							<option value="19">양천구</option>
							<option value="20">영등포구</option>
							<option value="21">용산구</option>
							<option value="22">은평구</option>
							<option value="23">종로구</option>
							<option value="24">중구</option>
							<option value="25">중랑구</option>
						</select>
					</div>
				</div>
				
				<!-- 영업 지역 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="selectgu">영업 지역</label>
					<div class="col-md-4">

						<select id="truckArea" name="truckArea" class="form-control">
						<c:choose>
                		  <c:when test="${truck.truckArea eq '1'}">
                   			  <option value="1">강남구</option>
                    	  </c:when>
                  		<c:when test="${truck.truckArea eq '2'}">
                    		  <option value="2">강동구</option>		
                    	</c:when>
                  		<c:when test="${truck.truckArea eq '3'}">
                   			  <option value="3">강북구</option>
                   		</c:when>
                  		<c:when test="${truck.truckArea eq '4'}">
                   			  <option value="4">강서구</option>
                    	</c:when>
                  		<c:when test="${truck.truckArea eq '5'}">
                    		  <option value="5">관악구</option>
                    	</c:when>
                  		<c:when test="${truck.truckArea eq '6'}">
                    		  <option value="6">광진구</option>
                    	</c:when>
                  		<c:when test="${truck.truckArea  eq '7'}">
                    		  <option value="7">구로구</option>
                   		</c:when>
                  		<c:when test="${truck.truckArea  eq '8'}">
                      		  <option value="8">금천구</option>
                    	</c:when>
                  		<c:when test="${truck.truckArea  eq '9'}">
                   			  <option value="9">노원구</option>
                    	</c:when>
                  		<c:when test="${truck.truckArea  eq '10'}">
                    		  <option value="10">도봉구</option>
                    	</c:when>
                  		<c:when test="${truck.truckArea  eq '11'}">
                   			  <option value="11">동대문구</option>
                    	</c:when>
                  		<c:when test="${truck.truckArea  eq '12'}">
                    		  <option value="12">동작구</option>
                    	</c:when>
                  		<c:when test="${truck.truckArea  eq '13'}">
                     		  <option value="13">마포구</option>
                    	</c:when>
                  		<c:when test="${truck.truckArea  eq '14'}">
                    		  <option value="14">서대문구</option>
                    	</c:when>
                  		<c:when test="${truck.truckArea  eq '15'}">
                   			  <option value="15">서초구</option>
                    	</c:when>
                  		<c:when test="${truck.truckArea  eq '16'}">
                    		  <option value="16">성동구</option>
                    	</c:when>
                  		<c:when test="${truck.truckArea  eq '17'}">
                   			  <option value="17">성북구</option>
                    	</c:when>
                  		<c:when test="${truck.truckArea  eq '18'}">
                    		  <option value="18">송파구</option>
                    	</c:when>
                  		<c:when test="${truck.truckArea  eq '19'}">
                    		  <option value="19">양천구</option>
                    	</c:when>
                  		<c:when test="${truck.truckArea  eq '20'}">
                    		  <option value="20">영등포구</option>
                    	</c:when>
                  		<c:when test="${truck.truckArea  eq '21'}">
                    		  <option value="21">용산구</option>
                    	</c:when>
                  		<c:when test="${truck.truckArea  eq '22'}">
                    		  <option value="22">은평구</option>
                    	</c:when>
                  		<c:when test="${truck.truckArea  eq '23'}">
                              <option value="23">종로구</option>
                    	</c:when>
                  		<c:when test="${truck.truckArea  eq '24'}">
                    		  <option value="24">중구</option>
                    	</c:when>
                  		<c:when test="${truck.truckArea  eq '25'}">
                    		  <option value="25">중랑구</option>
                    	</c:when>
                </c:choose>
							<option value="1">강남구</option>
							<option value="2">강동구</option>
							<option value="3">강북구</option>
							<option value="4">강서구</option>
							<option value="5">관악구</option>
							<option value="6">광진구</option>
							<option value="7">구로구</option>
							<option value="8">금천구</option>
							<option value="9">노원구</option>
							<option value="10">도봉구</option>
							<option value="11">동대문구</option>
							<option value="12">동작구</option>
							<option value="13">마포구</option>
							<option value="14">서대문구</option>
							<option value="15">서초구</option>
							<option value="16">성동구</option>
							<option value="17">성북구</option>
							<option value="18">송파구</option>
							<option value="19">양천구</option>
							<option value="20">영등포구</option>
							<option value="21">용산구</option>
							<option value="22">은평구</option>
							<option value="23">종로구</option>
							<option value="24">중구</option>
							<option value="25">중랑구</option>
						</select>
					</div>
				</div>
					
				<!-- 사업자번호 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="address1">사업자번호</label>
					<div class="col-md-4">
						<input id="sid" name="sid" type="text" placeholder="사업자번호를 입력 해 주세요. " class="form-control input-md" value="${truck.sid}" disabled>

					</div>
				</div>

				<!-- 차량번호 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="address1">차량번호</label>
					<div class="col-md-4">
						<input id="truckNum" name="truckNum" type="text" placeholder="차량번호를 입력 해 주세요." class="form-control input-md" value="${truck.truckNum}" disabled>
					</div>
				</div>

				<!-- 트럭상호명 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="city">트럭상호명</label>
					<div class="col-md-4">
						<input id="truckName" name="truckName" type="text" placeholder="트럭상호명을 입력 해 주세요." class="form-control input-md" value="${truck.truckName}">

					</div>
				</div>
				
				<!-- 음식 종류 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="selectgu">음식 종류</label>
					<div class="col-md-4">

						<select id="truckFood" name="truckFood" class="form-control">
							<option value="${truck.truckFood}">${truck.truckFood}</option>
							<option value="한식">한식</option>
							<option value="일식">일식</option>
							<option value="중식">중식</option>
							<option value="아프리카">아프리카</option>
							<option value="동남아">동남아</option>
							<option value="남미">남미</option>
							<option value="북미">북미</option>
							<option value="이탈리아">이탈리아</option>
							<option value="스페인">스페인</option>
							<option value="오세아니아">오세아니아</option>
							<option value="유럽식">유럽식</option>
							<option value="디저트">디저트</option>
							<option value="음료">음료</option>
							<option value="주류">주류</option>
							<option value="퓨전">퓨전</option>
						</select>
					</div>
				</div>
				
				<!-- 첨부파일 -->
            <div class="form-group">
               <label class="col-md-4 control-label" for="contactphone">파일 첨부 </label>
               <div class="col-md-4">
                  <div class="form-group">
                     <div class="col-md-5">
                        <div class="form-group">
                           <div class="input-group">
                              <span class="input-group-btn"> 
                              <input type="text" class="form-control" style="margin-left: 15px; margin-top: 2px;" id="truckImg" name="truckImg"  value="${truck.truckImg}">
                              <span class="btn btn-file image-preview-input" style="margin-right: 1px; margin-top: 2px; height: 40px;" >업로드
                               <input type="file" name="file" id="imgInp">
                              </span>
                              <a type="button" id="deleteImg" class="btn btn-default image-preview-input" style="margin-right: 30px; margin-top: 2px; height: 40px;"><i class="fa fa-close"></i></a>
                              </span>
                           </div>
                           <c:if test="${empty truck.truckImg}">
                           <img id='img-upload' style="margin-left: 20px; margin-top: 10px;" src="/displayFile?fileName=/user/noimage.png" />
                           </c:if>
                           <c:if test="${not empty truck.truckImg}">
                           <img id='img-upload' style="margin-left: 20px; margin-top: 10px;" src="/displayFile?fileName=/user/${truck.id}/${truck.truckImg}"/>
                           </c:if>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
				
				<!-- 내용 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="info">내용</label>
					<div class="col-md-5">
						<textarea rows="8" cols="84" id="truckInfo" name="truckInfo" style="resize: none;" class="form-control">${truck.truckInfo}</textarea>
					</div>
				</div>

				<!-- 버튼 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="save"></label>
					<div class="col-md-8">
						<a class="btn btn-common" href="delete">회원 탈퇴</a>
						<button type="submit" id="save" name="save" class="btn btn-common">수정</button>
						<a class="btn btn-common" href="#primary" data-toggle="modal">취소</a>
					</div>
				</div>
			</fieldset>
			</form> 
			<script type="text/javascript">
			function Check(form) {
				   var likearea = $("#likeArea option:selected").val();
				   var truckarea = $("#truckArea option:selected").val();
				   var truckfood = $("#truckFood option:selected").val();
				   var pw = $("#pw").val();
				   var repw = $("#repw").val();
				   var reg_pw = /^.*(?=.{6,16})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
				   
				   
					if(likearea == ""){
						swal("회원 수정 중 에러", "관심 지역을 설정 해 주세요!", "error")
						return false;
					}else if(truckarea == ""){
						swal("회원 수정 중 에러", "영업 지역을 설정 해 주세요!"", "error")
						return false;
					}else if(truckfood == ""){
						swal("회원 수정 중 에러", "음식 종류를 설정 해 주세요!", "error")
						return false;
					}else if(pw != repw || pw.length <= 6 || !reg_pw.test(pw)){
						swal("회원 수정 중 에러", "비밀 번호를 확인 해 주세요!", "error")
						return false;
					}
			}
			</script>
	
	</c:when>
	</c:choose> 
	<br>
	<%@include file="../include/footer.jsp"%>
	
	<!-- Modal -->
    <div class="modal fade" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="border-bottom: 4px solid #a94442; background-color: #f2dede; color: #a94446;">
              <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">닫기</span></button>
              <h4 class="modal-title" id="myModalLabel" style="font-size: 9pt;"><i class="fa fa-warning"></i> 경고</h4>
          		</div>
          <div style="margin-top: 1px; background-color: #a94442; height: 1px; width: 100%;"></div>
          <div class="modal-body">
              <div class="row">

                  <div class="col-xs-12">
                      <div class="alert alert-danger" role="alert" style="text-align: center;"><i class="fa fa-warning"></i> 취소 시 입력했던 내용이 전부 삭제됩니다.</div>
                      
                <div class="modal-footer">
                    <button type="button" class="btn btn-default pull-right" data-dismiss="modal">취소</button>
                    <a class="btn btn-default" href="../" >확인</a>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    </div>
    </div>
    </div>
     <!-- Modal -->
	
</body>

</html>