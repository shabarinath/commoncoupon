<%@ page language="java" contentType="text/html; charset=Shift-JIS" pageEncoding="UTF-8"%>
<%@ include file="../includes/taglibs.jsp"%>
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
	<div class="content-wrapper glowing-border">
		  <form:form  commandName="commonCoupon" id="msform" name="couponForm" cssClass="form-horizontal" method="post" action="/saveCoupon">
			<!-- progressbar -->
			<ul id="progressbar">
				<li class="active">Amount</li>
				<li>Sender Details</li>
				<li>Recipient Details</li>
			</ul>
			<!-- fieldsets -->
			<fieldset>
				<h2 class="fs-title">Enter Amount</h2>				
				<!--<h3 class="fs-subtitle">This is step 1</h3> -->
				<spring:bind path="amount">
					<div class="control-group">					
						<div class="controls">
							<div class="input-prepend">
								<form:input path="amount" cssClass="textbox ${status.error ? 'errorInput' : ''}" placeholder="Amount" value="${amount}"/>
							</div>
						</div> 
					</div>
				</spring:bind>
				<input type="button" name="next" class="next action-button" value="Next" />
			</fieldset>
			<fieldset>
				<h2 class="fs-title">Sender Details</h2>
				<div style="">	
					<spring:bind path="sender.firstName">
						<div class="control-group">
							<div class="controls">
								<div class="input-prepend">
									<form:input path="sender.firstName" cssClass="textbox ${status.error ? 'errorInput' : ''}" placeholder="First Name"/>
								</div>
							</div> 
						</div>
					</spring:bind>
					<spring:bind path="sender.lastName">
					<div class="control-group">
						<div class="controls">
							<div class="input-prepend">
								<form:input path="sender.lastName" cssClass="textbox ${status.error ? 'errorInput' : ''}" placeholder="Last Name"/>
							</div>
						</div> 
					</div>
					</spring:bind>
					<spring:bind path="sender.mobileNumber">
					<div class="control-group">
						<div class="controls">
							<div class="input-prepend">
								<form:input path="sender.mobileNumber" cssClass="textbox ${status.error ? 'errorInput' : ''}" placeholder="Mobile"/>
							</div>
						</div> 
					</div>
					</spring:bind>
					<spring:bind path="sender.email">
					<div class="control-group">
						<div class="controls">
							<div class="input-prepend">
								<form:input path="sender.email" cssClass="textbox ${status.error ? 'errorInput' : ''}" placeholder="Email"/>
							</div>
						</div> 
					</div>
					</spring:bind>
				</div>				
				<input type="button" name="previous" class="previous action-button" value="Previous" />
				<input type="button" name="next" class="next action-button" value="Next" />
			</fieldset>
			<fieldset>
				<h2 class="fs-title">Recipient Details</h2>
				<h3 class="fs-subtitle">Gift Card will be mailed to this mail address</h3>
				<div style="">	
					<div class="control-group">
						<div class="controls">
							<div class="input-prepend">
								<form:input path="recipient.email" cssClass="textbox" placeholder="Email"/>
							</div>
						</div> 
					</div>
				</div>
				<input type="button" name="previous" class="previous action-button" value="Previous" />
				<input class="action-button" type="submit" value="Pay">
			</fieldset>
		</form:form>
	</div>
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

//jQuery time
var current_fs, next_fs, previous_fs; //fieldsets
var left, opacity, scale; //fieldset properties which we will animate
var animating; //flag to prevent quick multi-click glitches

$(".next").click(function(){
	if(animating) return false;
	animating = true;
	
	current_fs = $(this).parent();
	next_fs = $(this).parent().next();
	
	//activate next step on progressbar using the index of next_fs
	$("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
	
	//show the next fieldset
	next_fs.show(); 
	//hide the current fieldset with style
	current_fs.animate({opacity: 0}, {
		step: function(now, mx) {
			//as the opacity of current_fs reduces to 0 - stored in "now"
			//1. scale current_fs down to 80%
			scale = 1 - (1 - now) * 0.2;
			//2. bring next_fs from the right(50%)
			left = (now * 50)+"%";
			//3. increase opacity of next_fs to 1 as it moves in
			opacity = 1 - now;
			current_fs.css({'transform': 'scale('+scale+')'});
			next_fs.css({'left': left, 'opacity': opacity});
		}, 
		duration: 800, 
		complete: function(){
			current_fs.hide();
			animating = false;
		}, 
		//this comes from the custom easing plugin
		easing: 'easeInOutBack'
	});
});

$(".previous").click(function(){
	if(animating) return false;
	animating = true;
	console.log("previous123");
	current_fs = $(this).parent();
	previous_fs = $(this).parent().prev();
	
	//de-activate current step on progressbar
	$("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");
	
	//show the previous fieldset
	previous_fs.show(); 
	//hide the current fieldset with style
	current_fs.animate({opacity: 0}, {
		step: function(now, mx) {
			//as the opacity of current_fs reduces to 0 - stored in "now"
			//1. scale previous_fs from 80% to 100%
			scale = 0.8 + (1 - now) * 0.2;
			//2. take current_fs to the right(50%) - from 0%
			left = ((1-now) * 50)+"%";
			//3. increase opacity of previous_fs to 1 as it moves in
			opacity = 1 - now;
			current_fs.css({'left': left});
			previous_fs.css({'transform': 'scale('+scale+')', 'opacity': opacity});
		}, 
		duration: 800, 
		complete: function(){
			current_fs.hide();
			animating = false;
		}, 
		//this comes from the custom easing plugin
		easing: 'easeInOutBack'
	});
});
</script>