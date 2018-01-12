package com.neu.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import com.neu.exception.AdException;
import com.neu.pojo.BloodBank;
import com.neu.pojo.Prescription;
import com.neu.pojo.User;

public class DoctorDAO extends DAO {

	public DoctorDAO() {

	}

	public Prescription addPrescription(Prescription prescription) throws AdException {
		try {
			begin();
			getSession().save(prescription);
			commit();
			return prescription;
		} catch (HibernateException exception) {
			rollback();
			throw new AdException("Exception while creating User: " + exception.getMessage());

		} finally {
			close();
		}
	}

	public User updateDoctors(String fName, String lName, String mNumber, String Address, String password, int id) throws AdException{
		try{
			begin();
			Query q = getSession().createQuery("Update User set firstName = :fName , lastName = :lName, "
					+ "mobileNUmber = :mNumber, address = :Address, password = :password "
					+ "where userId = :id");
			q.setString("fName", fName);
			q.setString("lName", lName);
			q.setString("mNumber", mNumber);
			q.setString("Address", Address);
			q.setString("password", password);
			q.setInteger("id", id);
			q.executeUpdate();
			commit();
			Query query = getSession().createQuery("from User where userId = :id");
			query.setInteger("id", id);
			User user = (User) query.uniqueResult();
			return user;
		}catch(HibernateException e){
			rollback();
			throw new AdException("Could not get user" +fName, e);
		}
	}
	
	public List<BloodBank> getListofBloodDonors() throws AdException {

		List<BloodBank> donorList = new ArrayList<BloodBank>();
		try {
			begin();
			Session session = getSession();
			session.beginTransaction();
			Query query = (Query) getSession().createQuery("from BloodBank");
			donorList = query.list();
			return donorList;
		} catch (HibernateException exception) {
			rollback();
			throw new AdException("Exception while creating user: " + exception.getMessage());

		} finally {
			close();
		}
	}
	
	public void updateAppointment(int id) throws AdException{
		try{
			begin();
			Query q = getSession().createQuery("Update Appointment set status = :status "
					+ "where id = :id");
			q.setInteger("status", 2);

			q.setInteger("id", id);
			q.executeUpdate();
			commit();
		}catch(HibernateException e){
			rollback();
			throw new AdException("Could not get user" +id, e);
		}
	}
}
