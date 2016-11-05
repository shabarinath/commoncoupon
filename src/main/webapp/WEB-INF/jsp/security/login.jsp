<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/taglibs.jsp" %>
<div id="loginDiv" class="modal-dialog">
	<div class="modal-content login-content">
		<!--<div class="modal-header login_modal_header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h2 class="modal-title" id="myModalLabel">Login to Your Account</h2>
		</div> -->
		<div class="modal-body login-modal" id="loginRegisterDiv">
			<div id='social-icons-conatainer'>
				<c:if test="${not empty error}">
					<div class="alert alert-danger" id="errorDiv" role="alert">
						Your login attempt was not successful, Username or Password not valid<!--<br /> Caused :
						${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message} -->
					</div>
				</c:if>
				<form name="login-form" id="loginForm" action="<c:url value='j_spring_security_check' />" method="POST">					
					<div>
						<div class="form-group">								
							<input name="j_username" required="required" placeholder="Eamil" id="username" type="text" class="form-control login-field"/>
							<i class="fa fa-envelope login-field-icon"></i>
						</div>		
						<div class="form-group">								
							<input  name="j_password" required="required" placeholder="Password" type="password" id="password" class="form-control login-field"/><!--END PASSWORD-->
							<i class="fa fa-lock login-field-icon"></i>
						</div>
							
						<button class="btn btn-default modal-login-btn" type="button" onClick="javascript:submitForm('loginForm','','loginDiv');">Login</button>	
						<div class="text-center">
							<a href="javascript:void(0);" id="forgotPassword" style="color: #fff;">Lost your password?</a>
						</div>
						<div class="form-group text-center modal-register-btn">
							<input class="btn btn-default" id="registerButton" value="New User Register"/>
						</div>
					</div>	
				</form>
			</div>		     					
		</div>
		<div class="clearfix"></div>
		<!--<div class="modal-footer login_modal_footer">
		</div>-->
	</div>
</div>
<script>
	$( document ).ready(function() {
		$("#username").focus();
	});
	$("#registerButton").click(function(){
		/*$('#errorDiv').html('');*/
		doGet('/getRegisterForm',{
		renderTo:'loginRegisterDiv'
		});
	});
	$("#forgotPassword").click(function(){
		/*$('#errorDiv').html('');*/
		doGet('/forgotPassword',{
		renderTo:'loginRegisterDiv'
		});
	});
</script>
