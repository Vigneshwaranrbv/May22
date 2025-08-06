package com.example.May22.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.May22.entity.CustomerDocument;

@Repository
public interface CustomerDocumentRepository extends JpaRepository<CustomerDocument, Long> {
	
}
