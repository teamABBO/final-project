<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/references.jsp"%>
<script type="text/javascript">
	$(document).ready( function(){
		var reg_pw = /^.*(?=.{6,16})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
		var reg_phone = $("#phone").val();
		var reg_name = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
		
	
		//비밀번호 유효성검사(영문숫자 조합 8~16자 내외)
		   $("#pw").keyup(function() {
		      var pw = $(this).val();
		      if(pw.length <= 6 ) {
		         $("#pwLabel").text("6~15자리 영문숫자조합").css("color","red");
		      }else if (reg_pw.test($("#pw").val()) &&  pw.length > 6 && pw.length <= 15){
		         $("#pwLabel").text("사용가능").css("color","green");
		      }
		   });
		   $("#repw").keyup(function() {
			  var repw = $(this).val();
		      if(repw.length <= 6){
		    	  $("#repwLabel").text("6~15자리 영문숫자조합").css("color","red")
		      }else if($("#repw").val() != $("#pw").val()){
		         $("#repwLabel").text("비밀번호가 다릅니다").css("color","red")
		      }else if($("#repw").val() == $("#pw").val() && reg_pw.test($("#repw").val())){
		         $("#repwLabel").text("사용가능").css("color","green");
		      }
		   });
		   
		 	//이름 유효성검사(한글,영문만 사용가능 2~25자 내외)
		   $("#name").keyup(function() {
		      var name = $(this).val();
		      if(name == ""){
		    	  $("#nameLabel").text("").css("color","red");
		      }else if(!reg_name.test(name)){
		         $("#nameLabel").text("올바르게 입력해주십시오").css("color","red");
		      } else {
		         $("#nameLabel").text("완료").css("color","green");
		      }
		   });
	});
</script>
<script type="text/javascript">
function isMember() {
	
	      var id = $('#id').val();
	      if(id == ""){
	    	  swal("중복체크","아이디를 입력 해 주세요.","warning")
	      }else{
	    	 
	         $.ajax({
	         async : true,
	         type : "post",
	         url : "isMember",
	         dataType : "text",
	         data: {
	           "id" : id
	            },  
	            success : function(data) {
		        	if(data == "fail"){
		        		swal("중복체크","가입 가능한 아이디 입니다.", "success")
		        		$("#checkid").val("확인");
		        	}else{
		           		swal("중복체크","이미 가입된 아이디 입니다.", "error")
		           		$("#checkid").val("취소");
		        	}
		         }
	      });
	      }
	   }
</script>
</head>
<body>
<%@include file="../include/header.jsp"%>
	
    
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
              <h1 class="title">회원가입</h1>
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
    
    <input type="hidden" id="checkid" value="확인 해 주세요.">
    <img alt="" src="/resources/images/home/joinus.png" style="margin-left: 590px; height: 100px;">
    <br>
	<form class="form-horizontal" method="post" role="form" onsubmit="return Check();">
			<fieldset>
				<!-- 아이디 -->
				<div class="form-group">
				<br><br>
					<label class="col-md-4 control-label" for="name">아이디</label>
					<button type="button" class="btn btn-common" onclick="isMember();">중복확인</button>
					<div class="col-md-4">
						<input id="id" name="id" type="text" placeholder="아이디를 입력 해 주세요." class="form-control input-md" required>
					</div>
				</div>

				<!-- 비밀번호 -->
				<div class="form-group">
					<label class="col-md-4 control-label">비밀번호</label>
					<label id="pwLabel"></label>
					<div class="col-md-4">
						<input id="pw" name="pw" type="password" placeholder="비밀번호를 입력 해 주세요." class="form-control input-md" required>
					</div>
				</div>

				<!-- 비밀번호 확인 -->
				<div class="form-group">
					<label class="col-md-4 control-label">비밀번호 확인</label>
					<label id="repwLabel"></label>
					<div class="col-md-4">
						<input id="repw" name="repw" type="password" placeholder="비밀번호를 다시 입력 해 주세요." class="form-control input-md" required>
					</div>
				</div>
			
			
				<!-- 전화번호 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="password">전화번호 </label>
					<div class="col-md-4">
						<input id="phone" name="phone"  type="text" placeholder="전화번호를 입력 해 주세요. " class="form-control input-md" required>
					</div>
				</div>
				
				<!-- 이름 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="rpassword">이름</label>
					<label id="nameLabel"></label>
					<div class="col-md-4">
						<input id="name" name="name" type="text" placeholder="이름을 입력 해 주세요." class="form-control input-md" required>
					</div>
				</div>
				
				<!-- 관심 지역 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="selectgu">관심 지역</label>
					<div class="col-md-4">

						<select id="likeArea" name="likeArea" class="form-control">
							<option value="">선택 해 주세요.</option>
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
						<input id="email" name="email" type="email" placeholder="이메일을 입력 해 주세요." class="form-control input-md" required>
					</div>
				</div>
					
				<!-- 담당부서명 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="contactname">담당부서명</label>
					<div class="col-md-4">
						<input id="eventDep" name="eventDep" type="text" placeholder="담당부서명을 입력 해 주세요." class="form-control input-md" required>
					</div>
				</div>
				<!-- 버튼 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="save"></label>
					<div class="col-md-8">
						<button type="submit" id="save" name="save" class="btn btn-common">가입</button>
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
				   var check = $("#checkid").val();
				   
					if(likearea == "" ){
						swal("회원 가입 중 에러", "관심 지역을 설정 해 주세요!", "error")
						return false;
					} 
					if(pw != repw || pw.length <= 6 || !reg_pw.test(pw)){
						swal("회원 가입 중 에러", "비밀 번호를 확인 해 주세요!", "error")
						return false;
					}
					
					if(check == "취소" || check == "확인 해 주세요."){
						swal("회원 가입 중 에러", "아이디 중복 확인 해 주세요!", "error")
						return false;
					}
			}
			
			</script>
			
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
    <!-- Modal -->
    </div>
    </div>
    </div>
    
	
</body>


</html>