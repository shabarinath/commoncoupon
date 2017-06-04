<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/taglibs.jsp"%>

<div class="get_voucher_panel">
	<div class="text_center p_none container">
	
			<div class="col-lg-12 p_none had_our_ecard">
				
				<div class="col-lg-2 p_none">
					<div style="font-size: 19px; letter-spacing: 4px;">				
						Your wallet 
					</div>
					<div>
						<span onclick="expandRedeemForm();" style="cursor:pointer;">Rs 500</span>
					</div>
				</div>
				
				<div style="color: black ! important;" class="col-lg-2 p_none">
					<div class="p_none" style="margin-top: 20px;">
						<div class="form-group cus_text_box" style="margin-bottom: -2px; color: red;">
							<div class="input-group">
							  <div class="input-group-addon profile_text_box_override">Rs</div>									
							  <input id="amount" name="amount" class="form-control profile_text_box_override" placeholder="INR" value="" type="number">
							</div>
						</div>
						<div class="coupon_required_field" id="amountValidationDiv"></div>
					</div>
				</div>
				
				<div class="col-lg-4 p_none">
					<div style="font-size: 19px; letter-spacing: 4px;">				
						<button class="vouchers_buy_btn_style" onclick="javascript:validateAndSubmitVoucherForm();">
							Add money to wallet
						</button>
					</div>
				</div>
				
			</div>
			
	</div>
</div>

<script>
	$('#menu_before_scroll').hide();
	$('#custom-after-scroll-bootstrap-menu').show();
</script>
