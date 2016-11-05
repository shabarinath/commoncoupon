<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/taglibs.jsp" %>
<div id="forgotPasswordDiv">
	<div class="reset_password">
		<h3>Forgot password</h3>
		<div>
			Please enter your email address & we will send a confirmation code
		</div>
	</div>
	<form:form  commandName="user" id="forgotPasswordForm" name="forgotPasswordForm" method="post" action="/forgotPassword?_ajax=true" >
		<span id="error" class="error">${error}</span>
		<div>			
			<div class="form-group">
			<spring:bind path="email">						
				<form:input path="email" cssClass="form-control login-field ${status.error ? 'errorInput' : ''}" placeholder="Enter Email"/>
				<i class="fa fa-envelope login-field-icon"></i>
				<span><form:errors path="email" cssClass="error"/></span>
			</spring:bind>	
			</div>	
			<div class="form-group text-center modal-register-btn">
				<button class="btn btn-default" type="button" onClick="javascript:submitForm('forgotPasswordForm','_finish','forgotPasswordDiv');">Submit</button>			
			</div>	
		</div>
	</form:form>
</div>