<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/taglibs.jsp" %>
<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
    	<div class="modal-content">
      		<div class="modal-header login_modal_header">
        		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        		<h2 class="modal-title" id="myModalLabel">Login to Your Account</h2>
      		</div>
      		<div class="modal-body login-modal">
      			<p></p>
      			<br/>
      			<div class="clearfix"></div>
      			<div id='social-icons-conatainer'>
					<form name="login-form" id="loginForm" action="<c:url value='j_spring_security_check' />" method="POST">
						<div class='modal-body-left'>
							<div class="form-group">								
								<input name="j_username" placeholder="Eamil" id="username" type="text" class="form-control login-field"/>
								<i class="fa fa-user login-field-icon"></i>
							</div>		
							<div class="form-group">								
								<input  name="j_password" placeholder="Password" type="password" id="password" class="form-control login-field"/><!--END PASSWORD-->
								<i class="fa fa-lock login-field-icon"></i>
							</div>
							<input type="submit" name="submit" value="Login" class="btn btn-success modal-login-btn" />							
							<a href="/changePassword" class="login-link text-center">Lost your password?</a>
						</div>	
					</form>
	        		<div class='modal-body-right'>
	        			<div class="modal-social-icons">
	        				<a href='#' class="btn btn-default facebook"> <i class="fa fa-facebook modal-icons"></i> Sign In with Facebook </a>	        				
	        			</div> 
	        		</div>	
	        		<div id='center-line'> OR </div>
	        	</div>			
        		<div class="clearfix"></div>        		
        		<div class="form-group modal-register-btn">
        			<button class="btn btn-default"> New User Please Register</button>
        		</div>
      		</div>
      		<div class="clearfix"></div>
      		<div class="modal-footer login_modal_footer">
      		</div>
    	</div>
  	</div>
</div>