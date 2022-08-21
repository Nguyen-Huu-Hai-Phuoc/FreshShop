package com.ps18371.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ps18371.domain.Product;

public interface ProductDAO extends JpaRepository<Product, Integer> {
	
	@Query("SELECT p FROM Product p WHERE p.category.id=?1")
	Page<Product> findByCategoryId(String category, Pageable pageable);
	
	@Query(value="SELECT * FROM Products WHERE name LIKE ?1",nativeQuery = true)
	List<Product> findByKeyword(String keyword);
	
	@Query(value = "SELECT * FROM Products WHERE price BETWEEN ?1 AND ?2", nativeQuery =true )
	Page<Product> findByPrice(double minPrice, double maxPrice, Pageable pageable);
}
