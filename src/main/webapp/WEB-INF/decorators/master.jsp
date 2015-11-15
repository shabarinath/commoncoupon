<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/includes/taglibs.jsp"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE HTML>
<html>
<head>
    <link rel="icon" type="image/x-icon" href="<c:url value="/resources/img/favicon.ico"/>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/flexslider.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/css/jquery.loadmask.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/css/magnific-popup.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/css/bjqs.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>">
	<!--<link rel="stylesheet/less" type="text/css" href="/customStyles?_ajax=true"> -->
	
    <script type="text/javascript" src="<c:url value="/resources/js/jquery-2.0.3.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-ui-1.10.3.custom.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/jquery.history.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/jquery.flexslider-min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/functions.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/jquery.form.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/bootbox.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/jquery.loadmask.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/jquery.magnific-popup.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/core.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/common.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/tinymce/tinymce.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/editor.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/bjqs-1.3.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/less-1.3.0.min.js"/>"></script>
    <decorator:head/>

</head>

<body>
 	 <div id="wrapper">
		<div class="shell">
			<div class="container">
				<header class="header services last-section">
					<!-- <h1 id="logo"><a href="/"></a></h1> -->
					<h1 style="float:left;padding-left:15px;">
						<img src="" style="width:80px; height:80px;border-radius:13px;" alt="Header Logo"/>
					</h1>
					<h1 id="headerMainTitle" class="title1">Header Title</h1>
					<hr style="background-color: #687A8D;margin:55px 0px 5PX 0;height:6px;border:0;">


					<div class="cl">&nbsp;</div>
				</header>
				<header class="header" style="padding-top:0px;">
					<sec:authorize access="isAuthenticated()">
						<nav id="navigation" style="margin-left:5px;">
							<ul>
								<li><a style="border-radius: 5px;  border: 1px solid #D7E1E8 !important;" href="<c:url value="/j_spring_security_logout"/>">Logout</a></li>
							</ul>
						</nav>
					</sec:authorize>
					
					<nav id="navigation">
						<ul>							
							<sec:authorize access="isAnonymous()">
								<li class="active"><a href="/login">Login</a></li>
							</sec:authorize>
						</ul>
					</nav>
					
					<div class="cl">&nbsp;</div>


				</header>
				<div class="main">
					<div class="leftDiv">
						<h1> Left Div</h1>
						
					</div>
					
					<div class="middleDiv" id="middleDiv">
						<decorator:body /> 
						
					</div>
					
					<div class="rightDiv" id="rightDiv">
						<h1>Right Div</h1>
					</div>
					<div class="cl">&nbsp;</div>
				</div>
			</div>
			<div class="footer">				
				<p class="copy">Copyright &copy; 2014 All Rights Reserved. Designed by <a href="http://techfunia.com" target="_blank" >Techfunia</a> </p>
			</div>
		</div>
	</div> 
</body>
</html>
