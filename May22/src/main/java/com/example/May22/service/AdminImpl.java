package com.example.May22.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.May22.entity.Admin;
import com.example.May22.repository.AdminRepository;

@Service
public class AdminImpl implements AdminService{ 

	@Autowired
	private AdminRepository adminRepository;
	//----------------------start register------------------//
	@Override
	public Admin saveAdmin(Admin admin) {
		return adminRepository.save(admin);
	}
	
	//-------------------Start login----------------------------// 
	 @Override
	 public Admin adminlogin(String email, String password, String role) {
		 return adminRepository.findByEmailAndPasswordAndRoleIgnoreCase(email, password,role);
	 }
}
