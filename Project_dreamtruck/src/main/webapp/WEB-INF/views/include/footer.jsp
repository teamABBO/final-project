<%@ page contentType="text/html; charset=utf-8"%>
<footer id="footer">
  <div class="container">
    <div class="row">
      <div class="col-sm-12">
        <div class="copyright-text text-center">
          <p>&copy; Dream Truck 2017. All Rights Reserved.</p>
          <p>
            Designed by <a target="_blank" href="#">Dongwon</a>
          </p>
          <br>
          <br>
          <br>
          <br>
        </div>
      </div>
    </div>
  </div>
</footer>
<style type="text/css">
a.top {
	background:none;
    position:fixed; 
    bottom:10px; 
    right:20px; 
    cursor:pointer; 
    text-decoration:none; 
    border-radius:5px; 
    -moz-border-radius:5px; 
    -webkit-border-radius:5px; 
    padding:5px
}
div.a {
        border: 1px solid #fc6b52;
}
</style>
<script>
$(document).ready(function() {
	$(window).scroll(function() {
		if ($(this).scrollTop() > 500) {
			$(".top").fadeIn();
		} else {
			$(".top").fadeOut();
		}
	});
	$(".top").click(function() {
		$("html, body").animate({
			scrollTop : 0
		}, 400);
		return false;
	});
});
</script>
<div>
<a href="#" class="top pull-right"><i class="glyphicon glyphicon-arrow-up" style="font-size: 17px; color: grey"></i></a>
</div>