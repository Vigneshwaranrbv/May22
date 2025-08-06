package com.example.May22.service;

import java.util.List;

import com.example.May22.entity.AdminPolicy;

public interface AdminPolicyService {

	AdminPolicy saveAdminpolicy(AdminPolicy adminpolicy);

	List<AdminPolicy> getAllPolicy();

	AdminPolicy getPolicyById(Long id);

	AdminPolicy editPolicy(AdminPolicy adminpolicy);

    AdminPolicy updatePolicy(Long id, AdminPolicy adminpolicy);

	void deletePolicy(Long id);
}
