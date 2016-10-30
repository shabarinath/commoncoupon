<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/taglibs.jsp"%>
<div class="table-responsive">
	<table class="table table-striped">
		<thead>
			<tr>
				<th>#</th>
				<th>Order No</th>
				<th>Price</th>
				<th>Status</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="transaction" items="${transactions}" varStatus="loop">				
				<tr>
					<th scope="row">${loop.count}</th>
					<td>${transaction.paymentId}</td>
					<td><i class="fa fa-inr"></i> ${transaction.coupon.amount} /-</td>
					<td>
						<span style="margin-left:4px;" class="${transaction.success ? 'succ' : 'errortrans'}">&nbsp;&nbsp;&nbsp;&nbsp;</span>
					</td>
				</tr>
			</c:forEach>						
		</tbody>
	</table>
</div>
