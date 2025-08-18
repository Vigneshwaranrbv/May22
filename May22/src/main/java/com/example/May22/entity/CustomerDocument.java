package com.example.May22.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;

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
     @Lob
     @Column(columnDefinition = "LONGBLOB")
     private byte[] filedata;
     private String survstatus;
     @Column(name = "upload_date", columnDefinition = "DATETIME")
     private LocalDateTime uploadDate;
     
	 public CustomerDocument(Long documentid, Customer customer, Surveyor surveyor, String filename, String filetype,
			byte[] filedata, String survstatus, LocalDateTime uploadDate) {
		super();
		this.documentid = documentid;
		this.customer = customer;
		this.surveyor = surveyor;
		this.filename = filename;
		this.filetype = filetype;
		this.filedata = filedata;
		this.survstatus = survstatus;
		this.uploadDate = uploadDate;
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
	public String getsurvStatus() {
		return survstatus;
	}
	public void setsurvStatus(String survstatus) {
		this.survstatus = survstatus;
	}
	public LocalDateTime getUploadDate() {
		return uploadDate;
	}
	@PrePersist
	public void prePersist() {
		this.uploadDate = LocalDateTime.now();
	}
	public void setUploadDate(LocalDateTime now) {
		// TODO Auto-generated method stub
		
	}
}
