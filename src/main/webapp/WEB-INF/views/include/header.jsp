<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>funfun</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Place favicon.ico in the root directory -->
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath() %>/resources/images/favicon.ico">
<link rel="apple-touch-icon" href="apple-touch-icon.png">



<!-- All css files are included here. -->
<!-- Bootstrap fremwork main css -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css">

<!-- This core.css file contents all plugings css file. -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/core.css">
<!-- Theme shortcodes/elements style -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/shortcode/shortcodes.css">
<!-- Theme main style -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style.css">
<!-- Responsive css -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/responsive.css">
<!-- fonsaswame css -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/fa.all.min.css">
<!-- User style -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/custom.css">
<link href="<%=request.getContextPath()%>/resources/summernote/summernote.min.css" 
  		rel="stylesheet" />



</head>

<body>
	<!--[if lt IE 8]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>

    <![endif]-->  

    <!-- Body main wrapper start -->
    <div class="wrapper ">
        <!-- Start Header Style -->
        <header id="header" class="htc-header header--3 bg__white">
            <!-- Start Mainmenu Area -->
            <div id="sticky-header-with-topbar" class="mainmenu__area sticky__header">
                <div class="container">
                    <div class="row">
                        <div class="col-md-2 col-lg-2 col-sm-3 col-xs-3">
                            <div class="logo">
                                <a href="<%=request.getContextPath() %>/index">
                                    <h1 style="color:#dadce0; font-size:30px;">Funhading</h1>
                                </a>
                            </div>
                        </div>
                        <!-- Start MAinmenu Ares -->
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                            <nav class="mainmenu__nav hidden-xs hidden-sm">
                                <ul class="main__menu">
                                    <li class="drop"><a href="<%=request.getContextPath() %>/funding/list"><i class="fas fa-list-ul"></i> 프로젝트 둘러보기</a></li>
                                    <li class="drop"><a href="<%=request.getContextPath() %>/funding/agreements"><i class="fas fa-angle-double-up"></i> 프로젝트 올리기</a></li>
                                        
                                </ul>
                            </nav>
                                                  
                        </div>
                        <!-- End MAinmenu Ares -->
                        <div class="col-md-4 col-sm-4 col-xs-3">  
                            <ul class="menu-extra">
                            
                          
                                <c:if test="${empty loginUser}">
                                <li><a href="<%=request.getContextPath() %>/common/loginForm.do"><i class="fas fa-user"></i> 로그인 </a></li>
                                </c:if>
                                
                                <c:if test="${not empty loginUser }">
                                	<c:if test="${ loginUser.dist eq 'role_manager' }">
                                	<li><a href="<%=request.getContextPath()%>/manager/fList"><i class="fas fa-user-shield"></i> 매니저</a></li>
                                	</c:if>
                                  <li><a href="<%=request.getContextPath()%>/member/menu.do" data-toggle="modal" data-target="#mypageModal"><i class="fas fa-user"></i> ${loginUser.name }</a></li>
                            	 <li><a href="<%=request.getContextPath()%>/common/logout.do"><i class="fas fa-sign-out-alt"></i> 로그아웃</a></li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                   
                </div>
            </div>
            <!-- End Mainmenu Area -->
        </header>
        <!-- End Header Style -->

        <%@ include file="modal.jsp" %>
        
        
        
        
        
