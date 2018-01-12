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
import com.neu.pojo.BillHistory;
import com.neu.pojo.BloodBank;
import com.neu.pojo.Events;
import com.neu.pojo.Payment;
import com.neu.pojo.Prescription;
import com.neu.pojo.User;

public class PatientDao extends DAO {

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

	public Payment addPayment(Payment p) throws AdException {
		try {
			begin();
			getSession().save(p);
			commit();
			return p;
		} catch (HibernateException exception) {
			rollback();
			throw new AdException("Exception while creating Appointment: " + exception.getMessage());

		} finally {
			close();
		}
	}

	public Prescription getPatientPrescription(int appointmentId) throws AdException {

		Prescription prescription = new Prescription();
		try {
			begin();
			Session session = getSession();
			session.beginTransaction();
			Query query = (Query) getSession().createQuery("from Prescription where appointment = :appointmentId");
			query.setString("appointmentId", String.valueOf(appointmentId));
			prescription = (Prescription) query.uniqueResult();
			;
			return prescription;
		} catch (HibernateException exception) {
			rollback();
			throw new AdException("Exception while creating user: " + exception.getMessage());

		} finally {
			close();
		}
	}

	public Appointment getAppointmentById(int appointmentId) throws AdException {

		Appointment appointment = new Appointment();
		try {
			begin();
			Session session = getSession();
			session.beginTransaction();
			Query query = (Query) getSession().createQuery("from Appointment where appointmentId = :appointmentId");
			query.setString("appointmentId", String.valueOf(appointmentId));
			appointment = (Appointment) query.uniqueResult();
			return appointment;
		} catch (HibernateException exception) {
			rollback();
			throw new AdException("Exception while creating user: " + exception.getMessage());

		} finally {
			close();
		}
	}

	public List<BillHistory> getPaymentHistory(int userId) throws AdException {

		List<BillHistory> billHistory = new ArrayList<BillHistory>();
		try {
			begin();
			Session session = getSession();
			session.beginTransaction();
			Query query = (Query) getSession().createSQLQuery(
					"select pr.prescriptionid, p.totalAmount, concat(doc.firstName,' ' ,doc.lastname) as FullName , pr.tax, pr.consultationFees, pr.discount from user as u"
							+ " join appointment as a on a.patientId =u.userid"
							+ " join prescription as pr on pr.appointmentid = a.appointmentid"
							+ " join payment as p on p.appointmentId = a.appointmentid"
							+ " join user as doc on a.doctorid = doc.userid where u.userid = :userId");
			query.setString("userId", String.valueOf(userId));
			List list = query.list();
			Iterator<Object[]> iter = list.iterator();

			while (iter.hasNext()) {
				Object[] obj = iter.next();
				BillHistory bh = new BillHistory();
				bh.setPrescriptionId(Integer.parseInt(obj[0].toString()));
				bh.setTotalAmount(obj[1].toString());
				bh.setDoctorName(obj[2].toString());
				bh.setTax(obj[3].toString());
				bh.setConsultationFees(obj[4].toString());
				bh.setDiscount(obj[5].toString());
				billHistory.add(bh);
			}
			return billHistory;
		} catch (HibernateException exception) {
			rollback();
			throw new AdException("Exception while creating user: " + exception.getMessage());

		} finally {
			close();
		}
	}
	
	public List<BillHistory> getPaymentHistoryPerId(int presId) throws AdException {

		List<BillHistory> billHistory = new ArrayList<BillHistory>();
		try {
			begin();
			Session session = getSession();
			session.beginTransaction();
			Query query = (Query) getSession().createSQLQuery(
					"select pr.prescriptionid, p.totalAmount, concat(doc.firstName,' ' ,doc.lastname) as FullName , pr.tax, pr.consultationFees, pr.discount from user as u"
							+ " join appointment as a on a.patientId =u.userid"
							+ " join prescription as pr on pr.appointmentid = a.appointmentid"
							+ " join payment as p on p.appointmentId = a.appointmentid"
							+ " join user as doc on a.doctorid = doc.userid where pr.prescriptionid = :presId");
			query.setString("presId", String.valueOf(presId));
			List list = query.list();
			Iterator<Object[]> iter = list.iterator();

			while (iter.hasNext()) {
				Object[] obj = iter.next();
				BillHistory bh = new BillHistory();
				bh.setPrescriptionId(Integer.parseInt(obj[0].toString()));
				bh.setTotalAmount(obj[1].toString());
				bh.setDoctorName(obj[2].toString());
				bh.setTax(obj[3].toString());
				bh.setConsultationFees(obj[4].toString());
				bh.setDiscount(obj[5].toString());
				billHistory.add(bh);
			}
			return billHistory;
		} catch (HibernateException exception) {
			rollback();
			throw new AdException("Exception while creating user: " + exception.getMessage());

		} finally {
			close();
		}
	}
	
	public BloodBank addBloodBank(BloodBank b) throws AdException {
		try {
			begin();
			getSession().save(b);
			commit();
			return b;
		} catch (HibernateException exception) {
			rollback();
			throw new AdException("Exception while creating BloodBank: " + exception.getMessage());

		} finally {
			close();
		}
	}
	
	public void updateEvents(String patientName, int id) throws AdException{
		try{
			begin();
			Query q = getSession().createQuery("Update Events set patientName = :patientName "
					+ "where id = :id");
			q.setString("patientName", patientName);

			q.setInteger("id", id);
			q.executeUpdate();
			commit();
		}catch(HibernateException e){
			rollback();
			throw new AdException("Could not get user" +patientName, e);
		}
	}
}
