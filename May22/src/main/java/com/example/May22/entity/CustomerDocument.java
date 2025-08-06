package com.example.May22.entity;

import java.time.LocalDateTime;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class CustomerDocument {

	 @Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
     private Long documentid;
	 
	 @ManyToOne
	 @JoinColumn(name = "customerid", nullable = false)
     private Customer customer;
	 
	 @ManyToOne
	 @JoinColumn(name = "surveyorid", nullable = false)
     private Surveyor surveyor;
	 
     private String filename;
     private String filetype;
     private byte[] filedata;
     private String status;
     private LocalDateTime uploadAt;
	 public CustomerDocument(Long documentid, Customer customer, Surveyor surveyor, String filename, String filetype,
			byte[] filedata, String status, LocalDateTime uploadAt) {
		super();
		this.documentid = documentid;
		this.customer = customer;
		this.surveyor = surveyor;
		this.filename = filename;
		this.filetype = filetype;
		this.filedata = filedata;
		this.status = status;
		this.uploadAt = uploadAt;
	}
	public CustomerDocument() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Long getDocumentid() {
		return documentid;
	}
	public void setDocumentid(Long documentid) {
		this.documentid = documentid;
	}			
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public Surveyor getSurveyor() {
		return surveyor;
	}
	public void setSurveyor(Surveyor surveyor) {
		this.surveyor = surveyor;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFiletype() {
		return filetype;
	}
	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}
	public byte[] getFiledata() {
		return filedata;
	}
	public void setFiledata(byte[] filedata) {
		this.filedata = filedata;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public LocalDateTime getUploadAt() {
		return uploadAt;
	}
	public void setUploadAt(LocalDateTime uploadAt) {
		this.uploadAt = uploadAt;
	}
}
