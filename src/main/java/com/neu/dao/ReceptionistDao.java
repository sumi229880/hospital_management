package com.neu.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import com.neu.exception.AdException;
import com.neu.pojo.Appointment;
import com.neu.pojo.Payment;
import com.neu.pojo.User;

public class ReceptionistDao extends DAO {
	
	public Appointment addAppointment(Appointment app) throws AdException {
		try {
			begin();
			getSession().save(app);
			commit();
			return app;
		} catch (HibernateException exception) {
			rollback();
			throw new AdException("Exception while creating Appointment: " + exception.getMessage());

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
	
	public List<User> getPatients() throws AdException {

		List<User> patientList = new ArrayList<User>();
		try {
			begin();
			Session session = getSession();
			session.beginTransaction();
			Query query = (Query) getSession().createQuery("from User where userRole = :patient");
			query.setString("patient", "patient");
			patientList = query.list();
			return patientList;
		} catch (HibernateException exception) {
			rollback();
			throw new AdException("Exception while creating user: " + exception.getMessage());

		} finally {
			close();
		}
	}
	
	public List<User> getReceptionist() throws AdException {

		List<User> receptionistList = new ArrayList<User>();
		try {
			begin();
			Session session = getSession();
			session.beginTransaction();
			Query query = (Query) getSession().createQuery("from User where userRole = :receptionist");
			query.setString("receptionist", "receptionist");
			receptionistList = query.list();
			return receptionistList;
		} catch (HibernateException exception) {
			rollback();
			throw new AdException("Exception while creating user: " + exception.getMessage());

		} finally {
			close();
		}
	}
	
	public List<Appointment> getAppointments() throws AdException {

		List<Appointment> appointmentList = new ArrayList<Appointment>();
		try {
			begin();
			Session session = getSession();
			session.beginTransaction();
			Query query = (Query) getSession().createQuery("from Appointment");
			appointmentList = query.list();
			return appointmentList;
		} catch (HibernateException exception) {
			rollback();
			throw new AdException("Exception while creating user: " + exception.getMessage());

		} finally {
			close();
		}
	}

	public List<Payment> getPayments() throws AdException {

		List<Payment> paymentList = new ArrayList<Payment>();
		try {
			begin();
			Session session = getSession();
			session.beginTransaction();
			Query query = (Query) getSession().createQuery("from Payment");
			paymentList = query.list();
			return paymentList;
		} catch (HibernateException exception) {
			rollback();
			throw new AdException("Exception while creating user: " + exception.getMessage());

		} finally {
			close();
		}
	}

}