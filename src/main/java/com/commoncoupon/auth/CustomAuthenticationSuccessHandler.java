package com.commoncoupon.auth;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

/**
 * @author SHABARINATH
 * 22-Dec-2015 11:54:26 pm 2015 
 */

public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomAuthenticationSuccessHandler.class);
	
    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request,
			HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		try {
			handle(request, response, authentication);
	        clearAuthenticationAttributes(request);
		}catch(Exception e) {
			logger.error("Exception occured in onAuthenticationSuccess reason:", e);
		}
	}
	
	 protected void handle(HttpServletRequest request, 
      HttpServletResponse response, Authentication authentication) throws IOException {
        String targetUrl = determineTargetUrl(authentication);
 
        if (response.isCommitted()) {
            logger.debug("Response has already been committed. Unable to redirect to " + targetUrl);
            return;
        }
 
        redirectStrategy.sendRedirect(request, response, targetUrl);
    }
		 
    /** Builds the target URL according to the logic defined in the main class Javadoc. */
    protected String determineTargetUrl(Authentication authentication) {
        boolean isUser = false;
        boolean isAdmin = false;
        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        for (GrantedAuthority grantedAuthority : authorities) {
            if (grantedAuthority.getAuthority().equals("ROLE_USER")) {
                isUser = true;
                break;
            } else if (grantedAuthority.getAuthority().equals("ROLE_ADMIN")) {
                isAdmin = true;
                break;
            }
        }
 
        if (isUser) {
            return "/redirect/?_ajax=true&redirectUrl=/";
        } else if (isAdmin) {
        	return "/adminDashboard";
        } else {
        	 return "/redirect/?_ajax=true";
        }
    }
		 
    protected void clearAuthenticationAttributes(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return;
        }
        session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
    }
 
    public void setRedirectStrategy(RedirectStrategy redirectStrategy) {
        this.redirectStrategy = redirectStrategy;
    }
    protected RedirectStrategy getRedirectStrategy() {
        return redirectStrategy;
    }

}

