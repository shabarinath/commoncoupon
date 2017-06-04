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
		
		<!-- 3rd party css resources -->
		<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
		<link href="/resources/css/font-awesome.min.css" rel="stylesheet">
		<link href="/resources/css/app-main.css" rel="stylesheet">
		<link href="/resources/css/hover.css" rel="stylesheet" media="all">
		<link href="/resources/css/jquery.loadmask.css" rel="stylesheet" media="all">
		
		<!-- Custom css addons -->
		<link href="/resources/css/app-dashboard.css" rel="stylesheet">
		<link href="/resources/css/app-carousel.css" rel="stylesheet">
		<link href='http://fonts.googleapis.com/css?family=Roboto+Condensed|Fjalla+One|Frijole' rel='stylesheet' type='text/css'>
		
		<!--[if lt IE 9]><script src="/js/ie8-responsive-file-warning.js"></script><![endif]-->
		<script src="/resources/js/ie-emulation-modes-warning.js"></script>
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
		
	</head>
	<body class="body">
	
		<!-- Exclusive menu for mobile	-->
		<div class="navbar-wrapper visible-xs visible-sm">
			<nav class="custom-bootstrap-menu navbar navbar-default navbar-static-top">
			  <div class="">
				<div class="navbar-header">
				  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				  </button>
				  <a class="navbar-brand" href="/">GiftYourLove</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
				  <ul class="nav navbar-nav">
					<li><a href="/" >Buy Our Exclusive Card</a></li>
					<li><a href="/mockup/redeemMock">Redeem</a></li>
				  </ul>
				</div>
			  </div>
			</nav>
		</div>



		<div id="custom-after-scroll-bootstrap-menu" class="navbar navbar-default navbar-fixed-top hidden-xs hidden-sm" role="navigation" style="display:none;">
		    <div class="container-fluid">
			<div class="navbar-header"><a class="navbar-brand" href="/">GiftYourLove</a>
			    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-menubuilder">
			    	<span class="sr-only">Toggle navigation</span>
			    	<span class="icon-bar"></span>
			    	<span class="icon-bar"></span>
			    	<span class="icon-bar"></span>
			    </button>
			</div>
			<div class="collapse navbar-collapse navbar-menubuilder">
			    <ul class="nav navbar-nav navbar-right">
			      <sec:authorize access="isAnonymous()">
					<a class="btn trans-border floatright hvr-underline-from-left" href="#" > How it works</a>
					<a class="btn trans-border floatright hvr-underline-from-left" href="#" > Who we are </a>
					<a class="btn trans-border floatright hvr-underline-from-left" href="#" data-toggle="modal" data-target="#login-modal" 
						id="login" onclick="openLoginForm();"> Get Vouchers /	Login
					</a>
					<a class="btn trans-border floatright hvr-underline-from-left" href="/" >
						Buy our exclusive e-card
					</a>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<li class="dropdown pull-right bg_and_border_none" id="userProfileId">
					    <a href="#" data-toggle="dropdown" class="dropdown-toggle btn trans-border user_pic">User <b class="caret"></b></a>
					    <ul class="dropdown-menu">
					    <li><a href="<c:url value="/profile"/>">Profile</a></li>
					    <li><a href="<c:url value="/mockup/profileMock"/>">ProfileNew</a></li>
					    <li><a href="<c:url value="/mockup/orderMock"/>">Transactions</a></li>
						<li><a href="<c:url value="/mockup/redeemMock"/>">Redeem</a></li>
						<li><a>History</a></li>
						<li><a>Report issue</a></li>
						<li class="divider"></li>
						<li><a href="<c:url value="/j_spring_security_logout"/>" >Logout</a></li>
					    </ul>
					</li>	
					
					<a class="btn trans-border floatright hvr-underline-from-left" href="#" > How it works</a>
					<a class="btn trans-border floatright hvr-underline-from-left" href="/voucher" > Get vouchers </a>
					<a class="btn trans-border floatright hvr-underline-from-left" href="/" > Buy our exclusive e-card</a>
				</sec:authorize>
			    </ul>
			</div>
		    </div>
		</div>



		<div class="nav navbar navbar-fixed-top hidden-xs hidden-sm" id="menu_before_scroll">
			<div class="header-bg">
				<a href="/" style="transform: rotate(346deg); font-size: xx-large; color: rgb(189, 25, 52);" class="navbar-brand">GiftYourLove</a>
				<sec:authorize access="isAnonymous()">
					<a class="btn trans-border floatright hvr-underline-from-left" href="#" > How it works</a>
					<a class="btn trans-border floatright hvr-underline-from-left" href="#" > Who we are </a>
					<a class="btn trans-border floatright hvr-underline-from-left" onclick="openLoginForm();" 
						id="login" href="#" data-toggle="modal" data-target="#login-modal"> Get Vouchers /	Login</a>
					<a class="btn trans-border floatright hvr-underline-from-left" href="/" >
						Buy our exclusive e-card</a>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					 <li class="dropdown pull-right bg_and_border_none" id="userProfileId">
					    <a href="#" data-toggle="dropdown" class="dropdown-toggle btn trans-border user_pic">User <b class="caret"></b></a>
					    <ul class="dropdown-menu">
					    <li><a href="<c:url value="/profile"/>">Profile</a></li>
					    <li><a href="<c:url value="/mockup/profileMock"/>">ProfileNew</a></li>
					    <li><a href="<c:url value="/mockup/orderMock"/>">Transactions</a></li>
						<li><a href="<c:url value="/mockup/redeemMock"/>">Redeem</a></li>
						<li><a>History</a></li>
						<li><a>Report issue</a></li>
						<li class="divider"></li>
						<li><a href="<c:url value="/j_spring_security_logout"/>" >Logout</a></li>
					    </ul>
					</li>
					<a class="btn trans-border floatright hvr-underline-from-left" href="#" > How it works</a>
					<a class="btn trans-border floatright hvr-underline-from-left" href="/voucher" > Get vouchers </a>
					<a class="btn trans-border floatright hvr-underline-from-left" href="/" > Buy our exclusive e-card</a>
				</sec:authorize>
			</div>
		</div>


		<!-- JavaScript Files
		================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="/resources/js/bootstrap.min.js"></script>
		<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
		<script src="/resources/js/ie10-viewport-bug-workaround.js"></script>
		<script src="/resources/js/jquery.parallaxmouse.min.js"></script>	
		<script src="/resources/js/jquery.form.js"></script>
		<script src="/resources/js/core.js"></script>
		<script src="/resources/js/jquery.loadmask.js"></script>
		
		
		<div id="container">
			<decorator:body /> 
		</div>
		
		<div class="major_footer_panel">
			<div class="p_none container">
				<div class="col-lg-12 p_none">
					<div class="col-lg-8 p_none">
						<ul class="list-inline major_footer_panel_menu_list_ul">
						  <li>Home</li>
						  <li>About Us</li>
						  <li>Contact Us</li>
						  <li>Members</li>
						  <li>Donate</li>
						  <li>My Account</li>
						  <li>Press</li>
						</ul>
						<ul class="list-inline major_footer_panel_social_icon_list_ul">
						  <li style="width: 90px;">Connect</li>
						  <li class="icons"><i class="fa fa-facebook-official"></i></li>
						  <li class="icons"><i class="fa fa-flickr"></i></li>
						  <li class="icons"><i class="fa fa-foursquare"></i></li>
						  <li class="icons"><i class="fa fa-google-plus-square"></i></li>
						  <li class="icons"><i class="fa fa-instagram"></i></li>
						  <li class="icons"><i class="fa fa-pinterest"></i></li>
						</ul>
					</div>
					<div class="col-lg-4 p_none">
						sdfeg
					</div>
				</div>
			</div>
		</div><!-- ./major_footer_panel -->
		
		
		<div class="mini_footer_panel">
			<div class="p_none container">
				<div class="col-lg-12 p_none">
					<div class="col-lg-6 text_left p_none">
						GiftYourLove &copy; GiftYourLove.com 2015
					</div>
					<div class="col-lg-6 text_right p_none">
						About Terms Of Use Privacy Policy
					</div>
				</div>
			</div>
		</div><!-- ./mini_footer_panel -->
		
		
		<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		</div>
	
	</body>
</html>
<script>
	function openLoginForm() {		
		doGet('/getLoginForm?_ajax=true',{	renderTo:'login-modal' });
	}
</script>
