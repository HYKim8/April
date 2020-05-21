<%--
  /**
  * Class Name : 
  * Description : 
  * Modification Information
  *
  *   수정일                   수정자                      수정내용
  *  -------    --------    ---------------------------
  *  2020. 5. 7.            최초 생성
  *
  * author 실행환경 개발팀
  * since 2009.01.06
  *
  * http://localhost:8080/groupware/mail/do_retrieveSent.do?pageNum=1&pageSize=10&searchDiv=&searchWord=kimmj
  *
  * Copyright (C) 2009 by KandJang  All right reserved.
  */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.april.groupware.cmn.StringUtil"%>
<%@page import="com.april.groupware.cmn.SearchVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/views/common/common.jsp"%>
<c:set var="aprilContext" value="${pageContext.request.contextPath }"></c:set>
<%
	//페이지 사이즈
String pageSize = "10";

//페이지 num
String pageNum = "1";

//검색구분
String searchDiv = "";

//검색어
String searchWord = "kimmj";

SearchVO search = (SearchVO) request.getAttribute("vo");
if (search != null) {
	pageSize = String.valueOf(search.getPageSize());
	pageNum = String.valueOf(search.getPageNum());
	searchDiv = String.valueOf(search.getSearchDiv());
	searchWord = String.valueOf(search.getSearchWord());

}
//out.print("search: "+search);

int totalCnt = 0;
totalCnt = (Integer) request.getAttribute("totalCnt");
//out.print("**totalCnt**"+totalCnt);

//paging (StringUtil render참고)
//int maxNum_i, int currPageNoIn_i, int rowsPerPage_i, int bottomCount_i, String url_i, String scriptName_i
String url = H_PATH + "/mail/do_retrieveSent.do"; //H_PATH: common.jsp에 있음(ehr)
String scriptName = "doSearchPage";
int maxNum = 0; //총글수
int currPageNo = 1; //현재 페이지
int rowPerPage = 10;
int bottomCount = 7; //바닥에 보여지는 글 수

if (search != null) {
	currPageNo = search.getPageNum();
	rowPerPage = search.getPageSize();
	maxNum = totalCnt;
}
//--//paging
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>메일</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${aprilContext}/views/images/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="${aprilContext}/views/css/style.css" rel="stylesheet">

</head>

