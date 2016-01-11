<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/taglibs.jsp"%>
<div class="container center_box">
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
</div>

