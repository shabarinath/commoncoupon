<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/taglibs.jsp" %>
<div id="resetPasswordDiv">
	<div class="reset_password">
		<h3>Reset Your Password</h3>
		<div>
			Please enter your OTP which is sent to your Email
		</div>
	</div>
	<form:form  commandName="user" id="restePasswordForm" name="restePasswordForm" method="post" action="/resetPassword?_ajax=true" >
		<span id="error" class="error">${error}</span>
		<div class="reset_password">			
			<div class="form-group">
				<spring:bind path="otp">						
					<form:input path="otp" cssClass="form-control login-field ${status.error ? 'errorInput' : ''}" placeholder="Enter OTP"/>
					<span><form:errors path="otp" cssClass="error"/></span>
				</spring:bind>	
			</div>
			<div class="form-group">
				<label>Current Password</label>   
				<spring:bind path="password">		
					 <form:password  placeholder="Current Password" path="password" type="password" cssClass="form-control ${status.error ? 'errorInput' : ''}" />
					 <form:errors path="password" cssClass="error"/>
				</spring:bind>
			</div>
			<div class="form-group">
				<label>Confirm Password</label>   
				<spring:bind path="confirmPassword">		
					 <form:password  placeholder="Confirm Password" path="confirmPassword" type="password" cssClass="form-control ${status.error ? 'errorInput' : ''}" />			 
					 <form:errors path="confirmPassword" cssClass="error"/>
				</spring:bind>
			</div> 	
			<div class="form-group text-center modal-register-btn">
				<button class="btn btn-default" type="button" onClick="javascript:submitForm('restePasswordForm','_finish','resetPasswordDiv');">Submit</button>			
			</div>	
			<form:hidden path="email" value="${userEmail}"/>
		</div>
	</form:form>
</div>