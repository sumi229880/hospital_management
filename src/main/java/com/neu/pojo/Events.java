package com.neu.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Events")
public class Events {
	
	@Id
	@GeneratedValue
	@Column (name = "eventId",unique =true,nullable =false)
	private int id;
	
	@Column(name="eventName")
	private String eventName;
	
	@Column(name="details")
	private String details;
	
	@Column(name="requirement")
	private String requirement;
	
	@Column(name="date")
	private String date;
	
	@Column(name="patientName")
	private String patientName;
	
	public Events(){
		
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public String getRequirement() {
		return requirement;
	}
	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getPatientName() {
		return patientName;
	}
	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}
	
	
}
