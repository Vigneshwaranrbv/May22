package com.example.May22.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.May22.entity.Customer;
import com.example.May22.repository.CustomerApplyRepository;

@Service
public class SurveyorViewRequestImpl implements SurveyorViewRequestService{
	
      @Autowired
      private CustomerApplyRepository customerapplyrepository; 
      
      

	@Override
	public Customer getcustomeridandsurveyorid(Long customerid) {
		// TODO Auto-generated method stub
		return customerapplyrepository.findById(customerid).orElse(null);
	}
}
