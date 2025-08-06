package com.example.May22.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.May22.entity.AdminPolicy;
import com.example.May22.entity.Student;
import com.example.May22.service.AdminPolicyService;

@Controller
@RequestMapping("/aa")
public class AdminPolicyController {

	@Autowired
	private AdminPolicyService adminpolicyservice;

	// -----------------postman Api-------------------//
	@GetMapping("/manage")
	@ResponseBody
	public List<AdminPolicy> displayViewall() {
		return adminpolicyservice.getAllPolicy();
	}

	@PostMapping("/add-policy")
	@ResponseBody
	public AdminPolicy addPolicy(@RequestBody AdminPolicy adminpolicy) {
		System.out.println("add policy " + adminpolicy.getPolicyname());
		adminpolicyservice.saveAdminpolicy(adminpolicy);
		return adminpolicyservice.saveAdminpolicy(adminpolicy);
	}
	
	 @PutMapping("/updatepolicy/{id}")
	 @ResponseBody 
	  public AdminPolicy updatePolicy(@PathVariable Long id, @RequestBody AdminPolicy adminpolicy) {
	  return adminpolicyservice.updatePolicy(id,adminpolicy); }
	 
	 @DeleteMapping("/deletepolicy/{id}")
	 @ResponseBody
	 public String deletePolicy(@PathVariable Long id) {
		 adminpolicyservice.deletePolicy(id);
		 return "ID delete success "+id;
	 }
	// --------------jsp integration API-------------------------//

	@GetMapping("/policy")
	public String displayViewall(Model model) {
		List<AdminPolicy> policyList = adminpolicyservice.getAllPolicy();
		model.addAttribute("policyList", policyList);
		return "Admin_policy";
	}

	@GetMapping("/addpolicy")
	public String viewall(Model model) {
		List<AdminPolicy> policyList = adminpolicyservice.getAllPolicy();
		model.addAttribute("policyList", policyList);
		return "Admin_add_policy";
	}

	@PostMapping("/addpolicy")
	public String saveAdminpolicy(@ModelAttribute("adminpolicy") AdminPolicy adminpolicy) {
		adminpolicyservice.saveAdminpolicy(adminpolicy);
		return "Admin_policy";
	}

	@GetMapping("/editpolicy")
	public String showEditForm(@RequestParam("id") Long id, Model model) {
		AdminPolicy policy = adminpolicyservice.getPolicyById(id);
		model.addAttribute("adminpolicy", policy);
		return "Admin_edit_policy";
	}

	@PostMapping("/updatepolicy")
	public String editPolicy(@ModelAttribute("adminpolicy") AdminPolicy adminpolicy) {
		adminpolicyservice.editPolicy(adminpolicy);
		return "Admin_edit_policy";
	}
	
	@GetMapping("/deletepolicy")
	public String deletePolicy(@RequestParam("id") Long id, Model model) {
		adminpolicyservice.deletePolicy(id);
		List<AdminPolicy> policies = adminpolicyservice.getAllPolicy(); // example method
		if (policies.isEmpty()) {
			model.addAttribute("nodata", "No Data Found");
		} else {
			model.addAttribute("adminpolicylist", policies); // change as per your JSP loop var
		}
		return "Admin_home";
	}
	
	
}