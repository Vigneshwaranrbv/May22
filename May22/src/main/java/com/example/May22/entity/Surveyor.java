package com.example.May22.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table
public class Surveyor {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long surveyorid;
	private String username;
	private String email;
	private String password;
	private String role;
	
	@OneToMany(mappedBy = "surveyor", cascade = CascadeType.ALL)
	private List<Customer> customer;

	public Surveyor(Long surveyorid, String username, String email, String password, String role) {
		super();

		this.surveyorid = surveyorid;
		this.username = username;
		this.email = email;
		this.password = password;
		this.role = role;
	}

	public Surveyor() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Long getSurveyorid() {
		return surveyorid;
	}

	public void setSurveyorid(Long surveyorid) {
		this.surveyorid = surveyorid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
}
