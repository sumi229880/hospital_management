package com.neu.edu;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfGState;
import com.itextpdf.text.pdf.PdfWriter;
import com.neu.dao.DoctorDAO;
import com.neu.dao.PatientDao;
import com.neu.dao.ReceptionistDao;
import com.neu.dao.UserDao;
import com.neu.exception.AdException;
import com.neu.pojo.Appointment;
import com.neu.pojo.BillHistory;
import com.neu.pojo.BloodBank;
import com.neu.pojo.Events;
import com.neu.pojo.Payment;
import com.neu.pojo.Prescription;
import com.neu.pojo.User;

@Controller

public class PatientController {

	@Autowired
	@Qualifier("UserDao")
	private UserDao userDao;

	@Autowired
	@Qualifier("PatientDao")
	private PatientDao patientDao;

	@Autowired
	@Qualifier("ReceptionistDao")
	private ReceptionistDao receptionistDao;

	@Autowired
	@Qualifier("DoctorDao")
	private DoctorDAO doctorDAO;

	@RequestMapping(value = "/bookAppointment.htm", method = RequestMethod.POST)
	public String bookAppointment(HttpServletRequest request) throws Exception {

		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		if (action != null) {
			if (action.equalsIgnoreCase("book")) {
				// All Products
				String selectDoctor = request.getParameter("selectDoctor");
				String appointmentFor = request.getParameter("appointmentFor");
				String reason = request.getParameter("reason");
				String date = request.getParameter("date");
				System.out.println(date);
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				Date startDate = new Date();
				try {
					startDate = df.parse(date);

				} catch (ParseException e) {
					e.printStackTrace();
				}
				User patientUser = (User) session.getAttribute("user");

				String fullName = selectDoctor.substring(4);
				String[] docName = fullName.split(" ");
				User doctorUser = userDao.getDoctorByName(docName[0], docName[1]);
				Appointment app = new Appointment();
				app.setReason(reason);
				app.setStatus(1);// under process
				app.setUser(doctorUser);
				app.setAppointmentDate(startDate);
				app.setUser1(patientUser);

				patientDao.addAppointment(app);

				List<Appointment> appointments = userDao.getAppointmentByPatient(patientUser.getUserId());
				session.setAttribute("appointments", appointments);
				return "patient";
			}

		}
		return null;
	}

	@RequestMapping(value = "/viewBill.htm", method = RequestMethod.GET)
	public String viewBill(HttpServletRequest request) throws AdException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		List<BillHistory> billHistory = patientDao.getPaymentHistory(user.getUserId());

