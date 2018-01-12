package com.neu.security;
import java.io.IOException;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.neu.dao.UserDao;
import com.neu.exception.AdException;
import com.neu.pojo.Appointment;
import com.neu.pojo.User;

public class MySimpleUrlAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
	
	@Autowired
	@Qualifier("UserDao")
	private UserDao userDao;

	protected Log logger = LogFactory.getLog(this.getClass());

	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {

		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		try {
			handle(request, response, authentication,session);
		} catch (AdException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		clearAuthenticationAttributes(request);
	}

	protected void handle(HttpServletRequest request, HttpServletResponse response, 
			Authentication authentication,HttpSession session)
			throws IOException, AdException {

		String targetUrl = determineTargetUrl(authentication,session);

		if (response.isCommitted()) {
			logger.debug("Response has already been committed. Unable to redirect to " + targetUrl);
			return;
		}

		redirectStrategy.sendRedirect(request, response, targetUrl);
	}

	protected String determineTargetUrl(Authentication authentication,HttpSession session) throws AdException {
		boolean isPatient = false;
		boolean isDoctor = false;
		boolean isReceptionist = false;
		boolean isAdmin = false;
		User user =
				 (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		for (GrantedAuthority grantedAuthority : authorities) {
			if (grantedAuthority.getAuthority().equals("patient")) {
				isPatient = true;
				List<User> doctorList = userDao.getDoctors();
				List<Appointment> appointments = userDao.getAppointmentByPatient(user.getUserId());

				session.setAttribute("appointments", appointments);	
				session.setAttribute("doctorList", doctorList);	
				session.setAttribute("user", user);
				break;
			} else if (grantedAuthority.getAuthority().equals("doctor")) {
				isDoctor = true;
				List<Appointment> appointments = userDao.getAppointmentByDoctor(user.getUserId());
//				 user = userDao.getPatientName(patientID);
				session.setAttribute("appointments", appointments);	
				session.setAttribute("user", user);
				break;
			}else if (grantedAuthority.getAuthority().equals("receptionist")) {
				isReceptionist = true;
				session.setAttribute("user", user);
				break;
			}else if (grantedAuthority.getAuthority().equals("admin")) {
				isAdmin = true;
				session.setAttribute("user", user);
				break;
			}
		}

		if (isPatient) {
			return "/patientHome.htm";
		} else if (isDoctor) {
			return "/doctorHome.htm";
		}
		else if (isReceptionist) {
			return "/receptionistHome.htm";
		}
		else if (isAdmin) {
			return "/adminHome.htm";
		}else {
			throw new IllegalStateException();
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