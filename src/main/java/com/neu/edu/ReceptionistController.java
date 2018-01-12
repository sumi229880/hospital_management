package com.neu.edu;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.neu.dao.DoctorDAO;
import com.neu.dao.ReceptionistDao;
import com.neu.exception.AdException;
import com.neu.pojo.Appointment;
import com.neu.pojo.Payment;
import com.neu.pojo.User;

@Controller
public class ReceptionistController {
	
	@Autowired
	@Qualifier("ReceptionistDao")
	private ReceptionistDao receptionistDao;
	
	
	@Autowired
	@Qualifier("DoctorDao")
	private DoctorDAO doctorDAO;
	
	@RequestMapping (value = "/receptionistAllPatient.htm" , method = RequestMethod.GET)
	public String receptionistAllPatient(HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		List<User> rPatientList = new ArrayList<User>();
		rPatientList = receptionistDao.getPatients();
		session.setAttribute("rPatientList", rPatientList);
		return "receptionistAllPatient";
	}
	
	@RequestMapping (value = "/receptionistAllDoctor.htm" , method = RequestMethod.GET)
	public String patientRedirectRegister(HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		List<User> rDoctorList = new ArrayList<User>();
		rDoctorList = receptionistDao.getDoctors();
		session.setAttribute("rDoctorList", rDoctorList);
		return "receptionistAllDoctor";
	}
	
	@RequestMapping (value = "/receptionistAppointments.htm" , method = RequestMethod.GET)
	public String receptionistAppointments(HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		List<Appointment> rAppointmentList = new ArrayList<Appointment>();
		rAppointmentList = receptionistDao.getAppointments();
		session.setAttribute("rAppointmentList", rAppointmentList);
		return "receptionistAppointments";
	}
	
	@RequestMapping (value = "/receptionistBill.htm" , method = RequestMethod.GET)
	public String receptionistBills(HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		List<Payment> paymentList = new ArrayList<Payment>();
		paymentList = receptionistDao.getPayments();
		session.setAttribute("paymentList", paymentList);
		return "receptionistBill";
	}
	
	@RequestMapping(value = "/receptionistProfileEdit.htm", method = RequestMethod.POST)
	public String doctorProfileEdit(HttpServletRequest request) throws AdException {
		HttpSession session = request.getSession();
		String fName = request.getParameter("first_name");
		String lName = request.getParameter("last_name");
		String mNumber = request.getParameter("mobile");
		String Address = request.getParameter("address");
		BCryptPasswordEncoder encoder= new BCryptPasswordEncoder(12);
		String password = encoder.encode(request.getParameter("password"));
		User u = (User) session.getAttribute("user");
		int id = u.getUserId();
		User user = doctorDAO.updateDoctors(fName, lName, mNumber, Address, password, id);
		session.setAttribute("user", user);
		request.setAttribute("profileUpdated", "Your profile has been updated");
		return "receptionistProfile";
	}
	
	@RequestMapping(value = "/recptionistProfile.htm", method = RequestMethod.GET)
	public String receptionistProfile(HttpServletRequest request) throws AdException {

		return "receptionistProfile";
	}
	
	@RequestMapping(value = "/recptionistHome.htm", method = RequestMethod.GET)
	public String recptionistHome(HttpServletRequest request) throws AdException {

		return "receptionist";
	}
	
}