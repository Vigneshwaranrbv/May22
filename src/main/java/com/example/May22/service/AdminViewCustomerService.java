package com.example.May22.service;

import java.util.List;

import com.example.May22.entity.Customer;
import com.example.May22.entity.Student;

public interface AdminViewCustomerService {

	List<Student> getAllStudents();
	
	List<Customer> getAllAppliedPolicy();

	
}
