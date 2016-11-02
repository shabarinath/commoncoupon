<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/taglibs.jsp"%>
<div class="carousel slide" id="middleDiv">
	<h3>Account Settings</h3>
	<hr/>
	<form:form  commandName="user" id="userProfileForm" name="userProfileForm" method="post" action="/saveProfile">
	  <div class="form-group">
		<label>First Name</label>
		<spring:bind path="firstName">		
			<form:input path="firstName" cssClass="form-control ${status.error ? 'errorInput' : ''}"/>
		</spring:bind>
	  </div>
	  <div class="form-group">
		<label>Last Name</label>   
		<spring:bind path="lastName">		
			<form:input path="lastName" cssClass="form-control ${status.error ? 'errorInput' : ''}"/>
		</spring:bind>
	  </div>	 	  
	  <h3>Change Password</h3>
	  <hr/>
	   <div class="form-group">
		<label>Current Password</label>   
		<spring:bind path="currentPassword">		
			 <form:password  placeholder="Current Password" path="currentPassword" type="password" cssClass="form-control ${status.error ? 'errorInput' : ''}" />
			 <form:errors path="currentPassword" cssClass="error"/>
		</spring:bind>
	  </div>
	  <div class="form-group">
		<label>New Password</label>   
		<spring:bind path="password">		
			 <form:password  placeholder="New Password" path="password" type="password" cssClass="form-control ${status.error ? 'errorInput' : ''}" />			 
		</spring:bind>
	  </div> 
	 <!--  <div class="form-group">
		<label>Confirm Password</label>   
		<spring:bind path="confirmPassword">		
			 <form:password  placeholder="Confirm Password" path="confirmPassword" type="password" cssClass="form-control ${status.error ? 'errorInput' : ''}" />
		</spring:bind>
	  </div>	 -->
	  <button class="btn btn-success" type="button" onClick="javascript:submitForm('userProfileForm','_finish','middleDiv');">Submit</button>
	</form:form>
</div>