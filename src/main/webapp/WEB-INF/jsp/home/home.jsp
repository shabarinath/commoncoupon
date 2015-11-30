<%@ page language="java" contentType="text/html; charset=Shift-JIS" pageEncoding="UTF-8"%>
<%@ include file="../includes/taglibs.jsp"%>
<div class="homePageBox">   
    <form:form  commandName="coupon" id="couponForm" name="couponForm" class="form-horizontal" method="post" action="/saveCoupon">
	<legend>Amount: </legend>
	<div style="">	
		<div class="control-group">
			<label class="control-label"><span class="required">*</span><b>Amount: </b></label>
			<div class="controls">
			    <div class="input-prepend">
					<form:input path="amount" cssClass="textbox" />
				</div>
				<p class="help-block error" >
			 		<span class="help-inline"><form:errors path="amount" cssClass="error"/></span>
				</p>
			</div> 
		</div>
	</div>
	<legend>Sender: </legend>
	<div style="">	
		<div class="control-group">
			<label class="control-label"><span class="required">*</span><b>First Name: </b></label>
			<div class="controls">
			    <div class="input-prepend">
					<form:input path="sender.firstName" cssClass="textbox" />
				</div>
				<p class="help-block error" >
			 		<span class="help-inline"><form:errors path="sender.firstName" cssClass="error"/></span>
				</p>
			</div> 
		</div>
		<div class="control-group">
			<label class="control-label"><span class="required">*</span><b>Last Name: </b></label>
			<div class="controls">
			    <div class="input-prepend">
					<form:input path="sender.lastName" cssClass="textbox" />
				</div>
				<p class="help-block error" >
			 		<span class="help-inline"><form:errors path="sender.lastName" cssClass="error"/></span>
				</p>
			</div> 
		</div>
		<div class="control-group">
			<label class="control-label"><span class="required">*</span><b>Mobile: </b></label>
			<div class="controls">
			    <div class="input-prepend">
					<form:input path="sender.mobileNumber" cssClass="textbox" />
				</div>
				<p class="help-block error" >
			 		<span class="help-inline"><form:errors path="sender.mobileNumber" cssClass="error"/></span>
				</p>
			</div> 
		</div>
		<div class="control-group">
			<label class="control-label"><span class="required">*</span><b>Email: </b></label>
			<div class="controls">
			    <div class="input-prepend">
					<form:input path="sender.email" cssClass="textbox" />
				</div>
				<p class="help-block error" >
			 		<span class="help-inline"><form:errors path="sender.email" cssClass="error"/></span>
				</p>
			</div> 
		</div>
	</div>
	<legend>Recipient: </legend>
	<div style="">	
		<div class="control-group">
			<label class="control-label"><b>Email: </b></label>
			<div class="controls">
			    <div class="input-prepend">
					<form:input path="recipient.email" cssClass="textbox" />
				</div>
				<p class="help-block error" >
			 		<span class="help-inline"><form:errors path="recipient.email" cssClass="error"/></span>
				</p>
			</div> 
		</div>
	</div>
	<div class="form-actions">
           <button class="btn btn-success" type="submit">Save Details</button>
           <a class="btn" href="/">Cancel</a>
       </div>
  </form:form>
</div>