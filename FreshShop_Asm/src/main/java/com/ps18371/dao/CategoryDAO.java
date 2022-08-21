package com.ps18371.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ps18371.domain.Category;

@Repository
public interface CategoryDAO extends JpaRepository<Category, String>{
	
}
