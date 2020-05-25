<%--
  /**
  * Class Name : 
  * Description : 
  * Modification Information
  *
  *   수정일                   수정자                      수정내용
  *  -------    --------    ---------------------------
  *  2020. 3. 18.            최초 생성
  *
  * author 실행환경 개발팀
  * since 2009.01.06
  *
  * Copyright (C) 2020 by SOMAC  All right reserved.
  */
--%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<!-- header start  -->
    <div class="header-content clearfix">
         <div class="nav-control">
             <div class="hamburger">
                 <span class="toggle-icon"><i class="icon-menu"></i></span>
             </div>
         </div>
         <div class="header-left">
             
         </div>
         <div class="header-right">
             <ul class="clearfix">
                 <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                         <i class="mdi mdi-email-outline"></i>
                         <span class="badge gradient-1 badge-pill badge-primary">3</span>
                     </a>
                     <div class="drop-down animated fadeIn dropdown-menu">
                         <div class="dropdown-content-heading d-flex justify-content-between">
                             <span class="">3 New Messages</span>  
                             
                         </div>
                         <div class="dropdown-content-body">
                             <ul>
                                 <li class="notification-unread">
                                     <a href="javascript:void()">
                                         <img class="float-left mr-3 avatar-img" src="${hContext}/views/images/avatar/1.jpg" alt="">
                                         <div class="notification-content">
                                             <div class="notification-heading">Saiful Islam</div>
                                             <div class="notification-timestamp">08 Hours ago</div>
                                             <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                         </div>
                                     </a>
                                 </li>
                                 <li class="notification-unread">
                                     <a href="javascript:void()">
                                         <img class="float-left mr-3 avatar-img" src="${hContext}/views/images/avatar/2.jpg" alt="">
                                         <div class="notification-content">
                                             <div class="notification-heading">Adam Smith</div>
                                             <div class="notification-timestamp">08 Hours ago</div>
                                             <div class="notification-text">Can you do me a favour?</div>
                                         </div>
                                     </a>
                                 </li>
                                 <li>
                                     <a href="javascript:void()">
                                         <img class="float-left mr-3 avatar-img" src="${hContext}/views/images/avatar/3.jpg" alt="">
                                         <div class="notification-content">
                                             <div class="notification-heading">Barak Obama</div>
                                             <div class="notification-timestamp">08 Hours ago</div>
                                             <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                         </div>
                                     </a>
                                 </li>
                                 <li>
                                     <a href="javascript:void()">
                                         <img class="float-left mr-3 avatar-img" src="${hContext}/views/images/avatar/4.jpg" alt="">
                                         <div class="notification-content">
                                             <div class="notification-heading">Hilari Clinton</div>
                                             <div class="notification-timestamp">08 Hours ago</div>
                                             <div class="notification-text">Hello</div>
                                         </div>
                                     </a>
                                 </li>
                             </ul>
                             
                         </div>
                     </div>
                 </li>
                 <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                         <i class="mdi mdi-bell-outline"></i>
                         <span class="badge badge-pill gradient-2 badge-primary">3</span>
                     </a>
                     <div class="drop-down animated fadeIn dropdown-menu dropdown-notfication">
                         <div class="dropdown-content-heading d-flex justify-content-between">
                             <span class="">2 New Notifications</span>  
                             
                         </div>
                         <div class="dropdown-content-body">
                             <ul>
                                 <li>
                                     <a href="javascript:void()">
                                         <span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>
                                         <div class="notification-content">
                                             <h6 class="notification-heading">Events near you</h6>
                                             <span class="notification-text">Within next 5 days</span> 
                                         </div>
                                     </a>
                                 </li>
                                 <li>
                                     <a href="javascript:void()">
                                         <span class="mr-3 avatar-icon bg-danger-lighten-2"><i class="icon-present"></i></span>
                                         <div class="notification-content">
                                             <h6 class="notification-heading">Event Started</h6>
                                             <span class="notification-text">One hour ago</span> 
                                         </div>
                                     </a>
                                 </li>
                                 <li>
                                     <a href="javascript:void()">
                                         <span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>
                                         <div class="notification-content">
                                             <h6 class="notification-heading">Event Ended Successfully</h6>
                                             <span class="notification-text">One hour ago</span>
                                         </div>
                                     </a>
                                 </li>
                                 <li>
                                     <a href="javascript:void()">
                                         <span class="mr-3 avatar-icon bg-danger-lighten-2"><i class="icon-present"></i></span>
                                         <div class="notification-content">
                                             <h6 class="notification-heading">Events to Join</h6>
                                             <span class="notification-text">After two days</span> 
                                         </div>
                                     </a>
                                 </li>
                             </ul>
                             
                         </div>
                     </div>
                 </li>
                 <li class="icons dropdown d-none d-md-flex">
       
       
                 </li>
                 <li class="icons dropdown">
                     <div class="user-img c-pointer position-relative"   data-toggle="dropdown">
                         <span class="activity active"></span>
                         <img src="${hContext}/views/images/user/1.png" height="40" width="40" alt="">
                     </div>
                     <div class="drop-down dropdown-profile   dropdown-menu">
                         <div class="dropdown-content-body">
                             <ul>
                                 <li>
                                     <a href="${hContext}/views/app-profile.html"><i class="icon-user"></i> <span>Profile</span></a>
                                 </li>
                                 <li>
                                     <a href="${hContext}/views/email-inbox.html"><i class="icon-envelope-open"></i> <span>Inbox</span> <div class="badge gradient-3 badge-pill badge-primary">3</div></a>
                                 </li>
                                 
                                 <hr class="my-2">
                                 <li>
                                     <a href="${hContext}/views/page-lock.html"><i class="icon-lock"></i> <span>Lock Screen</span></a>
                                 </li>
                                 <li><a href="${hContext}/views/page-login.html"><i class="icon-key"></i> <span>Logout</span></a></li>
                             </ul>
                         </div>
                     </div>
                 </li>
                 
                 
                 <!-- 해더 아이콘 -->
             	 <li class="icons"><a href="${hContext}/member/login.jsp" >
          				<button class="btn mb-3 btn-outline-primary" type="button">로그아웃</button>
          			</a>
                 </li>
             </ul>
         </div>
     </div>
            
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
	
	<style type="text/css">
		h4 {
			font-family: 'Noto Sans KR', sans-serif;
		}
		
		a {
			font-family: 'Noto Sans KR', sans-serif;
		}
	</style>
	<!--/ header end  -->