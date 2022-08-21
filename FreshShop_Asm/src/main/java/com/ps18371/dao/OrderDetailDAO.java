package com.ps18371.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ps18371.domain.OrderDetail;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Long> {

}
