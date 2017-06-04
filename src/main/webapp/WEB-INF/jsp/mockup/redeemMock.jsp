<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/taglibs.jsp"%>

<div class="get_voucher_panel">
	<div style="padding: 17px; margin-top: 28px; margin-bottom: 25px;" 
	class="p_none container">
		<div class="col-lg-12 p_none had_our_ecard text_center">
			<div style="font-size: 19px; letter-spacing: 4px;">				
				Had our e-card ? 
				<span style="font-weight: bold; font-size: 24px; letter-spacing: 0px;">Redeem</span> 
				here
			</div>
		</div>
		<div class="col-lg-12">
			<form id="redeemForm" name="redeemForm" style="width: 60%; margin: auto auto 10px; border: 1px solid rgb(222, 216, 216); padding: 18px; text-align: left; display: block;">
				<div style="text-align: right;" class="form-group">
				</div>  
				<div class="form-group">
				<label style="font-size: 14px; margin-bottom: 18px; color: rgba(101, 101, 101, 0.8);">COUPON DETAILS</label>
				<input placeholder="Enter coupon code" class="form-control">
				</div>
				<div class="form-group">
				<input placeholder="Enter coupon password" class="form-control">
				</div>
				<div class="form-group p_none vouchers_buy_btn">
					<button class="vouchers_buy_btn_style" onclick="javascript:validateAndSubmitVoucherForm();">
						Redeem
					</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
	$('#menu_before_scroll').hide();
	$('#custom-after-scroll-bootstrap-menu').show();
</script>
