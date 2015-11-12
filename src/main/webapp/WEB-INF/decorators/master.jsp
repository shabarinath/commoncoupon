<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/includes/taglibs.jsp"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE HTML>
<html>
<head>
    <link rel="icon" type="image/x-icon" href="<c:url value="/resources/img/favicon.ico"/>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<style type="text/css">
		@font-face {
			font-family: 'IM_FELL_English_SC';
			src: url('/resources/css/fonts/IMFeENsc28P.eot');
			src: url('/resources/css/fonts/IMFeENsc28P.eot?#iefix')
				format('embedded-opentype'),
				url('/resources/css/fonts/IMFeENsc28P.woff') format('woff'),
				url('/resources/css/fonts/IMFeENsc28P.ttf') format('truetype'),
				url('/resources/css/fonts/IMFeENsc28P.svg#IM_FELL_English_SC')
				format('svg');
		}
	</style>
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
						<img src="/images/${homePage.collegeLogoRelativePath}" style="width:80px; height:80px;border-radius:13px;" alt="College Logo"/>
					</h1>
					<h1 id="headerMainTitle" class="title1">${homePage.headerText}</h1>
					<h1 id="headerSubTitle" class="title2">${homePage.headerCity}</h1>
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
							<li class="active"><a href="/">Home</a></li>
							<li id="aboutCollegeLink" class="aboutCollegeLink active_toggle"><a href="javascript:void(0);">About College</a></li>
							<li id="ADMINISTRATION" class="active_toggle desc_link"><a href="javascript:void(0);">Administration</a></li>
							<li id="CITIZEN_CHARTER" class="active_toggle desc_link"><a href="javascript:void(0);">Citizen Charter</a></li>
							<li id="RTI_ACT" class="active_toggle resource_link"><a href="javascript:void(0);">RTI Act</a></li>
							<li id="ANTI_RAGGING_ACT" class="active_toggle resource_link"><a href="javascript:void(0);">Anti Ragging Act</a></li>
							<li id="GALLERY" class="active_toggle resource_link"><a href="javascript:void(0);">Gallery</a></li>
							<sec:authorize access="isAnonymous()">
								<li id="CONTACT_US" class="last active_toggle desc_link"><a href="/login">Login</a></li>
							</sec:authorize>
						</ul>
					</nav>
					
					<div class="cl">&nbsp;</div>


				</header>
				<div class="main">
					<div class="leftDiv">
						<nav id="vertical-navigation" style="height:395px;">
							<ul>
								<li id="STUDENTS_CORNER" class="active_toggle resource_link"><a href="javascript:void(0);">Students Corner</a></li>
								<li id="RESULTS" class="active_toggle resource_link"><a href="javascript:void(0);">Results</a></li>
								<li id="NOTIFICATIONS" class="active_toggle resource_link"><a href="javascript:void(0);">Notification</a></li>
								<li id="COURSES" class="active_toggle"><a href="javascript:void(0);">Courses</a></li>
								<li id="DEPARTMENTS" class="active_toggle"><a href="javascript:void(0);">Departments</a></li>
								<li id="STAFF_DETAILS" class="active_toggle"><a href="javascript:void(0);">Staff Details</a></li>
								<li id="INFRASTRUCTURE" class="active_toggle desc_link"><a href="javascript:void(0);">Infrastructure</a></li>
								<li id="HOSTEL" class="active_toggle desc_link"><a href="javascript:void(0);">Hostel</a></li>
								<li id="PLACEMENTS" class="active_toggle resource_link"><a href="javascript:void(0);">Placements</a></li>
								<li id="ALUMNI" class="active_toggle resource_link"><a href="javascript:void(0);">Alumni</a></li>
								<li id="DOWNLOADS" class="active_toggle resource_link"><a href="javascript:void(0);">Downloads</a></li>
								<li id="TENDERS" class="active_toggle resource_link"><a href="javascript:void(0);">Tenders</a></li>
						
							</ul>
						</nav>
						
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<nav id="vertical-navigation" style="clear:both; height:115px;">
								<ul>
									<li id="editHomePage" class="active_toggle"><a href="javascript:void(0);">Edit Home Page</a></li>
									<li id="otherRelatedLinks"class="active_toggle"><a href="javascript:void(0);">Other Related Links</a></li>
									<li id="noticeBoardLinks" class="active_toggle"><a href="javascript:void(0);">Notice Board Links</a></li>
								</ul>
							</nav>
						</sec:authorize>
						
						<div id="otherRelatedLinksMenu" style="">
							<c:import url="/otherRelatedLinksMenu?_ajax=true"></c:import>
						</div>
						
					</div>
					
					<div class="middleDiv" id="middleDiv">
						<decorator:body /> 
						
					</div>
					
					<div class="rightDiv" id="rightDiv">
						<div class="homePageBox principal">
							<h4>Principal</h4>
							<img src="/images/${homePage.principalPhotoRelativePath}" style="width:140px; height:140px;border-radius:13px;" alt="Principal Photo"/>
							<p style="text-transform: capitalize; word-break:break-all; font-weight: bold; font-size: 16px;">${homePage.principalName}</p>
							<b>${homePage.principalQualification}</b>
				        </div>
						<div id="noticeBoardDiv" class="homePageBox noticeBoard">
							<c:import url="/noticeBoardLinksMenu?_ajax=true"></c:import>
						</div>
					</div>
					<div class="cl">&nbsp;</div>
				</div>
			</div>
			<div class="footer">
				<nav class="footer-nav">
					<ul>
						<li class="active"><a href="/">Home</a></li>
						<li class="footer_link aboutCollegeLink active_toggle"><a href="javascript:void(0);">About College</a></li>
						<li id="ADMINISTRATION" class="footer_link active_toggle desc_link"><a href="javascript:void(0);">Administration</a></li>
						<li id="CITIZEN_CHARTER" class="footer_link active_toggle desc_link"><a href="javascript:void(0);">Citizen Charter</a></li>
						<li id="RTI_ACT" class="footer_link active_toggle resource_link"><a href="javascript:void(0);">RTI Act</a></li>
						<li id="ANTI_RAGGING_ACT" class="footer_link active_toggle resource_link"><a href="javascript:void(0);">Anti Ragging Act</a></li>
						<li id="GALLERY" class="footer_link active_toggle resource_link"><a href="javascript:void(0);">Gallery</a></li>
						<li id="CONTACT_US" class="footer_link last active_toggle desc_link"><a href="javascript:void(0);">Contact Us</a></li>
					</ul>
				</nav>
				<p class="copy">Copyright &copy; 2014 All Rights Reserved. Designed by <a href="http://techfunia.com" target="_blank" >Techfunia</a> </p>
			</div>
		</div>
	</div> 
