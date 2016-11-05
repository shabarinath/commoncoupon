<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/taglibs.jsp"%>
<div class="get_voucher_panel" id="middleDiv">
	<div class="text_center p_none container">
		<h2>Redeem Coupon</h2>
		<div class="col-lg-12">
			<form:form  commandName="commonCoupon" id="redeemCommonCouponForm" name="redeemCommonCouponForm" method="post" action="/redeemCommonCoupon" >
				<div class="form-group">
					<label>Coupon details</label>
					<spring:bind path="couponId">
						<form:input path="couponId" cssClass="form-control ${status.error ? 'errorInput' : ''}" placeholder="Coupon Code"/>
					</spring:bind>			
				</div>
				<div class="form-group">
					<spring:bind path="password">
						  <form:password path="password" cssClass="form-control ${status.error ? 'errorInput' : ''}" placeholder="password"/>
					</spring:bind>					
				</div>
				<div>
					<span class="error" id="infoDiv">${invalidCoupon}</span>
				</div>
				<button style="" type="button" onClick="javascript:submitForm('redeemCommonCouponForm','_finish','middleDiv');" class="btn btn-default">Submit</button>
			</form:form>		
		</div>
	</div>
</div>
<script>
if(${isRedeemSuccess == true}) {
	$("#infoDiv").html("<b>Coupon Redeemption Success!!</b>");
	$("#walletAmount").html('${walletAmount}');
}
</script>