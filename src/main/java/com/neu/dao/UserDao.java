package com.neu.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import com.neu.exception.AdException;
import com.neu.pojo.Appointment;
import com.neu.pojo.BloodBank;
import com.neu.pojo.Events;
import com.neu.pojo.User;

public class UserDao extends DAO {

	public UserDao() {

	}

	public User addUser(User user) throws AdException {
		try {
			begin();
			getSession().save(user);
			commit();
			return user;
		} catch (HibernateException exception) {
			rollback();
			throw new AdException("Exception while creating User: " + exception.getMessage());

		} finally {
			close();
		}
	}

	public Events addEvents(Events event) throws AdException {
		try {
			begin();
			getSession().save(event);
			commit();
			return event;
		} catch (HibernateException exception) {
			rollback();
			throw new AdException("Exception while creating Events: " + exception.getMessage());

		} finally {
			close();
		}
	}
	
	public Events getEvent() throws AdException {

		Events event = new Events();
		try {
			begin();
			Session session = getSession();
			session.beginTransaction();
			Query query = (Query) getSession().createQuery("from Events");
			query.setMaxResults(1);
			event = (Events) query.uniqueResult();
			return event;
		} catch (HibernateException exception) {
			rollback();
			throw new AdException("Exception while creating user: " + exception.getMessage());

		} finally {
			close();
		}
	}

	public User loginUser(String email, String password) throws AdException {

		try {
			begin();
			Query query = (Query) getSession().createQuery("from User where emailId = :email and password = :password");
			query.setString("email", email);
			query.setString("password", password);
			User user = (User) query.uniqueResult();
			return user;
		} catch (HibernateException exception) {
			rollback();
			throw new AdException("Exception while creating user: " + exception.getMessage());

		} finally {
			close();
		}

	}

	public List<User> getDoctors() throws AdException {

		List<User> doctorList = new ArrayList<User>();
		try {
			begin();
			Session session = getSession();
			session.beginTransaction();
			Query query = (Query) getSession().createQuery("from User where userRole = :doctor");
			query.setString("doctor", "doctor");
			doctorList = query.list();
			return doctorList;
		} catch (HibernateException exception) {
			rollback();
			throw new AdException("Exception while creating user: " + exception.getMessage());

		} finally {
			close();
		}
	}
	
	public User getDoctorByName(String doctorFname, String doctorLname ) throws AdException {

		User doctorUser = new User();
		try {
			begin();
			Session session = getSession();
			session.beginTransaction();
			Query query = (Query) getSession().createQuery("from User where userRole = :doctor and firstName = :fName and lastName = :lName");
			query.setString("doctor", "doctor");
			query.setString("fName", doctorFname);
			query.setString("lName", doctorLname);
			doctorUser = (User) query.uniqueResult();
			return doctorUser;
		} catch (HibernateException exception) {
			rollback();
			throw new AdException("Exception while creating user: " + exception.getMessage());

		} finally {
			close();
		}
	}
	

	
	
	public List<Appointment> getAppointmentByDoctor(int doctId) throws AdException {

		List<Appointment> appointmentList = new ArrayList<Appointment>();
		try {
			begin();
			Session session = getSession();
			session.beginTransaction();
			Query query = (Query) getSession().createQuery("from Appointment where user = :doctId");
			query.setString("doctId", String.valueOf(doctId));
			appointmentList = query.list();
			return appointmentList;
		} catch (HibernateException exception) {
			rollback();
			throw new AdException("Exception while creating user: " + exception.getMessage());

		} finally {
			close();
		}
	}
	
	public List<Appointment> getAppointmentByPatient(int patientId) throws AdException {

		List<Appointment> appointmentList = new ArrayList<Appointment>();
		try {
			begin();
			Session session = getSession();
			session.beginTransaction();
			Query query = (Query) getSession().createQuery("from Appointment where user1 = :patientId");
			query.setString("patientId", String.valueOf(patientId));
			appointmentList = query.list();
			return appointmentList;
		} catch (HibernateException exception) {
			rollback();
			throw new AdException("Exception while creating user: " + exception.getMessage());

		} finally {
			close();
		}
	}
	
	public boolean userExists(String emailId) throws AdException {
		System.out.println("In user"+emailId);
		try {
			begin();
			Query query =getSession().createQuery("from User where emailId = :emailId");
			query.setString("emailId", emailId);

			User user = (User) query.uniqueResult();

			commit();
			if (user != null) {
				
				return true;
			} else {
				
				return false;
			}
		} catch (HibernateException e) {
			rollback();
			return false;
		} finally {
			close();
		}

	}
	
	

}
