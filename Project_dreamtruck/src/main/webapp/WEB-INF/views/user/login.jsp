<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/references.jsp"%> 
<script >
var result = '${msg}';
var modify = '${modify}';

if (result == 'success') {
	swal("탈퇴!", "정상적으로 탈퇴되었습니다.", "success");
}else if (modify == 'modify'){
	swal("로그인 필요!","회원정보가 수정되었습니다. 다시 로그인 해 주세요.", "warning");
}
</script>
		
		
<style type="text/css">
.box-radius {
   width : 550px;
   padding: 10px;
   border: 1px solid #cc0000;
   border-radius: 30px;
   -moz-border-radius: 30px;
   -webkit-border-radius: 30px;
   -o-border-radius: 30px;
}

.box-radius2 {
   width : 200px;
   height : 50px;
   padding: 15px;
   border: 1px solid ;
   border-radius: 30px;
   margin-left : 60px;
   -moz-border-radius: 30px;
   -webkit-border-radius: 30px;
   -o-border-radius: 30px;
}

</style>
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
              <h1 class="title">로그인</h1>
                            <p>Login</p>
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
    
    <!-- 본문 -->
    <br>
    <img alt="" src="/resources/images/home/welcome.png" style="margin-left: 590px; height: 100px;">
    <br>
	<div class="container">
	<div class="row">
	 <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
	 
		<form action="loginPost" method="post" onsubmit="return check();">
			<fieldset>
				<br>
				<br>
			
				<div class="form-group">
                    <input type="text" id="id" name="id" class="box-radius" placeholder="아이디를 입력해 주세요.">
				</div>
				<div class="form-group">
                    <input type="password" id="pw" name="pw" class="box-radius" placeholder="비밀번호를 입력해 주세요.">
				</div>
				<span class="button-checkbox">
					<!-- <button type="button" class="btn" data-color="info">아이디 저장</button> -->
                    <input type="checkbox" name="useCookie" id="useCookie" checked="checked" class="hidden">
					<!-- <a href="find" class="btn btn-link pull-right">아이디  & 비밀번호를 잊어 버리셨습니까?</a> -->
					
				</span>
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-6">
                        <!-- <input type="submit" class="btn btn-lg btn-success btn-block" value="로그인"> -->
					</div>
					
				<!-- 유효성 검사 -->
				<script type="text/javascript">
				function check(){
					if($.trim($("#id").val())==""){
						swal("오류!", "아이디를 입력하세요!", "warning");
						$("#id").val("").focus();
						return false;
					}
					
					if($.trim($("#pw").val())==""){
						alert("오류!", "비밀번호를 입력하세요!", "warning");
						$("#pw").val("").focus();
						return false;
					}
				};
				</script>	
				
					<div class="col-xs-6 col-sm-6 col-md-6">
						<input type="submit" class="btn btn-lg btn-common box-radius2" value="로그인">
						
						<!-- <a href="registertype" class="btn btn-lg btn-primary btn-block">회원가입</a> -->
					</div>
					<br><br><br>
					<a href="find" class="btn btn-link" style="margin-left: 50px;">아이디  & 비밀번호를 잊어 버리셨습니까?</a>
					<a href="registertype" class="btn btn-link" style="margin-left: 100px; color: #fd9483;">회원가입</a>
				</div>
				</fieldset>
			</form>
		</div>
	</div>		
</div>
<br>
<br><br>
<%@include file="../include/footer.jsp"%>

</body>

</html>