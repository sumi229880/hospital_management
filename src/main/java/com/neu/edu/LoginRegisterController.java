package com.neu.edu;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.neu.dao.UserDao;
import com.neu.email.EmailUser;
import com.neu.exception.AdException;
import com.neu.pojo.Appointment;
import com.neu.pojo.Events;
import com.neu.pojo.User;


@Controller
public class LoginRegisterController {
	
	
	@Autowired
	@Qualifier("UserDao")
	private UserDao userDao;
	
	
	@RequestMapping (value = "/redirectRegister.htm" , method = RequestMethod.GET)
	public String patientRedirectRegister(HttpServletRequest request) throws Exception{
		
		
		return "signUp";
	}
	
	@RequestMapping (value = "/register.htm" , method = RequestMethod.POST)
	public String patientRegister(HttpServletRequest request) throws Exception{
		
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		session.setAttribute("userExist", 0);
		System.out.println("In customerSignUp - Login Home Controller");
		if(action != null){
			if(action.equalsIgnoreCase("register")){
				//All Products
				String firstName = request.getParameter("firstName");
				String lastName = request.getParameter("lastName");
				String address = request.getParameter("address");
				String mobileNumber = request.getParameter("mobileNumber");
				String email = request.getParameter("emailId");
				BCryptPasswordEncoder encoder= new BCryptPasswordEncoder(12);
				String password = encoder.encode(request.getParameter("password"));
				
				User newUser = new User();
				newUser.setFirstName(firstName);
				newUser.setLastName(lastName);
				newUser.setAddress(address);
				newUser.setMobileNUmber(mobileNumber);
				newUser.setEmailId(email);
				newUser.setPassword(password);
				newUser.setUserRole("patient");
				
				Boolean existFlag = userDao.userExists(email);
				System.out.println("existFlag "+existFlag);
				if(existFlag == false){
					userDao.addUser(newUser);
					session.setAttribute("userExist", 0);
					request.setAttribute("userCreated", "Your Profile has been created");
					EmailUser.sendEmailToUser(email);
				}else{
					session.setAttribute("userExist", 1);
					return "signUp";
				}
				
				
				return "signUp";
			}
			if(action.equalsIgnoreCase("reset")){
				//All Products
				session.setAttribute("cusDisplay", 1);
				return "signUp";
			}
		}
		return "home";
	}
	
	@RequestMapping (value = "/registerDoctor.htm" , method = RequestMethod.POST)
	public String doctorRegister(HttpServletRequest request) throws Exception{
		
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		session.setAttribute("userExist", 0);
		System.out.println("In customerSignUp - Login Home Controller");
		if(action != null){
			if(action.equalsIgnoreCase("registerDoctor")){
				//All Products
				String firstName = request.getParameter("fName");
				String lastName = request.getParameter("lName");
				String address = request.getParameter("address");
				String mobileNumber = request.getParameter("phoneNumber");
				String email = request.getParameter("emailId");
				
				BCryptPasswordEncoder encoder= new BCryptPasswordEncoder(12);
				String password = encoder.encode(request.getParameter("password"));
				String department = request.getParameter("department");
				String degree = request.getParameter("degree");
				String salary = request.getParameter("salary");
				
				User newUser = new User();
				newUser.setFirstName(firstName);
				newUser.setLastName(lastName);
				newUser.setAddress(address);
				newUser.setMobileNUmber(mobileNumber);
				newUser.setEmailId(email);
				newUser.setPassword(password);
				newUser.setDegree(degree);
				newUser.setDepartment(department);
				newUser.setSalary(salary);
				newUser.setUserRole("doctor");
				
				Boolean existFlag = userDao.userExists(email);
				System.out.println("existFlag "+existFlag);
				if(existFlag == false){
					userDao.addUser(newUser);
					session.setAttribute("userExist", 0);
					EmailUser.sendEmailToUser(email);
				}else{
					session.setAttribute("userExist", 1);
					return "admin";
				}
				
				
				return "admin";
			}
			if(action.equalsIgnoreCase("reset")){
				//All Products
				session.setAttribute("cusDisplay", 1);
				return "signUp";
			}
		}
		return "admin";
	}
	
	@RequestMapping (value = "/registerPatient.htm" , method = RequestMethod.POST)
	public String patientAdminRegister(HttpServletRequest request) throws Exception{
		
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		session.setAttribute("userExist", 0);
		System.out.println("In customerSignUp - Login Home Controller");
		if(action != null){
			if(action.equalsIgnoreCase("registerPatient")){
				//All Products
				String firstName = request.getParameter("fName");
				String lastName = request.getParameter("lName");
				String address = request.getParameter("address");
				String mobileNumber = request.getParameter("phoneNumber");
				String email = request.getParameter("emailId");
				
				BCryptPasswordEncoder encoder= new BCryptPasswordEncoder(12);
				String password = encoder.encode(request.getParameter("password"));
				String age = request.getParameter("age");
				
				User newUser = new User();
				newUser.setFirstName(firstName);
				newUser.setLastName(lastName);
				newUser.setAddress(address);
				newUser.setMobileNUmber(mobileNumber);
				newUser.setEmailId(email);
				newUser.setPassword(password);
				newUser.setAge(Integer.parseInt(age));
				newUser.setUserRole("patient");
				
				Boolean existFlag = userDao.userExists(email);
				System.out.println("existFlag "+existFlag);
				if(existFlag == false){
					userDao.addUser(newUser);
					session.setAttribute("userExist", 0);
					EmailUser.sendEmailToUser(email);
				}else{
					session.setAttribute("userExist", 1);
					return "admin";
				}
				
				
				return "admin";
			}
			if(action.equalsIgnoreCase("reset")){
				//All Products
				session.setAttribute("cusDisplay", 1);
				return "admin";
			}
		}
		return "admin";
	}
	
