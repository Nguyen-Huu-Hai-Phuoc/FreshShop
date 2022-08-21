package com.ps18371.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


import com.ps18371.dao.AccountDAO;
import com.ps18371.domain.Account;
import com.ps18371.service.ParamService;


@Controller
public class AccountAdminController {
	
	@Autowired
	AccountDAO accDao;
	
	@Autowired
	ParamService param;
	
	@RequestMapping("/menu/accounts")
	public String viewAccounts(Model model) {
		Account item = new Account();
		model.addAttribute("item", item);
		List<Account> items = accDao.findAll();
		model.addAttribute("items", items);
		model.addAttribute("message", "account/listAccount.jsp");
		return "admin/index";
	}
	
	@RequestMapping("/account/edit/{username}")
	public String edit(Model model, @PathVariable("username") String id) {
		
		Account item = accDao.findById(id).get();
		model.addAttribute("item", item);
		List<Account> items = accDao.findAll();
		model.addAttribute("items", items);
		model.addAttribute("message", "account/addAccount.jsp");
		return "admin/index";
	}
	
	@RequestMapping("/account/create")
	public String saveOrUpdate(Account item, Model model) {
		accDao.save(item);
		model.addAttribute("message", "account/listAccount.jsp");
		model.addAttribute("thongbao","Save succsess!");
		return "redirect:/menu/accounts";
	}
	
	@RequestMapping("/account/delete/{username}")
	public String delete(@PathVariable("username") String id) {
		accDao.deleteById(id);
		return "redirect:/menu/accounts";
	}

}
