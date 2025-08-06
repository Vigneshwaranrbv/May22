package com.example.May22.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.May22.entity.AdminPolicy;
import com.example.May22.repository.AdminPolicyRepository;

@Service
public class AdminPolicyImpl implements AdminPolicyService {

	@Autowired
	private AdminPolicyRepository adminpolicyrepository;

	@Override
	public AdminPolicy saveAdminpolicy(AdminPolicy adminpolicy) {
		return adminpolicyrepository.save(adminpolicy);
	}

	@Override
	public List<AdminPolicy> getAllPolicy() {
		return adminpolicyrepository.findAll();
	}

	@Override
	public AdminPolicy getPolicyById(Long id) {
		return adminpolicyrepository.findById(id).orElse(null);
	}
	 
	 @Override 
	 public AdminPolicy editPolicy(	AdminPolicy adminpolicy) {
	 return adminpolicyrepository.save(adminpolicy); }
	
	
	  @Override 
	  public AdminPolicy updatePolicy(Long id, AdminPolicy adminpolicy) {
	  AdminPolicy a = getPolicyById(id);
	  a.setPolicyname(adminpolicy.getPolicyname());
	  a.setPolicytype(adminpolicy.getPolicytype());
	  a.setSuminsured(adminpolicy.getSuminsured());
	  a.setPremiumamount(adminpolicy.getPremiumamount());
	  a.setDuration(adminpolicy.getDuration());
	  a.setDescription(adminpolicy.getDescription());
	  a.setEligibility(adminpolicy.getEligibility());
	  a.setTermsconditions(adminpolicy.getTermsconditions());
	  return adminpolicyrepository.save(a); } 
	 
	 @Override
	 public void deletePolicy(Long id) {
		 adminpolicyrepository.deleteById(id);
		 }

}
