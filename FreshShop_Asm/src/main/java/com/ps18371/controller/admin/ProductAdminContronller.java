package com.ps18371.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ps18371.dao.ProductDAO;
import com.ps18371.domain.Product;

@Controller
public class ProductAdminContronller {
	@Autowired
	ProductDAO proDAO;
	
	@RequestMapping("/admin/product/index")
	public String index() {
		//return "admin/product/addProduct";
		return "login";
	}
	
	@RequestMapping("/admin/product")
	public String add(Model model) {
		Product item = new Product();
		model.addAttribute("item", item);
		List<Product> items = proDAO.findAll();
		model.addAttribute("items", items);
		model.addAttribute("message", "product/list.jsp");
		return "admin/index";
	}
	
	@RequestMapping("/product/edit/{id}")
	public String edit(Model model, @PathVariable("id") int id) {
		
		Product item = proDAO.findById(id).get();
		model.addAttribute("item", item);
		List<Product> items = proDAO.findAll();
		model.addAttribute("items", items);
		model.addAttribute("message", "product/addProduct.jsp");
		return "admin/index";
	}
	
	@RequestMapping("/product/create")
	public String saveOrUpdate(Product item, Model model) {
		proDAO.save(item);
		model.addAttribute("message", "product/list.jsp");
		return "redirect:/admin/product";
	}
	
	@RequestMapping("/product/delete/{id}")
	public String delete(@PathVariable("id") int id) {
		proDAO.deleteById(id);
		return "redirect:/admin/product";
	}
}
