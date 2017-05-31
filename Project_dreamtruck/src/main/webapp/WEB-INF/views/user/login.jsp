<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<link href="../resources/css/font-awesome.min.css" rel="stylesheet">
<link href="../resources/css/animate.min.css" rel="stylesheet"> 
<link href="../resources/css/lightbox.css" rel="stylesheet"> 
<link href="../resources/css/main.css" rel="stylesheet">
<link href="../resources/css/responsive.css" rel="stylesheet">
</head>

<body>
<%@include file="../include/header.jsp"%>
<section id="page-breadcrumb">
        <div class="vertical-center sun">
             <div class="container">
                <div class="row">
                    <div class="action">
                        <div class="col-sm-12">
                            <h1 class="title">로그인</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   		</section>
	<div class="container">
	<div class="row">
	 <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		<form role="form">
			<fieldset>
				<br>
				<br>
				<hr class="colorgraph">
				<div class="form-group">
                    <input type="text" id="name" class="form-control" placeholder="아이디를 입력해 주세요.">
				</div>
				<div class="form-group">
                    <input type="password" id="paw" class="form-control" placeholder="비밀번호를 입력해 주세요.">
				</div>
				<span class="button-checkbox">
					<button type="button" class="btn" data-color="info">아이디 저장</button>
                    <input type="checkbox" name="remember_me" id="remember_me" checked="checked" class="hidden">
					<a href="find" class="btn btn-link pull-right">아이디  & 비밀번호를 잊어 버리셨습니까?</a>
				</span>
				<hr class="colorgraph">
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-6">
                        <input type="submit" class="btn btn-lg btn-success btn-block" value="로그인">
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6">
						<a href="registertype" class="btn btn-lg btn-primary btn-block">회원가입</a>
					</div>
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
<script type="text/javascript" src="../resources/js/jquery.js"></script>
		<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="../resources/js/lightbox.min.js"></script>
		<script type="text/javascript" src="../resources/js/wow.min.js"></script>
		<script type="text/javascript" src="../resources/js/main.js"></script>  
		<script type="text/javascript">
		$(function(){
		    $('.button-checkbox').each(function(){
				var $widget = $(this),
					$button = $widget.find('button'),
					$checkbox = $widget.find('input:checkbox'),
					color = $button.data('color'),
					settings = {
							on: {
								icon: 'glyphicon glyphicon-check'
							},
							off: {
								icon: 'glyphicon glyphicon-unchecked'
							}
					};

				$button.on('click', function () {
					$checkbox.prop('checked', !$checkbox.is(':checked'));
					$checkbox.triggerHandler('change');
					updateDisplay();
				});

				$checkbox.on('change', function () {
					updateDisplay();
				});

				function updateDisplay() {
					var isChecked = $checkbox.is(':checked');
					// Set the button's state
					$button.data('state', (isChecked) ? "on" : "off");

					// Set the button's icon
					$button.find('.state-icon')
						.removeClass()
						.addClass('state-icon ' + settings[$button.data('state')].icon);

					// Update the button's color
					if (isChecked) {
						$button
							.removeClass('btn-default')
							.addClass('btn-' + color + ' active');
					}
					else
					{
						$button
							.removeClass('btn-' + color + ' active')
							.addClass('btn-default');
					}
				}
				function init() {
					updateDisplay();
					// Inject the icon if applicable
					if ($button.find('.state-icon').length == 0) {
						$button.prepend('<i class="state-icon ' + settings[$button.data('state')].icon + '"></i> ');
					}
				}
				init();
			});
		});
</script>
</html>