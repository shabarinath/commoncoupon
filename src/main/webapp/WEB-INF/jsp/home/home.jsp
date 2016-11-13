<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/taglibs.jsp"%>


<div class="carousel slide carousel-div" data-ride="carousel">
	<div class="col-lg-12">
	
		<div class="col-lg-1"></div>
	
		<div class="col-lg-5 buy_ecard_panel">
			
			<div class="col-xs-12 p_none buy_ecard_panel_blinking_text">
				<span style="color: #12A2AF; font-size: 27px;">Buy our exclusive 
					<span style="color:yellow;">All-in-one</span> 
				</span> 
				e-card & 
				<span style="font-size: 25px;"> experience the magic </span>
			</div>
			
			<div class="col-xs-12 p_none buy_ecard_panel_form">
				
				<div class="col-xs-12 p_none form_number_display">
					<div class="col-xs-8 p_none " style="text-align: left; font-size: 18px; letter-spacing: 3px;">
						<c:if test="${hasErrors}">
							*Please fill all the mandatory fields
						</c:if>
					</div>
					<div class="col-xs-4 p_none">
						<span id="current_leaf_num">1</span>/3
					</div>
				</div>
				
				<form:form commandName="commonCoupon" id="msform" name="couponForm" method="post" action="/saveCoupon">
					
					<!-- Leaf 1 -->
					<div class="col-xs-12 p_none form_leaf_1 " id="leaf_1">
						<div class="col-xs-12 p_none">
							Amount
						</div>
						<spring:bind path="amount">
							<div class="col-xs-8 p_none" style="margin-top: 20px;">
								<div class="form-group cus_text_box" style="margin-bottom: -2px;">
									<div class="input-group">
									  <div class="input-group-addon">Rs</div>									
									  <form:input id="amount" path="amount" type="number" cssClass="form-control ${status.error ? 'errorInput' : ''}" placeholder="INR" value="${amount}"/>
									</div>
								</div>
								<div class="coupon_required_field" id="amountValidationDiv"></div>
							</div>
						</spring:bind>
						<div class="col-xs-4 p_none next_arrow">
						  <i class="fa fa-arrow-circle-o-right" id="leaf_1_next_arrow"></i>
						</div>
					</div><!-- ./ Leaf 1 -->
					
					<!-- Leaf 2 -->
					<div class="col-xs-12 p_none form_leaf_2 displaynone" id="leaf_2">
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
												<form:input id="firstName" path="sender.firstName" cssClass="form-control p_none ${status.error ? 'errorInput' : ''}" placeholder="First Name"/>
											  </div>
											</div>
											<div class="coupon_required_field" id="firstNameValidationDiv"></div>
										</div>
									</spring:bind>
									<spring:bind path="sender.lastName">
										<div class="col-xs-6 p_none">  
											<div class="form-group cus_text_box">
											  <div class="input-group">										
												<form:input id="lastName" path="sender.lastName" cssClass="form-control p_none ${status.error ? 'errorInput' : ''}" placeholder="Last Name"/>
											  </div>
											</div>
											<div class="coupon_required_field" id="lastNameValidationDiv"></div>
										</div>
									</spring:bind>
								</div>
								<!-- email + mobile -->
								<div class="col-xs-12 p_none" style="margin-top: 25px;">
									<spring:bind path="sender.email">
										<div class="col-xs-6 p_none" style="padding-right: 15px;">  
											<div class="form-group cus_text_box">
											  <div class="input-group">												
												<form:input id="email" path="sender.email" cssClass="form-control p_none ${status.error ? 'errorInput' : ''}" placeholder="Email"/>
											  </div>
											</div>
											<div class="coupon_required_field" id="emailValidationDiv"></div>
										</div>
									</spring:bind>
									<spring:bind path="sender.mobileNumber">
										<div class="col-xs-6 p_none">  
											<div class="form-group cus_text_box">
											  <div class="input-group">											
												<form:input id="mobileNumber" path="sender.mobileNumber" type="number" cssClass="form-control p_none specialClsOverride ${status.error ? 'errorInput' : ''}" placeholder="Mobile"/>
											  </div>
											</div>
											<div class="coupon_required_field" id="mobileValidationDiv"></div>
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
					<div class="col-xs-12 p_none form_leaf_3 displaynone" id="leaf_3">
						<div class="col-xs-12 p_none">
							Give Recipient details
						</div>
						<spring:bind path="recipient.email">
							<div class="col-xs-8 p_none" style="margin-top: 20px;">
								<div class="form-group cus_text_box">
									<div class="input-group">
										<form:input id="recipientEmail" path="recipient.email" cssClass="form-control p_none ${status.error ? 'errorInput' : ''}" placeholder="Email"/>
									</div>
								</div>
								<div class="coupon_required_field" id="recipientEmailValidationDiv"></div>
							</div>
						</spring:bind>
						<div class="col-xs-4 p_none next_arrow">							
							<i class="fa fa-arrow-circle-o-right" id="leaf_3_next_arrow"></i>
							<br/>
							<i class="fa fa-arrow-circle-o-left"  id="leaf_3_previous_arrow"></i>
							
						</div>
					</div><!-- ./ Leaf 3 -->
					
				</form:form>
				
			</div> <!-- ./buy_ecard_panel_form -->

		</div> <!-- ./buy_ecard_panel -->
		
		
		<div class="col-lg-5 redeem_coupon_panel" style="display:none;">
			
			<div class="col-xs-12 p_none redeem_coupon_panel_blinking_text">
				<span style="color:yellow;">Woah !!</span> 
				<span style="color: #12A2AF; font-size: 27px;">you already had e-card, </span> 
				<span style="font-size: 25px;"> add it to wallet </span>
			</div>
			
			<div class="col-xs-10 p_none redeem_coupon_panel_form">
				<!-- Redeem Leaf 1 -->
				<div class="col-xs-12 p_none form_leaf_1">
					<div class="col-xs-12 p_none enter_card_details">
						Enter e-card details
					</div>
					<div class="col-xs-12 p_none" style="margin-top: 4px;">
						<div class="form-group cus_text_box">
							<div class="input-group">
							  <input class="form-control p_l_none" placeholder="code"/>
							</div>
						</div>
						<div class="coupon_required_field"></div>
						<div class="form-group cus_text_box">
							<div class="input-group">
							  <input class="form-control p_l_none" placeholder="password"/>
							</div>
						</div>
						<div class="coupon_required_field"></div>
					</div>
				</div><!-- ./ Redeem Leaf 1 -->
				<div class="col-xs-12 p_none">				
					<a class="btn trans-border floatright m_none font_inherit redeem_btn hvr-grow-rotate" href="#" data-toggle="modal" data-target="#login-modal">
						Redeem
					</a>
					<a class="btn trans-border floatright m_none font_inherit redeem_btn hvr-grow-rotate" href="#" data-toggle="modal" data-target="#login-modal">
						Proceed without redeem
					</a>
				</div>
			</div> <!-- ./redeem_coupon_panel_form -->
		
		</div> <!-- ./redeem_coupon_panel -->
		
					
	</div>
