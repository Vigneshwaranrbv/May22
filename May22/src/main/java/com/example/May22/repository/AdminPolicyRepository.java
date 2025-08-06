package com.example.May22.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.May22.entity.AdminPolicy;

@Repository
public interface AdminPolicyRepository extends JpaRepository<AdminPolicy, Long>{
	
}