	@RequestMapping (value = "/registerReceptionist.htm" , method = RequestMethod.POST)
	public String receptionistRegister(HttpServletRequest request) throws Exception{
		
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		session.setAttribute("userExist", 0);
		System.out.println("In customerSignUp - Login Home Controller");
		if(action != null){
			if(action.equalsIgnoreCase("registerReceptionist")){
				//All Products
				String firstName = request.getParameter("fName");
				String lastName = request.getParameter("lName");
				String address = request.getParameter("address");
				String mobileNumber = request.getParameter("phoneNumber");
				String email = request.getParameter("emailId");
				BCryptPasswordEncoder encoder= new BCryptPasswordEncoder(12);
				String password = encoder.encode(request.getParameter("password"));
				String salary = request.getParameter("salary");
				
				User newUser = new User();
				newUser.setFirstName(firstName);
				newUser.setLastName(lastName);
				newUser.setAddress(address);
				newUser.setMobileNUmber(mobileNumber);
				newUser.setEmailId(email);
				newUser.setPassword(password);
				newUser.setSalary(salary);
				newUser.setUserRole("receptionist");
				
				Boolean existFlag = userDao.userExists(email);
				System.out.println("existFlag "+existFlag);
				if(existFlag == false){
					userDao.addUser(newUser);
					session.setAttribute("userExist", 0);
					EmailUser.sendEmailToUser(email);
				}else{
					session.setAttribute("userExist", 1);
					return "admin";
				}
				
				
				return "admin";
			}
			if(action.equalsIgnoreCase("reset")){
				//All Products
				session.setAttribute("cusDisplay", 1);
				return "admin";
			}
		}
		return "admin";
	}
	
	@RequestMapping(value = "/login.htm", method = RequestMethod.POST)
	public String customerLoginController(Model model,HttpServletRequest request) throws Exception {
		
		
		HttpSession session = request.getSession();
		String username = request.getParameter("email");
		String password = request.getParameter("password");
		System.out.println("hello");
		User user = userDao.loginUser(username, password);
		
		if(user==null){
			request.setAttribute("error", "Username or Password Invalid");
			return "home";
		}
		
		if(user != null){
			session.setAttribute("user", user);
//			session.setAttribute("token", "YES");
			session.setAttribute("userError", 1);   
			if(user.getUserRole().equalsIgnoreCase("admin")){
				System.out.println("Admin");
				return "admin";
			}
			if(user.getUserRole().equalsIgnoreCase("patient")){
				List<User> doctorList = userDao.getDoctors();
				List<Appointment> appointments = userDao.getAppointmentByPatient(user.getUserId());

				session.setAttribute("appointments", appointments);	
				session.setAttribute("doctorList", doctorList);			
				return "patient";
			}
			if(user.getUserRole().equalsIgnoreCase("receptionist")){
				return "receptionist";
			}
			if(user.getUserRole().equalsIgnoreCase("doctor")){
				List<Appointment> appointments = userDao.getAppointmentByDoctor(user.getUserId());
//				 user = userDao.getPatientName(patientID);
				session.setAttribute("appointments", appointments);	
				return "doctor";
			}
			return "home";
		}else{
			session.setAttribute("error", "UserName or Password Invalid");
			return "home";
		}
	}
	
	
	@RequestMapping(value = "/logout.htm", method = RequestMethod.GET)
    public String logout(HttpServletRequest request) throws AdException{
		Events events = userDao.getEvent();
        request.getSession().invalidate();
        request.getSession().removeAttribute("user");
        request.getSession().removeAttribute("token");
        HttpSession session = request.getSession();
        session.setAttribute("events", events);
        return "home";
    }
	
	@RequestMapping(value = "/signup.htm", method = RequestMethod.POST)
	protected String validateUser(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String action = request.getParameter("action");
		
		if(action.equals("ajaxCheck")){
			PrintWriter out = response.getWriter();
			String emailId = request.getParameter("emailId");


			if(userDao.userExists(emailId)==true){
				//JSONObject obj = new JSONObject();
				//obj.put("message", "Email Id already exists");
				out.println("Email Id already exists");
				//out.println(obj);
				
				
				
			}else{

			}
			return null;
		}
		return null;
	}

}