</div> 


<div class="header-angle-div"></div>


<div class="height-15"></div>


<div class="container center_box">
	<div class="left_panel col-lg-12">
		<div class="col-lg-12 dashboard separator"><span>Available Coupons</span></div>
		<div class="col-lg-11 col-lg-offset-1">
			<div class="col-lg-3  p_none serp_box"><span>Flip Kart</span></div>
			<div style="visibility: hidden;" class="col-lg-1 p_none serp_box "></div>
			<div class="col-lg-3 p_none serp_box"><span>Sub way</span></div>
			<div style="visibility: hidden;" class="col-lg-1 p_none serp_box "></div>
			<div class="col-lg-3 p_none serp_box"><span>Snap Deal</span></div>
		</div>
		<div class="col-lg-12"><span>&nbsp;</span></div>
		<div class="col-lg-11 col-lg-offset-1">
			<div class="col-lg-3  p_none serp_box"><span>BookMyShow</span></div>
			<div style="visibility: hidden;" class="col-lg-1 p_none serp_box "></div>
			<div class="col-lg-3 p_none serp_box"><span>Amazon</span></div>
			<div style="visibility: hidden;" class="col-lg-1 p_none serp_box "></div>
			<div class="col-lg-3 p_none serp_box"><span>Ebay</span></div>
		</div>
		<div class="col-lg-12 p_none update_box">
			<blockquote>
				<p>Unique theme, unique service. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
				<footer>Someone famous in <cite title="Source Title">Source Title</cite></footer>
			</blockquote>
		</div>
	</div>
</div><!-- /.center_box -->


