<%@ page language="java" contentType="text/html; charset=Shift-JIS" pageEncoding="UTF-8"%>
<%@ include file="../includes/taglibs.jsp"%>
<body>
<div id="wrapper" class="carousel slide carousel-div" data-ride="carousel">
	<img id="star1" class="parallax top star1" src="/resources/img/header_banner/star1.png">
	<img id="star2" class="parallax top star2" src="/resources/img/header_banner/star2.png">
	<img id="star3" class="parallax star3" src="/resources/img/header_banner/star3.png">
	<img id="star4" class="parallax left top star4" src="/resources/img/header_banner/star4.png">
	<img id="star5" class="parallax left star5" src="/resources/img/header_banner/star5.png">
	<img id="planet" class="parallax left top planet" src="/resources/img/header_banner/planet.png">
	<img id="robot" class="parallax top robot" src="/resources/img/header_banner/robot.png">
	<img id="astronaut" class="parallax top astronaut" src="/resources/img/header_banner/astronaut.png">
	<img id="asteroid" class="parallax asteroid" src="/resources/img/header_banner/asteroid.png">
</div> 
<div class="header-angle-div">
</div>
<div class="height-15">
</div>
<div class="container center_box">
	<div class="left_panel col-lg-12">
		<!-- services panel -->
		<div class="col-lg-12 dashboard separator"><span>Available Coupons</span></div>
		<div class="col-lg-11 col-lg-offset-1">
			<div class="col-lg-3  p_none serp_box"><span>Flip Kart</span></div>
			<div style="visibility: hidden;" class="col-lg-1 p_none serp_box "></div>
			<div class="col-lg-3 p_none serp_box"><span>Sub way</span></div>
			<div style="visibility: hidden;" class="col-lg-1 p_none serp_box "></div>
			<div class="col-lg-3 p_none serp_box"><span>Snap Deal</span></div>
		</div><!-- / services panel -->
		<!-- history panel -->
		<div class="col-lg-12"><span>&nbsp;</span></div>
		<div class="col-lg-11 col-lg-offset-1">
			<div class="col-lg-3  p_none serp_box"><span>Kibana</span></div>
			<div style="visibility: hidden;" class="col-lg-1 p_none serp_box "></div>
			<div class="col-lg-3 p_none serp_box"><span>Amazon</span></div>
			<div style="visibility: hidden;" class="col-lg-1 p_none serp_box "></div>
			<div class="col-lg-3 p_none serp_box"><span>Ebay</span></div>
		</div><!-- / history panel -->
		<!-- updates panel -->
		<div class="col-lg-12 p_none update_box hidden">
			<blockquote>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
				<footer>Someone famous in <cite title="Source Title">Source Title</cite></footer>
			</blockquote>
		</div><!-- / updates panel -->
	</div>
</div><!-- /.center_box -->
 <script>
 $( document ).ready(function() {
	$(window).parallaxmouse({
		invert: true,
		range: 100,
		elms: [
			{el: $('#star1'), rate: 0.2},
			{el: $('#star2'), rate: 0.2},
			{el: $('#star3'), rate: 0.2},
			{el: $('#star4'), rate: 0.2},
			{el: $('#star5'), rate: 0.2},
			{el: $('#planet'), rate: 0.3},
			{el: $('#robot'), rate: 0.4},
			{el: $('#astronaut'), rate: 0.48},
			{el: $('#asteroid'), rate: 0.7}
		]
	});
});
</script>
<%-- <div class="homePageBox">   
    <form:form  commandName="commonCoupon" id="couponForm" name="couponForm" class="form-horizontal" method="post" action="/saveCoupon">
	<legend>Amount: </legend>
	<div style="">	
		<div class="control-group">
			<label class="control-label"><span class="required">*</span><b>Amount: </b></label>
			<div class="controls">
			    <div class="input-prepend">
					<form:input path="amount" cssClass="textbox" />
				</div>
				<p class="help-block error" >
			 		<span class="help-inline"><form:errors path="amount" cssClass="error"/></span>
				</p>
			</div> 
		</div>
	</div>
	<legend>Sender: </legend>
	<div style="">	
		<div class="control-group">
			<label class="control-label"><span class="required">*</span><b>First Name: </b></label>
			<div class="controls">
			    <div class="input-prepend">
					<form:input path="sender.firstName" cssClass="textbox" />
				</div>
				<p class="help-block error" >
			 		<span class="help-inline"><form:errors path="sender.firstName" cssClass="error"/></span>
				</p>
			</div> 
		</div>
		<div class="control-group">
			<label class="control-label"><span class="required">*</span><b>Last Name: </b></label>
			<div class="controls">
			    <div class="input-prepend">
					<form:input path="sender.lastName" cssClass="textbox" />
				</div>
				<p class="help-block error" >
			 		<span class="help-inline"><form:errors path="sender.lastName" cssClass="error"/></span>
				</p>
			</div> 
		</div>
		<div class="control-group">
			<label class="control-label"><span class="required">*</span><b>Mobile: </b></label>
			<div class="controls">
			    <div class="input-prepend">
					<form:input path="sender.mobileNumber" cssClass="textbox" />
				</div>
				<p class="help-block error" >
			 		<span class="help-inline"><form:errors path="sender.mobileNumber" cssClass="error"/></span>
				</p>
			</div> 
		</div>
		<div class="control-group">
			<label class="control-label"><span class="required">*</span><b>Email: </b></label>
			<div class="controls">
			    <div class="input-prepend">
					<form:input path="sender.email" cssClass="textbox" />
				</div>
				<p class="help-block error" >
			 		<span class="help-inline"><form:errors path="sender.email" cssClass="error"/></span>
				</p>
			</div> 
		</div>
	</div>
	<legend>Recipient: </legend>
	<div style="">	
		<div class="control-group">
			<label class="control-label"><b>Email: </b></label>
			<div class="controls">
			    <div class="input-prepend">
					<form:input path="recipient.email" cssClass="textbox" />
				</div>
				<p class="help-block error" >
			 		<span class="help-inline"><form:errors path="recipient.email" cssClass="error"/></span>
				</p>
			</div> 
		</div>
	</div>
	<div class="form-actions">
           <button class="btn btn-success" type="submit">Save Details</button>
           <a class="btn" href="/">Cancel</a>
       </div>
  </form:form>
</div> --%>