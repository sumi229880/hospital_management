package com.neu.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table (name = "prescription")
public class Prescription {
	
	public Prescription(){
		
	}
	
	@Id
	@GeneratedValue
	@Column (name = "prescriptionid",unique =true,nullable =false)
	private int prescriptionId;
	
	@Column (name = "details")
	private String details;
	
	@Column (name = "consultationFees")
	private String consultationFees;
	
	@Column (name = "tax")
	private String tax;
	
	@Column (name = "charges")
	private String charges;
	
	@Column (name = "discount")
	private String discount;
	
	@Column (name = "medicine")
	private String medicine;
	
	@Column (name = "medicinePrice")
	private String medicinePrice;
	
	
	@OneToOne (fetch = FetchType.EAGER)
	@JoinColumn (name = "appointmentId", nullable = false)
	private Appointment appointment;
	
	
	
	public String getMedicinePrice() {
		return medicinePrice;
	}
	public void setMedicinePrice(String medicinePrice) {
		this.medicinePrice = medicinePrice;
	}
	public String getMedicine() {
		return medicine;
	}
	public void setMedicine(String medicine) {
		this.medicine = medicine;
	}
	public int getPrescriptionId() {
		return prescriptionId;
	}
	public void setPrescriptionId(int prescriptionId) {
		this.prescriptionId = prescriptionId;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public Appointment getAppointment() {
		return appointment;
	}
	public void setAppointment(Appointment appointment) {
		this.appointment = appointment;
	}
	public String getConsultationFees() {
		return consultationFees;
	}
	public void setConsultationFees(String consultationFees) {
		this.consultationFees = consultationFees;
	}
	public String getTax() {
		return tax;
	}
	public void setTax(String tax) {
		this.tax = tax;
	}
	public String getCharges() {
		return charges;
	}
	public void setCharges(String charges) {
		this.charges = charges;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	
	
}
