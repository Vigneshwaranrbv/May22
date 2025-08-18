package com.example.May22.controller;

import java.io.IOException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.May22.entity.AdminPolicy;
import com.example.May22.entity.Customer;
import com.example.May22.service.AdminPolicyService;
import com.example.May22.service.CustomerApplicationService;

@Controller
@RequestMapping("/ap")
public class CustomerApplyPolicyController {

	@Autowired
	private AdminPolicyService adminpolicyservice;

	@Autowired
	private CustomerApplicationService customerapplicationservice;

	@GetMapping("/customerapply")
	public String customerPolicyapply(Model model) {
		List<AdminPolicy> policies = adminpolicyservice.getAllPolicy();
		System.out.println("view policies:" + policies);
		model.addAttribute("customerapply", policies);
		return "Customer_view_policy";
	}

	@GetMapping("/application")
	public String showApplication(@RequestParam("policyId") Long policyId, Model model) {
		AdminPolicy adminpolicy = adminpolicyservice.getPolicyById(policyId);
		System.out.println("policy ID: " + policyId);
		// System.out.println("policy ID: "+policyname);
		// System.out.println("policy ID: "+policyId);
		model.addAttribute("adminpolicy", adminpolicy);
		return "/Customer_application";
	}

	@PostMapping("/applying")
	public String policyApplying(@ModelAttribute() Customer customer) {
		customerapplicationservice.saveApplyPolicy(customer);
		return "/Customer_home";
	}

	@GetMapping("/appliedpolicy")
	public String getAllAppliedPolicy(Model model, Customer customer) {
		List<Customer> policylist = customerapplicationservice.getAllAppliedPolicy(customer);
		model.addAttribute("policylist", policylist);
		return "/Customer_view_application";
	}

	@GetMapping("/customer")
	public String home() {
		return "Customer_home";
	}

	// ----------------- list of applied policy---------------------//
	@GetMapping("/appliedlist")
	public String listAppliedPolicy(Model model, Customer customer) {
		List<Customer> appliedpolicies = customerapplicationservice.getAllAppliedPolicy(customer);
		model.addAttribute("appliedpolicies", appliedpolicies);
		return "Admin_view_applied";
	}

	// ------------ admin update status-----------------//
	@PostMapping("/approvePolicy")
	public String updateStatus(@RequestParam Long customerid, @RequestParam String status) {
		customerapplicationservice.updateStatus(customerid, status);
		return "Admin_home";
	}

	// -------------------------------customer apply
	// claim-----------------------------//
	/*@PostMapping("/appliedclaim")
	 *
	 * public String applyclaim(@RequestParam("customerid") Long customerid,
	 * MultipartFile file, Model model) { 
	 * System.out.println("Id:"+ customerid);
	 * boolean isEligible =
	 * customerapplicationservice.isEligibleForClaim(customerid); if (isEligible) 
	 * {
	 * System.out.println("Id:"+ customerid);
	 * customerapplicationservice.updateStatusToClaimRequest(customerid);
	 * model.addAttribute("Message", "Claim application allowed"); return
	 * "Customer_home"; 
	 * } else { 
	 * model.addAttribute("error",
	 * "You are not allowed to apply for claim."); return "Admin_home"; 
	 * } 
	 * }
	 */
//	@PostMapping("/appliedclaim")
//	public String handleFileUpload(@RequestParam("file") MultipartFile file,
//			@RequestParam("customerid") Long customerid) {
//		try {
//			customerapplicationservice.uploadFileAndRequestClaim(customerid, file);
//			return "Customer_home";
//		} catch (Exception e) {
//			e.printStackTrace();
//			return "Customer_home";
//		}
//	}
	@PostMapping("/appliedclaim")
	public String handleFileUpload(
			@RequestParam("customerid") Long customerid,
            @RequestParam("file") MultipartFile file) {
    try {
        customerapplicationservice.uploadFileAndRequestClaim(customerid, file, "Claim Request");
       } catch (IOException e) {
          e.printStackTrace();
// optionally: return error page
      }
     return "Customer_home";  // change to your JSP route
}
}