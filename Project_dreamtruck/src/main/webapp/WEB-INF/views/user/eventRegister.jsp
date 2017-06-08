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
    
    <img alt="" src="/resources/images/home/joinus.png" style="margin-left: 590px; height: 100px;">
    <br>
	<form class="form-horizontal" method="post" role="form">
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
					<div class="col-md-4">
						<input id="pw" name="pw" type="password" placeholder="비밀번호를 입력 해 주세요." class="form-control input-md" required>
					</div>
				</div>

				<!-- 비밀번호 확인 -->
				<div class="form-group">
					<label class="col-md-4 control-label">비밀번호 확인</label>
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
						<input id="eventEmail" name="eventEmail" type="email" placeholder="이메일을 입력 해 주세요." class="form-control input-md" required>
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
                      <div style="text-align: center; font-size: 10pt; margin: 16px;"><span style="color: #2e77bc;"><i class="fa fa-info-circle"></i></span> Undiscovered assets are assets that were recorded against a DRH customer but were not discoverable when a site audit was carried out.</div>
                      <div class="well">
                            <div style="color: #acacac; font-size: 9pt; text-align: center; padding: 0px; margin-bottom: 6px;">You are required to complete the following actions:</div>
                              <ul class="list-unstyled" style="line-height: 2">
                                  <li><span class="text-success"><i class="fa fa-check-square"></i></span> <span style="color: #acacac; font-size: 11pt; text-align: left;">1</span> <span style="font-size: 11pt; text-align: left;">Connect the affected workstation to the power & network</span></li>
                                  <li><span class="text-success"><i class="fa fa-check-square"></i></span> <span style="color: #acacac; font-size: 11pt; text-align: left;">2</span> <span style="font-size: 11pt; text-align: left;">Login to the workstation with using your admin account</span></li>
                                  <li><span class="text-success"><i class="fa fa-check-square"></i></span> <span style="color: #acacac; font-size: 11pt; text-align: left;">3</span> <span style="font-size: 11pt; text-align: left;">Check the local <b>C:\Documents and Settings</b> for the DRH customers profile</span></li>
                                  <li><span class="text-success"><i class="fa fa-check-square"></i></span> <span style="color: #acacac; font-size: 11pt; text-align: left;">4</span> <span style="font-size: 11pt; text-align: left;">Contact the DRH SME (NAME HERE)</span></li>
                              </ul>
                      </div>
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