<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/taglibs.jsp"%>
<link href="/resources/css/profile.css" rel="stylesheet">
<div class="container">		
	<div class="row user-menu-container square row1">
		<div class="col-md-7 user-details">
			<div class="row coralbg white">
				<div class="col-md-6 no-pad">
					<div class="user-pad">
						<h3>Welcome, ${user.fullName}</h3>
						<h4 class="white"><i class="fa fa-mobile login-field-icon"></i> ${user.mobileNumber}</h4>
						<h4 class="white"><i class="fa fa-envelope login-field-icon"></i> ${user.email}</h4>
						<button type="button" onClick="loadProfileForm()" class="btn btn-labeled btn-info" href="#">
						<span class="btn-label"><i class="fa fa-pencil"></i></span>Update</button>
					</div>
				</div>
				<div class="col-md-6 no-pad">
					<div class="user-image">
						<img src="http://blog.threedayrule.com/wp-content/uploads/2016/03/AdviceforMen.jpeg" class="img-responsive thumbnail">
					</div>
				</div>
			</div>
			<div class="row overview">
				<div class="col-md-4 user-pad text-center">
					<h3>Wallet Amount</h3>
					<h4><i class="fa fa-inr" aria-hidden="true"></i><span id="walletAmount">${user.amount}</span></h4>
					<span><a href="javascript:void(0);" onClick="loadRedeemForm();">Having coupon? Redeem Now</a></span>
				</div>
				<div class="col-md-4 user-pad text-center">
					<h3>FOLLOWING</h3>
					<h4>456</h4>
				</div>
				<div class="col-md-4 user-pad text-center">
					<h3>APPRECIATIONS</h3>
					<h4>4,901</h4>
				</div>				
			</div>
			<div style="border:2px soolid red;">
				<div class="panel-heading">
				<ul class="nav nav-tabs">
					<li  class="active">
						<a data-toggle="tab" href="#transactionsList" id="commonCouponsPurchased" onClick="loadTrnasactions('commonCouponsPurchaseHistory')"><h4>Common Coupons Purchased</h4></a>
					</li>	
					<li>
						<a data-toggle="tab" href="#transactionsList" id="otherCouponsPurchased" onClick="loadTrnasactions('otherCouponsPurchaseHistory')"><h4>Other Coupons Purchased</h4></a>
					</li>					
				</ul>
			</div>
			<div class="panel-body">
				<div class="tab-content">
					<div class="tab-pane fade in active" id="transactionsList">											
					</div>									
				</div>
			</div>
			</div>
		</div>
		<div class="col-md-1 user-menu-btns  user-details">
			<div class="btn-group-vertical square" id="responsive">
				<a href="javascript:void(0);" onClick="loadRedeemForm();"  class="btn btn-default active">
				  <i class="fa fa-money fa-3x" aria-hidden="true"></i>
				</a>
				<a href="javascript:void(0);" onClick="loadProfileForm();" class="btn btn-block btn-default">
				 <i class="fa fa-cog fa-3x" ></i>
				</a>				
				<a href="#" class="btn btn-default">
				  <i class="fa fa-laptop fa-3x"></i>
				</a>
				<a href="#" class="btn btn-default">
				  <i class="fa fa-cloud-upload fa-3x"></i>
				</a>
			</div>
		</div>
		<div class="col-md-4 user-menu user-pad ">
			<div id="profileContentDiv" class="user-menu-content active">				 
			</div>			 
		</div>
	</div>
</div>
<script type="text/javascript">

	function loadTrnasactions(type) {
		get("/transactionHistory?type="+type+"&ajax=true",'transactionsList');
	}
	
	function loadProfileForm() {
		get("/loadProfileForm",'profileContentDiv');
	}
	
	function loadRedeemForm() {
		get("/dashboard",'profileContentDiv');
	}	
	
	$(document).ready(function() {
		get("/dashboard",'profileContentDiv');
		var $btnSets = $('#responsive'),
		$btnLinks = $btnSets.find('a');
	 
		$btnLinks.click(function(e) {
			e.preventDefault();
			$(this).siblings('a.active').removeClass("active");
			$(this).addClass("active");
			var index = $(this).index();
			$("div.user-menu>div.user-menu-content").removeClass("active");
			$("div.user-menu>div.user-menu-content").eq(index).addClass("active");
		});
		
		$('#custom-after-scroll-bootstrap-menu').show();
		$('#menu_before_scroll').hide();
		$("[rel='tooltip']").tooltip();    
	 
		$('.view').hover(
			function(){
				$(this).find('.caption').slideDown(250); //.fadeIn(250)
			},
			function(){
				$(this).find('.caption').slideUp(250); //.fadeOut(205)
			}
		); 
		
		get("/transactionHistory?type=commonCouponsPurchaseHistory&ajax=true",'transactionsList');
	});
</script>