<div class="how_it_works_panel">
	<div class="p_none container">
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
	$('#amount').focus();

	/** leaf_1 arrow actions */
	$('#leaf_1_next_arrow').on( 'click', function(){
		if(isAmountInvalid()){
			return false;
		}
		$('#leaf_1').hide();
		$('#leaf_2').show();
		$('#current_leaf_num').html('2');
	});
	
	/** leaf_2 arrow actions */
	$('#leaf_2_next_arrow').on( 'click', function(){
		var fnInvlaidFlag = isFirstNameInvalid();
		var lnInvlaidFlag = isLastNameInvalid();
		var emailInvlaidFlag = isEmailInvalid();
		var mobileInvlaidFlag = isMobileInvalid();
		if( fnInvlaidFlag || lnInvlaidFlag || emailInvlaidFlag || mobileInvlaidFlag ){
			return false;
		}
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
	$('#leaf_3_next_arrow').on( 'click', function(){
		var recipientEmailInvalidFlag = isRecipientEmailInvalid();
		if(recipientEmailInvalidFlag){
			return false;
		}
		submitForm('msform','_finish','container');
	});
	$('#leaf_3_previous_arrow').on( 'click', function(){
		$('#leaf_1').hide();
		$('#leaf_3').hide();
		$('#leaf_2').show();
		$('#current_leaf_num').html('2');
	});
	
	function isAmountInvalid(){
		$('#amountValidationDiv').html('');
		var box_value = $('#amount').val();
		if(findIfEmpty(box_value)){
			$('#amountValidationDiv').html('Required *');
			return true;
		}
		var couponAmount = parseFloat(box_value);
		if(couponAmount < 500){
			$('#amountValidationDiv').html('must be atleast Rs.500');
			return true;
		}
		return false;
	}
	
	function isFirstNameInvalid(){
		$('#firstNameValidationDiv').html('');
		var fn = $('#firstName').val();
		if(findIfEmpty(fn)){
			$('#firstNameValidationDiv').html('Required *');
			return true;
		}
		if(findLength(fn) < 4){
			$('#firstNameValidationDiv').html('min size is 4 chars');
			return true;
		}
	}
	
	function isLastNameInvalid(){
		$('#lastNameValidationDiv').html('');
		var ln = $('#lastName').val();
		if(findIfEmpty(ln)){
			$('#lastNameValidationDiv').html('Required *');
			return true;
		}
		if(findLength(ln) < 4){
			$('#lastNameValidationDiv').html('min size is 2 char');
			return true;
		}
	}
	
	function isEmailInvalid(){
		$('#emailValidationDiv').html('');
		var email = $('#email').val();
		if(findIfEmpty(email)){
			$('#emailValidationDiv').html('Required *');
			return true;
		}
		if(!isEmail(email)){
			$('#emailValidationDiv').html('invalid email');
			return true;
		}
	}
	
	function isMobileInvalid(){
		$('#mobileValidationDiv').html('');
		var mobValue = $('#mobileNumber').val();
		if(findIfEmpty(mobValue)){
			$('#mobileValidationDiv').html('Required *');
			return true;
		}
		if(validatePhone(mobValue) == false){
			$('#mobileValidationDiv').html('invalid number');
			return true;
		}
	}
	
	function isRecipientEmailInvalid(){
		$('#recipientEmailValidationDiv').html('');
		var recipientEmailValue = $('#recipientEmail').val();
		if(findIfEmpty(recipientEmailValue)){
			$('#recipientEmailValidationDiv').html('Required *');
			return true;
		}
		if(!isEmail(recipientEmailValue)){
			$('#recipientEmailValidationDiv').html('invalid email');
			return true;
		}
	}
	
	function findLength(value){
		return $.trim(value).length;
	}
	
	function findIfEmpty(value){
		if(!$.trim(value).length) { 
			return true;
		}
		return false;
	}
	
	function isEmail(email) {
		var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		return regex.test(email);
	}
	
	function validatePhone(field) {
	    if (field.match(/^\d{10}/)) {
	         return true;
	    }
	    return false;
	}

	$(window).scroll(function() {
	    var height = $(window).scrollTop();
	    if(height > 60) {
			$('#menu_before_scroll').hide();
			$('#custom-after-scroll-bootstrap-menu').show();
	    } else {
			$('#custom-after-scroll-bootstrap-menu').hide();
			$('#menu_before_scroll').show();
		}
	});

});
</script>
