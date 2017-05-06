<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/taglibs.jsp"%>

<div class="get_voucher_panel">
	<div class="text_center p_none container">	
		<div class="col-lg-9 p_none text_center">
			<div class="col-lg-12 p_none had_our_ecard">
				<div style="font-size: 19px; letter-spacing: 4px;">				
					Had our e-card ? 
				</div>
				<div>
					<span onclick="expandRedeemForm();" style="cursor:pointer;" id="redeemBtn">[ Redeem ]</span>
				</div>
			</div>
			<div class="col-lg-12">
				<form id="redeemForm" name="redeemForm" style="width: 60%; margin: auto auto 10px; border: 1px solid rgb(222, 216, 216); padding: 18px; text-align: left; display: none;" >
					<div style="text-align: right;" class="form-group">
					    <i class="fa fa-times" aria-hidden="true" onclick="closeRedeemForm();" style="cursor:pointer;"></i>
					</div>  
					<div class="form-group">
					<label>Coupon details</label>
					<input placeholder="Enter coupon code" class="form-control">
					</div>
					<div class="form-group">
					<input placeholder="Enter coupon password" class="form-control">
					</div>
					<button style="" type="submit" class="btn btn-default">Submit</button>
				</form>
			</div>
			<div class="col-lg-12 p_none text_center coupons_wrapper_main">
				<div class="col-lg-12 p_none coupon_wrapper_single">
					<form:form  commandName="couponsListWrapper" id="couponsListWrapperForm" name="couponsListWrapperForm" method="post" action="/saveVoucher">
						<c:forEach var="coupon" varStatus="couponStatus" items="${couponsListWrapper.couponsList}">
							<c:set var="couponIdentifier" value="${coupon.name}"/>
							<c:if test="${couponIdentifier eq 'FOOD PANDA'}">
							   <c:set var="couponIdentifier" value="${FOODPANDA}"/>
							</c:if>
							<form:hidden path="couponsList[${couponStatus.index}].name"/>
							<form:hidden path="couponsList[${couponStatus.index}].description"/>
							<form:hidden path="couponsList[${couponStatus.index}].imageUrlBig"/>
							<form:hidden path="couponsList[${couponStatus.index}].imageUrlMedium"/>
							<form:hidden path="couponsList[${couponStatus.index}].imageUrlSmall"/>
							<form:hidden path="couponsList[${couponStatus.index}].voucherPicked" id="checkbox_${couponIdentifier}"/>
							<div class="col-lg-4 p_none">
								<div class="coupon_box hovereffect border_right_none border_bottom_none">
							        <img class="img-responsive" src="${coupon.imageUrlBig}" alt="">
							        <div class="overlay" id="overlay_${couponIdentifier}">
							           	<h2>
											<div class="ribbon">
												<div class="ribbon-stitches-top"></div>
												<strong class="ribbon-content">
													<h1>${coupon.name}</h1>
												</strong>
												<div class="ribbon-stitches-bottom"></div>
											</div>
										</h2>
										<div>
											<div id="pick_${couponIdentifier}">
												<div>
													<a class="info" href="#">Details</a>
												</div>
												<div class="voucher_pickup">
													<form:select path="couponsList[${couponStatus.index}].amount" cssClass="voucher_selectbox" id="select_${couponIdentifier}">
													  <form:option value="0">-------</form:option>
													  <form:option value="500">500</form:option>
													  <form:option value="1000">1000</form:option>
													  <form:option value="1500">1500</form:option>
													  <form:option value="2000">2000</form:option>
													  <form:option value="5000">5000</form:option>
													</form:select>
													<a class="voucher_pick_btn" onclick="flip('${couponIdentifier}');">Pick</a>
												</div>
											</div>	
											<div id="picked_${couponIdentifier}" style="display:none;">
												<div>
													<i style="font-size: 76px; color: rgb(205, 22, 49);" class="fa fa-check-circle" aria-hidden="true"></i>
												</div>
			 									<div style="color: rgb(255, 255, 255); font-size: 11px; letter-spacing: 4px; font-weight: bold;">
				 									PICKED (Rs <span id="selectedamount_${couponIdentifier}"></span>)
												</div>
												<div>
													<i class="fa fa-times voucher_unpick" aria-hidden="true" title="Unpick" onclick="unFlip('${couponIdentifier}');"></i>
												</div>
											</div>
										</div>
							        </div>
							    </div>
							</div> <!-- ./col-lg-4 -->
						</c:forEach>
					</form:form>
				</div> <!-- ./col-lg-12 coupon_wrapper_single -->
			</div> <!-- ./col-lg-12 coupons_wrapper_main -->
		</div> <!-- ./col-lg-9 p_none text_center -->

		<div class="col-lg-3" style="min-height: 300px; margin-top: 3%; padding-right: 0px;">
			<div class="col-lg-12 p_none voucher_account_summary">
				Account summary
			</div>
			<div class="col-lg-12 p_none voucher_balance">
			  Wallet
			  <span class="voucher_balance_amount">${walletAmount}</span>
			  <input class="hidden" id="wallet_amount" value="${walletAmount}"/>
			</div>
			<div class="col-lg-12 p_none selected_vouchers">
			  Vouchers
			  <span class="selected_vouchers_amount" id="vouchers_amount_display">0</span>
			</div>
			<c:if test="${isCouponRedeemptionChargesEnabled eq 'Y'}">
				<input type="hidden" id="isCouponRedeemptionChargesEnabled" value='${isCouponRedeemptionChargesEnabled}'/>
				<input type="hidden" id="redeemptionChargesInPercent" value='${redeemptionChargesInPercent}'/>
				<div class="col-lg-12 p_none selected_vouchers">
				  Total Amount:
				  <span class="selected_vouchers_amount" id="totalAmountIncludingCharges">0</span>				  
				  <div class="total_amount_info_class" align="center" id="summaryDetails"></div>
				</div>
			</c:if>
			<div class="col-lg-12 p_none" style="${not empty Error ? '' : 'display: none;'}" id="errorDisplayDiv">
				<p style="font-size: 12px; padding: 7px; margin-top: 5px;" class="bg-danger" id="errorDisplayDivText">
					<c:if test="${not empty Error}">
						${Error}
					</c:if>
				</p>
			</div>
			<div class="col-lg-12 p_none vouchers_buy_btn">
				<button class="vouchers_buy_btn_style" onClick="javascript:validateAndSubmitVoucherForm();">
					Proceed
				</button>
			</div>
		</div>
		
	</div> <!-- ./text_center p_none container -->
</div> <!-- ./get_voucher_panel -->

<script>
	$('#menu_before_scroll').hide();
	$('#custom-after-scroll-bootstrap-menu').show();	
</script>
<script src="/resources/js/voucher.js"></script>