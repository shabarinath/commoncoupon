<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/taglibs.jsp"%>
<div id="wrapper" class="carousel slide carousel-div" data-ride="carousel">
	<img id="star1" class="parallax top star1" src="/resources/img/header_banner/star1.png"/>
	<img id="star2" class="parallax top star2" src="/resources/img/header_banner/star2.png"/>
	<img id="star3" class="parallax star3" src="/resources/img/header_banner/star3.png"/>
	<img id="star4" class="parallax left top star4" src="/resources/img/header_banner/star4.png"/>
	<img id="star5" class="parallax left star5" src="/resources/img/header_banner/star5.png"/>
	<img id="planet" class="parallax left top planet" src="/resources/img/header_banner/planet.png"/>
	<img id="robot" class="parallax top robot" src="/resources/img/header_banner/robot.png"/>
	<img id="astronaut" class="parallax top astronaut" src="/resources/img/header_banner/astronaut.png"/>
	<img id="asteroid" class="parallax asteroid" src="/resources/img/header_banner/asteroid.png"/>
	<div class="col-lg-12">
			<div class="col-lg-1"></div>
			<div class="col-lg-5 buy_ecard_panel">
				<div class="col-xs-12 p_none buy_ecard_panel_blinking_text">
					<span style="color: #12A2AF; font-size: 35px;">Easiest</span> 
					way to send 
					<span style="font-size: 27px;"> e-gift, do it Now </span>
				</div>
				<div class="col-xs-12 p_none buy_ecard_panel_form">
					<div class="col-xs-12 p_none form_number_display">
						<span id="current_leaf_num">1</span>/3
					</div>
					<form:form  commandName="commonCoupon" id="msform" name="couponForm" cssClass="form-horizontal" method="post" action="/saveCoupon">
					<!-- Leaf 1 -->
					<div class="col-xs-12 p_none form_leaf_1 " id="leaf_1">
						<div class="col-xs-12 p_none">
							Amount
						</div>
						<spring:bind path="amount">
							<div class="col-xs-8 p_none" style="margin-top: 20px;">
								<div class="form-group cus_text_box">
									<div class="input-group">
									  <div class="input-group-addon">Rs</div>									
									  <form:input path="amount" cssClass="form-control ${status.error ? 'errorInput' : ''}" placeholder="Amount" value="${amount}"/>
									</div>
								</div>
							</div>
						</spring:bind>
						<div class="col-xs-4 p_none next_arrow">
						  <i class="fa fa-arrow-circle-o-right" id="leaf_1_next_arrow"></i>
						</div>
					</div><!-- ./ Leaf 1 -->
					
					<!-- Leaf 2 -->
					<div class="col-xs-12 p_none form_leaf_2" id="leaf_2">
						<div class="col-xs-12 p_none give_ur_details">
							Give your details
						</div>
						<div class="col-xs-12 p_none">
							<div class="col-xs-10 p_none">
								<!-- first name + last name -->
								<div class="col-xs-12 p_none" style="margin-top: 25px;">
									<spring:bind path="sender.firstName">
										<div class="col-xs-6 p_none" style="padding-right: 15px;">  
											<div class="form-group cus_text_box">
											  <div class="input-group">												
												<form:input path="sender.firstName" cssClass="form-control p_none ${status.error ? 'errorInput' : ''}" placeholder="First Name"/>
											  </div>
											</div>
										</div>
									</spring:bind>
									<spring:bind path="sender.lastName">
										<div class="col-xs-6 p_none">  
											<div class="form-group cus_text_box">
											  <div class="input-group">										
												<form:input path="sender.lastName" cssClass="form-control p_none ${status.error ? 'errorInput' : ''}" placeholder="Last Name"/>
											  </div>
											</div>
										</div>
									</spring:bind>
								</div>
								<!-- email + mobile -->
								<div class="col-xs-12 p_none" style="margin-top: 25px;">
									<spring:bind path="sender.email">
										<div class="col-xs-6 p_none" style="padding-right: 15px;">  
											<div class="form-group cus_text_box">
											  <div class="input-group">												
												<form:input path="sender.email" cssClass="form-control p_none ${status.error ? 'errorInput' : ''}" placeholder="Email"/>
											  </div>
											</div>
										</div>
									</spring:bind>
									<spring:bind path="sender.mobileNumber">
										<div class="col-xs-6 p_none">  
											<div class="form-group cus_text_box">
											  <div class="input-group">											
												<form:input path="sender.mobileNumber" cssClass="form-control p_none ${status.error ? 'errorInput' : ''}" placeholder="Mobile"/>
											  </div>
											</div>
										</div>
									</spring:bind>
								</div>
							</div>
							<div class="col-xs-2 p_none next_arrow">
								<i class="fa fa-arrow-circle-o-right" id="leaf_2_next_arrow"></i>
								<br/>
								<i class="fa fa-arrow-circle-o-left"  id="leaf_2_previous_arrow"></i>
							</div>
						</div>
					</div><!-- ./ Leaf 2 -->
					
					<!-- Leaf 3 -->
					<div class="col-xs-12 p_none form_leaf_3 " id="leaf_3">
						<div class="col-xs-12 p_none">
							Give Recipient details
						</div>
						<div class="col-xs-8 p_none" style="margin-top: 20px;">
							<div class="form-group cus_text_box">
								<div class="input-group">
									<form:input path="recipient.email" cssClass="form-control p_none" placeholder="Email"/>
								</div>
							</div>
						</div>
						<div class="col-xs-4 p_none next_arrow">							
							<button type="submit" class="removeButtonBorder">
								<i class="fa fa-arrow-circle-o-right" id="leaf_3_next_arrow"></i>
							</button>
							<br/>
							<i class="fa fa-arrow-circle-o-left"  id="leaf_3_previous_arrow"></i>
							
						</div>
					</div><!-- ./ Leaf 3 -->
					</form:form>
				</div> <!-- ./buy_ecard_panel_form -->
			</div> <!-- ./buy_ecard_panel -->			
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
		<div class="col-lg-12 p_none update_box">
			<blockquote>
				<p>Unique theme, unique service. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
				<footer>Someone famous in <cite title="Source Title">Source Title</cite></footer>
			</blockquote>
		</div><!-- / updates panel -->
	</div>
