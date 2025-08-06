package com.example.May22.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.example.May22.entity.Customer;

public interface CustomerApplicationService {

	Customer getPolicy(Long customerid);

	Customer saveApplyPolicy(Customer customer);

	List<Customer> getAllAppliedPolicy(Customer customer);
	
	List<Customer> getAllAppliedStatus();
	
	void updateStatus(Long customerid, String status);
	
	Customer getCustomerById(Long customerid);
	
	boolean isEligibleForClaim(Long customerid);
	
	//ithu customer doc upload
	void uploadFileAndRequestClaim(Long customerid, MultipartFile file, String status) throws IOException;
	
	//Surveyor Request
	List<Customer> getallSurveyor();
		
	
}
