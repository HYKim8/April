<%--
  /**
  * Class Name : nboard_list.jsp
  * Description : 전사 게시판 목록
    http://localhost:8080/groupware/nboard/do_retrieve.do?pageNum=1&pageSize=10&searchDiv=&searchWord=
  * Modification Information
  *
  *
  *   수정일                   수정자                      수정내용
  *  -------    --------    ---------------------------
  *
  * author 실행환경 개발팀
  * since 2009.01.06
  *
  * Copyright (C) 2009 by KandJang  All right reserved.
  */
--%>
<%@page import="com.april.groupware.member.service.UserVO"%>
<%@page import="com.april.groupware.cmn.StringUtil"%>
<%@page import="com.april.groupware.cmn.SearchVO"%>
<%@page import="com.april.groupware.code.service.CodeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/views/common/common.jsp"%>
<%
    //session
    /* UserVO userInfo = (UserVO) session.getAttribute("user");
    String auth = userInfo.getAuth();
    String id = userInfo.getId();
    out.print("auth : "+auth + " | ");
    out.print("id : "+id + " | "); */

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
    //out.print("search:"+search);
    
    List<CodeVO> searchList = (List<CodeVO>) request.getAttribute("searchList");
    //out.print("searchList:"+searchList);
    /*     for(CodeVO vo:searchList){
            out.print(vo.toString()+"<br/>");
        } */
    
    //pageSizeList
    List<CodeVO> pageSizeList = (List<CodeVO>) request.getAttribute("pageSizeList");
    //out.print("pageSizeList:"+pageSizeList);
    /*     for(CodeVO vo:pageSizeList){
            out.print(vo.toString()+"<br/>");
        }   */
    
    int totalCnt = 0;
    
    totalCnt = (Integer) request.getAttribute("totalCnt");
    //out.print("totalCnt:"+totalCnt);

    //paging
    String url = H_PATH+"/nboard/do_retrieve.do";
    String scriptName = "doSeachPage";
    int maxNum =0;//총글수
    int currPageNo=1;//현재페이지 
    int rowPerPage=10;
    int bottomCount=5;//바닥에 page
    
    if(null !=search){
        currPageNo = search.getPageNum();
        rowPerPage = search.getPageSize();
        maxNum     = totalCnt;
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
                            <li><a href="${hContext}/views/layout-one-column.html">One Column</a></li>
                            <li><a href="${hContext}/views/layout-two-column.html">Two column</a></li>
                            <li><a href="${hContext}/views/layout-compact-nav.html">Compact Nav</a></li>
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
                            <li><a href="./chart-chartist.html">Chartist</a></li>
                            <li><a href="./chart-sparkline.html">Sparkline</a></li>
                            <li><a href="./chart-peity.html">Peity</a></li>
                        </ul>
                    </li>
                    <li class="nav-label">UI Components</li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-grid menu-icon"></i><span class="nav-text">UI Components</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./ui-accordion.html">Accordion</a></li>
                            <li><a href="./ui-alert.html">Alert</a></li>
                            <li><a href="./ui-badge.html">Badge</a></li>
                            <li><a href="./ui-button.html">Button</a></li>
                            <li><a href="./ui-button-group.html">Button Group</a></li>
                            <li><a href="./ui-cards.html">Cards</a></li>
                            <li><a href="./ui-carousel.html">Carousel</a></li>
                            <li><a href="./ui-dropdown.html">Dropdown</a></li>
                            <li><a href="./ui-list-group.html">List Group</a></li>
                            <li><a href="./ui-media-object.html">Media Object</a></li>
                            <li><a href="./ui-modal.html">Modal</a></li>
                            <li><a href="./ui-pagination.html">Pagination</a></li>
                            <li><a href="./ui-popover.html">Popover</a></li>
                            <li><a href="./ui-progressbar.html">Progressbar</a></li>
                            <li><a href="./ui-tab.html">Tab</a></li>
                            <li><a href="./ui-typography.html">Typography</a></li>
                        <!-- </ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-layers menu-icon"></i><span class="nav-text">Components</span>
                        </a>
                        <ul aria-expanded="false"> -->
                            <li><a href="./uc-nestedable.html">Nestedable</a></li>
                            <li><a href="./uc-noui-slider.html">Noui Slider</a></li>
                            <li><a href="./uc-sweetalert.html">Sweet Alert</a></li>
                            <li><a href="./uc-toastr.html">Toastr</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="widgets.html" aria-expanded="false">
                            <i class="icon-badge menu-icon"></i><span class="nav-text">Widget</span>
                        </a>
                    </li>
                    <li class="nav-label">Forms</li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-note menu-icon"></i><span class="nav-text">Forms</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./form-basic.html">Basic Form</a></li>
                            <li><a href="./form-validation.html">Form Validation</a></li>
                            <li><a href="./form-step.html">Step Form</a></li>
                            <li><a href="./form-editor.html">Editor</a></li>
                            <li><a href="./form-picker.html">Picker</a></li>
                        </ul>
                    </li>
                    <li class="nav-label">Table</li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-menu menu-icon"></i><span class="nav-text">Table</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./table-basic.html" aria-expanded="false">Basic Table</a></li>
                            <li><a href="./table-datatable.html" aria-expanded="false">Data Table</a></li>
                        </ul>
                    </li>
                    <li class="nav-label">Pages</li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-notebook menu-icon"></i><span class="nav-text">Pages</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./page-login.html">Login</a></li>
                            <li><a href="./page-register.html">Register</a></li>
                            <li><a href="./page-lock.html">Lock Screen</a></li>
                            <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">Error</a>
                                <ul aria-expanded="false">
                                    <li><a href="${hContext}/views/page-error-404.html">Error 404</a></li>
                                    <li><a href="${hContext}/views/page-error-403.html">Error 403</a></li>
                                    <li><a href="${hContext}/views/page-error-400.html">Error 400</a></li>
                                    <li><a href="${hContext}/views//page-error-500.html">Error 500</a></li>
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
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Apps</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">Email</a></li>
                    </ol>
                    
                    
                </div>
            </div>
            <!-- row -->

            <div class="container-fluid">
            <div class="bootstrap-label">
               <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                            <div class="card-title">
                                    <h4>전사 게시판</h4><hr/>
                                </div>
        <!-- 검색영역 -->
        <div class="row">
            <div class="col-md-12">
                <form action="${hContext}/nboard/do_retrieve.do" class="form-inline" style="text-align: center;" 
                        name="searchFrm" method="get">
                    <input type="hidden" name="pageNum" id="pageNum" value="${vo.pageNum }">
                    <input type="hidden" name="nbNo" id="nbNo" />
                        <button style="margin-right:0.5em; text-align:center; height: 40px; align-self: right;" class="btn mb-1 btn-light" type="button" disabled="disabled">총 글 수 ${totalCnt }개</button>
                        <div class="form-group">
                        <%=StringUtil.makeSelectBox(pageSizeList, "pageSize", pageSize, false)%>&nbsp;&nbsp;
                        <%=StringUtil.makeSelectBox(searchList, "searchDiv", searchDiv, true)%>&nbsp;&nbsp;
                        <input type="text" style="height: 12px;" class="form-control input-sm"  
                        id="searchWord" name="searchWord" placeholder="검색어" value="${vo.searchWord }">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
                        <button style="margin-right:0.5em; text-align:center; height: 40px;" 
                                class="btn mb-1 btn-info" type="button" onclick="doRetrieve();">조회</button> 
<!--                         <button style="margin-right:0.5em; text-align:center; height: 40px;" 
                                class="btn mb-1 btn-light" type="button" onclick="doRetrieve();">조회</button>  -->
                        <!-- 마지막에 풀기 -->
                        <c:choose>
                           <c:when test="${9 eq user.auth}">
                              <button style="margin-right:0.5em; text-align:center; height: 40px;" 
	                                class="btn mb-1 btn-danger" type="button" 
	                                onclick="doInsertView();">게시글 작성</button>
                           </c:when>
                       </c:choose>
                     </div>   
                </form>
            </div>
        </div>
        <!--// 검색영역 -->

           <!-- 게시글 목록 -->
         <div class="table-responsive">
           <table class="table header-border table-hover verticle-middle" id="listTable">
<!--            <table class="table" id="listTable"> -->
               <thead>
                   <tr>
                       <th class="text-center" width="120">글번호</th>
                       <th class="text-center" width="150">분류</th>
                       <th class="text-center" width="800">제목</th>
                       <th class="text-center">등록자</th>
                       <th class="text-center">등록일</th>
                       <th class="text-center">조회수</th>
                   </tr>
               </thead>
               <tbody>
                    <c:choose>
                        <c:when test="${list.size()>0 }">
                            <c:forEach var="vo" items="${list }">
                                <tr>
                                    <td class="text-center hidden-sm hidden-xs">
                                            <c:out value="${vo.nbNo }" /></td>
                                    <td class="text-center"><c:out value="${vo.nbCategory }" /></td>
                                    <td class="text-left"><c:out value="${vo.nbTitle }" /></td>
                                    <td class="text-center"><c:out value="${vo.regId }" /></td>
                                    <td class="text-center hidden-sm hidden-xs  ">
                                        <c:out value="${vo.regDate }" /></td>
                                    <td class="text-right hidden-sm hidden-xs">
                                        <c:out value="${vo.readCnt }" /></td>
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
                    <div class="text-center">
			            <%=StringUtil.renderPaging(maxNum, currPageNo, rowPerPage, bottomCount, url, scriptName) %>
			        </div>
                 </ul>
             </nav> 
         <!--// pagenation -->
         <!-- </div> -->
          <!-- //게시글 목록 -->
                                                             
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

    //등록으로 화면 이동.
        function doInsertView() {
            console.log("doInsertView");
            location.href='${hContext}/views/nboard_wirte.jsp';
        }

        function doSeachPage(url,no){
            console.log("#url:"+url);
            console.log("#no:" + no);
            
            var frm = document.searchFrm;
            frm.pageNum.value = no;
            frm.action = url;
            frm.submit();

        }

        function doRetrieve() {
            console.log("doRetrieve");
            var frm = document.searchFrm;
            frm.pageNum.value = "1";
            frm.action = "${hContext}/nboard/do_retrieve.do";
            frm.submit();
        }

        $("#searchWord").on("keypress", function(e) {
            console.log("#searchWord");
            console.log("#searchWord:" + e.which);
            if (e.which == 13) {
                doRetrieve();
            }
        });

        //selecOne
        $("#listTable>tbody").on("click","tr",function(){
            // $(".sung").on("click",function(){
                 //console.log("sung #listTable>tbody");
                 var trs = $(this);
                 var tds = trs.children();
                 var nbNo = tds.eq(0).text();
                 console.log("nbNo:"+nbNo);
                 //board/do_selectone.do
                 var frm = document.searchFrm;
                 frm.nbNo.value = nbNo;
                 frm.action = "${hContext}/nboard/do_selectone.do";
                 frm.submit();
                 
                 //get location.href="getURL"            
                 //location.href="${hContext}/nboard/do_selectone.do?nbNo="+nbNo;
                 
             });

        
    </script>
</body>

</html>