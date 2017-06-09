<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>드림트럭</title>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/font-awesome.min.css" rel="stylesheet">
<link href="/resources/css/animate.min.css" rel="stylesheet">
<link href="/resources/css/lightbox.css" rel="stylesheet">
<link href="/resources/css/main.css" rel="stylesheet">
<link href="/resources/css/responsive.css" rel="stylesheet">
<link rel="shortcut icon" href="/resources/images/ico/favicon.ico">
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/lightbox.min.js"></script>
<script type="text/javascript" src="/resources/js/wow.min.js"></script>
<script type="text/javascript" src="/resources/js/main.js"></script>
<script type="text/javascript">
	$(document).ready( function() {
		
			var reg_pw = /^.*(?=.{6,16})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
			var reg_phone = $("#phone").val();
			var reg_name = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
			
			//비밀번호 유효성검사(영문숫자 조합 8~16자 내외)
			   $("#pw").keyup(function() {
			      var pw = $(this).val();
			      if(pw.length <= 6 ) {
			         $("#pwLabel").text("6~15자리 영문숫자조합").css("color","red");
			      }else if (reg_pw.test($("#pw").val()) &&  pw.length >= 6 && pw.length <= 15){
			         $("#pwLabel").text("사용가능").css("color","green");
			      }
			   })
			   $("#repw").keyup(function() {
				  var repw = $(this).val();
			      if(repw.length <= 6){
			    	  $("#repwLabel").text("6~15자리 영문숫자조합").css("color","red")
			      }else if($("#repw").val() != $("#pw").val()){
			         $("#repwLabel").text("비밀번호가 다릅니다").css("color","red")
			      }else if($("#repw").val() == $("#pw").val() && reg_pw.test($("#repw").val())){
			         $("#repwLabel").text("사용가능").css("color","green");
			      }
			   })
				
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
									alert(log);
							}

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
    
    <img alt="" src="/resources/images/home/joinus.png" style="margin-left: 590px; height: 100px;">
    <br>
	<form class="form-horizontal" id="form1" enctype="multipart/form-data" method="post" role="form">
			<fieldset>
				 <!-- 아이디 -->
				<div class="form-group">
				<br><br>
					<label class="col-md-4 control-label" for="name">아이디</label>
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
					<label class="col-md-4 control-label" >비밀번호 확인</label>
					<label id="repwLabel"></label>
					<div class="col-md-4">
						<input id="repw" name="repw" type="password" placeholder="비밀번호를 다시 입력 해 주세요." class="form-control input-md" required>
					</div>
				</div>
			
			
				<!-- 전화번호 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="password">전화번호 </label>
					<div class="col-md-4">
						<input id="phone" name="phone" type="text" placeholder="전화번호를 입력 해 주세요. " class="form-control input-md" required>
					</div>
				</div>
				
				<!-- 이름 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="rpassword">이름</label>
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
				
				<!-- 영업 지역 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="selectgu">영업 지역</label>
					<div class="col-md-4">

						<select id="truckArea" name="truckArea" class="form-control">
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
					
				<!-- 사업자번호 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="address1">사업자번호</label>
					<div class="col-md-4">
						<input id="sid" name="sid" type="text" placeholder="사업자번호를 입력 해 주세요. " class="form-control input-md" required>

					</div>
				</div>

				<!-- 차량번호 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="address1">차량번호</label>
					<div class="col-md-4">
						<input id="truckNum" name="truckNum" type="text" placeholder="차량번호를 입력 해 주세요." class="form-control input-md">
					</div>
				</div>

				<!-- 트럭상호명 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="city">트럭상호명</label>
					<div class="col-md-4">
						<input id="truckName" name="truckName" type="text" placeholder="트럭상호명을 입력 해 주세요." class="form-control input-md" required>

					</div>
				</div>
				
				<!-- 이메일 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="email">이메일</label>
					<div class="col-md-4">
						<input id="email" name="email" type="email" placeholder="이메일을 입력 해 주세요." class="form-control input-md" required>
					</div>
				</div>
				
				<!-- 음식 종류 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="selectgu">음식 종류</label>
					<div class="col-md-4">

						<select id="truckFood" name="truckFood" class="form-control">
							<option value="">선택 해 주세요.</option>
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
				
				<!-- 트럭 이미지 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="contactphone">트럭 이미지 </label>
					<div class="col-md-4">
						<div class="form-group">
							<div class="col-md-5">
								<div class="form-group">
									<div class="input-group">
										<span class="input-group-btn"> 
										<span class="btn btn-default btn-file" style="margin-left: 15px;">업로드
									    <input type="file" name="file" id="imgInp">
										</span>
										</span> <input type="text" class="form-control" readonly style="margin-left: 20px;" id="truckImg" name="truckImg">
									</div>
									<img id='img-upload' style="margin-left: 20px; margin-top: 10px;" />
								</div>
							</div>
						</div>
					</div>
				</div>
				
				

				<!-- 내용 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="info">내용</label>
					<div class="col-md-5">
						<textarea rows="8" cols="84" id="truckInfo" name="truckInfo" style="resize: none;" class="form-control"></textarea>
					</div>
				</div>

				<!-- 버튼 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="save"></label>
					<div class="col-md-8">
						<button type="submit" id="save" name="save" class="btn btn-success">가입</button>
						<a class="btn btn-primary" href="#primary" data-toggle="modal">취소</a>
					</div>
				</div>
			</fieldset>
			</form>
	
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
            </div><!-- modal-content -->
        </div><!-- modal-dialog -->
    </div><!-- modal -->   
    </div>
    </div>
    </div>
    
	
</body>

</html>