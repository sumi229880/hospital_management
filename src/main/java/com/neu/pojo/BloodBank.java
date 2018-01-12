package com.neu.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity 
@Table(name = "bloodbank")
public class BloodBank {

	@Id
	@GeneratedValue
	@Column (name = "bloodid",unique =true,nullable =false)
	private int bloodId;
	
	@Column(name="bloodgroup")
	private String bloodGroup;
	
	@Column(name="donationdate")
	private String donationDate;
	
	@Column(name="contactme")
	private String contactMe;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "patientId")
	private User user;
	
	public BloodBank(){
		
	}

	public int getBloodId() {
		return bloodId;
	}

	public void setBloodId(int bloodId) {
		this.bloodId = bloodId;
	}

	public String getBloodGroup() {
		return bloodGroup;
	}

	public void setBloodGroup(String bloodGroup) {
		this.bloodGroup = bloodGroup;
	}

	public String getDonationDate() {
		return donationDate;
	}

	public void setDonationDate(String donationDate) {
		this.donationDate = donationDate;
	}

	public String getContactMe() {
		return contactMe;
	}

	public void setContactMe(String contactMe) {
		this.contactMe = contactMe;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
}
