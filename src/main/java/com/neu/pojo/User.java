package com.neu.pojo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
@Entity 
@Table(name = "user")
public class User implements UserDetails {
	
	public User(){
		
	}
	
	@Id
	@GeneratedValue
	@Column (name = "userid",unique =true,nullable =false)
	private int userId;
	
	@Column (name = "firstName")
	private String firstName;
	
	@Column (name = "lastName")
	private String lastName;
	
	@Column (name = "address")
	private String address;
	
	
	@Column (name = "emailId")
	private String emailId;
	
	@Column (name = "password")
	private String password;
	
	@Column (name = "mobilenumber")
	private String mobileNUmber;
	
	@Column (name = "userrole")
	private String userRole;
	
	@Column (name = "department")
	private String department; //doctor
	
	@Column (name = "degree")
	private String degree; //doctor
	
	@Column (name = "salary")
	private String salary; //doctor
	
	@Column (name = "age")
	private int age; //patient
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user", cascade = CascadeType.ALL)
	private Set<Appointment> appointment = new HashSet<Appointment>();
	

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user1", cascade = CascadeType.ALL)
	private Set<Appointment> appointment1 = new HashSet<Appointment>();
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user", cascade = CascadeType.ALL)
	private Set<BloodBank> bloodBank = new HashSet<BloodBank>();
	
	public Set<Appointment> getAppointment1() {
		return appointment1;
	}
	public void setAppointment1(Set<Appointment> appointment1) {
		this.appointment1 = appointment1;
	}
	public Set<BloodBank> getBloodBank() {
		return bloodBank;
	}
	public void setBloodBank(Set<BloodBank> bloodBank) {
		this.bloodBank = bloodBank;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMobileNUmber() {
		return mobileNUmber;
	}
	public void setMobileNUmber(String mobileNUmber) {
		this.mobileNUmber = mobileNUmber;
	}
	public String getUserRole() {
		return userRole;
	}
	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
	public Set<Appointment> getAppointment() {
		return appointment;
	}
	public void setAppointment(Set<Appointment> appointment) {
		this.appointment = appointment;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	@Override
	public String toString(){
		return firstName + " "+ lastName; 
	}
	@Override
	public Collection<GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		Collection<GrantedAuthority> grantedAuthority = new ArrayList<GrantedAuthority>();
		grantedAuthority.add( new GrantedAuthorityImpl(this.getUserRole()));
//		grantedAuthority.add(new GrantedAuthorityImpl("doctor"));
//		grantedAuthority.add(new GrantedAuthorityImpl("admin"));
//		grantedAuthority.add(new GrantedAuthorityImpl("receptionist"));
		return grantedAuthority;
	}
	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return this.emailId;
	}
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}

	
}