package com.ps18371.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ps18371.domain.Account;

public interface AccountDAO extends JpaRepository<Account, String> {
	/*
	 * @Query("SELECT a FROM Account a WHERE a.email=?1") Account findByEmail(String
	 * email);
	 */
}
