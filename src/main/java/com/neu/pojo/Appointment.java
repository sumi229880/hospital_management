package com.neu.pojo;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table (name = "appointment")
public class Appointment {
	
	public Appointment(){
		
	}
	
	@Id
	@GeneratedValue
	@Column (name = "appointmentid",unique =true,nullable =false)
	private int appointmentId;
	
	@Column (name = "appointmentdate")
	private Date appointmentDate;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "patientId")
	private User user1;
	
	@Column (name = "reason")
	private String reason;
	
	@Column (name = "status")
	private int status; //1 - under process or 2 - processed or 3 = cancelled
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "doctorid")
	private User user;
	
	@OneToOne(cascade = CascadeType.ALL, mappedBy = "appointment", fetch = FetchType.LAZY)
	private Prescription prescription;
	
	@OneToOne(cascade = CascadeType.ALL, mappedBy = "appointment", fetch = FetchType.LAZY)
	private Payment payment;
	
	public int getAppointmentId() {
		return appointmentId;
	}
	public void setAppointmentId(int appointmentId) {
		this.appointmentId = appointmentId;
	}
	public Date getAppointmentDate() {
		return appointmentDate;
	}
	public void setAppointmentDate(Date appointmentDate) {
		this.appointmentDate = appointmentDate;
	}

	public User getUser1() {
		return user1;
	}
	public void setUser1(User user1) {
		this.user1 = user1;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	

	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Prescription getPrescription() {
		return prescription;
	}
	public void setPrescription(Prescription prescription) {
		this.prescription = prescription;
	}
	public Payment getPayment() {
		return payment;
	}
	public void setPayment(Payment payment) {
		this.payment = payment;
	}
	
	
	
}
