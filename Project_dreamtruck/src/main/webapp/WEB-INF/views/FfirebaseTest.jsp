<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page language="java"   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script src="https://www.gstatic.com/firebasejs/3.6.2/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/3.6.2/firebase-auth.js"></script>
<script src="https://www.gstatic.com/firebasejs/3.6.2/firebase-database.js"></script>
<script src="https://www.gstatic.com/firebasejs/3.6.2/firebase-messaging.js"></script>
<script src="https://www.gstatic.com/firebasejs/3.6.2/firebase.js"></script>


  <script>
	 
  $(document).ready(function() {
	  $(".sendButton").on("click", function() {
		  
		  
		  
	           $.ajax({
	        	  url : 'https://fcm.googleapis.com/fcm/send',
	        	  type: "post",
	              headers : {
	                 'Content-Type' : 'application/json',
	                 'Authorization' : 'key=AAAAhlGBbq0:APA91bFr0dGj6GP3thL0zkKtpuCZEnj2jZ5YzypbSDI3iAH6FD-J9Q0KnE6jFKMsIEqVRPowSfM-JkvVEj8lhWGgHyThn5GU-sl5tMMd3Yhlo_X7H_MS8q1TjIo4NwHxmTKRDsF3I477'
	              },
	              data : JSON.stringify({
	            	   "notification": {
	            		    "title": "Dream Truck",
	            		    "body": "새로운 행사가 등록되었습니다!"
	            		  },
	                 "to" : "cj4CNWrg5yg:APA91bGyScw4dpOzAEbJxvy8IBnqEP_pAUXEHGy1P_qdcDt5bHPREQGIf5tSlIrOTVEiWbQ0jdkjoUO4KSOIwldCn3sgh6M6pXgoU401YvLemdOA-DGOiK01OmpkqVwcc006bLN-_p0Z",
	                 
	                 
	              }),
	           success: function(error, response, body) {
	              if (error) {
	                 console.error(error, response, body);
	              } else if (response.statusCode >= 400) {
	                 console.error('HTTP Error: ' + response.statusCode + ' - '
	                       + response.statusMessage + '\n' + body);
	              } else {
	                 console.log('JSON 메세지 전송 성공!')
	              }
	           }
    		});
  });
	  
  });
</script>



</head>
<body>

<h2>파이어베이스 데이터보내기</h2>
<form class="sendButton">
  <input type="button" id="sendButton" name="sendButton">
</form>

</body>
</html>