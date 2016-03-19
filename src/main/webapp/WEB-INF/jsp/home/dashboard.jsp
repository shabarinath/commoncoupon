<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/taglibs.jsp"%>
<div class="carousel slide carousel-div" id="middleDiv">
	<div class="col-lg-12">
		<div class="col-lg-1"></div>
		<div class="col-lg-5 buy_ecard_panel"  style="margin-left:25%;margin-top:-5%">		
			<div class="col-xs-12 p_none buy_ecard_panel_form">
				<div class="col-xs-12 p_none form_number_display">					
				</div>
				<form:form  commandName="commonCoupon" id="redeemCommonCouponForm" name="redeemCommonCouponForm" method="post" action="/redeemCommonCoupon" >
					<!-- Leaf 1 -->
					<div class="col-xs-12 p_none form_leaf_1 " id="leaf_1">
						<div class="col-xs-12 p_none">
							Redeem
						</div>
						<div class="col-xs-8 p_none" style="margin-top: 20px;">
							<spring:bind path="couponId">							
									<div class="form-group cus_text_box">
										<div class="input-group">
										  <div class="input-group-addon">Coupon Code: </div>									
										  <form:input path="couponId" cssClass="form-control ${status.error ? 'errorInput' : ''}" placeholder="Coupon Code" value="${couponId}"/>
										</div>
									</div>
							</spring:bind>
							<spring:bind path="password">
									<div class="form-group cus_text_box">
										<div class="input-group">
										  <div class="input-group-addon">Password: </div>									
										  <form:password path="password" cssClass="form-control ${status.error ? 'errorInput' : ''}" placeholder="password" value="${password}"/>
										</div>
									</div>							
							</spring:bind>
						</div>
					</div><!-- ./ Leaf 1 -->
					<div style="float:right">				
						<button class="btn btn-success" type="button" onClick="javascript:submitForm('redeemCommonCouponForm','_finish','middleDiv');">Redeem</button>
					</div>
				</form:form>
				
			</div>
			<div>
				<span id="infoDiv">${invalidCoupon}</span>
			</div>			<!-- ./buy_ecard_panel_form -->			
			<!-- <div class ="input-group-addon" style="margin-top:60%">
				<span>
					<h3>Wallet Amount : <i class="fa fa-inr"> 0 </i></h3>
				</span>
			</div> -->
		</div> <!-- ./buy_ecard_panel -->			
	</div>
</div> 
<script>
if(${isRedeemSuccess == true}) {
	$("#infoDiv").html("<b>Coupon Redeemption Success!!</b>");
}
</script>
<!-- <div class="container center_box">
	<div style="height: 200px; position: relative; margin-bottom: 20px; border-bottom: medium dotted rgb(255, 0, 0);">
	</div>
	<section class="mp-hp-packages">
		<div class="packages-wrapper cf">
		<c:forEach items="${supportedCoupons}" var="coupon"> 			
			<div class="package package-new">	
				<a href="#">				
					<span >
						<c:choose>
							<c:when test="${coupon eq 'FLIPKART'}">
								<img width="290" height="228" src="http://static.dnaindia.com/sites/default/files/2014/07/30/255027-flipkart.jpg">
							</c:when>
							<c:when test="${coupon eq 'AMAZON'}">
								<img width="290" height="228" src="http://ecx.images-amazon.com/images/I/31TN1u5GEqL.png">
							</c:when>
							<c:when test="${coupon eq 'MYNTRA'}">
								<img width="290" height="228" src="http://www.couponpitcher.com/wp-content/uploads/2015/10/u573g8OB.jpg">
							</c:when>
							<c:when test="${coupon eq 'SHOPCLUES'}">
								<img width="290" height="228" src="http://static.dnaindia.com/sites/default/files/2014/07/30/255027-flipkart.jpg">
							</c:when>
							<c:otherwise>
								<img width="290" height="228" src="http://static.dnaindia.com/sites/default/files/2014/07/30/255027-flipkart.jpg">
							</c:otherwise>
						</c:choose>
					</span>
				</a>
			</div>	
		</c:forEach>					
		</div>		
	</section>
</div>-->

