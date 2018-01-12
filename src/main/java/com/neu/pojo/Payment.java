package com.neu.pojo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table (name = "payment")
public class Payment {
	
	public Payment(){
		
	}
	
	@Id
	@GeneratedValue
	@Column (name = "paymentid",unique =true,nullable =false)
	private int paymentId;
	
	@Column (name = "cardnumber")
	private String cardNumber;
	
	@Column (name = "cvvnumber")
	private int cvvNumber;
	
	@Column (name = "expirationdate")
	private String expirationDate;
	
	@Column (name = "totalAmount")
	private String totalAmount;
	
	@OneToOne (fetch = FetchType.EAGER)
	@JoinColumn(name = "appointmentId", nullable = false)
	private Appointment appointment;
	
	public int getPaymentId() {
		return paymentId;
	}
	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
	}
	public String getCardNumber() {
		return cardNumber;
	}
	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}
	public int getCvvNumber() {
		return cvvNumber;
	}
	public void setCvvNumber(int cvvNumber) {
		this.cvvNumber = cvvNumber;
	}


	public String getExpirationDate() {
		return expirationDate;
	}
	public void setExpirationDate(String expirationDate) {
		this.expirationDate = expirationDate;
	}
	public String getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}
	public Appointment getAppointment() {
		return appointment;
	}
	public void setAppointment(Appointment appointment) {
		this.appointment = appointment;
	}
	
	
	
}
