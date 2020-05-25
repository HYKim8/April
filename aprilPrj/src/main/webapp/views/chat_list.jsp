<%--
/**
  * Class Name : 
  * Description :  
  * Modification Information
  *
  *   수정일                   수정자                      수정내용
  *  -------    --------    ---------------------------
  *  2020.5.7.           	 최초 생성
  *
  * http://localhost:8080/groupware/chat/do_retrieve.do?pageNum=1&pageSize=10&searchDiv=&searchWord= 
  *
  * Copyright (C) 2009 by KandJang  All right reserved.
  */
--%>
<%@page import="com.april.groupware.cmn.StringUtil"%>
<%@page import="com.april.groupware.cmn.SearchVO"%>
<%@page import="com.april.groupware.chat.service.ChatVO"%>
<%@page import="com.april.groupware.code.service.CodeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/views/common/common.jsp"%>
<%
	//페이지 사이즈
String pageSize = "10";
//페이지 num
String pageNum = "1";
//검색구분
String searchDiv = "";
//검색어
String searchWord = "";

SearchVO search = (SearchVO) request.getAttribute("vo");
if (null != search) {
	pageSize = String.valueOf(search.getPageSize());
	pageNum = String.valueOf(search.getPageNum());
	searchDiv = search.getSearchDiv();
	searchWord = search.getSearchWord();
}

List<CodeVO> searchList = (List<CodeVO>) request.getAttribute("searchList");
//out.print("searchList:"+searchList);
for (CodeVO vo : searchList) {
	//out.print(vo.toString()+"<br/>");
}

//pageSizeList
List<CodeVO> pageSizeList = (List<CodeVO>) request.getAttribute("pageSizeList");
//out.print("pageSizeList:"+pageSizeList);
for (CodeVO vo : pageSizeList) {
	//out.print(vo.toString()+"<br/>");
}

int totalCnt = 0;

totalCnt = (Integer) request.getAttribute("totalCnt");
//out.print("totalCnt:"+totalCnt);

//paging
String url = H_PATH + "/chat/do_retrieve.do";
String scriptName = "doSeachPage";
int maxNum = 0;//총글수
int currPageNo = 1;//현재페이지 
int rowPerPage = 10;
int bottomCount = 5;//바닫에 page

if (null != search) {
	currPageNo = search.getPageNum();
	rowPerPage = search.getPageSize();
	maxNum = totalCnt;
}
//--paging
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Quixlab - Bootstrap Admin Dashboard Template by Themefisher.com</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="${hContext}/views/images/favicon.png">
<!-- Custom Stylesheet -->
<link href="${hContext}/views/css/style.css" rel="stylesheet">

</head>

