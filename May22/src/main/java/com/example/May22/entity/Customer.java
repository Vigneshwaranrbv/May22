package com.example.May22.entity;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table
public class Customer {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long customerid;
	private Long policyId;
	private String policyname;
	private String policytype;
	private Double premiumamount;
	private String customername;
	private String email;
	private String mobilenumber;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate startdate;
	private Long duration;
	private String nominee;
	private String status;
	
	//Surveyor assign customer table to update status
    @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL)
	private List<CustomerDocument> documents;
    
  //Surveyor assign customer table to update status
  	public List<CustomerDocument> getDocuments() {
          return documents;
      }

      public void setDocuments(List<CustomerDocument> documents) {
          this.documents = documents;
      }
	
	@Lob
	@Column(columnDefinition = "LONGBLOB")
	private byte[] filedata;	
	private String filename;
	private String filetype;

	public Customer(Long customerid, Long policyId, String policyname, String policytype, Double premiumamount,
			String customername, String email, String mobilenumber, LocalDate startdate, Long duration, String nominee,
			String status,byte[] filedata,String filename, String filetype, Surveyor surveyor) {
		super();
		this.customerid = customerid;
		this.policyId = policyId;
		this.policyname = policyname;
		this.policytype = policytype;
		this.premiumamount = premiumamount;
		this.customername = customername;
		this.email = email;
		this.mobilenumber = mobilenumber;
		this.startdate = startdate;
		this.duration = duration;
		this.nominee = nominee;
		this.status = status;
		this.surveyor = surveyor;
	}
    //Admin assign surveyor_id relationship
	@ManyToOne
	@JoinColumn(name = "surveyorid")
	private Surveyor surveyor;

	public Surveyor getSurveyor() {
		return surveyor;
	}

	public void setSurveyor(Surveyor surveyor) {
		this.surveyor = surveyor;
	}
	
	public Customer(Long customerid, Long policyId, String policyname, String policytype, Double premiumamount,
			String customername, String email, String mobilenumber, LocalDate startdate, Long duration, String nominee,
			String status) {
		super();
		this.customerid = customerid;
		this.policyId = policyId;
		this.policyname = policyname;
		this.policytype = policytype;
		this.premiumamount = premiumamount;
		this.customername = customername;
		this.email = email;
		this.mobilenumber = mobilenumber;
		this.startdate = startdate;
		this.duration = duration;
		this.nominee = nominee;
		this.status = status;
	}

	public Long getCustomerid() {
		return customerid;
	}

	public void setCustomerid(Long customerid) {
		this.customerid = customerid;
	}

	public Long getPolicyId() {
		return policyId;
	}

	public void setPolicyId(Long policyId) {
		this.policyId = policyId;
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

	public Double getPremiumamount() {
		return premiumamount;
	}

	public void setPremiumamount(Double premiumamount) {
		this.premiumamount = premiumamount;
	}

	public String getCustomername() {
		return customername;
	}

	public void setCustomername(String customername) {
		this.customername = customername;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobilenumber() {
		return mobilenumber;
	}

	public void setMobilenumber(String mobilenumber) {
		this.mobilenumber = mobilenumber;
	}

	public LocalDate getStartdate() {
		return startdate;
	}

	public void setStartdate(LocalDate startdate) {
		this.startdate = startdate;
	}

	public Long getDuration() {
		return duration;
	}

	public void setDuration(Long duration) {
		this.duration = duration;
	}

	public String getNominee() {
		return nominee;
	}

	public void setNominee(String nominee) {
		this.nominee = nominee;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	public Customer(byte[] filedata) {
		this.filedata = filedata;
	}
	public void setFiledata(byte[] filedata) {
	    this.filedata = filedata;
	}
	public byte[] getFiledata() {
		return filedata;
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

	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
