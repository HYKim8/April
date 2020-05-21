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
  * Copyright (C) 2009 by KandJang  All right reserved.
  */
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/views/common/common.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>전사게시판_상세페이지</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${hContext}/views/images/favicon.png">
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
                <a href="${hContext}/views/index.html">
                    <b class="logo-abbr"><img src="${hContext}/views/images/logo.png" alt=""> </b>
                    <span class="logo-compact"><img src="${hContext}/views/images/logo-compact.png" alt=""></span>
                    <span class="brand-title">
                        <img src="${hContext}/views/images/logo-text.png" alt="">
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
                            <li><a href="${hContext}/views/index.html">Home 1</a></li>
                            <!-- <li><a href="./index-2.html">Home 2</a></li> -->
                        </ul>
                    </li>
                    <li class="mega-menu mega-menu-sm">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-globe-alt menu-icon"></i><span class="nav-text">Layouts</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="${hContext}/views/layout-blank.html">Blank</a></li>
                            <li><a href="${hContext}/views/views/layout-one-column.html">One Column</a></li>
                            <li><a href="${hContext}/views/views/layout-two-column.html">Two column</a></li>
                            <li><a href="${hContext}/views/views/layout-compact-nav.html">Compact Nav</a></li>
                            <li><a href="${hContext}/views/layout-vertical.html">Vertical</a></li>
                            <li><a href="${hContext}/views/layout-horizontal.html">Horizontal</a></li>
                            <li><a href="${hContext}/views/layout-boxed.html">Boxed</a></li>
                            <li><a href="${hContext}/views/layout-wide.html">Wide</a></li>
                            
                            
                            <li><a href="${hContext}/views/layout-fixed-header.html">Fixed Header</a></li>
                            <li><a href="${hContext}/views/layout-fixed-sidebar.html">Fixed Sidebar</a></li>
                        </ul>
                    </li>
                    <li class="nav-label">Apps</li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-envelope menu-icon"></i> <span class="nav-text">Email</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="${hContext}/views/email-inbox.html">Inbox</a></li>
                            <li><a href="${hContext}/views/email-read.html">Read</a></li>
                            <li><a href="${hContext}/views/email-compose.html">Compose</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-screen-tablet menu-icon"></i><span class="nav-text">Apps</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="${hContext}/views/app-profile.html">Profile</a></li>
                            <li><a href="${hContext}/views/app-calender.html">Calender</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-graph menu-icon"></i> <span class="nav-text">Charts</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="${hContext}/views/chart-flot.html">Flot</a></li>
                            <li><a href="${hContext}/views/chart-morris.html">Morris</a></li>
                            <li><a href="${hContext}/views/chart-chartjs.html">Chartjs</a></li>
                            <li><a href="${hContext}/views/chart-chartist.html">Chartist</a></li>
                            <li><a href="${hContext}/views/chart-sparkline.html">Sparkline</a></li>
                            <li><a href="${hContext}/views/chart-peity.html">Peity</a></li>
                        </ul>
                    </li>
                    <li class="nav-label">UI Components</li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-grid menu-icon"></i><span class="nav-text">UI Components</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="${hContext}/views/ui-accordion.html">Accordion</a></li>
                            <li><a href="${hContext}/views/ui-alert.html">Alert</a></li>
                            <li><a href="${hContext}/views/ui-badge.html">Badge</a></li>
                            <li><a href="${hContext}/views/ui-button.html">Button</a></li>
                            <li><a href="${hContext}/views/ui-button-group.html">Button Group</a></li>
                            <li><a href="${hContext}/views/ui-cards.html">Cards</a></li>
                            <li><a href="${hContext}/views/ui-carousel.html">Carousel</a></li>
                            <li><a href="${hContext}/views/ui-dropdown.html">Dropdown</a></li>
                            <li><a href="${hContext}/views/ui-list-group.html">List Group</a></li>
                            <li><a href="${hContext}/views/ui-media-object.html">Media Object</a></li>
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
                            <li><a href="${hContext}/views/uc-noui-slider.html">Noui Slider</a></li>
                            <li><a href="${hContext}/views/uc-sweetalert.html">Sweet Alert</a></li>
                            <li><a href="${hContext}/views/uc-toastr.html">Toastr</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="${hContext}/views/widgets.html" aria-expanded="false">
                            <i class="icon-badge menu-icon"></i><span class="nav-text">Widget</span>
                        </a>
                    </li>
                    <li class="nav-label">Forms</li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-note menu-icon"></i><span class="nav-text">Forms</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="${hContext}/views/form-basic.html">Basic Form</a></li>
                            <li><a href="${hContext}/views/form-validation.html">Form Validation</a></li>
                            <li><a href="${hContext}/views/form-step.html">Step Form</a></li>
                            <li><a href="${hContext}/views/form-editor.html">Editor</a></li>
                            <li><a href="${hContext}/views/form-picker.html">Picker</a></li>
                        </ul>
                    </li>
                    <li class="nav-label">Table</li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-menu menu-icon"></i><span class="nav-text">Table</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="${hContext}/views/table-basic.html" aria-expanded="false">Basic Table</a></li>
                            <li><a href="${hContext}/views/table-datatable.html" aria-expanded="false">Data Table</a></li>
                        </ul>
                    </li>
                    <li class="nav-label">Pages</li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-notebook menu-icon"></i><span class="nav-text">Pages</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="${hContext}/views/page-login.html">Login</a></li>
                            <li><a href="${hContext}/views/page-register.html">Register</a></li>
                            <li><a href="${hContext}/views/page-lock.html">Lock Screen</a></li>
                            <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">Error</a>
                                <ul aria-expanded="false">
                                    <li><a href="${hContext}/views/page-error-404.html">Error 404</a></li>
                                    <li><a href="${hContext}/views/page-error-403.html">Error 403</a></li>
                                    <li><a href="${hContext}/views/page-error-400.html">Error 400</a></li>
                                    <li><a href="${hContext}/views/page-error-500.html">Error 500</a></li>
                                    <li><a href="${hContext}/views/page-error-503.html">Error 503</a></li>
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
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">Home</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->

            <div class="container-fluid">
            <div class="bootstrap-label">
            <div class="toolbar" role="toolbar">
              <span style="font-size:1.7em; text-align:center; line-height:30px; height: 40px; width: 150px;" class="label label-info" >전사게시판</span>
            </div>
                <div class="row">
                    <div class="col-lg-12">
                    <form name="searchFrm" id="searchFrm" method="get">
                        <div class="card">
                            <div class="card-body">
                                <div class="email-box">
                                    <div class="toolbar" role="toolbar">
                                        <div class="btn-group" style="float:right;">
                                          <input type="button" style="margin:0.2em; height: 30px; width: 100px; text-align:center;" 
                                                 class="label label-pill label-danger"
                                                 value="삭제(관리자)" id="delete_btn" name="delete_btn" />
                                          <input type="button" style="margin:0.2em; height: 30px; width: 100px; text-align:center;" 
                                                 class="label label-pill label-danger" value="수정(관리자)"
                                                 id="update_btn" name="update_btn" />
                                          <input type="text" style="margin:0.2em; height: 30px; width: 100px; text-align:center;" class="label label-pill label-success" 
                                                 id="nbNo" name="nbNo" value="글번호  ${vo.nbNo }"  readonly="readonly"/>
                                          <input type="text" style="margin:0.2em; height: 30px; width: 100px; text-align:center;" class="label label-pill label-success"
                                                 value="${vo.readCnt }"  readonly="readonly" id="readCnt" name="readCnt"/>
                                          <span style="margin:0.2em; height: 30px; width: 100px; text-align:center;" class="label label-pill label-success">댓글 000</span>
                                          <input type="button" style="margin:0.2em; height: 30px; width: 100px; text-align:center;" class="label label-pill label-success"
                                                 value="글 목록" id="list_btn" onclick="goRetrieve();" />
                                        </div>
                                    </div>
                                    <!-- 게시글 내용 영역 -->
                                    
                                    <div class="read-content">
                                    <div class="media mb-4 mt-1">
                                            <div class="media" style="display: flex; padding-right: 1em;">
                                            <%-- <input type="hidden" id="nbCategory" value="${vo.nbCategory }"/> --%>
                                                ${vo.nbCategory }
                                            </div>
                                                <div class="media-body" style="margin: 0; padding: 0;">
                                                 <%-- <input type="hidden" id="nbTitle" value="${vo.nbTitle }"/> --%>
                                                    <h4 class="m-0 text-primary" style="font-weight: bolder;">${vo.nbTitle }</h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="media pt-3">
                                            <img class="mr-3 rounded-circle" src="${hContext}/views/images/avatar/1.jpg">
                                            <div class="media-body">
	                                            <%-- <input type="hidden" id="regId" value="${vo.regId }"/>
	                                            <input type="hidden" id="regDate" value="${vo.regDate }"/> --%>
                                                <h5 class="m-b-3">등록자 ${vo.regId }</h5>
                                                <p class="m-b-2">등록일 ${vo.regDate }</p>
                                            </div>
                                            <!-- 수정시 수정자 아이디/수정일 -->
                                        </div>
                                                <p class="m-b-2" > 수정자 ${vo.modId } 수정일 ${vo.modDate }</p>
                                      <!-- // 게시글 내용 영역 -->
                                        <hr>
                                         <input type="hidden" id="nbContents" value="${vo.nbContents }"/>
                                       <h5 class="m-b-15">${vo.nbContents }</h5>
                                        <hr>
                                        <h6 class="p-t-15"><i class="fa fa-download mb-2"></i> Attachments <span>(3)</span></h6>
                                        <div class="row m-b-30">
                                            <div class="col-auto"><a href="#" class="text-muted">My-Photo.png</a>
                                            </div>
                                            <div class="col-auto"><a href="#" class="text-muted">My-File.docx</a>
                                            </div>
                                            <div class="col-auto"><a href="#" class="text-muted">My-Resume.pdf</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                      </form>
                        </div>
                        <!--div 댓글 작성 -->
                        <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body" style="padding-bottom: 1em;">
                                <span style="margin-bottom:1em; height: 30px; width: 100px; text-align:center;" class="label label-pill label-success">댓글 작성</span>
                                <div class="basic-form">
                                    <form>
                                        <div class="form-group">
                                            <table>
                                                <tr>
                                                    <td>
                                                    <img class="mr-3 circle-rounded" src="${hContext}/views/images/avatar/2.jpg" width="50" height="50" alt="Generic placeholder image">
                                                    </td>
                                                    <td width="1500px">
                                                   <textarea class="form-control h-150px" rows="2" id="comment"></textarea>
                                                   </td>
                                                </tr>
                                                <tr>
                                                   <td colspan = "2" align="right" style="padding-top: 1em;">
                                                       <button type="button" class="btn mb-1 btn-outline-info">댓글 등록</button>
                                                   </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        
                        <!--div 댓글 읽기 -->
                        <div class="card">
                            <div class="card-body">
                             <span style="margin-bottom:1em; height: 30px; width: 100px; text-align:center;" class="label label-pill label-success">댓글</span>
                                <div class="media media-reply">
                                    <img class="mr-3 circle-rounded" src="${hContext}/views/images/avatar/2.jpg" width="50" height="50" alt="Generic placeholder image">
                                    <div class="media-body">
                                        <div class="d-sm-flex justify-content-between mb-2">
                                            <h5 class="mb-sm-0">Milan Gbah <small class="text-muted ml-3">about 3 days ago</small></h5>
                                        </div>
                                        
                                        <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
                                        <ul>
                                            <li class="d-inline-block"><img class="rounded" width="60" height="60" src="${hContext}/views/images/blog/2.jpg" alt=""></li>
                                            <li class="d-inline-block"><img class="rounded" width="60" height="60" src="${hContext}/views/images/blog/3.jpg" alt=""></li>
                                            <li class="d-inline-block"><img class="rounded" width="60" height="60" src="${hContext}/views/images/blog/4.jpg" alt=""></li>
                                            <li class="d-inline-block"><img class="rounded" width="60" height="60" src="${hContext}/views/images/blog/1.jpg" alt=""></li>
                                        </ul>
                                </div>
                            </div>
                            <div class="media media-reply">
                                    <img class="mr-3 circle-rounded" src="${hContext}/views/images/avatar/2.jpg" width="50" height="50" alt="Generic placeholder image">
                                    <div class="media-body">
                                        <div class="d-sm-flex justify-content-between mb-2">
                                            <h5 class="mb-sm-0">Milan Gbah <small class="text-muted ml-3">about 3 days ago</small></h5>
                                        </div>
                                        
                                        <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
                                        <ul>
                                            <li class="d-inline-block"><img class="rounded" width="60" height="60" src="${hContext}/views/images/blog/2.jpg" alt=""></li>
                                            <li class="d-inline-block"><img class="rounded" width="60" height="60" src="${hContext}/views/images/blog/3.jpg" alt=""></li>
                                            <li class="d-inline-block"><img class="rounded" width="60" height="60" src="${hContext}/views/images/blog/4.jpg" alt=""></li>
                                            <li class="d-inline-block"><img class="rounded" width="60" height="60" src="${hContext}/views/images/blog/1.jpg" alt=""></li>
                                        </ul>
                                </div>
                            </div>
                            
                        </div>
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
    <script src="${hContext}/views/plugins/common/common.min.js"></script>
    <script src="${hContext}/views/js/custom.min.js"></script>
    <script src="${hContext}/views/js/settings.js"></script>
    <script src="${hContext}/views/js/gleek.js"></script>
    <script src="${hContext}/views/js/styleSwitcher.js"></script>
    <script type="text/javascript">
    //목록 화면으로 이동
    function goRetrieve(){
        location.href="${hContext}/nboard/do_retrieve.do?pageNum=1&nbNo=&pageSize=10&searchDiv=&searchWord=";
        //location.href="${hContext}/nboard/nboard_list.jsp";
    }

   //수정 화면으로 이동
    /* function doUpdateView() {
    	console.log("doUpdateView");
        var nbNo = ${vo.nbNo };
        console.log("nbNo : " + nbNo);
        var frm = document.searchFrm;
        frm.nbNo.value = nbNo;
        frm.action = "${hContext}/nboard/do_selectone_update.do";
        frm.submit();
    } */
    
  //수정 화면으로 이동
    $("#update_btn").on("click",function(){
	    	var nbNo = ${vo.nbNo };
	    	var readCnt = ${vo.readCnt };
	        console.log("nbNo:"+nbNo);
	        console.log("readCnt:"+readCnt);
             var frm = document.searchFrm;
             frm.nbNo.value = nbNo;
             frm.action = "${hContext}/nboard/do_selectone_update.do";
             frm.submit();
             
             
         });
    

    // 삭제하기 - 관리자만 보여짐
    $("#delete_btn").on("click",function(){
        console.log("delete_btn");
        var nbNo = ${vo.nbNo };
        //var nbNo = $("#nbNo").val();
        console.log("nbNo : "+nbNo);

        if(false==confirm("삭제 하시겠습니까?"))return;

        $.ajax({
                   type:"POST",
                   url:"${hContext}/nboard/do_delete.do",
                   dataType:"html", 
                   data:{"nbNo":nbNo  },
               success:function(data){ //성공
                    //alert(data);
                    //{"msgId":"1","msgMsg":"삭제 되었습니다.","num":0,"totalCnt":0}
                    var jData = JSON.parse(data);
                    if(null !=jData && jData.msgId=="1"){
                        alert(jData.msgMsg);
                        //목록화면으로 이동
                        goRetrieve();
                    }else{
                        alert(jData.msgMsg);
                        
                    }
               
               },
               error:function(xhr,status,error){
                   alert("error:"+error);
               },
               complete:function(data){
               
               }   
               
       });//--ajax
    });

    </script>
</body>

</html>