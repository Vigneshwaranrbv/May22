package com.example.May22.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

import javax.management.RuntimeErrorException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.May22.entity.Customer;
import com.example.May22.repository.CustomerApplyRepository;

@Service
public class CustomerApplicationImpl implements CustomerApplicationService{

	@Autowired
	private CustomerApplyRepository customerapplyrepository;
	
	@Override
	public Customer getPolicy(Long id) {
		return customerapplyrepository.findById(id).orElse(null);
	}
	
	@Override
	public Customer saveApplyPolicy(Customer customer) {
		return customerapplyrepository.save(customer);
	}
	
	@Override
	public List<Customer> getallSurveyor(){
		return customerapplyrepository.findAll();
	}
	
	@Override
	public List<Customer> getAllAppliedPolicy(Customer customer) {
		return customerapplyrepository.findAll();
	}

	@Override
	public void updateStatus(Long customerid, String status) {
		Optional<Customer> optional = customerapplyrepository.findById(customerid);
        if (optional.isPresent()) {
            Customer customer = optional.get();
            customer.setStatus(status);
            customerapplyrepository.save(customer);
        }
    
	}

	@Override
	public List<Customer> getAllAppliedStatus() {
		// TODO Auto-generated method stub
		return null;
	}
	// applied policy and file upload
	@Override
    public void uploadFileAndRequestClaim(Long customerid, MultipartFile file, String status) throws IOException {
        Optional<Customer> optional = customerapplyrepository.findById(customerid);
        if (optional.isPresent()) {
            Customer customer = optional.get();
            customer.setFiledata(file.getBytes());
            customer.setFilename(file.getOriginalFilename());
            customer.setFiletype(file.getContentType());
            customer.setStatus(status); 
            customerapplyrepository.save(customer);
        }
    }
	@Override
	public Customer getCustomerById(Long customerid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean isEligibleForClaim(Long customerid) {
		// TODO Auto-generated method stub
		return false;
	}
	
}
 