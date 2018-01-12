package com.neu.security;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.neu.pojo.User;

public class LoginFailureHandler implements AuthenticationFailureHandler {
	 private static final Logger log = LoggerFactory.getLogger(LoginFailureHandler.class);

		protected Log logger = LogFactory.getLog(this.getClass());

		private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
		
		public void setRedirectStrategy(RedirectStrategy redirectStrategy) {
			this.redirectStrategy = redirectStrategy;
		}

		protected RedirectStrategy getRedirectStrategy() {
			return redirectStrategy;
		}

	    public LoginFailureHandler() {
	        log.debug("I am");
	    }

	    @Override
	    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
	            AuthenticationException exception) throws IOException, ServletException {
	        log.debug("invalid login");
	        System.out.println("exceptio received: "+exception);
	      //  user.setUsername("invalid");
	        HttpSession session=request.getSession();
	        session.setAttribute("error", "Username or Password Invalid !!!!");
	    	redirectStrategy.sendRedirect(request, response, "/");
	    }
}