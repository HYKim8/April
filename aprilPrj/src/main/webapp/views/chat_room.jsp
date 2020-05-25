<%--
/**
  * Class Name : chat_room
  * Description : 임의 채팅방 
  * http://localhost:8080/groupware/chat/chat.do
  * Modification Information
  *
  *   수정일                   수정자                      수정내용
  *  -------    --------    ---------------------------
  *  2020.5.7.           	 최초 생성
  *
  * 
  *
  * Copyright (C) 2009 by KandJang  All right reserved.
  */
--%>
<%@page import="com.april.groupware.member.service.UserVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<%@ page session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
</head>
<body>

	<div class="container-fluid">
		<div class="card">
			<div class="card-body">
			    <fieldset>
			        <textarea id="messageBox" rows="40" cols="50" readonly="true"></textarea>
			        <br/>
			        <input id="inputMessage" type="text"/>
			        <input class="btn btn-primary" type="submit" value="send" onclick="send()" />
			        <input type="hidden" id="userName" value="${user.name }">
			    </fieldset>
    		</div>
    	</div>
    </div>
</body>

    <script type="text/javascript">
        var textarea = document.getElementById("messageBox");
        var webSocket = new WebSocket('ws://localhost:8080/groupware/broadcasting.do');
        var inputMessage = document.getElementById('inputMessage');
        /* var userName = document.getElementById('userName').value;
        console.log("userName" + userName); */
    webSocket.onopen = function(event) {
      onOpen(event)
    };
    webSocket.onmessage = function(event) {
      onMessage(event)
    };
    function onMessage(event) {
        textarea.value += "상대 : " + event.data + "\n";
    }
    function onOpen(event) {
        //textarea.value += userName+" 님이 대화에 참여하셨습니다 \n";
    	textarea.value += "${user.name}님이 대화에 참여하셨습니다 \n";
    }

    webSocket.onerror = function(event) {
        onError(event)
      };
    function onError(event) {
      alert("서버 접속에 문제가 있습니다"+ "( problem: " + event.data + " )");
    }
    function send() {
        textarea.value += "나 : " + inputMessage.value + "\n";
        webSocket.send(inputMessage.value);
        inputMessage.value = "";
    }
  </script>