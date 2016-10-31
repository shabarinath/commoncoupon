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
						<button type="button" class="btn btn-labeled btn-info" href="#">
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
					<h4><i class="fa fa-inr" aria-hidden="true"></i>${user.amount}</h4>
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
					<!--<div class="tab-pane fade" id="tab2default">
						<div class="row form-group">
							<div class="col-sm-2">
								Headache
							</div>
							<div class=" col-sm-3 btn-group" data-toggle=
							"buttons">
								<label class=
								"btn btn-primary btn-sm active"><input autocomplete="off"
								checked type="checkbox">Yes</label>
								<label class=
								"btn btn-primary btn-sm"><input autocomplete="off"
								type="checkbox">No</label>
							</div>
						</div>						
					</div>
					<div class="tab-pane fade in active" id="tab3default">
						<div class="row form-group">
							<div class="col-sm-2">
								Headache
							</div>
							<div class=" col-sm-3 btn-group" data-toggle=
							"buttons">
								<label class=
								"btn btn-primary btn-sm active"><input autocomplete="off"
								checked type="checkbox">Yes</label>
								<label class=
								"btn btn-primary btn-sm"><input autocomplete="off"
								type="checkbox">No</label>
							</div>
						</div>						
					</div> -->					
				</div>
			</div>
			</div>
		</div>
		<div class="col-md-1 user-menu-btns  user-details">
			<div class="btn-group-vertical square" id="responsive">
				<a href="#" class="btn btn-block btn-default active">
				  <i class="fa fa-bell-o fa-3x"></i>
				</a>
				<a href="#" class="btn btn-default">
				  <i class="fa fa-envelope-o fa-3x"></i>
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
			<div class="user-menu-content active">
				<h3>
					Recent Interactions
				</h3>
				<ul class="user-menu-list">
					<li>
						<h4><i class="fa fa-user coral"></i> Roselynn Smith followed you.</h4>
					</li>
					<li>
						<h4><i class="fa fa-heart-o coral"></i> Jonathan Hawkins followed you.</h4>
					</li>
					<li>
						<h4><i class="fa fa-paper-plane-o coral"></i> Gracie Jenkins followed you.</h4>
					</li>
					<li>
						<button type="button" class="btn btn-labeled btn-success" href="#">
							<span class="btn-label"><i class="fa fa-bell-o"></i></span>View all activity</button>
					</li>
				</ul>
			</div>
			<div class="user-menu-content">
				<h3>
					Your Inbox
				</h3>
				<ul class="user-menu-list">
					<li>
						<h4>From Roselyn Smith <small class="coral"><strong>NEW</strong> <i class="fa fa-clock-o"></i> 7:42 A.M.</small></h4>
					</li>
					<li>
						<h4>From Jonathan Hawkins <small class="coral"><i class="fa fa-clock-o"></i> 10:42 A.M.</small></h4>
					</li>
					<li>
						<h4>From Georgia Jennings <small class="coral"><i class="fa fa-clock-o"></i> 10:42 A.M.</small></h4>
					</li>
					<li>
						<button type="button" class="btn btn-labeled btn-danger" href="#">
							<span class="btn-label"><i class="fa fa-envelope-o"></i></span>View All Messages</button>
					</li>
				</ul>
			</div>
			<div class="user-menu-content">
				<h3>
					Trending
				</h3>
				<div class="row">
					<div class="col-md-6">
						<div class="view">
							<div class="caption">
								<p>47LabsDesign</p>
								<a href="" rel="tooltip" title="Appreciate"><span class="fa fa-heart-o fa-2x"></span></a>
								<a href="" rel="tooltip" title="View"><span class="fa fa-search fa-2x"></span></a>
							</div>
							<img src="http://24.media.tumblr.com/273167b30c7af4437dcf14ed894b0768/tumblr_n5waxesawa1st5lhmo1_1280.jpg" class="img-responsive">
						</div>
						<div class="info">
							<p class="small" style="text-overflow: ellipsis">An Awesome Title</p>
							<p class="small coral text-right"><i class="fa fa-clock-o"></i> Posted Today | 10:42 A.M.</small>
						</div>
						<div class="stats turqbg">
							<span class="fa fa-heart-o"> <strong>47</strong></span>
							<span class="fa fa-eye pull-right"> <strong>137</strong></span>
						</div>
					</div>
					<div class="col-md-6">
						<div class="view">
							<div class="caption">
								<p>47LabsDesign</p>
								<a href="" rel="tooltip" title="Appreciate"><span class="fa fa-heart-o fa-2x"></span></a>
								<a href="" rel="tooltip" title="View"><span class="fa fa-search fa-2x"></span></a>
							</div>
							<img src="http://24.media.tumblr.com/282fadab7d782edce9debf3872c00ef1/tumblr_n3tswomqPS1st5lhmo1_1280.jpg" class="img-responsive">
						</div>
						<div class="info">
							<p class="small" style="text-overflow: ellipsis">An Awesome Title</p>
							<p class="small coral text-right"><i class="fa fa-clock-o"></i> Posted Today | 10:42 A.M.</small>
						</div>
						<div class="stats turqbg">
							<span class="fa fa-heart-o"> <strong>47</strong></span>
							<span class="fa fa-eye pull-right"> <strong>137</strong></span>
						</div>
					</div>
				</div>
			</div>
			<div class="user-menu-content">
				<h2 class="text-center">
					START SHARING
				</h2>
				<center><i class="fa fa-cloud-upload fa-4x"></i></center>
				<div class="share-links">
					<center><button type="button" class="btn btn-lg btn-labeled btn-success" href="#" style="margin-bottom: 15px;">
							<span class="btn-label"><i class="fa fa-bell-o"></i></span>A FINISHED PROJECT
					</button></center>
					<center><button type="button" class="btn btn-lg btn-labeled btn-warning" href="#">
							<span class="btn-label"><i class="fa fa-bell-o"></i></span>A WORK IN PROGRESS
					</button></center>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">

	function loadTrnasactions(type) {
		get("/transactionHistory?type="+type+"&ajax=true",'transactionsList');
	}
		
	$(document).ready(function() {
		
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