</body>
<script>
first3=24;second3=first3+6; third3=first3+second3; fourth3=first3+second3+third3; fifth3=fourth3/third3*first3; sixth3=third3*first3/12*second3; seventh3=first3+second3/fifth3-16*fourth3; eighth3=sixth3*(first3-5)/third3+fourth3; ninth3=eighth3/seventh3+first3*third3-fourth3;tenth3=(ninth3+first3/third3*fourth3+second3*fifth3)/sixth3+eighth3-ninth3-1;eleventh3=Math.floor(tenth3);twelfth3=eleventh3-2*second3;
var first2=":: Techfunia ::";var thirteenth=1;var ninth=1;function fifteenth() {
document.title=first2.substring(twelfth3, thirteenth);
if (thirteenth >= first2.length) {thirteenth=1;window.setTimeout("eighth2()",300); } else {thirteenth++;
window.setTimeout("fifteenth()",70); } }function eighth2() {
document.title=first2.substring(thirteenth, first2.length);
if (thirteenth >= first2.length) {thirteenth=1;
document.title = "\xa0";
window.setTimeout("fifteenth()", 100);
} else {thirteenth++;window.setTimeout("eighth2()", 80);}}window.onload=fifteenth;

$(".resource_link").click(function() {
	if ($("#middleDiv").length > 0) {
		get("/resource/"+$(this).attr('id'),'middleDiv');
	} else {
		window.location.href = "/?loadTab="+$(this).attr('id');
	}
});

$(".desc_link").click(function() {
	if ($("#middleDiv").length > 0) {
		get("/description/"+$(this).attr('id'),'middleDiv');
	} else {
		window.location.href = "/?loadTab="+$(this).attr('id');
	}
});

$("#COURSES").click(function() {
	get("/courses",'middleDiv');
});

$("#DEPARTMENTS").click(function() {
	get("/departments",'middleDiv');
});

$("#STAFF_DETAILS").click(function() {
	get("/staffDetails",'middleDiv');
});

$( ".aboutCollegeLink" ).click(function() {
	get("/aboutCollege",'middleDiv');
});

<sec:authorize access="hasRole('ROLE_ADMIN')">
	$( "#editHomePage" ).click(function() {
		get("/editHomePage",'middleDiv');
	});
	
	$( "#otherRelatedLinks" ).click(function() {
		get("/otherRelatedLinksList",'middleDiv');
	});
	$( "#noticeBoardLinks" ).click(function() {
		get("/noticeBoardLinksList",'middleDiv');
	});
</sec:authorize>

$(".active_toggle").click(function() {
	$("li").removeClass("active");
	$(this).addClass("active");
	resetTitles();
});

$(".footer_link").click(function() {
	scrollToDiv('wrapper');
});

function scrollToDiv(divId, milliSeconds) {
	if(!milliSeconds) {
		milliSeconds = 1500;
	}
	$('html,body').animate({scrollTop: $("#"+divId).offset().top}, milliSeconds);
}

function resetTitles() {
	$('#headerMainTitle').html('<c:out value="${homePage.headerText}" escapeXml="true"/>');
	$('#headerSubTitle').html('<c:out value="${homePage.headerCity}" escapeXml="true"/>');
}
</script>
</html>
