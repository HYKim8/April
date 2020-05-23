<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="resources/sockjs.min.js"></script>
	

</head>
<body>


	<form id="chatForm">
		<input type="text" id="message" />
		<input type="submit" class="btn btn-primary px-3 ml-4" value="send" />
		
		<!-- <button class="btn btn-primary px-3 ml-4">send</button>-->
	</form>
	
		<div class="container-fluid">
	    <div class="row">
	    <div class="col">
	    <div class="card">
		<div class="card-body">
		<div class="read-content">
		<div class="media-body">
			<div id="chat" ></div>
		</div>
		</div>
		</div>
		</div>
		</div>
		</div>
		</div>
	
	
	
	<script>
		$(document).ready(function(){
			$("#chatForm").submit(function(event){
				event.preventDefault();
				sock.send($("#message").val());
				$("#message").val('').focus();
			});
		});
		
		var sock = new SockJS("/echo");
		sock.onmessage = function(e){
			$("#chat").append(e.data + "<br/>");
		}
		
		sock.onclose = function(){
			$("#chat").append("연결 종료");
		}
		
	</script>
</body>
</html>