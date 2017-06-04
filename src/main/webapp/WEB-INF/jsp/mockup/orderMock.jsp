<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/taglibs.jsp"%>

<div class="get_voucher_panel">
	<div style="padding: 17px; border: 1px solid rgb(248, 230, 230); margin-top: 28px; margin-bottom: 25px;" 
	class="p_none container">
		<ul class="nav nav-tabs">
		  <li class="active"><a aria-expanded="true" data-toggle="tab" href="#home">All Transactions</a></li>
		  <li class=""><a aria-expanded="false" data-toggle="tab" href="#menu1">Gifted</a></li>
		  <li class=""><a aria-expanded="false" data-toggle="tab" href="#menu2">Redeemed</a></li>
		</ul>
		
		<div class="tab-content" style="margin-top: 10px;">
		  <div id="home" class="table-responsive tab-pane fade active in ">
		    <table class="table table-hover">
			    <thead>
			      <tr class="info">
			        <th>#</th>
			        <th>Description</th>
			        <th>Status</th>
			        <th>Amount</th>
			        <th>Order No.</th>
			        <th>Order Total</th>
			      </tr>
			    </thead>
			    <tbody>
			      <tr>
			      	<td>1</td>
			        <td>Gifted</td>
			        <td>Successful</td>
			        <td>Rs 5000</td>
			        <td>TE86532457</td>
			        <td>Rs 5000</td>
			      </tr>      
			      <tr>
			      	<td>2</td>
			        <td>Redeemed</td>
			        <td>Successful</td>
			        <td>Rs 5000</td>
			        <td>TE86532457</td>
			        <td>Rs 5000</td>
			      </tr> 
			      <tr>
			      	<td>3</td>
			        <td>Redeemed</td>
			        <td>Successful</td>
			        <td>Rs 5000</td>
			        <td>TE86532457</td>
			        <td>Rs 5000</td>
			      </tr>      
			      <tr>
			      	<td>4</td>
			        <td>Gifted</td>
			        <td>Successful</td>
			        <td>Rs 5000</td>
			        <td>TE86532457</td>
			        <td>Rs 5000</td>
			      </tr> 
			    </tbody>
			  </table>
		  </div>
		  <div id="menu1" class="table-responsive tab-pane fade">
		    <table class="table table-hover">
			    <thead>
			      <tr class="info">
			        <th>#</th>
			        <th>Description</th>
			        <th>Status</th>
			        <th>Amount</th>
			        <th>Order No.</th>
			        <th>Order Total</th>
			      </tr>
			    </thead>
			    <tbody>
			      <tr>
			      	<td>1</td>
			        <td>Gifted</td>
			        <td>Successful</td>
			        <td>Rs 5000</td>
			        <td>TE86532457</td>
			        <td>Rs 5000</td>
			      </tr>      
			      <tr>
			      	<td>2</td>
			        <td>Gifted</td>
			        <td>Successful</td>
			        <td>Rs 5000</td>
			        <td>TE86532457</td>
			        <td>Rs 5000</td>
			      </tr> 
			    </tbody>
			  </table>
		  </div>
		  <div id="menu2" class="table-responsive tab-pane fade">
		   <table class="table table-hover">
			    <thead>
			      <tr class="info">
			        <th>#</th>
			        <th>Description</th>
			        <th>Status</th>
			        <th>Amount</th>
			        <th>Order No.</th>
			        <th>Order Total</th>
			      </tr>
			    </thead>
			    <tbody>
			      <tr>
			      	<td>1</td>
			        <td>Redeemed</td>
			        <td>Successful</td>
			        <td>Rs 5000</td>
			        <td>TE86532457</td>
			        <td>Rs 5000</td>
			      </tr> 
			      <tr>
			      	<td>2</td>
			        <td>Redeemed</td>
			        <td>Successful</td>
			        <td>Rs 5000</td>
			        <td>TE86532457</td>
			        <td>Rs 5000</td>
			      </tr>      
			    </tbody>
			  </table>
		  </div>
		</div>	
	</div>
</div>

<script>
	$('#menu_before_scroll').hide();
	$('#custom-after-scroll-bootstrap-menu').show();
</script>
