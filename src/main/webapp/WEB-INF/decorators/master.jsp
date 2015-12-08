<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/includes/taglibs.jsp"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		<meta name="description" content="">
		<meta name="author" content="">
		<!-- Commenting out! Must be added later!! -->
		<!-- <link rel="icon" href="../../favicon.ico">  -->
		<title>GiftYourLove</title>
		<!-- Bootstrap core CSS -->
		<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
		<link href="/resources/css/app-main.css" rel="stylesheet">
		<!--[if lt IE 9]><script src="/js/ie8-responsive-file-warning.js"></script><![endif]-->
		<script src="/resources/js/ie-emulation-modes-warning.js"></script>
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
		<!-- Custom addons for this template -->
		<link href="/resources/css/app-dashboard.css" rel="stylesheet">
		<link href="/resources/css/app-carousel.css" rel="stylesheet">
		<link href='http://fonts.googleapis.com/css?family=Roboto+Condensed|Pacifico|Fjalla+One|Source+Sans+Pro' rel='stylesheet' type='text/css'>
	</head>
	<body>
		<div class="navbar-wrapper visible-xs">
			<nav class="custom-bootstrap-menu navbar navbar-default navbar-static-top">
			  <div class="">
				<div class="navbar-header">
				  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				  </button>
				  <a class="navbar-brand" href="#">GiftYourLove</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
				  <ul class="nav navbar-nav">
						<li><a href="/" >Buy Our Exclusive Card</a>
						</li>
						<li><a href="/products">Redeem</a>
						</li>
				  </ul>
				</div>
			  </div>
			</nav>
		</div>
		<div class="nav navbar navbar-fixed-top hidden-xs">
			<div class="header-bg">
				<sec:authorize access="isAnonymous()">
					<a class="btn floatright" href="/login">Login</a>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<nav id="navigation" style="margin-left:5px;">
						<ul>
							<li><a class="btn floatright" href="<c:url value="/j_spring_security_logout"/>">Logout</a></li>
						</ul>
					</nav>
				</sec:authorize>
			</div>
		</div>
		  <!-- Bootstrap core JavaScript
		================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="/resources/js/bootstrap.min.js"></script>
		<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
		
		<script src="/resources/js/ie10-viewport-bug-workaround.js"></script>
		<script src="/resources/js/jquery.parallaxmouse.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
		<decorator:body /> 
		<div class="col-lg-12 footer">
			<div class="col-lg-6 text_left p_none">
				GiftYourLove &copy; GiftYourLove.com 2015
			</div>
			<div class="col-lg-6 text_right p_none">
				About Terms Of Use Privacy Policy
			</div>
		</div><!-- /.footer -->
	</body>
</html>
