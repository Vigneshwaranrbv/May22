
package com.example.May22.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.May22.entity.Customer;

@Repository
public interface CustomerApplyRepository extends JpaRepository<Customer, Long> {

}
