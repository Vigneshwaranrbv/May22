package com.example.May22.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.example.May22.entity.Surveyor;

@Repository
public interface SurveyorRepository extends JpaRepository<Surveyor,Long>{

	Surveyor findByEmailAndPasswordAndRoleIgnoreCase(String email, String password, String role);

}
