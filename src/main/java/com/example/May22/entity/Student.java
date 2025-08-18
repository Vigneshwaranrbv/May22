package com.example.May22.entity;

import javax.annotation.Generated;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
//import lombok.AllArgsConstructor;
//import lombok.Data;
//import lombok.NoArgsConstructor;

@Entity
@Table
//@Data
//@AllArgsConstructor
//@NoArgsConstructor
public class Student {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id ;
	private String firstname;
	private String lastname;
	private String email;		
	private String password;
	private Long phone;
	private String role;

	    // Getters
	    public Long getId() { return id; }
	    public String getfirstname() { return firstname; }
	    public String getlastname() { return lastname; }
	    public String getEmail() { return email; }
	    public String getPassword() { return password; }
	    public Long getPhone() { return phone; }
	    public String getRole() { return role;}
	    
	    // Setters
	    public void setId(Long id) { this.id = id; }
	    public void setFirstname(String firstname) { this.firstname = firstname; }
	    public void setLastname(String lastname) { this.lastname = lastname; }
	    public void setEmail(String email) { this.email = email; }
	    public void setPassword(String password) { this.password = password; }
	    public void setPhone(Long phone) { this.phone = phone; }
	    public void setRole(String role) {this.role = role;}	    
		public Student(Long id, String firstname, String lastname, String email, String password, Long phone,String role) {
			super();
			this.id = id;
			this.firstname = firstname;
			this.lastname = lastname;
			this.email = email;
			this.password = password;
			this.phone = phone;
			this.role= role;
		}
		public Student() {
			
		}
	

	
}
