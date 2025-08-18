package com.example.May22.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.May22.entity.Admin;
@Repository
public interface AdminRepository extends JpaRepository<Admin, Long>{

	Admin findByEmailAndPasswordAndRoleIgnoreCase(String email, String password, String role);

}