<body>

	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none"
					stroke-width="3" stroke-miterlimit="10" />
            </svg>
		</div>
	</div>
	<!--*******************
        Preloader end
    ********************-->


	<!--**********************************
        Main wrapper start
    ***********************************-->
	<div id="main-wrapper">

		<!--**********************************
            Nav header start
        ***********************************-->
		<div class="nav-header">
			<div class="brand-logo">
				<a href="${hContext}/views/index.html"> <b class="logo-abbr"><img
						src="${hContext}/views/images/logo.png" alt=""> </b> <span
					class="logo-compact"><img
						src="${hContext}/views/images/logo-compact.png" alt=""></span> <span
					class="brand-title"> <img
						src="${hContext}/views/images/logo-text.png" alt="">
				</span>
				</a>
			</div>
		</div>
		<!--**********************************
            Nav header end
        ***********************************-->

		<!--**********************************
            Header start
        ***********************************-->
		<div class="header">
			<div class="header-content clearfix">

				<div class="nav-control">
					<div class="hamburger">
						<span class="toggle-icon"><i class="icon-menu"></i></span>
					</div>
				</div>
				<div class="header-left">
					<div class="input-group icons">
						<div class="input-group-prepend">
							<span
								class="input-group-text bg-transparent border-0 pr-2 pr-sm-3"
								id="basic-addon1"><i class="mdi mdi-magnify"></i></span>
						</div>
						<input type="search" class="form-control"
							placeholder="Search Dashboard" aria-label="Search Dashboard">
						<div class="drop-down   d-md-none">
							<form action="#">
								<input type="text" class="form-control" placeholder="Search">
							</form>
						</div>
					</div>
				</div>
				<div class="header-right">
					<ul class="clearfix">
						<li class="icons dropdown"><a href="javascript:void(0)"
							data-toggle="dropdown"> <i class="mdi mdi-email-outline"></i>
								<span class="badge gradient-1 badge-pill badge-primary">3</span>
						</a>
							<div class="drop-down animated fadeIn dropdown-menu">
								<div
									class="dropdown-content-heading d-flex justify-content-between">
									<span class="">3 New Messages</span>

								</div>
								<div class="dropdown-content-body">
									<ul>
										<li class="notification-unread"><a
											href="javascript:void()"> <img
												class="float-left mr-3 avatar-img"
												src="${hContext}/views/images/avatar/1.jpg" alt="">
												<div class="notification-content">
													<div class="notification-heading">Saiful Islam</div>
													<div class="notification-timestamp">08 Hours ago</div>
													<div class="notification-text">Hi Teddy, Just wanted
														to let you ...</div>
												</div>
										</a></li>
										<li class="notification-unread"><a
											href="javascript:void()"> <img
												class="float-left mr-3 avatar-img"
												src="${hContext}/views/images/avatar/2.jpg" alt="">
												<div class="notification-content">
													<div class="notification-heading">Adam Smith</div>
													<div class="notification-timestamp">08 Hours ago</div>
													<div class="notification-text">Can you do me a
														favour?</div>
												</div>
										</a></li>
										<li><a href="javascript:void()"> <img
												class="float-left mr-3 avatar-img"
												src="${hContext}/views/images/avatar/3.jpg" alt="">
												<div class="notification-content">
													<div class="notification-heading">Barak Obama</div>
													<div class="notification-timestamp">08 Hours ago</div>
													<div class="notification-text">Hi Teddy, Just wanted
														to let you ...</div>
												</div>
										</a></li>
										<li><a href="javascript:void()"> <img
												class="float-left mr-3 avatar-img"
												src="${hContext}/views/images/avatar/4.jpg" alt="">
												<div class="notification-content">
													<div class="notification-heading">Hilari Clinton</div>
													<div class="notification-timestamp">08 Hours ago</div>
													<div class="notification-text">Hello</div>
												</div>
										</a></li>
									</ul>

								</div>
							</div></li>
						<li class="icons dropdown"><a href="javascript:void(0)"
							data-toggle="dropdown"> <i class="mdi mdi-bell-outline"></i>
								<span class="badge badge-pill gradient-2 badge-primary">3</span>
						</a>
							<div
								class="drop-down animated fadeIn dropdown-menu dropdown-notfication">
								<div
									class="dropdown-content-heading d-flex justify-content-between">
									<span class="">2 New Notifications</span>

								</div>
								<div class="dropdown-content-body">
									<ul>
										<li><a href="javascript:void()"> <span
												class="mr-3 avatar-icon bg-success-lighten-2"><i
													class="icon-present"></i></span>
												<div class="notification-content">
													<h6 class="notification-heading">Events near you</h6>
													<span class="notification-text">Within next 5 days</span>
												</div>
										</a></li>
										<li><a href="javascript:void()"> <span
												class="mr-3 avatar-icon bg-danger-lighten-2"><i
													class="icon-present"></i></span>
												<div class="notification-content">
													<h6 class="notification-heading">Event Started</h6>
													<span class="notification-text">One hour ago</span>
												</div>
										</a></li>
										<li><a href="javascript:void()"> <span
												class="mr-3 avatar-icon bg-success-lighten-2"><i
													class="icon-present"></i></span>
												<div class="notification-content">
													<h6 class="notification-heading">Event Ended
														Successfully</h6>
													<span class="notification-text">One hour ago</span>
												</div>
										</a></li>
										<li><a href="javascript:void()"> <span
												class="mr-3 avatar-icon bg-danger-lighten-2"><i
													class="icon-present"></i></span>
												<div class="notification-content">
													<h6 class="notification-heading">Events to Join</h6>
													<span class="notification-text">After two days</span>
												</div>
										</a></li>
									</ul>

								</div>
							</div></li>
						<li class="icons dropdown d-none d-md-flex"><a
							href="javascript:void(0)" class="log-user" data-toggle="dropdown">
								<span>English</span> <i class="fa fa-angle-down f-s-14"
								aria-hidden="true"></i>
						</a>
							<div
								class="drop-down dropdown-language animated fadeIn  dropdown-menu">
								<div class="dropdown-content-body">
									<ul>
										<li><a href="javascript:void()">English</a></li>
										<li><a href="javascript:void()">Dutch</a></li>
									</ul>
								</div>
							</div></li>
						<li class="icons dropdown">
							<div class="user-img c-pointer position-relative"
								data-toggle="dropdown">
								<span class="activity active"></span> <img
									src="${hContext}/views/images/user/1.png" height="40"
									width="40" alt="">
							</div>
							<div class="drop-down dropdown-profile   dropdown-menu">
								<div class="dropdown-content-body">
									<ul>
										<li><a href="${hContext}/views/app-profile.html"><i
												class="icon-user"></i> <span>Profile</span></a></li>
										<li><a href="${hContext}/views/email-inbox.html"><i
												class="icon-envelope-open"></i> <span>Inbox</span>
												<div class="badge gradient-3 badge-pill badge-primary">3</div></a>
										</li>

										<hr class="my-2">
										<li><a href="${hContext}/views/page-lock.html"><i
												class="icon-lock"></i> <span>Lock Screen</span></a></li>
										<li><a href="${hContext}/views/page-login.html"><i
												class="icon-key"></i> <span>Logout</span></a></li>
									</ul>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!--**********************************
            Header end ti-comment-alt
        ***********************************-->

		<!--**********************************
            Sidebar start
        ***********************************-->
		<div class="nk-sidebar">
			<div class="nk-nav-scroll">
				<ul class="metismenu" id="menu">
					<li class="nav-label">Dashboard</li>
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"> <i class="icon-speedometer menu-icon"></i><span
							class="nav-text">Dashboard</span>
					</a>
						<ul aria-expanded="false">
							<li><a href="${hContext}/views/index.html">Home 1</a></li>
							<!-- <li><a href="./index-2.html">Home 2</a></li> -->
						</ul></li>
					<li class="mega-menu mega-menu-sm"><a class="has-arrow"
						href="javascript:void()" aria-expanded="false"> <i
							class="icon-globe-alt menu-icon"></i><span class="nav-text">Layouts</span>
					</a>
						<ul aria-expanded="false">
							<li><a href="${hContext}/views/layout-blank.html">Blank</a></li>
							<li><a href="${hContext}/views/layout-one-column.html">One
									Column</a></li>
							<li><a href="${hContext}/views/layout-two-column.html">Two
									column</a></li>
							<li><a href="${hContext}/views/layout-compact-nav.html">Compact
									Nav</a></li>
							<li><a href="${hContext}/views/layout-vertical.html">Vertical</a></li>
							<li><a href="${hContext}/views/layout-horizontal.html">Horizontal</a></li>
							<li><a href="${hContext}/views/layout-boxed.html">Boxed</a></li>
							<li><a href="${hContext}/views/layout-wide.html">Wide</a></li>


							<li><a href="${hContext}/views/layout-fixed-header.html">Fixed
									Header</a></li>
							<li><a href="${hContext}/views/layout-fixed-sidebar.html">Fixed
									Sidebar</a></li>
						</ul></li>
					<li class="nav-label">Apps</li>
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"> <i class="icon-envelope menu-icon"></i>
							<span class="nav-text">Email</span>
					</a>
						<ul aria-expanded="false">
							<li><a href="${hContext}/views/email-inbox.html">Inbox</a></li>
							<li><a href="${hContext}/views/email-read.html">Read</a></li>
							<li><a href="${hContext}/views/email-compose.html">Compose</a></li>
						</ul></li>
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"> <i class="icon-screen-tablet menu-icon"></i><span
							class="nav-text">Apps</span>
					</a>
						<ul aria-expanded="false">
							<li><a href="${hContext}/views/app-profile.html">Profile</a></li>
							<li><a href="${hContext}/views/app-calender.html">Calender</a></li>
						</ul></li>
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"> <i class="icon-graph menu-icon"></i> <span
							class="nav-text">Charts</span>
					</a>
						<ul aria-expanded="false">
							<li><a href="${hContext}/views/chart-flot.html">Flot</a></li>
							<li><a href="${hContext}/views/chart-morris.html">Morris</a></li>
							<li><a href="${hContext}/views/chart-chartjs.html">Chartjs</a></li>
							<li><a href="${hContext}/views/chart-chartist.html">Chartist</a></li>
							<li><a href="${hContext}/views/chart-sparkline.html">Sparkline</a></li>
							<li><a href="${hContext}/views/chart-peity.html">Peity</a></li>
						</ul></li>
					<li class="nav-label">UI Components</li>
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"> <i class="icon-grid menu-icon"></i><span
							class="nav-text">UI Components</span>
					</a>
						<ul aria-expanded="false">
							<li><a href="${hContext}/views/ui-accordion.html">Accordion</a></li>
							<li><a href="${hContext}/views/ui-alert.html">Alert</a></li>
							<li><a href="${hContext}/views/ui-badge.html">Badge</a></li>
							<li><a href="${hContext}/views/ui-button.html">Button</a></li>
							<li><a href="${hContext}/views/ui-button-group.html">Button
									Group</a></li>
							<li><a href="${hContext}/views/ui-cards.html">Cards</a></li>
							<li><a href="${hContext}/views/ui-carousel.html">Carousel</a></li>
							<li><a href="${hContext}/views/ui-dropdown.html">Dropdown</a></li>
							<li><a href="${hContext}/views/ui-list-group.html">List
									Group</a></li>
							<li><a href="${hContext}/views/ui-media-object.html">Media
									Object</a></li>
							<li><a href="${hContext}/views/ui-modal.html">Modal</a></li>
							<li><a href="${hContext}/views/ui-pagination.html">Pagination</a></li>
							<li><a href="${hContext}/views/ui-popover.html">Popover</a></li>
							<li><a href="${hContext}/views/ui-progressbar.html">Progressbar</a></li>
							<li><a href="${hContext}/views/ui-tab.html">Tab</a></li>
							<li><a href="${hContext}/views/ui-typography.html">Typography</a></li>
							<!-- </ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-layers menu-icon"></i><span class="nav-text">Components</span>
                        </a>
                        <ul aria-expanded="false"> -->
							<li><a href="${hContext}/views/uc-nestedable.html">Nestedable</a></li>
							<li><a href="${hContext}/views/uc-noui-slider.html">Noui
									Slider</a></li>
							<li><a href="${hContext}/views/uc-sweetalert.html">Sweet
									Alert</a></li>
							<li><a href="${hContext}/views/uc-toastr.html">Toastr</a></li>
						</ul></li>
					<li><a href="${hContext}/views/widgets.html"
						aria-expanded="false"> <i class="icon-badge menu-icon"></i><span
							class="nav-text">Widget</span>
					</a></li>
					<li class="nav-label">Forms</li>
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"> <i class="icon-note menu-icon"></i><span
							class="nav-text">Forms</span>
					</a>
						<ul aria-expanded="false">
							<li><a href="${hContext}/views/form-basic.html">Basic
									Form</a></li>
							<li><a href="${hContext}/views/form-validation.html">Form
									Validation</a></li>
							<li><a href="${hContext}/views/form-step.html">Step Form</a></li>
							<li><a href="${hContext}/views/form-editor.html">Editor</a></li>
							<li><a href="${hContext}/views/form-picker.html">Picker</a></li>
						</ul></li>
					<li class="nav-label">Table</li>
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"> <i class="icon-menu menu-icon"></i><span
							class="nav-text">Table</span>
					</a>
						<ul aria-expanded="false">
							<li><a href="${hContext}/views/table-basic.html"
								aria-expanded="false">Basic Table</a></li>
							<li><a href="${hContext}/views/table-datatable.html"
								aria-expanded="false">Data Table</a></li>
						</ul></li>
					<li class="nav-label">Pages</li>
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"> <i class="icon-notebook menu-icon"></i><span
							class="nav-text">Pages</span>
					</a>
						<ul aria-expanded="false">
							<li><a href="${hContext}/views/page-login.html">Login</a></li>
							<li><a href="${hContext}/views/page-register.html">Register</a></li>
							<li><a href="${hContext}/views/page-lock.html">Lock
									Screen</a></li>
							<li><a class="has-arrow" href="javascript:void()"
								aria-expanded="false">Error</a>
								<ul aria-expanded="false">
									<li><a href="${hContext}/views/page-error-404.html">Error
											404</a></li>
									<li><a href="${hContext}/views/page-error-403.html">Error
											403</a></li>
									<li><a href="${hContext}/views/page-error-400.html">Error
											400</a></li>
									<li><a href="${hContext}/views/page-error-500.html">Error
											500</a></li>
									<li><a href="${hContext}/views/page-error-503.html">Error
											503</a></li>
								</ul></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<!--**********************************
            Sidebar end
        ***********************************-->

		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">

			<div class="row page-titles mx-0">
				<div class="col p-md-0">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
						<li class="breadcrumb-item active"><a
							href="javascript:void(0)">Home</a></li>
					</ol>
				</div>
			</div>
			<!-- row -->
			<div class="container-fluid">

				<div class="row">
					<!-- 본인 정보란 -->	
					<div class="col-lg-6">
						<div class="card">
							<div class="card-body"
								style="padding: 20px; padding-bottom: 0px;">
								<div class="media align-items-center mb-4"
									style="padding-left: 20px; margin-bottom: 5px;">
									<img class="mr-3" src="${hContext}/views/images/avatar/11.png"
										width="80" height="80" alt="">
									<div class="media-body" style="padding-left: 20px;">
										<table>
											<tbody>
												<tr>
													<td><strong class="text-dark mr-4">&emsp;이름</strong><span>${user.name }</span></td>
												</tr>
												<tr>
													<td class="mb-1"><strong class="text-dark mr-4">&emsp;부서</strong><span>${user.deptNm }</span></td>
												</tr>
												<tr>
													<td class="mb-1"><strong class="text-dark mr-4">&emsp;직급</strong><span>${user.position }</span></td>
												</tr>
												<tr>
													<td class="mb-1"><strong class="text-dark mr-4">&ensp;Email</strong><span>${user.email }</span></td>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /본인 정보란 -->
					<!-- 채팅방1 -->
					<div class="col-lg-6">
						<div class="card text-center" >
							<div class="card-body">
								<h5 class="card-title">테스트 중</h5>
								<p class="card-text">채팅방</p>
								<a href="#" class="btn btn-primary">참여하기</a>
							</div>
						</div>
					</div>
					<!-- //채팅ㅂ1 -->
				</div>
				<!-- /row -->	
				
				<!-- /부서검색박스 -->
				<div class="row">
					<div class="col-lg-6">
						<div class="card" style="margin-bottom: 20px;">
							<div class="card-body" style="padding: 20px;">
								<!-- 부서검색박스 -->
								<form action="${hContext}/chat/do_retrieve.do" name="dNameForm"
									method="get" class="form-inline" onchange="doRetrieve();"
									style="padding-left: 5%; padding-top: 10px; padding-bottom: 10px;">
									<strong class="text-dark mr-3">부서 선택&ensp;</strong> <input
										type="hidden" name="pageSize" id="pageSize"
										value="${vo.pageSize }" /> <input type="hidden"
										name="pageNum" id="pageNum" value="${vo.pageNum }" /> <input
										type="hidden" name="searchWord" id="searchWord" />
									<%=StringUtil.makeSelectBox(searchList, "searchDiv", searchDiv, true)%>
								</form>
								<!-- /부서검색박스 -->
								<!-- 사원목록테이블 -->
									<div class="table-responsive">
										<table id="listTable"
											class="table header-border table-hover verticle-middle" >
											<!-- hidden-sm hidden-xs 숨기기 -->
											<thead>
							                   <tr>     
							                       <th class="text-center">이름</th>
							                       <th class="text-center">부서</th>
							                       <th class="text-center">직급</th>
							                   </tr>
							               </thead>
											<tbody>
												<c:choose>
													<c:when test="${list.size()>0 }">
														<c:forEach var="vo" items="${list }">
															<tr style="text-align: center;">
																<%-- <td class="text-center hidden-sm hidden-xs"><c:out value="${vo.id }" /> --%>
																<td style="display: none;"><c:out value="${vo.id}" />
																	<input type="hidden" id="id" name="id" value="${vo.id}" />
																<td class="text-center"><c:out value="${vo.name }" />
																<td class="text-center"><c:out value="${vo.dept_Nm }" />
																<td class="text-center hidden-sm hidden-xs  "><c:out value="${vo.position }" />	
															</tr>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<tr>
															<td class="text-center">No data found.</td>
														</tr>
													</c:otherwise>
												</c:choose>
											</tbody>
										</table>
									</div>
									<!-- pagenation -->
									<nav>
										<ul class="pagination justify-content-center">
											<div class="text-center"
												style="margin-top: 10px; margin-bottom: 10px;">
												<%=StringUtil.renderPaging(maxNum, currPageNo, rowPerPage, bottomCount, url, scriptName)%>
											</div>
										</ul>
									</nav>
									<!--// pagenation -->
								</div>
							</div>
							<!-- /사원목록테이블 -->
	
						</div>
						
					</div>
					<!-- //row2 -->
					
				</div>



								
				
				</div>

				<!-- #/ container -->
			</div>
		</div>
		<!--**********************************
            Content body end
        ***********************************-->


		<!--**********************************
            Footer start
        ***********************************-->
		<div class="footer">
			<div class="copyright">
				<p>
					Copyright &copy; Designed & Developed by <a
						href="https://themeforest.net/user/quixlab">Quixlab</a> 2018
				</p>
			</div>
		</div>
		<!--**********************************
            Footer end
        ***********************************-->
	</div>
	<!--**********************************
        Main wrapper end
    ***********************************-->

	<!--**********************************
        Scripts
    ***********************************-->
	<script src="${hContext}/views/plugins/common/common.min.js"></script>
	<script src="${hContext}/views/js/custom.min.js"></script>
	<script src="${hContext}/views/js/settings.js"></script>
	<script src="${hContext}/views/js/gleek.js"></script>
	<script src="${hContext}/views/js/styleSwitcher.js"></script>
	<%-- <script src="${hContext}/views/js/swiper.jquery.js"></script> --%>

	<script type="text/javascript">
		//--셀렉트박스 list 중 하나 선택했을 때 메일 읽기 페이지로 넘어가는 기능 Start
		function doRetrieve() {
			//console.log($("#dNameList option:selected").val());
			//console.log("doRetrieve");
			var frm = document.dNameForm;
			frm.searchDiv.value = $("#searchDiv option:selected").val();
			/* frm.searchWord.value = ""; */
			/* frm.pageSize.value = 10;
			frm.pageNum.value = 1;  */
			frm.action = "${hContext}/chat/do_retrieve.do";
			frm.submit();

		}

		function doSeachPage(url, no) {
			console.log("#url:" + url);
			console.log("#no:" + no);

			var frm = document.dNameForm;
			frm.pageNum.value = no;
			frm.action = url;
			frm.submit();

		}

		
		/*
		//--사원목록에서 하나를 선택했을 때 해당 사원의 정보를 띄움
		 $("#listTable>tbody").on("click", "tr", function() {
			console.log("#listTable>tbody");
			var trs = $(this);
			var tds = trs.children();
			var id = tds.eq(5).text();
			console.log("id = " + id);
			location.href = "${hContext}/chat/do_selectOne.do?id=" + id;

		});
 		//끝
 		*/
 		
		/*<form action="${hContext}/chat/do_retrieve.do" name="dNameForm" method="get" class="form-inline">
		 			<select name="dNameList" id="dNameList" onchange="doRetrieve()">
		               	<option value="">전체</option>
		               	<option value="10">개발</option>
		               	<option value="20">부서명</option>
		            </select>
		            </form> */

		/*     $.ajax({
		        type:"GET",
		        url:"${hContext }/chat/do_retrieve.do",
		        dataType:"html",
		        data:{"searchDiv":$("#dNameList option:selected").val()  
		        },
		        success:function(data){ //성공
		            
		            var jsonObj = JSON.parse(data);
		            if(jsonObj !=null && jsonObj.msgId == "1"){
		                alert(jsonObj.msgContents);         //메시지 먼저 뜨고 아래에서 이동시킴
		                
		                //goRetrieve();
		                //window.location.href='/groupware/chat/do_retrieve.do?pageNum=1&pageSize=10&searchDiv=&searchWord=';
		            } else{
		                alert(jsonObj.msgId+"|"+ jsonObj.msgContents);
		                
		            } 
		            
		        },error:function(xhr,status,error){
		            alert("error:" + error);
		        },complete:function(data){
		        
		        }
		        
		       });//--ajax */
	</script>
	</ body>
</html>