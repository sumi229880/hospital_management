package com.neu.edu;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import com.neu.dao.DoctorDAO;
import com.neu.exception.AdException;
import com.neu.pojo.Appointment;
import com.neu.pojo.BloodBank;
import com.neu.pojo.DiseaseXML;
import com.neu.pojo.Prescription;
import com.neu.pojo.User;

@Controller
public class DoctorController {
	
	
	@Autowired
	@Qualifier("DoctorDao")
	private DoctorDAO doctorDAO;

	@RequestMapping (value = "/hospitalGallery.htm" , method = RequestMethod.GET)
	public String doctorGallery(HttpServletRequest request) throws Exception{
		return "hospitalGallery";
	}
	
	
	
	@RequestMapping (value = "/assignedPatient.htm" , method = RequestMethod.GET)
	public String assignedPatient(HttpServletRequest request) throws Exception{
			
		return "assignedPatient";
	}
	
	
	@RequestMapping (value = "/BloodDonor.htm" , method = RequestMethod.GET)
	public String bloodDonorList(HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		List<BloodBank> donorList = new ArrayList<BloodBank>();
		donorList=doctorDAO.getListofBloodDonors();
		session.setAttribute("donorList", donorList);
		return "doctorBloodBank";
	}
	
	
	@RequestMapping (value = "/doctorPrescription.htm" , method = RequestMethod.GET)
	public String doctorPrescription(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();	
		String action = request.getParameter("action");
		session.setAttribute("action", action);
		return "doctorPrescription";
	}
	
	@RequestMapping (value = "/doctorPrescriptionSubmit.htm" , method = RequestMethod.POST)
	public String doctorPrescriptionSubmit(HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();	
		String action = (String) session.getAttribute("action");
		if(action != null){
			System.out.println("In If"+action);
			String appointmentId = action;
			String details = request.getParameter("details");
			String consultationFees = request.getParameter("consultationFees");
//			String tax = request.getParameter("tax");
			String otherCharges = request.getParameter("otherCharges");
			String discount = request.getParameter("discount");
			String price = request.getParameter("price");
			
			Appointment newApp = new Appointment();
			System.out.println("Idhar tak");
			int appId = 0;
			List<Appointment> appList = (List<Appointment>) session.getAttribute("appointments");
			for(Appointment appointment : appList){
				System.out.println("In for"+appointment.getAppointmentId());
				if(appointment.getAppointmentId() == Integer.parseInt(appointmentId)){
					System.out.println("newApp"+ newApp.getAppointmentId());
					newApp = appointment;
					newApp.setStatus(2);
					appId = newApp.getAppointmentId();
				}
			}
			
			
			doctorDAO.updateAppointment(appId);
			Prescription newPrescription = new Prescription();
			newPrescription.setAppointment(newApp);
			newPrescription.setDetails(details);
			newPrescription.setConsultationFees(consultationFees);
			newPrescription.setTax("14.6%");
			newPrescription.setCharges(otherCharges);
			newPrescription.setDiscount(discount);
			newPrescription.setMedicinePrice(price);
			
			doctorDAO.addPrescription(newPrescription);
		}
		
		
		return "doctor";
	}
	
	

	
	@RequestMapping(value = "/doctorDiseases.htm", method = RequestMethod.GET)
	public String doctorDiseases(HttpServletRequest request) throws SAXException, IOException, ParserConfigurationException{
		
		HttpSession session = request.getSession();
		
		Client client = ClientBuilder.newClient();
		
		System.out.println("restCall");
		
//		WebTarget target = client.target("http://localhost:8088/HospitalRestService/service/getAllDiseaseInXML");
		WebTarget target = client.target("http://sample-env.sgji8wkx9h.us-east-1.elasticbeanstalk.com/service/getAllDiseaseInXML");
		
		String s = target.request(MediaType.APPLICATION_XML).get(String.class);
		
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
		Document doc = dBuilder.parse(new InputSource(new ByteArrayInputStream(s.getBytes("utf-8"))));
		doc.getDocumentElement().normalize();
		
		NodeList nList = doc.getElementsByTagName("disease");
		
		List<DiseaseXML> diseaseList = new ArrayList<DiseaseXML>();
		
		for (int temp = 0; temp < nList.getLength(); temp++) {

			Node nNode = nList.item(temp);
			DiseaseXML newProduct = new DiseaseXML();


			if (nNode.getNodeType() == Node.ELEMENT_NODE) {

				Element eElement = (Element) nNode;

				
				newProduct.setId(Integer.parseInt((eElement.getElementsByTagName("id").item(0)).getTextContent()));
				newProduct.setDiseaseName(eElement.getElementsByTagName("name").item(0).getTextContent());
				newProduct.setDetails(eElement.getElementsByTagName("diseaseSymp").item(0).getTextContent());
				newProduct.setDiseaseSymp(eElement.getElementsByTagName("details").item(0).getTextContent());
				diseaseList.add(newProduct);

			}
		}
		
		session.setAttribute("diseaseList", diseaseList);
		
		
		return "doctorDiseases";
	}

	
	@RequestMapping(value = "/doctorProfile.htm", method = RequestMethod.GET)
	public String doctorProfile(HttpServletRequest request) throws AdException {

		return "doctorProfile";
	}
	
	
	
	@RequestMapping(value = "/doctorProfileEdit.htm", method = RequestMethod.POST)
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
		return "doctorProfile";
	}
	
	private static String readAll(Reader rd) throws IOException {
		StringBuilder sb = new StringBuilder();
		int cp;
		while ((cp = rd.read()) != -1) {
			sb.append((char) cp);
		}
		return sb.toString();
	}

	public static JSONObject readJsonFromUrl(String url) throws IOException, JSONException {
		InputStream is = new URL(url).openStream();
		try {
			BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
			String jsonText = readAll(rd);
			JSONObject json = new JSONObject(jsonText);
			return json;
		} finally {
			is.close();
		}
	}

	@RequestMapping(value = "/doctorMedicines.htm", method = RequestMethod.POST)
	public String doctorMedicines(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String tags = request.getParameter("tags");
		JSONObject json = readJsonFromUrl("http://sample-env-1.yyrq3mmpds.us-east-1.elasticbeanstalk.com/Medicines/index.php/?name="+tags);
		System.out.println(json.toString());
		System.out.println(json.get("medicine_price"));
		Integer medicine_price = (Integer) json.get("medicine_price");
		session.setAttribute("medicine_Price", medicine_price);
		return "doctorPrescription";
	}
}
