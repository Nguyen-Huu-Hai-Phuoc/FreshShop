package com.ps18371.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ps18371.domain.Order;

public interface OrderDAO extends JpaRepository<Order, Long> {

}
