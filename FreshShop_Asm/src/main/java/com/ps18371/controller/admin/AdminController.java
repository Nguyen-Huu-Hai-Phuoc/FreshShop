package com.ps18371.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ps18371.dao.CategoryDAO;
import com.ps18371.dao.ProductDAO;
import com.ps18371.domain.Category;
import com.ps18371.domain.Product;

@Controller
public class AdminController {
	
	@Autowired
	CategoryDAO dao;
	
	@Autowired
	ProductDAO pdao;
	
	@RequestMapping("/admin/index")
	public String index() {
		return "admin/index";
	}
	
	@RequestMapping("/menu/catrgory")
	public String menuCategory(Model model) {
		List<Category> items = dao.findAll();
		model.addAttribute("items", items);
		model.addAttribute("message", "categories/list.jsp");
		return "admin/index";
	}
	
	@RequestMapping("/menu/product")
	public String menuProduct(Model model) {
		List<Product> items = pdao.findAll();
		model.addAttribute("items", items);
		model.addAttribute("message", "product/list.jsp");
		return "admin/index";
	}
}
