package com.example.May22.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class AdminPolicy {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id;
	String policyname;
	String policytype;
	Double suminsured;
	Double premiumamount;
	Long duration;
	String description;
	String eligibility;
	String termsconditions;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getPolicyname() {
		return policyname;
	}
	public void setPolicyname(String policyname) {
		this.policyname = policyname;
	}
	public String getPolicytype() {
		return policytype;
	}
	public void setPolicytype(String policytype) {
		this.policytype = policytype;
	}
	public double getSuminsured() {
		return suminsured;
	}
	public void setSuminsured(double suminsured) {
		this.suminsured = suminsured;
	}
	public double getPremiumamount() {
		return premiumamount;
	}
	public void setPremiumamount(double premiumamount) {
		this.premiumamount = premiumamount;
	}
	public Long getDuration() {
		return duration;
	}
	public void setDuration(Long duration) {
		this.duration = duration;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getEligibility() {
		return eligibility;
	}
	public void setEligibility(String eligibility) {
		this.eligibility = eligibility;
	}
	public String getTermsconditions() {
		return termsconditions;
	}
	public void setTermsconditions(String termsconditions) {
		this.termsconditions = termsconditions;
	}
	public AdminPolicy() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdminPolicy(Long id, String policyname, String policytype, Double sumInsured, Double premiumamount,
			Long duration, String description, String eligibility, String termsconditions) {
		super();
		this.id = id;
		this.policyname = policyname;
		this.policytype = policytype;
		this.suminsured = sumInsured;
		this.premiumamount = premiumamount;
		this.duration = duration;
		this.description = description;
		this.eligibility = eligibility;
		this.termsconditions = termsconditions;
	}
	
}
