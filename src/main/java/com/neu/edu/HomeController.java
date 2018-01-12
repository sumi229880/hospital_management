package com.neu.edu;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.neu.dao.UserDao;
import com.neu.exception.AdException;
import com.neu.pojo.Events;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
	@Autowired
	@Qualifier("UserDao")
	private UserDao userDao;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,HttpServletRequest request) throws AdException{  //HttpServletRequest request
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		Events events = userDao.getEvent();
//		System.out.println("HOme "+ events.getEventName());
		HttpSession session = request.getSession();
		
		session.setAttribute("events", events);
		return "home";
		
		
	}

	@RequestMapping (value = "/frontSettings.htm" , method = RequestMethod.GET)
	public String frontSettings(HttpServletRequest request) throws Exception{
		return "frontSettings";
	}

	@RequestMapping (value = "/frontMessage.htm" , method = RequestMethod.GET)
	public String frontMessage(HttpServletRequest request) throws Exception{
		return "frontMessage";
	}
	
	@RequestMapping (value = "/frontHeart.htm" , method = RequestMethod.GET)
	public String frontHeart(HttpServletRequest request) throws Exception{
		return "frontHeart";
	}
	
	@RequestMapping (value = "/frontPlus.htm" , method = RequestMethod.GET)
	public String frontPlus(HttpServletRequest request) throws Exception{
		return "frontPlus";
	}
	
	@RequestMapping (value = "/frontGraph.htm" , method = RequestMethod.GET)
	public String frontGraph(HttpServletRequest request) throws Exception{
		return "frontGraph";
	}

	
	
	@RequestMapping (value = "/createEvent.htm" , method = RequestMethod.GET)
	public String patientRedirectRegister(HttpServletRequest request) throws Exception{
		return "adminCreateEvent";
	}
	
	@RequestMapping(value= "/receptionistHome.htm", method= RequestMethod.GET)
	public String receptionistHome(HttpServletRequest request) throws Exception{
		return "receptionist";
	}
	@RequestMapping(value= "/doctorHome.htm", method= RequestMethod.GET)
	public String doctorHome(HttpServletRequest request) throws Exception{
		return "doctor";
	}
	@RequestMapping(value= "/patientHome.htm", method= RequestMethod.GET)
	public String patientHome(HttpServletRequest request) throws Exception{
		return "patient";
	}
	@RequestMapping(value= "/adminHome.htm", method= RequestMethod.GET)
	public String adminHome(HttpServletRequest request) throws Exception{
		return "admin";
	}
	
}