<body>

    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
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
                <a href="${aprilContext}/views/index.html">
                    <b class="logo-abbr"><img src="${aprilContext}/views/images/logo.png" alt=""> </b>
                    <span class="logo-compact"><img src="${aprilContext}/views/images/logo-compact.png" alt=""></span>
                    <span class="brand-title">
                        <img src="${aprilContext}/views/images/logo-text.png" alt="">
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
                            <span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3" id="basic-addon1"><i class="mdi mdi-magnify"></i></span>
                        </div>
                        <input type="search" class="form-control" placeholder="Search Dashboard" aria-label="Search Dashboard">
                        <div class="drop-down   d-md-none">
							<form action="#">
								<input type="text" class="form-control" placeholder="Search">
							</form>
                        </div>
                    </div>
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
                                                <img class="float-left mr-3 avatar-img" src="${aprilContext}/views/images/avatar/1.jpg" alt="">
                                                <div class="notification-content">
                                                    <div class="notification-heading">Saiful Islam</div>
                                                    <div class="notification-timestamp">08 Hours ago</div>
                                                    <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="notification-unread">
                                            <a href="javascript:void()">
                                                <img class="float-left mr-3 avatar-img" src="${aprilContext}/views/images/avatar/2.jpg" alt="">
                                                <div class="notification-content">
                                                    <div class="notification-heading">Adam Smith</div>
                                                    <div class="notification-timestamp">08 Hours ago</div>
                                                    <div class="notification-text">Can you do me a favour?</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void()">
                                                <img class="float-left mr-3 avatar-img" src="${aprilContext}/views/images/avatar/3.jpg" alt="">
                                                <div class="notification-content">
                                                    <div class="notification-heading">Barak Obama</div>
                                                    <div class="notification-timestamp">08 Hours ago</div>
                                                    <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void()">
                                                <img class="float-left mr-3 avatar-img" src="${aprilContext}/views/images/avatar/4.jpg" alt="">
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
                            <a href="javascript:void(0)" class="log-user"  data-toggle="dropdown">
                                <span>English</span>  <i class="fa fa-angle-down f-s-14" aria-hidden="true"></i>
                            </a>
                            <div class="drop-down dropdown-language animated fadeIn  dropdown-menu">
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li><a href="javascript:void()">English</a></li>
                                        <li><a href="javascript:void()">Dutch</a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="icons dropdown">
                            <div class="user-img c-pointer position-relative"   data-toggle="dropdown">
                                <span class="activity active"></span>
                                <img src="${aprilContext}/views/images/user/1.png" height="40" width="40" alt="">
                            </div>
                            <div class="drop-down dropdown-profile   dropdown-menu">
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li>
                                            <a href="${aprilContext}/views/app-profile.html"><i class="icon-user"></i> <span>Profile</span></a>
                                        </li>
                                        <li>
                                            <a href="${aprilContext}/views/email-inbox.html"><i class="icon-envelope-open"></i> <span>Inbox</span> <div class="badge gradient-3 badge-pill badge-primary">3</div></a>
                                        </li>
                                        
                                        <hr class="my-2"/>
                                        <li>
                                            <a href="${aprilContext}/views/page-lock.html"><i class="icon-lock"></i> <span>Lock Screen</span></a>
                                        </li>
                                        <li><a href="${aprilContext}/views/page-login.html"><i class="icon-key"></i> <span>Logout</span></a></li>
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
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-speedometer menu-icon"></i><span class="nav-text">Dashboard</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="${aprilContext}/views/index.html">Home 1</a></li>
                            <!-- <li><a href="./index-2.html">Home 2</a></li> -->
                        </ul>
                    </li>
                    <li class="mega-menu mega-menu-sm">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-globe-alt menu-icon"></i><span class="nav-text">Layouts</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="${aprilContext}/views/layout-blank.html">Blank</a></li>
                            <li><a href="${aprilContext}/views/layout-one-column.html">One Column</a></li>
                            <li><a href="${aprilContext}/views/layout-two-column.html">Two column</a></li>
                            <li><a href="${aprilContext}/views/layout-compact-nav.html">Compact Nav</a></li>
                            <li><a href="${aprilContext}/views/layout-vertical.html">Vertical</a></li>
                            <li><a href="${aprilContext}/views/layout-horizontal.html">Horizontal</a></li>
                            <li><a href="${aprilContext}/views/layout-boxed.html">Boxed</a></li>
                            <li><a href="${aprilContext}/views/layout-wide.html">Wide</a></li>
                            
                            
                            <li><a href="${aprilContext}/views/layout-fixed-header.html">Fixed Header</a></li>
                            <li><a href="${aprilContext}/views/layout-fixed-sidebar.html">Fixed Sidebar</a></li>
                        </ul>
                    </li>
                    <li class="nav-label">Apps</li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-envelope menu-icon"></i> <span class="nav-text">메일</span>
                        </a>
                    </li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-screen-tablet menu-icon"></i><span class="nav-text">Apps</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="${aprilContext}/views/app-profile.html">Profile</a></li>
                            <li><a href="${aprilContext}/views/app-calender.html">Calender</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-graph menu-icon"></i> <span class="nav-text">Charts</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="${aprilContext}/views/chart-flot.html">Flot</a></li>
                            <li><a href="${aprilContext}/views/chart-morris.html">Morris</a></li>
                            <li><a href="${aprilContext}/views/chart-chartjs.html">Chartjs</a></li>
                            <li><a href="${aprilContext}/views/chart-chartist.html">Chartist</a></li>
                            <li><a href="${aprilContext}/views/chart-sparkline.html">Sparkline</a></li>
                            <li><a href="${aprilContext}/views/chart-peity.html">Peity</a></li>
                        </ul>
                    </li>
                    <li class="nav-label">UI Components</li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-grid menu-icon"></i><span class="nav-text">UI Components</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="${aprilContext}/views/ui-accordion.html">Accordion</a></li>
                            <li><a href="${aprilContext}/views/ui-alert.html">Alert</a></li>
                            <li><a href="${aprilContext}/views/ui-badge.html">Badge</a></li>
                            <li><a href="${aprilContext}/views/ui-button.html">Button</a></li>
                            <li><a href="${aprilContext}/views/ui-button-group.html">Button Group</a></li>
                            <li><a href="${aprilContext}/views/ui-cards.html">Cards</a></li>
                            <li><a href="${aprilContext}/views/ui-carousel.html">Carousel</a></li>
                            <li><a href="${aprilContext}/views/ui-dropdown.html">Dropdown</a></li>
                            <li><a href="${aprilContext}/views/ui-list-group.html">List Group</a></li>
                            <li><a href="${aprilContext}/views/ui-media-object.html">Media Object</a></li>
                            <li><a href="${aprilContext}/views/ui-modal.html">Modal</a></li>
                            <li><a href="${aprilContext}/views/ui-pagination.html">Pagination</a></li>
                            <li><a href="${aprilContext}/views/ui-popover.html">Popover</a></li>
                            <li><a href="${aprilContext}/views/ui-progressbar.html">Progressbar</a></li>
                            <li><a href="${aprilContext}/views/ui-tab.html">Tab</a></li>
                            <li><a href="${aprilContext}/views/ui-typography.html">Typography</a></li>
                        <!-- </ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-layers menu-icon"></i><span class="nav-text">Components</span>
                        </a>
                        <ul aria-expanded="false"> -->
                            <li><a href="${aprilContext}/views/uc-nestedable.html">Nestedable</a></li>
                            <li><a href="${aprilContext}/views/uc-noui-slider.html">Noui Slider</a></li>
                            <li><a href="${aprilContext}/views/uc-sweetalert.html">Sweet Alert</a></li>
                            <li><a href="${aprilContext}/views/uc-toastr.html">Toastr</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="${aprilContext}/views/widgets.html" aria-expanded="false">
                            <i class="icon-badge menu-icon"></i><span class="nav-text">Widget</span>
                        </a>
                    </li>
                    <li class="nav-label">Forms</li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-note menu-icon"></i><span class="nav-text">Forms</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="${aprilContext}/views/form-basic.html">Basic Form</a></li>
                            <li><a href="${aprilContext}/views/form-validation.html">Form Validation</a></li>
                            <li><a href="${aprilContext}/views/form-step.html">Step Form</a></li>
                            <li><a href="${aprilContext}/views/form-editor.html">Editor</a></li>
                            <li><a href="${aprilContext}/views/form-picker.html">Picker</a></li>
                        </ul>
                    </li>
                    <li class="nav-label">Table</li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-menu menu-icon"></i><span class="nav-text">Table</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="${aprilContext}/views/table-basic.html" aria-expanded="false">Basic Table</a></li>
                            <li><a href="${aprilContext}/views/table-datatable.html" aria-expanded="false">Data Table</a></li>
                        </ul>
                    </li>
                    <li class="nav-label">Pages</li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-notebook menu-icon"></i><span class="nav-text">Pages</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="${aprilContext}/views/page-login.html">Login</a></li>
                            <li><a href="${aprilContext}/views/page-register.html">Register</a></li>
                            <li><a href="${aprilContext}/views/page-lock.html">Lock Screen</a></li>
                            <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">Error</a>
                                <ul aria-expanded="false">
                                    <li><a href="${aprilContext}/views/page-error-404.html">Error 404</a></li>
                                    <li><a href="${aprilContext}/views/page-error-403.html">Error 403</a></li>
                                    <li><a href="${aprilContext}/views/page-error-400.html">Error 400</a></li>
                                    <li><a href="${aprilContext}/views/page-error-500.html">Error 500</a></li>
                                    <li><a href="${aprilContext}/views/page-error-503.html">Error 503</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
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
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Apps</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">메일</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="email-left-box">
                                	<a href="${aprilContext}/views/email-compose.html" class="btn btn-primary btn-block">메일 쓰기</a>
                                	<a href="${aprilContext}/views/email-composeVacation.html" class="btn btn-primary btn-block">휴가 신청서 쓰기</a>
                                    <div class="mail-list mt-4">
                                    	<a href="${aprilContext}/views/email-inbox.html" class="list-group-item border-0 p-r-0"><i class="fa fa-inbox font-18 align-middle mr-2"></i> 
	                                    	<b>받은 메일함</b> 
	                                    	<span class="badge badge-primary badge-sm float-right m-t-5">198</span> 
                                    	</a>
                                        <a href="#" class="list-group-item border-0 text-primary p-r-0"><i class="fa fa-paper-plane font-18 align-middle mr-2"></i>보낸 메일함</a>  
                                        <!-- 
                                        <a href="#" class="list-group-item border-0 p-r-0"><i class="mdi mdi-file-document-box font-18 align-middle mr-2"></i>Draft</a>
                                         -->
                                        <a href="#" class="list-group-item border-0 p-r-0"><i class="fa fa-trash font-18 align-middle mr-2"></i>휴지통</a>
                                    </div>
                                    <!-- 
                                    <h5 class="mt-5 m-b-10">카테고리</h5>
                                    <div class="list-group mail-list">
                                    	<a href="#" class="list-group-item border-0"><span class="fa fa-briefcase f-s-14 mr-2"></span>Work</a>  
                                    	<a href="#" class="list-group-item border-0"><span class="fa fa-sellsy f-s-14 mr-2"></span>Private</a>  
                                    	<a href="#" class="list-group-item border-0"><span class="fa fa-ticket f-s-14 mr-2"></span>Support</a>  
                                    	<a href="#" class="list-group-item border-0"><span class="fa fa-tags f-s-14 mr-2"></span>Social</a>
                                    </div>
                                     -->
                                </div>
                                <div class="email-right-box">
                                    <div role="toolbar" class="toolbar">
                                    	<!-- <div class="btn-group">
                                        	<button type="button" class="btn btn-light"><i class="fa fa-mail-reply font-18 align-middle mr-2"></i>답장</button>
                                        	<button type="button" class="btn btn-light"><i class="fa fa-trash font-18 align-middle mr-2"></i>삭제</button>
                                        	<button type="button" class="btn btn-light"><i class="fa fa-mail-forward font-18 align-middle mr-2"></i>전달</button>
                                        	<button type="button" class="btn btn-light"><i class="fa fa-envelope-open font-18 align-middle mr-2"></i>읽음</button>
                                        	<button aria-expanded="false" data-toggle="dropdown" class="btn btn-dark dropdown-toggle" type="button">More <span class="caret m-l-5"></span>
                                            </button>
                                    	</div> -->
										<table class="table table-striped table-bordered sung">
										<!-- hidden-sm hidden-xs 숨기기 -->
											<thead class="bg-primary" style="text-align: center; color:white;">
												<th width="15%" style="">작성일</th>
												<th width="10%" >수신자</th>
												<th width="55%">제목</th>
												<th width="10%">읽음 여부</th>
											</thead>
										</table>
                                    </div>
                                    <hr>
                                    <div class="email-list m-t-15">
                                    	<form action="" name="mailFrm">
											<input type="hidden" name="pageNum" id="pageNum" value="${vo.pageNum}" />
											<input type="hidden" id="searchWord" name="searchWord"value="kimmj" />
											<table id="listTable" class="table table-striped table-bordered">
												
												<tbody>
													<c:choose>
														<c:when test="${list.size()>0 }">
															<c:forEach var="vo" items="${list}">
																<tr style="text-align: center;">
																	<td width="15%"><c:out value="${vo.recDate}"></c:out></td>
																	<td width="10%"><c:out value="${vo.recipient}"></c:out></td>
																	<td width="55%" style="text-align: left;"><c:out value="${vo.title}"></c:out></td>
																	<td width="10%">
																		<c:choose>
																				<c:when test="${vo.read =='9'}">
																					<c:out value="읽음"></c:out>
																				</c:when>
																				<c:otherwise>
																					<c:out value="읽지 않음"></c:out>
																				</c:otherwise>
																		</c:choose>
																	</td>
																	<td style="display: none;"><c:out value="${vo.mailId}" />
																		<input type="hidden" id="mailId" name="mailId" value="${vo.mailId}" />
																	</td>
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
										</form>
                                    </div>
                                    <!-- panel -->
                                    <!-- pagenation -->
									<div class="text-center">
										<%=StringUtil.renderPaging(maxNum, currPageNo, rowPerPage, bottomCount, url, scriptName)%>
									</div>
									<!--// pagenation -->
                                    <!-- <div class="row">
                                        <div class="col-7">
                                            <div class="text-left">1 - 20 of 568</div>
                                        </div>
                                        <div class="col-5">
                                            <div class="btn-group float-right">
                                                <button class="btn btn-gradient" type="button"><i class="fa fa-angle-left"></i>
                                                </button>
                                                <button class="btn btn-dark" type="button"><i class="fa fa-angle-right"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #/ container -->
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
        
        
        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <div class="copyright">
                <p>Copyright &copy; Designed & Developed by <a href="https://themeforest.net/user/quixlab">Quixlab</a> 2018</p>
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
    <script src="${aprilContext}/views/plugins/common/common.min.js"></script>
    <script src="${aprilContext}/views/js/custom.min.js"></script>
    <script src="${aprilContext}/views/js/settings.js"></script>
    <script src="${aprilContext}/views/js/gleek.js"></script>
    <script src="${aprilContext}/views/js/styleSwitcher.js"></script>
    
    <script type="text/javascript">

    function doSearchPage(url,no){
        var frm = document.mailFrm;
        frm.pageNum.value= no;
        frm.action= url;
        console.log("no: "+no);
        console.log("url: "+url);
        frm.submit();
    }
    
    //--메일 list 중 하나 선택했을 때 메일 읽기 페이지로 넘어가는 기능 Start
	$("#listTable").on("click","tr",function() {
		//console.log("haha #listTable>tbody");
		var trs = $(this);
		var tds = trs.children();
		var mailId = tds.eq(4).text();
		console.log("mailId = " + mailId);
		location.href = "${aprilContext}/mail/do_selectOneSent.do?mailId="+ mailId;

		//console.log("mailId = "+mailId);
		//$("#mailIdInput").val(mailId);
		//var frm = document.mailFrm;
		//console.log("mailIdInput.val() = "+$("#mailIdInput").val());
		////frm.mailId.value = mailId;
		//frm.action="${aprilContext}/mail/do_selectOne.do?mailId="+mailId;
		//frm.submit();

	});
	//--메일 list 중 하나 선택했을 때 메일 읽기 페이지로 넘어가는 기능 End
	
    </script>

</body>

</html>