		session.setAttribute("billHistory", billHistory);
		return "patientPayment";
	}

	@RequestMapping(value = "/patientRegisterEvent.htm", method = RequestMethod.GET)
	public String patientRegisterEvent(HttpServletRequest request) throws AdException {
		Events events = userDao.getEvent();

		HttpSession session = request.getSession();
		session.setAttribute("events", events);
		return "patientRegisterEvent";
	}

	@RequestMapping(value = "/registerEvent.htm", method = RequestMethod.POST)
	public String registerEvent(HttpServletRequest request) throws AdException {

		HttpSession session = request.getSession();
		String eventName = request.getParameter("eventName");
		String details = request.getParameter("details");
		String date = request.getParameter("eventDate");
		String requirement = request.getParameter("requirement");

		Events events = (Events) session.getAttribute("events");
		int id = events.getId();
		User user = (User) session.getAttribute("user");
		String fName = user.getFirstName();
		String lName = user.getLastName();
		String patientName = fName + " " + lName;
		patientDao.updateEvents(patientName, id);

		session.setAttribute("message", "Registration Successful !!");

		return "patientRegisterEvent";
	}

	@RequestMapping(value = "/patientPrescription.htm", method = RequestMethod.GET)
	public String patientPrescription(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
		String action = (String) request.getParameter("action1");

		System.out.println(action);
		if (action != null) {

			String appointmentId = action;
			System.out.println("1 " + appointmentId);
			Prescription prescription = patientDao.getPatientPrescription(Integer.parseInt(appointmentId));
			System.out.println("2 " + prescription.getDetails());
			session.setAttribute("prescription", prescription);
			session.setAttribute("action1", action);

		}
		return "patientPrescription";
	}

	@RequestMapping(value = "/billPayment.htm", method = RequestMethod.POST)
	public String patientPayment(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();

		String consultationFees = request.getParameter("hiddenFees");
		// String tax =request.getParameter("hiddenTax");
		String discount = request.getParameter("hiddenDiscount");
		String otherCharges = request.getParameter("hiddenCharges");
		String medicinePrice = request.getParameter("medicinePrice");

		// String t = tax.substring(0,4);

		double newTax = 14.6;

		double cFees = Double.parseDouble(consultationFees);
		double dDiscount = Double.parseDouble(discount);
		double oCharges = Double.parseDouble(otherCharges);
		// double mPrice = Double.parseDouble(medicinePrice);

		double totalAmount = cFees + (cFees * (newTax / 100)) - dDiscount + oCharges;
		session.setAttribute("totalAmount", totalAmount);
		return "patientBillPayment";
	}

	@RequestMapping(value = "/paidBill.htm", method = RequestMethod.POST)
	public String paidBill(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();

		String cardNumber = request.getParameter("cardNumber");
		String cardExpiry = request.getParameter("cardExpiry");
		String cvv = request.getParameter("cvv");
		String hiddenTotalAmount = request.getParameter("hiddenTotalAmount");

		Payment p = new Payment();
		p.setCardNumber(cardNumber);
		p.setCvvNumber(Integer.parseInt(cvv));
		p.setExpirationDate(cardExpiry);
		p.setTotalAmount(hiddenTotalAmount);
		String app = (String) session.getAttribute("action1");
		p.setAppointment(patientDao.getAppointmentById(Integer.parseInt(app)));
		;
		patientDao.addPayment(p);

		return "patient";
	}

	@RequestMapping(value = "/patientDoctors.htm", method = RequestMethod.GET)
	public String doctorList(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
		List<User> doctorList = new ArrayList<User>();
		doctorList = receptionistDao.getDoctors();
		session.setAttribute("doctorList", doctorList);
		return "patientDoctors";
	}

	@RequestMapping(value = "/patientProfile.htm", method = RequestMethod.GET)
	public String patientProfile(HttpServletRequest request) throws AdException {

		return "patientProfile";
	}

	@RequestMapping(value = "/donateBlood.htm", method = RequestMethod.GET)
	public String donateBlood(HttpServletRequest request) throws AdException {

		return "donateBlood";
	}

	@RequestMapping(value = "/patientProfileEdit.htm", method = RequestMethod.POST)
	public String doctorProfileEdit(HttpServletRequest request) throws AdException {
		HttpSession session = request.getSession();
		String fName = request.getParameter("first_name");
		String lName = request.getParameter("last_name");
		String mNumber = request.getParameter("mobile");
		String Address = request.getParameter("address");
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(12);
		String password = encoder.encode(request.getParameter("password"));
		User u = (User) session.getAttribute("user");
		int id = u.getUserId();
		User user = doctorDAO.updateDoctors(fName, lName, mNumber, Address, password, id);
		session.setAttribute("user", user);
		request.setAttribute("profileUpdated", "Your profile has been updated");
		return "patientProfile";
	}

	@RequestMapping(value = "/submitdonateBlood.htm", method = RequestMethod.POST)
	public String submitDonateBlood(HttpServletRequest request) throws AdException {
		HttpSession session = request.getSession();
		String blood = request.getParameter("blood");
		String date = request.getParameter("date");
		String contact = request.getParameter("contact");
		User u = (User) session.getAttribute("user");

		BloodBank bb = new BloodBank();
		bb.setBloodGroup(blood);
		bb.setContactMe(contact);
		bb.setDonationDate(date);
		bb.setUser(u);

		patientDao.addBloodBank(bb);
		request.setAttribute("message", "Thank you for donating the blood");

		return "donateBlood";
	}

	@RequestMapping(value = "/viewPdfBill.htm", method = RequestMethod.GET)
	public void generateReport(HttpServletRequest request, HttpServletResponse response)
			throws DocumentException, IOException, AdException {

		try {
			Document document = new Document();

			

			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			PdfWriter writer = PdfWriter.getInstance(document, baos);

			document.open();
			// document.add(image);
			Paragraph paragraph = new Paragraph();
			paragraph.add("Patient Billing Report");
			paragraph.setAlignment(Element.ALIGN_CENTER);
			document.add(paragraph);
			String id = request.getParameter("billId");
			System.out.println("Pdf " + Integer.parseInt(id));
			List<BillHistory> billHistory = patientDao.getPaymentHistoryPerId(Integer.parseInt(id));
			for (BillHistory bilHis : billHistory) {
				document.add(new Paragraph("Total Amount: " + bilHis.getTotalAmount()));
				document.add(new Paragraph("Treated By: " + bilHis.getDoctorName()));
				document.add(new Paragraph("Tax Deducted: " + bilHis.getTax()));
				document.add(new Paragraph("Consultation Fees: " + bilHis.getConsultationFees()));
				document.add(new Paragraph("Discount Offered: " + bilHis.getDiscount()));
			}
			document.close();

			response.setHeader("Expires", "0");
			response.setHeader("Cache-Control", "must-revalidate, post-check=0, pre-check=0");
			response.setHeader("Pragma", "public");
			response.setContentType("application/pdf");
			response.setContentLength(baos.size());

			OutputStream os = response.getOutputStream();
			baos.writeTo(os);
			os.flush();
			os.close();
		} catch (DocumentException e) {
			throw new IOException(e.getMessage());
		}

	}

}
