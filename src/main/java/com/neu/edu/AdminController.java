package com.neu.edu;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.neu.dao.ReceptionistDao;
import com.neu.dao.UserDao;
import com.neu.pojo.Events;
import com.neu.pojo.User;

@Controller
public class AdminController {
	
	@Autowired
	@Qualifier("ReceptionistDao")
	private ReceptionistDao receptionistDao;
	
	@Autowired
	@Qualifier("UserDao")
	private UserDao userDao;

	@RequestMapping (value = "/adminPatients.htm" , method = RequestMethod.GET)
	public String patientList(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		List<User> patientList = new ArrayList<User>();
		patientList = receptionistDao.getPatients();
		session.setAttribute("patientList", patientList);
		return "adminPatients";
	}
	
	@RequestMapping (value = "/adminDoctors.htm" , method = RequestMethod.GET)
	public String doctorList(HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		List<User> adminDoctorList = new ArrayList<User>();
		adminDoctorList = receptionistDao.getDoctors();
		session.setAttribute("adminDoctorList", adminDoctorList);
		return "adminDoctors";
	}
	
	
	@RequestMapping (value = "/adminReceptionist.htm" , method = RequestMethod.GET)
	public String receptionistList(HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		List<User> receptionistList = new ArrayList<User>();
		receptionistList = receptionistDao.getReceptionist();
		session.setAttribute("receptionistList", receptionistList);
		return "adminReceptionist";
	}
	
	@RequestMapping (value = "/createEvent.htm" , method = RequestMethod.POST)
	public String createEvent(HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		String eventName = request.getParameter("eventName");
		String eventDetails = request.getParameter("details");
		String eventRequirements = request.getParameter("requirement");
		String eventDate = request.getParameter("eventDate");
		
		Events events = new Events();
		events.setEventName(eventName);
		events.setDetails(eventDetails);
		events.setRequirement(eventRequirements);
		events.setDate(eventDate);
		userDao.addEvents(events);
		request.setAttribute("createdEvent", "Event Created Successfully !!!");
		return "adminCreateEvent";
	}
}
