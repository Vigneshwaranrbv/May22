package com.example.May22.service;

import com.example.May22.entity.Admin;

public interface AdminService {
	
	Admin adminlogin(String email, String password, String role);

	Admin saveAdmin(Admin admin);

	}
