package com.example.May22.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.May22.entity.Customer;
import com.example.May22.entity.Student;
import com.example.May22.service.AdminViewCustomerService;
import com.example.May22.service.CustomerApplicationService;
import com.example.May22.service.StudentService;

@Controller
@RequestMapping("/aa")
public class AdminViewController {

	@Autowired
	StudentService studentservice;
	
	@Autowired
	AdminViewCustomerService adminviewcustomerservice;
	
	@Autowired
	CustomerApplicationService customerapplicationservice;
	//-------------------------------view Customer data in JsP-------------------------------------//
	@GetMapping("/view")
	public String displayViewall(Model model){
		List<Student> students = studentservice.getAllStudents();
		model.addAttribute("viewcustomers",students);
		return "Admin_view_customers";
	}
	//--------------- Applied policies list-----------------------------------//
	@GetMapping("/appliedlist")
	public String listAppliedPolicy(Model model, Customer customer) {
		List<Customer> appliedpolicies = customerapplicationservice.getAllAppliedPolicy(customer);
		model.addAttribute("appliedpolicies",appliedpolicies);
		return "Admin_view_applied";
	}
	//------------ Update status-----------------------//
}