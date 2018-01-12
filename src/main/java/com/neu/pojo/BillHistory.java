package com.neu.pojo;

public class BillHistory {

	private int prescriptionId;
	private String totalAmount;
	private String doctorName;
	private String tax;
	private String consultationFees;
	private String discount;
	
	
	
	
	
	public String getTax() {
		return tax;
	}
	public void setTax(String tax) {
		this.tax = tax;
	}

	public int getPrescriptionId() {
		return prescriptionId;
	}
	public void setPrescriptionId(int prescriptionId) {
		this.prescriptionId = prescriptionId;
	}
	public String getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getDoctorName() {
		return doctorName;
	}
	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	public String getConsultationFees() {
		return consultationFees;
	}
	public void setConsultationFees(String consultationFees) {
		this.consultationFees = consultationFees;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	
}
