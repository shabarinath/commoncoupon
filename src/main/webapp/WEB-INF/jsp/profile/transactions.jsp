<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/taglibs.jsp"%>
<c:choose>
	<c:when test="${not empty transactions}">
		<div class="table-responsive well well-sm pre-scrollable">		
			<table class="table table-striped">
				<thead>
					<tr>
						<th>#</th>
						<c:choose>
							<c:when test="${param.type eq 'otherCouponsPurchaseHistory'}">					
								<th>Coupon Name</th>
							</c:when>
							<c:otherwise>
								<th>Order No</th>
							</c:otherwise>
						</c:choose>
						<th>Date</th>
						<th>Price</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${param.type eq 'otherCouponsPurchaseHistory'}">
							<c:forEach var="transaction" items="${transactions}" varStatus="loop">							
								<tr>
									<th scope="row">${loop.count}</th>							
									<td>${transaction.companyName}</td>						
									<td><fmt:formatDate pattern="dd-MM-yyyy" value="${transaction.createdOn}" /></td>					
									<td><i class="fa fa-inr"></i> ${transaction.amount} /-</td>
									<td>
										<span style="margin-left:4px;" class="${transaction.isDispatched() ? 'succ' : 'errortrans'}">&nbsp;&nbsp;&nbsp;&nbsp;</span>
									</td>
								</tr>								
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach var="transaction" items="${transactions}" varStatus="loop">							
								<tr>
									<th scope="row">${loop.count}</th>
									<td>${transaction.paymentId}</td>
									<td><fmt:formatDate pattern="dd-MM-yyyy" value="${transaction.createdTime}" /></td>
									<td><i class="fa fa-inr"></i> ${transaction.coupon.amount} /-</td>
									<td>
										<span style="margin-left:4px;" class="${transaction.success ? 'succ' : 'errortrans'}">&nbsp;&nbsp;&nbsp;&nbsp;</span>
									</td>
								</tr>								
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>		
		</div>
	</c:when>
	<c:otherwise>
			<div align="center"><b>No Transactions Yet !!</b></div>
	</c:otherwise>
</c:choose>