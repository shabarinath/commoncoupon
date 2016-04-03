<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/taglibs.jsp" %>
<div id="registrationFormDiv">
	<form:form  commandName="user" id="registrationForm" name="registrationForm" method="post" action="/register" >
		<span id="error" class="error">${error}</span>
		<div>			
			<div class="form-group">
			<spring:bind path="email">						
				<form:input path="email" cssClass="form-control login-field ${status.error ? 'errorInput' : ''}" placeholder="Email"/>
				<i class="fa fa-envelope login-field-icon"></i>
				<span><form:errors path="email" cssClass="error"/></span>
			</spring:bind>	
			</div>	
			<div class="form-group">
			<spring:bind path="password">						
				<form:password path="password" cssClass="form-control login-field ${status.error ? 'errorInput' : ''}" placeholder="Password"/>
				<i class="fa fa-lock login-field-icon"></i>
				<span><form:errors path="password" cssClass="error"/></span>
			</spring:bind>	
			</div>
			<div class="form-group">
			<spring:bind path="mobileNumber">						
				<form:input path="mobileNumber" cssClass="form-control login-field ${status.error ? 'errorInput' : ''}" placeholder="Mohile Number"/>	
				<i class="fa fa-mobile login-field-icon"></i>			
				<span><form:errors path="mobileNumber" cssClass="error"/></span>
			</spring:bind>	
			</div>
			<div class="form-group">
			<spring:bind path="firstName">						
				<form:input path="firstName" cssClass="form-control login-field ${status.error ? 'errorInput' : ''}" placeholder="First Name"/>				
				<span><form:errors path="firstName" cssClass="error"/></span>
			</spring:bind>	
			</div>	
			<div class="form-group">
			<spring:bind path="lastName">						
				<form:input path="lastName" cssClass="form-control login-field ${status.error ? 'errorInput' : ''}" placeholder="Last Name"/>				
				<span><form:errors path="lastName" cssClass="error"/></span>
			</spring:bind>	
			</div>				
			<div class="form-group text-center modal-register-btn">
				<button class="btn btn-default" type="button" onClick="javascript:submitForm('registrationForm','_finish','registrationFormDiv');">Register</button>			
			</div>			
		</div>	
	</form:form>
</div>