</div><!-- /.center_box -->
<div class="how_it_works_panel">
		<div class="text_center p_none container">
			<div class="col-lg-12 p_none how_it_works">
				How It Works
			</div>
			<div class="col-lg-12 p_none">
				Gift your Love provides website design &amp; development, graphic design & print services, social media, and services for established and emerging artists. Our approach is greater than selling business cards, trifold brochures, mailers, eCommerce or informational websites, we strive to understand your business, your goals and your desired results. We then navigate our many services to create a custom package for you. We want to understand how you want it to work so we can make it work for you.
				Our customers and expertise span traditional brick & mortar, web-based, organizations & associations, government, real estate, events/venues, products, and service oriented businesses.
				<br/>
				Gift your Love provides website design &amp; development, graphic design & print services, social media, and services for established and emerging artists. Our approach is greater than selling business cards, trifold brochures, mailers, eCommerce or informational websites, we strive to understand your business, your goals and your desired results. We then navigate our many services to create a custom package for you. We want to understand how you want.
				Gift your Love provides website design & development, graphic design & print services, social media, and services for established and emerging artists. Our approach is greater than selling business cards, trifold brochures, mailers, eCommerce or informational websites, we strive to understand your business, your goals and your desired results. We then navigate our many services to create a custom package for you. We want to understand how you want it to work so we can make it work for you.
				Our customers and expertise span traditional brick.
				<br/>
				Gift your Love provides website design & development, graphic design & print services, social media, and services for established and emerging artists. Our approach is greater than selling business cards, trifold brochures, mailers, eCommerce or informational websites, we strive to understand your business, your goals and your desired results. We then navigate our many services to create a custom package for you. We want to understand how you want.
				<br/>
				Gift your Love provides website design & development, graphic design & print services, social media, and services for established and emerging artists. Our approach is greater than selling business cards, trifold brochures, mailers, eCommerce or informational websites, we strive to understand your business.
			</div>
		</div>
	</div><!-- /.how_it_works_panel  -->
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
	console.log( "ready!" );
	$('#leaf_2, #leaf_3').hide();
	
	/** leaf_1 arrow actions */
	$('#leaf_1_next_arrow').on( 'click', function(){
		$('#leaf_1').hide();
		$('#leaf_2').show();
		$('#current_leaf_num').html('2');
	});
	
	/** leaf_2 arrow actions */
	$('#leaf_2_next_arrow').on( 'click', function(){
		$('#leaf_1').hide();
		$('#leaf_2').hide();
		$('#leaf_3').show();
		$('#current_leaf_num').html('3');
	});
	$('#leaf_2_previous_arrow').on( 'click', function(){
		$('#leaf_2').hide();
		$('#leaf_3').hide();
		$('#leaf_1').show();
		$('#current_leaf_num').html('1');
	});
	
	/** leaf 3 arrow actions*/
	$('#leaf_3_previous_arrow').on( 'click', function(){
		$('#leaf_1').hide();
		$('#leaf_3').hide();
		$('#leaf_2').show();
		$('#current_leaf_num').html('2');
	});
});

</script>