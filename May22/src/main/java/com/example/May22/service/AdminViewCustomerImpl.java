package com.example.May22.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.May22.entity.Customer;
import com.example.May22.entity.Student;
import com.example.May22.repository.AdminViewRepository;
import com.example.May22.repository.CustomerApplyRepository;
import com.example.May22.repository.StudentRepository;

@Service
public class AdminViewCustomerImpl implements AdminViewCustomerService{

	@Autowired
	StudentRepository studentrepository;
	
	@Autowired
	CustomerApplyRepository customerapplyrepository;
	
	@Override
	public List<Student> getAllStudents(){
		return studentrepository.findAll();
	}
	@Override
	public List<Customer> getAllAppliedPolicy(){
		return customerapplyrepository.findAll();
	}
	 
}

	
